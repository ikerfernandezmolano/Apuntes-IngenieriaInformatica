# -*- coding: utf-8 -*-
import sys
import signal
import argparse
import pandas as pd
import numpy as np
import string
import pickle
import json
import csv
import os
import time
import warnings
from colorama import Fore
from pandas.errors import Pandas4Warning
# Sklearn
from sklearn.model_selection import StratifiedKFold, train_test_split
from sklearn.metrics import f1_score, confusion_matrix, precision_score, recall_score, classification_report
from sklearn.model_selection import GridSearchCV
# Preprocesado
from sklearn.preprocessing import MaxAbsScaler, MinMaxScaler, StandardScaler, LabelEncoder
from sklearn.preprocessing import OneHotEncoder
from sklearn.feature_extraction.text import TfidfVectorizer, CountVectorizer
from pandas.api.types import is_numeric_dtype
# kNN
from sklearn.neighbors import KNeighborsClassifier
# Decision Tree
from sklearn.tree import DecisionTreeClassifier
# Random Forest
from sklearn.ensemble import RandomForestClassifier
# Naive Bayes
from sklearn.naive_bayes import MultinomialNB
# Nltk
import nltk
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
# Imblearn
from imblearn.under_sampling import RandomUnderSampler
from imblearn.over_sampling import RandomOverSampler
from tqdm import tqdm

global data
global package
package = {}

# ===========================
# Funciones de Sistema
# ===========================

def signal_handler(sig, frame):
    """
    Función para manejar la señal SIGINT (Ctrl+C)
    :param sig: Señal
    :param frame: Frame
    """
    print("\nSaliendo del programa...")
    sys.exit(0)


def parse_args():
    """
    Función para parsear los argumentos de entrada y combinar con JSON
    """
    parser = argparse.ArgumentParser(description="Sistema de Apoyo a la Decisión - Clasificador")
    parser.add_argument("-j", "--json", help="Archivo de configuración JSON", required=True)
    parser.add_argument("-v", "--verbose", help="Mostrar métricas extendidas", action="store_true") # si se pone -v o --verbose se mostrarán métricas extendidas, si no, solo las básicas

    args = parser.parse_args() # obtiene el json que le pasamos

    try:
        # Se guarda el Json como diccionario en config y se guarda su contenido en args para que sea accesible desde cualquier función
        with open(args.json, 'r') as f:
            config = json.load(f)

        lista_algoritmos = ["kNN", "decision_tree", "random_forest", "naive_bayes"]

        for key, value in config.items():
            if key not in lista_algoritmos:
                setattr(args, key, value)

        args.parameters = config.get(args.algorithm, {})

        if not hasattr(args, 'preprocessing') or args.preprocessing is None:
            args.preprocessing = {}

    except FileNotFoundError:
        print(f"Error: No se encontró el archivo {args.json}")
        sys.exit(1)

    return args

def load_data(file):
    """
    Función para cargar los datos de un fichero csv
    :param file: Fichero csv
    :return: Datos del fichero
    """

    try:
        data = pd.read_csv(file, encoding='utf-8')
        print(Fore.GREEN + "Datos cargados con éxito" + Fore.RESET)
        return data
    except Exception as e:
        print(Fore.RED + "Error al cargar los datos" + Fore.RESET)
        print(e)
        sys.exit(1)

# ===========================
# Preprocesado
# ===========================

def select_features():
    try:
        # 1. Identificar numéricas (excluyendo la predicción)
        numerical_feature = data.select_dtypes(include=['int64', 'float64'])
        if args.prediction in numerical_feature.columns:
            numerical_feature = numerical_feature.drop(columns=[args.prediction])

        # 2. Identificar categóricas (excluyendo la predicción)
        unique_threshold = args.preprocessing.get("unique_category_threshold", 20)
        categorical_feature = data.select_dtypes(include='object')
        # EXCLUIR PREDICCIÓN AQUÍ:
        if args.prediction in categorical_feature.columns:
            categorical_feature = categorical_feature.drop(columns=[args.prediction])

        categorical_feature = categorical_feature.loc[:, categorical_feature.nunique() <= unique_threshold]

        # 3. Identificar texto (excluyendo categóricas y la predicción)
        all_objects = data.select_dtypes(include='object')
        text_feature = all_objects.drop(columns=categorical_feature.columns)
        # EXCLUIR PREDICCIÓN AQUÍ TAMBIÉN:
        if args.prediction in text_feature.columns:
            text_feature = text_feature.drop(columns=[args.prediction])

        print(Fore.GREEN + "Datos separados con éxito (Predicción excluida de X)" + Fore.RESET)
        return numerical_feature, text_feature, categorical_feature
    except Exception as e:
        print(Fore.RED + "Error al separar los datos" + Fore.RESET)
        print(e)
        sys.exit(1)


def process_missing_values(numerical_feature, categorical_feature):
    """
    Procesa los valores faltantes en los datos según la estrategia especificada en los argumentos.

    Args:
        numerical_feature (DataFrame): El DataFrame que contiene las características numéricas.
        categorical_feature (DataFrame): El DataFrame que contiene las características categóricas.

    Returns:
        None

    Raises:
        None
    """
    global data
    try:
        # Leemos la estrategia del JSON (si no la pones, usa mediana y moda por defecto)
        impute_num = args.preprocessing.get("impute_num", "median").lower()
        impute_cat = args.preprocessing.get("impute_cat", "mode").lower()
        package['impute_num'] = impute_num
        package['impute_cat'] = impute_cat
        
        # Numéricas
        for col in numerical_feature.columns:
            if col in data.columns and data[col].isnull().any():
                data[col] = pd.to_numeric(data[col], errors="coerce")

        if impute_num == "constant":
            while True:
                try:
                    package['impute_num_const'] = int(
                        input("¿Qué constante quieres utilizar para la imputación de valores numéricos?: "))
                    break  # sale del bucle si es válido
                except ValueError:
                    print("Por favor, introduce un número entero válido.")

        if impute_num == "delete":
            data = data.dropna(subset=numerical_feature.columns)
        else:
            for col in numerical_feature.columns:
                if col in data.columns and data[col].isnull().any():
                    if impute_num == "mean":
                        data[col] = data[col].fillna(data[col].mean())
                    elif impute_num == "mode":
                        data[col] = data[col].fillna(data[col].mode()[0])
                    elif impute_num == "constant":
                        data[col] = data[col].fillna(package['impute_num_const'])
                    else: # Por defecto: mediana
                        data[col] = data[col].fillna(data[col].median())

        # Categóricas
        if impute_cat == "constant":
            package['impute_cat_const'] = str(
                input("¿Qué constante quieres utilizar para la imputación de valores categoriales?: "))

        if impute_cat == "delete":
            data = data.dropna(subset=categorical_feature.columns)
        else:
            for col in categorical_feature.columns:
                if col in data.columns and data[col].isnull().any():
                    if impute_cat == "constant":
                        data[col] = data[col].fillna(package['impute_cat_const'])
                    else: # Por defecto: moda
                        moda = data[col].mode(dropna=True)
                        fill_value = moda.iloc[0] if not moda.empty else "Desconocido"
                        data[col] = data[col].fillna(fill_value)

        # Resto de columnas object/texto
        object_cols = data.select_dtypes(include=["object"]).columns.difference(categorical_feature.columns)

        for col in object_cols:
            if data[col].isnull().any():
                data[col] = data[col].fillna("")

        print(Fore.GREEN + "Valores faltantes procesados con éxito" + Fore.RESET)
    except Exception as e:
        print(Fore.RED + "Error al procesar valores faltantes" + Fore.RESET)
        print(e)
        sys.exit(1)

def reescaler(numerical_feature):
    """
    Rescala las características numéricas en el conjunto de datos utilizando diferentes métodos de escala.

    Args:
        numerical_feature (DataFrame): El dataframe que contiene las características numéricas.

    Returns:
        None

    Raises:
        Exception: Si hay un error al reescalar los datos.

    """
    global data
    try:
        if numerical_feature.columns.size == 0:
            print(Fore.YELLOW + "No se han encontrado columnas numéricas para reescalar" + Fore.RESET)
            return

        scaler_name = args.preprocessing.get("scaler", "standard").lower()

        if scaler_name == "minmax":
            scaler = MinMaxScaler()
        elif scaler_name == "maxabs":
            scaler = MaxAbsScaler()
        elif scaler_name == "zscore":
            scaler = StandardScaler()
        else:
            scaler = StandardScaler()

        cols = [col for col in numerical_feature.columns if col in data.columns]

        if cols:
            data[cols] = scaler.fit_transform(data[cols])
            print(Fore.GREEN + "Datos reescalados con éxito" + Fore.RESET)
            global package
            package['scaler'] = scaler

    except Exception as e:
            print(Fore.RED + "Error al reescalar los datos" + Fore.RESET)
            print(e)
            sys.exit(1)


def cat2num(categorical_feature):
    global data, package  # Asegúrate de que 'package' existe para guardar cosas
    try:
        cols = [col for col in categorical_feature.columns if col in data.columns]
        if not cols:
            return

        # Creamos el encoder en el entrenamiento
        # handle_unknown='ignore' es VITAL para que el Test no pete con clases nuevas
        encoder = OneHotEncoder(handle_unknown='ignore', sparse_output=False)

        # Aprendemos las categorías
        encoder.fit(data[cols])

        # Transformamos y reemplazamos en el DataFrame
        encoded_data = encoder.transform(data[cols])
        encoded_df = pd.DataFrame(
            encoded_data,
            columns=encoder.get_feature_names_out(cols),
            index=data.index
        )

        data = pd.concat([data.drop(columns=cols), encoded_df], axis=1)

        # GUARDAMOS el objeto en el package para el Test
        package['categorical_encoder'] = encoder

        print(Fore.GREEN + "OneHotEncoder entrenado y guardado" + Fore.RESET)
    except Exception as e:
        print(Fore.RED + f"Error en cat2num (Train): {e}" + Fore.RESET)
        sys.exit(1)

def simplify_text(text_feature):
    """
    Función que simplifica el texto de una columna dada en un DataFrame. lower,stemmer, tokenizer, stopwords del NLTK....

    Parámetros:
    - text_feature: DataFrame - El DataFrame que contiene la columna de texto a simplificar.

    Retorna:
    None
    """
    global data
    try:
        if text_feature.columns.size == 0:
            print(Fore.YELLOW + "No se han encontrado columnas de texto para simplificar" + Fore.RESET)
            return

        stemmer = PorterStemmer()
        stop_words = set(stopwords.words(args.preprocessing.get("language","english")))
        package['language'] = args.preprocessing.get("language","english")

        def clean_text(text):
            text = str(text).lower()
            text = text.translate(str.maketrans('', '', string.punctuation))
            tokens = word_tokenize(text)
            tokens = [tok for tok in tokens if tok.isalpha()]
            tokens = [tok for tok in tokens if tok not in stop_words]
            tokens = [stemmer.stem(tok) for tok in tokens]
            tokens.sort()
            return " ".join(tokens)

        for col in text_feature.columns:
            if col in data.columns:
                data[col] = data[col].fillna("").astype(str).apply(clean_text)

        print(Fore.GREEN + "Texto simplificado con éxito" + Fore.RESET)
    except Exception as e:
        print(Fore.RED + "Error al simplificar el texto" + Fore.RESET)
        print(e)
        sys.exit(1)

def process_text(text_feature):
    """
    Procesa las características de texto utilizando técnicas de vectorización como TF-IDF o BOW.

    Parámetros:
    text_feature (pandas.DataFrame): Un DataFrame que contiene las características de texto a procesar.

    """
    global data
    try:
        if text_feature.columns.size > 0:
            global package
            if args.preprocessing["text_process"] == "tf-idf":
                vectorizer = TfidfVectorizer()
                text_data = data[text_feature.columns].apply(lambda x: ' '.join(x.astype(str)), axis=1)
                tfidf_matrix = vectorizer.fit_transform(text_data)
                text_features_df = pd.DataFrame(tfidf_matrix.toarray(),
                                                columns=vectorizer.get_feature_names_out())
                data = pd.concat([data, text_features_df], axis=1)
                data.drop(text_feature.columns, axis=1, inplace=True)
                print(Fore.GREEN + "Texto tratado con éxito usando TF-IDF" + Fore.RESET)
                package['vectorizer'] = vectorizer
            elif args.preprocessing["text_process"] == "bow":
                vectorizer = CountVectorizer()
                text_data = data[text_feature.columns].apply(lambda x: ' '.join(x.astype(str)), axis=1)
                bow_matrix = vectorizer.fit_transform(text_data)
                text_features_df = pd.DataFrame(bow_matrix.toarray(), columns=vectorizer.get_feature_names_out())
                # Unimos las nuevas columnas numéricas
                data = pd.concat([data, text_features_df], axis=1)
                # ELIMINAMOS las columnas de texto originales para que no den error
                data.drop(text_feature.columns, axis=1, inplace=True)
                print(Fore.GREEN + "Texto tratado con éxito usando BOW" + Fore.RESET)
                package['vectorizer'] = vectorizer
            else:
                print(Fore.YELLOW + "No se están tratando los textos" + Fore.RESET)
        else:
            print(Fore.YELLOW + "No se han encontrado columnas de texto a procesar" + Fore.RESET)
    except Exception as e:
        print(Fore.RED + "Error al tratar el texto" + Fore.RESET)
        print(e)
        sys.exit(1)

def over_under_sampling(X_train, y_train, desbalanceado):
    """
    Aplica técnicas de balanceo de clases (Oversampling o Undersampling)
    sobre el conjunto de datos global para evitar sesgos en el modelo.
    El tipo de balanceo se lee de los argumentos del JSON.

    Parámetros:
    Ninguno (utiliza las variables globales 'data' y 'args').

    Retorna:
    None (modifica el DataFrame global 'data' directamente).
    """
    sampling_type = args.preprocessing.get("sampling", "none")

    if sampling_type == "none":
        return X_train, y_train  # Siempre devolver los datos

    try:
        answer = "y"
        if not desbalanceado:
            answer = input(f"Los datos están balanceados, has indicado que quieres realizar {sampling_type}. ¿Quieres continuar aún así? [y/N]?")

        if answer.lower() == "y":
            if sampling_type == "oversampling":
                sampler = RandomOverSampler(random_state=42)
            elif sampling_type == "undersampling":
                sampler = RandomUnderSampler(random_state=42)
            else:
                return X_train, y_train
            X_res, y_res = sampler.fit_resample(X_train, y_train)
            print(Fore.GREEN + f"Sampling ({sampling_type}) aplicado" + Fore.RESET)
            return X_res, y_res
        else:
            return X_train, y_train
    except Exception as e:
        print(Fore.YELLOW + "No se pudo aplicar sampling: " + str(e) + Fore.RESET)
        return X_train, y_train

def preprocesar_datos():
    # Descargamos los recursos necesarios de nltk
    print("\n- Descargando diccionarios...")
    nltk.download('stopwords')
    nltk.download('punkt')
    nltk.download('punkt_tab')
    nltk.download('wordnet')

    # Silencia los avisos de depuración de Pandas
    warnings.filterwarnings("ignore", category=Pandas4Warning)

    numerical_feature, text_feature, categorical_feature = select_features() # dividir los datos con los que trabajamos en numéricos, categóricos y de texto
    simplify_text(text_feature)
    cat2num(categorical_feature)
    process_missing_values(numerical_feature, categorical_feature)
    reescaler(numerical_feature)
    process_text(text_feature)
    return data

# ===========================
# Funciones calculos
# ===========================

# =========================================================================
# EXPLICACIÓN DE METRICAS
# =========================================================================
#
# PRECISION (Precisión):
#    De todas las predicciones positivas que hizo el modelo, ¿cuántas
#    eran correctas en la realidad?
#    -> Una precisión alta indica que el modelo minimiza los falsos positivos.
#
# RECALL (Sensibilidad / Exhaustividad):
#    De todos los casos positivos reales que existen en el conjunto de datos,
#    ¿cuántos logró identificar correctamente el modelo?
#    -> Un recall alto indica que el modelo minimiza los falsos negativos.
#
# F1-SCORE:
#    La media armónica entre Precision y Recall. Es la métrica de referencia
#    cuando se trabaja con conjuntos de datos desbalanceados.
#       - F-SCORE MACRO: Calcula la métrica para cada clase de forma
#         independiente y calcula su media no ponderada. Trata a todas las
#         clases por igual, penalizando si el modelo falla en la clase minoritaria.
#       - F-SCORE MICRO: Calcula las métricas sumando globalmente los verdaderos
#         positivos, falsos negativos y falsos positivos. En datasets desbalanceados,
#         la clase mayoritaria dominará el resultado.
#
# MATRIZ DE CONFUSION:
#    Tabla que detalla los aciertos y errores exactos de clasificación.
#    En clasificación binaria muestra: Verdaderos Positivos, Verdaderos Negativos,
#    Falsos Positivos y Falsos Negativos.
#
# CLASSIFICATION REPORT:
#    Genera un informe en texto plano que desglosa las métricas de Precision,
#    Recall, F1-score y Soporte (número total de apariciones reales) para
#    cada una de las clases evaluadas.
# =========================================================================

def calcular_metricas(y_test, y_pred):
    requested_fscore = str(getattr(args, 'f_score', 'macro')).lower() # obtenemos el tipo de fscore que queremos calcular, por defecto macro, y lo convertimos a minúsculas para evitar problemas
    if requested_fscore not in ["micro", "macro", "weighted", "none"]:
        requested_fscore = "macro"

    # Cálculo de precisión, recall y fscore según el tipo solicitado (micro, macro o weighted)
    precision = precision_score(y_test, y_pred, average=requested_fscore if requested_fscore != "none" else "macro", zero_division=0)
    recall = recall_score(y_test, y_pred, average=requested_fscore if requested_fscore != "none" else "macro", zero_division=0)
    fscore = f1_score(y_test, y_pred, average=requested_fscore if requested_fscore != "none" else "macro", zero_division=0)

    return precision, recall, fscore

def calculate_confusion_matrix(y_test, y_pred):
    cm = confusion_matrix(y_test, y_pred)
    return cm

def calculate_fscore(y_true, y_pred):
    return (
        f1_score(y_true, y_pred, average='micro', zero_division=0),
        f1_score(y_true, y_pred, average='macro', zero_division=0)
    )

def calculate_classification_report(y_true, y_pred):
    return classification_report(y_true, y_pred, zero_division=0)

# =========================================
# Funciones comunes para los modelos
# =========================================

def divide_data():
    global data
    try:
        if args.prediction not in data.columns:
            raise ValueError(f"La columna objetivo '{args.prediction}' no existe en el dataset.")

        # Se separa la columna objetivo (y) del resto de características (x)
        y = data[args.prediction].copy()
        X = data.drop(columns=[args.prediction]).copy()

        # Transformamos la columna objetivo a numérica si no lo es.
        if not is_numeric_dtype(y):
            le = LabelEncoder()
            y = le.fit_transform(y.astype(str))
            package['label_encoder'] = le

        # Comprobar si está desbalanceado
        proportions = pd.Series(y).value_counts(normalize=True)
        min_prop = proportions.min()
        desbalanceado = min_prop < 0.10

        # Dividimos los datos en entrenamiento y desarrollo (80% - 20%) de forma estratificada para mantener la proporción de clases.
        X_train, X_dev, y_train, y_dev = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)
        X_train, y_train = over_under_sampling(X_train, y_train, desbalanceado)
        return X_train, X_dev, y_train, y_dev
    except Exception as e:
        print(Fore.RED + "Error al dividir datos: " + str(e) + Fore.RESET)
        sys.exit(1)

def save_model(gs):
    """
    Guarda el modelo y los resultados de la búsqueda de hiperparámetros en archivos.

    Parámetros:
    - gs: objeto GridSearchCV, el cual contiene el modelo y los resultados de la búsqueda de hiperparámetros.

    Excepciones:
    - Exception: Si ocurre algún error al guardar el modelo.

    Archivos generados:
    - output/modelo.pkl: Archivo que contiene el modelo guardado en formato pickle.
    - output/modelo.csv: Archivo CSV que contiene los parámetros probados y sus respectivas puntuaciones obtenidas durante la búsqueda de hiperparámetros.
    """
    try:
        package['model'] = gs
        package['unique_category_threshold'] = args.preprocessing.get("unique_category_threshold", 20)
        algorithm = args.algorithm
        with open(f'output/Modelo{algorithm}.pkl', 'wb') as file:
            pickle.dump(package, file)
            print(Fore.CYAN + "Modelo guardado con éxito" + Fore.RESET)

        # Extraemos los datos necesarios de cv_results_
        results = gs.cv_results_
        params_list = results['params']
        mean_precision = results['mean_test_precision']
        mean_recall = results['mean_test_recall']
        mean_f1 = results['mean_test_f1']

        with open(f'output/Results_{algorithm}.csv', 'w', newline='') as file:
            writer = csv.writer(file)
            fscore = getattr(args, 'f_score', 'macro')
            writer.writerow(['NombreMod', 'Precisión', 'Recall', f'F_score({fscore})'])

            # Iteramos usando el índice para acceder a todas las listas a la vez
            for i in range(len(params_list)):
                params = params_list[i]

                if algorithm.lower() == 'knn':
                    nombreMod = f"{algorithm}_k{params['n_neighbors']}_p{params['p']}_w{params['weights']}"
                elif algorithm.lower() == 'decision_tree':
                    nombreMod = f"{algorithm}_depth{params.get('max_depth')}_split{params.get('min_samples_split')}_leaf{params.get('min_samples_leaf')}_criterion{params.get('criterion')}"
                elif algorithm.lower() == 'random_forest':
                    nombreMod = f"{algorithm}_nest{params.get('n_estimators')}_depth{params.get('max_depth')}_split{params.get('min_samples_split')}_leaf{params.get('min_samples_leaf')}_criterion{params.get('criterion')}"
                elif algorithm.lower() == 'naive_bayes':
                    nombreMod = f"{algorithm}_alpha{params.get('alpha')}"

                # Escribimos los valores correspondientes a esa combinación de parámetros
                writer.writerow([
                    nombreMod,
                    f"{mean_precision[i]:.4f}",
                    f"{mean_recall[i]:.4f}",
                    f"{mean_f1[i]:.4f}"
                ])
    except Exception as e:
        print(Fore.RED + "Error al guardar el modelo" + Fore.RESET)
        print(e)

def mostrar_resultados(gs, x_dev, y_dev):
    """
    Muestra los resultados del clasificador.

    Parámetros:
    - gs: objeto GridSearchCV, el clasificador con la búsqueda de hiperparámetros.
    - x_dev: array-like, las características del conjunto de desarrollo.
    - y_dev: array-like, las etiquetas del conjunto de desarrollo.

    Imprime en la consola los siguientes resultados:
    - Mejores parámetros encontrados por la búsqueda de hiperparámetros.
    - Mejor puntuación obtenida por el clasificador.
    - F1-score micro del clasificador en el conjunto de desarrollo.
    - F1-score macro del clasificador en el conjunto de desarrollo.
    - Informe de clasificación del clasificador en el conjunto de desarrollo.
    - Matriz de confusión del clasificador en el conjunto de desarrollo.
    """
    if args.verbose:
        print(Fore.MAGENTA + "> Mejores parametros:\n" + Fore.RESET, gs.best_params_)
        print(Fore.MAGENTA + "> Mejor puntuacion:\n" + Fore.RESET, gs.best_score_)
        print(Fore.MAGENTA + "> F1-score micro:\n" + Fore.RESET, calculate_fscore(y_dev, gs.predict(x_dev))[0])
        print(Fore.MAGENTA + "> F1-score macro:\n" + Fore.RESET, calculate_fscore(y_dev, gs.predict(x_dev))[1])
        print(Fore.MAGENTA + "> Informe de clasificación:\n" + Fore.RESET, calculate_classification_report(y_dev, gs.predict(x_dev)))
        print(Fore.MAGENTA + "> Matriz de confusión:\n" + Fore.RESET,calculate_confusion_matrix(y_dev, gs.predict(x_dev)))

# =========================================================================
# Algoritmo kNN
# =========================================================================
# ¿CÓMO PIENSA? Basado en distancia. Clasifica un dato nuevo mirando la 
# etiqueta de sus 'k' vecinos más cercanos en el espacio.
#
# ¿CUÁNDO USARLO? 
# - Datos numéricos continuos (Edad, Sueldo, Coordenadas).
# - Datasets pequeños o medianos (el cálculo de distancias es costoso).
# - Distribuciones de datos desconocidas (es un modelo no paramétrico).
#
# ¿CUÁNDO EVITARLO? 
# - Texto libre (TF-IDF): La alta dimensionalidad estropea el cálculo de distancias.
# - Datos muy desbalanceados (la clase mayoritaria domina, salvo que se use weights).
# =========================================================================
def kNN():

    k_cfg = args.parameters.get("k", {})
    k_values = k_cfg.get("kValues", [])
    k_min = k_cfg.get("valueMin")
    k_max = k_cfg.get("valueMax")
    k_step = k_cfg.get("step")

    if k_values and isinstance(k_values, list) and len(k_values) > 0:
        if not all(isinstance(v, int) and v > 0 for v in k_values):
            print("Error: Todos los valores en 'kValues' deben ser enteros mayores que 0.")
            sys.exit(1)
        k_list = k_values
        print(Fore.CYAN + f"Usando valores fijos para k: {k_list}" + Fore.RESET)
    else:
        if not all(isinstance(v, int) and v > 0 for v in [k_min, k_max, k_step]) or k_min > k_max:
            print("Error en la configuración de k.")
            sys.exit(1)
        k_list = list(range(k_min, k_max + 1, k_step))
        print(Fore.CYAN + f"Usando rango para k: {k_list}" + Fore.RESET)

    weights = args.parameters.get("weights", ["uniform"])
    if isinstance(weights, str):
        weights = [weights]
    if not isinstance(weights, list) or not all(w in ["uniform", "distance"] for w in weights):
        print("Error en la configuración de weights.")
        sys.exit(1)

    p_values = args.parameters.get("p", [2])
    if isinstance(p_values, int):
        p_values = [p_values]
    if not isinstance(p_values, list) or not all(p in [1, 2] for p in p_values):
        print("Error en la configuración de p.")
        sys.exit(1)

    X_train, X_dev, y_train, y_dev = divide_data()

    unique_classes, class_counts = np.unique(y_train, return_counts=True)
    min_class_count = class_counts.min()

    if min_class_count >= 5:
        cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)
    elif min_class_count >= 2:
        cv = StratifiedKFold(n_splits=int(min_class_count), shuffle=True, random_state=42)
    else:
        raise ValueError("No es posible aplicar validación cruzada estratificada: alguna clase tiene menos de 2 muestras.")

    param_grid = {
        'n_neighbors': k_list,
        'p': p_values,
        'weights': weights
    }

    # Configuramos las métricas de evaluación
    fscore_param = getattr(args, 'f_score', 'macro').lower()
    scoring_metrics = {
        'precision': f'precision_{fscore_param}',
        'recall': f'recall_{fscore_param}',
        'f1': f'f1_{fscore_param}'
    }

    print("Entrenando kNN y buscando los mejores parámetros...")
    start_time = time.time()

    knn = KNeighborsClassifier()
    gs = GridSearchCV(knn, param_grid, cv=cv, n_jobs=-1, scoring=scoring_metrics, refit='f1')

    # Entrenamos el modelo
    gs.fit(X_train, y_train)

    end_time = time.time()
    execution_time = end_time - start_time
    print(f"Tiempo de ejecución: {Fore.MAGENTA}{execution_time:.2f}{Fore.RESET} segundos")

    # Guardamos y mostramos los resultados usando las funciones comunes
    mostrar_resultados(gs, X_dev, y_dev)

    save_model(gs)

# =========================================================================
# Algoritmo Arból de Decisión
# =========================================================================
# ¿CÓMO PIENSA? Crea un diagrama de flujo con reglas lógicas encadenadas 
# para dividir los datos paso a paso.
#
# ¿CUÁNDO USARLO? 
# - Cuando se necesita EXPLICABILIDAD ("Caja Blanca", 100% interpretable).
# - Inmune a diferencias de escala (no requiere normalizar datos numéricos).
# - Útil para detectar patrones en valores nulos explícitos (ej: "Desconocido").
#
# ¿CUÁNDO EVITARLO? 
# - Alto riesgo de OVERFITTING (sobreajuste) si no se limita la profundidad 
#   (max_depth). Tiende a memorizar el dataset en lugar de generalizar.
# =========================================================================
def decision_tree():
    """
    Función que entrena un modelo de Árbol de Decisión utilizando GridSearchCV.
    """

    from sklearn.exceptions import UndefinedMetricWarning

    # Esto ignorará específicamente los avisos de precisión/f-score indefinidos
    warnings.filterwarnings("ignore", category=UndefinedMetricWarning)

    x_train, x_dev, y_train, y_dev = divide_data()

    params = args.parameters if hasattr(args, 'parameters') else {}

    # Extraemos los parámetros del JSON o ponemos valores por defecto si no existen
    param_grid = {
        'max_depth': params.get('max_depth', [None, 5, 10, 20]),
        'min_samples_split': params.get('min_samples_split', [2, 5, 10]),
        'min_samples_leaf': params.get('min_samples_leaf', [1, 2, 5]),
        'criterion': params.get('criterion', ['gini', 'entropy'])
    }

    # Configuramos las métricas de evaluación
    fscore_param = getattr(args, 'f_score', 'macro').lower()
    scoring_metrics = {
        'precision': f'precision_{fscore_param}',
        'recall': f'recall_{fscore_param}',
        'f1': f'f1_{fscore_param}'
    }

    print("Entrenando Árbol de Decisión y buscando los mejores parámetros...")
    start_time = time.time()

    # Inicializamos el modelo y la búsqueda en rejilla (GridSearch)
    dt = DecisionTreeClassifier(random_state=42)
    gs = GridSearchCV(dt, param_grid, cv=5, n_jobs=-1, scoring=scoring_metrics, refit='f1')

    # Entrenamos el modelo
    gs.fit(x_train, y_train)

    end_time = time.time()
    execution_time = end_time - start_time
    print("Tiempo de ejecución:" + Fore.MAGENTA + f" {execution_time:.2f} " + Fore.RESET + "segundos")

    # Guardamos y mostramos los resultados usando las funciones comunes
    mostrar_resultados(gs, x_dev, y_dev)
    save_model(gs)

# =========================================================================
# Algoritmo Random Forest
# =========================================================================
# ¿CÓMO PIENSA? Entrena múltiples Árboles de Decisión independientes 
# (con subconjuntos de datos) y promedia/vota la predicción final.
#
# ¿CUÁNDO USARLO? 
# - Búsqueda de la máxima precisión y métricas altas (F1-Score).
# - Datasets complejos y desbalanceados.
# - Soluciona el problema de sobreajuste (overfitting) de los árboles simples.
#
# ¿CUÁNDO EVITARLO? 
# - Cuando es obligatorio explicar el motivo de la predicción ("Caja Negra").
# - Recursos limitados (consume mucha memoria RAM y CPU al entrenar).
# =========================================================================

def random_forest():
    """
    Función que entrena un modelo de Random Forest utilizando GridSearchCV.
    """
    x_train, x_dev, y_train, y_dev = divide_data()

    params = args.parameters if hasattr(args, 'parameters') else {}
    param_grid = {
        'n_estimators': params.get('n_estimators', [100, 200]),
        'max_depth': params.get('max_depth', [None, 10, 20]),
        'min_samples_split': params.get('min_samples_split', [2, 5]),
        'min_samples_leaf': params.get('min_samples_leaf', [1, 2]),
        'criterion': params.get('criterion', ['gini', 'entropy'])
    }

    # Configuramos las métricas de evaluación
    fscore_param = getattr(args, 'f_score', 'macro').lower()
    scoring_metrics = {
        'precision': f'precision_{fscore_param}',
        'recall': f'recall_{fscore_param}',
        'f1': f'f1_{fscore_param}'
    }

    print("Entrenando Random Tree y buscando los mejores parámetros...")
    start_time = time.time()

    rf = RandomForestClassifier(random_state=42, n_jobs=-1)
    gs = GridSearchCV(rf, param_grid, cv=5, n_jobs=-1, scoring=scoring_metrics, refit='f1')

    with tqdm(total=1, desc='Procesando random forest', unit='modelo', leave=True) as pbar:
        gs.fit(x_train, y_train)
        pbar.update(1)

    end_time = time.time()
    execution_time = end_time - start_time
    print("Tiempo de ejecución:" + Fore.MAGENTA + f" {execution_time} " + Fore.RESET + "segundos")

    mostrar_resultados(gs, x_dev, y_dev)
    save_model(gs)

# =========================================================================
# Algoritmo Naive Bayes
# =========================================================================
# ¿CÓMO PIENSA? Basado en probabilidad (Teorema de Bayes). Es "ingenuo" 
# porque asume que todas las variables predictoras son independientes.
#
# ¿CUÁNDO USARLO? 
# - El estándar para Procesamiento de Lenguaje Natural (NLP).
# - Clasificación de texto libre (TF-IDF, Bag of Words, análisis de sentimientos).
# - Entrenamiento extremadamente rápido y muy ligero para la memoria.
#
# ¿CUÁNDO EVITARLO? 
# - Falla si las variables numéricas están fuertemente correlacionadas 
#   entre sí (porque rompe la regla matemática de independencia).
# =========================================================================

def naive_bayes():
    """
    Función que entrena un modelo de Naive Bayes utilizando GridSearchCV.
    """
    x_train, x_dev, y_train, y_dev = divide_data()

    params = args.parameters if hasattr(args, 'parameters') else {}
    param_grid = {
        'alpha': params.get('alpha', [1.0]),
    }

    # Configuramos las métricas de evaluación
    fscore_param = getattr(args, 'f_score', 'macro').lower()
    scoring_metrics = {
        'precision': f'precision_{fscore_param}',
        'recall': f'recall_{fscore_param}',
        'f1': f'f1_{fscore_param}'
    }

    print("Entrenando Naive Bayes y buscando los mejores parámetros...")
    start_time = time.time()

    nb = MultinomialNB()
    gs = GridSearchCV(nb, param_grid, cv=5, n_jobs=-1, scoring=scoring_metrics, refit='f1')
    gs.fit(x_train, y_train)

    end_time = time.time()

    execution_time = end_time - start_time
    print("Tiempo de ejecución:" + Fore.MAGENTA + f" {execution_time} " + Fore.RESET + "segundos")

    mostrar_resultados(gs, x_dev, y_dev)
    save_model(gs)

# ===========================
# Configuración inicial
# ===========================

def config():
    # Cargamos los datos con los que vamos a trabajar
    print("\n- Cargando datos...")
    global data
    data = load_data(args.data_file)

    # Preprocesamos los datos
    print("\n- Preprocesando datos...")
    preprocesar_datos()

    if args.algorithm == "kNN":
        try:
            kNN()
            print(Fore.GREEN + "Algoritmo kNN ejecutado con éxito" + Fore.RESET)
            sys.exit(0)
        except Exception as e:
            print(e)
    elif args.algorithm == "decision_tree":
        try:
            decision_tree()
            print(Fore.GREEN + "Algoritmo árbol de decisión ejecutado con éxito" + Fore.RESET)
            sys.exit(0)
        except Exception as e:
            print(e)
    elif args.algorithm == "random_forest":
        try:
            random_forest()
            print(Fore.GREEN + "Algoritmo random forest ejecutado con éxito" + Fore.RESET)
            sys.exit(0)
        except Exception as e:
            print(e)
    elif args.algorithm == "naive_bayes":
        try:
            naive_bayes()
            print(Fore.GREEN + "Algoritmo naive bayes ejecutado con éxito" + Fore.RESET)
            sys.exit(0)
        except Exception as e:
            print(e)
    else:
        print(Fore.RED + "Algoritmo no soportado" + Fore.RESET)
        sys.exit(1)

# ===========================
# Entrada principal
# ===========================

if __name__ == "__main__":
    # Fijamos la semilla
    np.random.seed(42)
    # Manejamos la señal SIGINT (Ctrl+C)
    signal.signal(signal.SIGINT, signal_handler)
    # Parseamos los argumentos
    args = parse_args()
    # Si la carpeta output no existe la creamos
    print("\n- Creando carpeta output...")
    try:
        os.makedirs('output')
        print(Fore.GREEN + "Carpeta output creada con éxito" + Fore.RESET)
    except FileExistsError:
        print(Fore.GREEN + "La carpeta output ya existe" + Fore.RESET)
    except Exception as e:
        print(Fore.RED + "Error al crear la carpeta output" + Fore.RESET)
        print(e)
        sys.exit(1)
    config()
