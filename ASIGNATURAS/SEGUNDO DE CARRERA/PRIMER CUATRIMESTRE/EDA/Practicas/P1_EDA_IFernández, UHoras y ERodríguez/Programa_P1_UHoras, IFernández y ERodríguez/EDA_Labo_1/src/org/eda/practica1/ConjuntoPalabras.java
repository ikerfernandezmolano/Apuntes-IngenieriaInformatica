package org.eda.practica1;

import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;
import java.util.TreeSet;

public class ConjuntoPalabras {
	private TreeSet<String> treePalabras;
	
	public ConjuntoPalabras() { //Método constructor de la clase ConjuntoPalabras
		treePalabras = new TreeSet<>();
	}
	
	public void cargarPalabras() { //Método utilizado para cargar las palabras del fichero "datuak-2024-2025/words.txt". Va leyendo línea a línea cada palabra y las añade al TreeSet.
		try {
			Scanner entrada = new Scanner(new FileReader("datuak-2024-2025/words.txt"));
			while(entrada.hasNextLine()) {
				String linea = entrada.nextLine();
				treePalabras.add(linea);
			}
			entrada.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public TreeSet<String> getTreePalabras() { //Método para obtener el treeSet de palabras
		return treePalabras;
	}

	public void imprimir() { //Método que imprime cada palabra del TreeSet
		for(String palabra: treePalabras) {
			System.out.println(palabra);
		}
	}
}








