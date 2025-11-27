package org.eda.edap1;


import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;


public class ListaWebs {
	private Web[] listaWebs;
	public ListaWebs() {
		this.listaWebs = new Web[2039805];
	}
	
	public void cargarLista(String fichero) { //Método utilizado para cargar la lista de webs del fichero "datuak-2024-2025/index-2024-25". Va leyendo línea a línea cada web, hace un split para separar el índice de la dirección web, y añade el id y la web al array.
		try {
			Scanner entrada = new Scanner(new FileReader(fichero));
			while(entrada.hasNextLine()) { 
				String linea = entrada.nextLine(); 
				String[] lista=linea.split("\\s+:+\\s+");
				int id = Integer.parseInt(lista[0]);
				String dir = lista[1];
				Web web = new Web(id, dir);
				this.listaWebs[id]=web;
			}
			entrada.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void cargarSalientes(String fichero) { //Método utilizado para cargar la lista de enlaces salientes del fichero "datuak-2024-2025/pld-arcs-1-N-2024-25". Va leyendo línea a línea cada web, hace un split para separar el índice de los enlaces salientes correspondientes a dicha web, y añade el enlace saliente a la web.
		try {
			Scanner entrada = new Scanner(new FileReader(fichero));
			while(entrada.hasNextLine()) {
				String linea = entrada.nextLine(); 
				String [] datos = linea.split("\\s+>+\\s+");
				int id = Integer.parseInt(datos[0]);
				if(datos.length>1) {
					String [] salientes = datos[1].split("\\s+#+\\s+");
					Web web = this.listaWebs[id];
					for(String str : salientes) {
						int saliente = Integer.parseInt(str);
						web.añadirSaliente(this.listaWebs[saliente]);
					}
				}
			}
			entrada.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void imprimir() { //Método utilizado para imprimir lan lista de webs
		for(Web web: this.listaWebs) { 
			System.out.println(web.getId()+"   :::   "+web.getDireccion());
			System.out.println("Salientes de "+web.getId()+" : ");
			web.imprimirSalientes();
			System.out.println();
		}
	}
}

































