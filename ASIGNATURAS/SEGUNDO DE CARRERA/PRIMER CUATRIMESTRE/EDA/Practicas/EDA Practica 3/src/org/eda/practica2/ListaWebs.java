package org.eda.practica2;


import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class ListaWebs{
	private Web[] listaWebs;
	public ListaWebs() {
		this.listaWebs = new Web[2039805];
	}
	
	public void cargarLista(String fichero) { //M�todo utilizado para cargar la lista de webs del fichero "datuak-2024-2025/index-2024-25". Va leyendo l�nea a l�nea cada web, hace un split para separar el �ndice de la direcci�n web, y a�ade el id y la web al array.
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
	
	public void cargarSalientes(String fichero) { //M�todo utilizado para cargar la lista de enlaces salientes del fichero "datuak-2024-2025/pld-arcs-1-N-2024-25". Va leyendo l�nea a l�nea cada web, hace un split para separar el �ndice de los enlaces salientes correspondientes a dicha web, y a�ade el enlace saliente a la web.
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
						web.anadirSaliente(this.listaWebs[saliente]);
					}
				}
			}
			entrada.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Web[] getLista() {
		return this.listaWebs;
	}
}

































