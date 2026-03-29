# SAD_Proyecto

## 🧾 Preparación del entorno

La versión de Python a utilizar es **Python 3.12.3**

La primera vez que ejecutes el proyecto, prepara el entorno con:

```bash
source setup.sh
```

## ▶️ Ejecución del entorno

Para utilizar la plantilla de entrenamiento:

```bash
source venv/bin/activate
python3 SAD_IFernandez_IHerrera.py --json archivo_config.json [-v/--verbose]
```

## 👁‍🗨 Testeo

Para utilizar la plantilla de testeo:

```bash
source venv/bin/activate
python3 SAD_test_IFernandez_IHerrera.py --json archivo_config.json
```

## ⚙ Config

```json
{
    "data_file": "archivo.csv",
    "algorithm": "kNN/decision_tree/random_forest/naive_bayes",
    "prediction": "columna_a_predecir",
    "f_score": "macro*/micro/weighted",
    "preprocessing": {
        "sampling": "oversampling/undersampling",
        "scaler": "minmax/maxabs/zscore*",
        "unique_category_threshold": value,
        "text_process": "tf-idf/bow",
        "language": "language",
        "impute_num": "mean/mode/median*/constant/delete",
        "impute_cat": "mode*/constant/delete"
    },
    "kNN": {
        "k": {
            "kValues" : [value1, value2, ..., valueN],
            "valueMin": valueMin,
            "valueMax": valueMax,
            "step": valueStep
        },
        "weights": ["uniform"*,"distance"],
        "p": [1,2*]
    },
    "decision_tree": {
        "max_depth": [value1, value2, ..., valueN],
        "min_samples_split": [value1, value2, ..., valueN],
        "min_samples_leaf": [value1, value2, ..., valueN],
        "criterion": ["gini", "entropy"]*
    },
    "random_forest": {
        "n_estimators": [value1, value2, ..., valueN],
        "max_depth": [value1, value2, ..., valueN],
        "min_samples_split": [value1, value2, ..., valueN],
        "min_samples_leaf": [value1, value2, ..., valueN],
        "criterion": ["gini", "entropy"]*
    },
    "naive_bayes": {
        "alpha": [value1, value2, ..., valueN] [1.0*]
    }
}
```

* Valor default

```json
{
    "data_file": "archivo.csv",
    "model": "modelo.pkl",
    "prediction": "columna_a_predecir"
}
```


