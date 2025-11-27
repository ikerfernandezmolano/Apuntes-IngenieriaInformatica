package org.eda.practica1;


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
	
	public void cargarLista() { //Método utilizado para cargar la lista de webs del fichero "datuak-2024-2025/index-2024-25". Va leyendo línea a línea cada web, hace un split para separar el índice de la dirección web, y añade el id y la web al array.
		try {
			Scanner entrada = new Scanner(new FileReader("datuak-2024-2025/index-2024-25"));
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
	
	public void cargarSalientes() { //Método utilizado para cargar la lista de enlaces salientes del fichero "datuak-2024-2025/pld-arcs-1-N-2024-25". Va leyendo línea a línea cada web, hace un split para separar el índice de los enlaces salientes correspondientes a dicha web, y añade el enlace saliente a la web.
		try {
			Scanner entrada = new Scanner(new FileReader("datuak-2024-2025/pld-arcs-1-N-2024-25"));
			while(entrada.hasNextLine()) {
				String linea = entrada.nextLine(); 
				String [] datos = linea.split("\\s+>+\\s+");
				int id = Integer.parseInt(datos[0]);
				if(datos.length>1) {
					String [] salientes = datos[1].split("\\s+#+\\s+");
					Web web = this.listaWebs[id];
					for(String str : salientes) {
						int saliente = Integer.parseInt(str);
						web.añadirSaliente(saliente);
					}
				}
			}
			entrada.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void cargarPalabraClave() { //Método utilizado para cargar las palabras del fichero "datuak-2024-2025/words.txt". Va leyendo línea a línea cada palabra y las añade al TreeSet.
		try {
			Scanner entrada = new Scanner(new FileReader("datuak-2024-2025/words.txt"));
			while(entrada.hasNextLine()) {
				String palabra = entrada.nextLine();
				for(Web web: this.listaWebs){
					if(web.tienePalabraClave(palabra)) {
						web.añadirPalabraClave(palabra);
					}
				}
			}
			entrada.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void cargarListaEnFicheros() { //Método utilizado para cargar la lista en el mismo formato que se nos da en los ficheros
		try {
			PrintWriter pw = new PrintWriter("datuak-2024-2025/index-2024-25-ACTUALIZADO", "UTF-8");
			PrintWriter pw2 = new PrintWriter("datuak-2024-2025/pld-arcs-1-N-2024-25-ACTUALIZADO", "UTF-8");
			for(Web web : listaWebs) { 
				pw.println(web.getId()+" ::: "+web.getDireccion());
				pw2.print(web.getId()+" >>>> ");
				for(int saliente: web.getSalientes()) {
					pw2.print(saliente +" ###");
				}
			}
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Web buscarWeb(String pDir) { //Método utilizado para buscar una web concreta, cuya dirección se proporciona como parámetro
		boolean enc = false;
		Web web = null;
		int i=0;
		while(!enc && i<this.listaWebs.length){ 
			web=this.listaWebs[i];
			enc=web.esLaMismaDir(pDir);
			i++;
		}
		if(!enc) {
			web = null;
		}
		return web;
	}
	
	public void borrarWeb(String pDir) { //Método utilizado para borrar una web concreta, cuya dirección se proporciona como parámetro, de la lista de webs
		Web web = this.buscarWeb(pDir);
		this.listaWebs[web.getId()]=null;
	}
	
	public void añadirWeb(Web pWeb) { //Método utilizado para añadir una web concreta, cuya dirección se proporciona como parámetro, a la lista de webs
		this.listaWebs[pWeb.getId()]=pWeb;
	}
	
	public ArrayList<String> ordenarWebs(){ //Método utilizado para ordenar las webs, para ello se utiliza el método de ordenación "quickSort", mediante una llamada al método con dicho nombre
		ArrayList<String> lista= new ArrayList<String>();
		for(Web web:this.listaWebs) {
			if(web!=null) {
				lista.add(web.getDireccion());
			}
		}
		quickSort(lista,0,lista.size()-1);
		return lista;
	}
	
	private void quickSort(ArrayList<String> pLista,int pBajo, int pAlto){ //Método de ordenación QuickSort
		 if (pBajo < pAlto) {
	            int p = particion(pLista, pBajo, pAlto); 
	            this.quickSort(pLista, pBajo, p - 1);  
	            this.quickSort(pLista, p + 1, pAlto); 
	       }
	}
	
	private int particion(ArrayList<String> pLista,int pBajo, int pAlto) { //Método utilizado para completar el algoritmo QuickSort. Su función es reorganizar una sublista en la lista dada.
		String temp;
		String pivote = pLista.get(pAlto); 
        int i=pBajo-1;
        for (int j=pBajo;j<pAlto;j++) {
            if (pLista.get(j).compareTo(pivote) <= 0) {
                i++;
                temp = pLista.get(i);
                pLista.set(i, pLista.get(j));
                pLista.set(j, temp);
            }
        }
        temp = pLista.get(i + 1);
        pLista.set(i + 1, pLista.get(pAlto));
        pLista.set(pAlto, temp);
        return i + 1;
	}
	
	public ArrayList<String> salientes(String pWeb){ //Método utilizado para obtener la web de los enlaces salientes de una web dada como parámetro, y añadir sus direcciones a la lista.
		ArrayList<String> lista = new ArrayList<>();
		Web web = buscarWeb(pWeb); 
		if(web!=null) {
			for(int saliente: web.getSalientes()) {
				String dir = this.listaWebs[saliente].getDireccion();
				lista.add(dir);
			}
		}
		return lista;
	}
	
	public ArrayList<String> word2Webs(String pS){ //Método que devuelve la lista de webs que contienen una palabra dada como parámetro
		ArrayList<String> lista = new ArrayList<>();
		for(Web web : this.listaWebs) {
			if(web.getDireccion().contains(pS)) {
				lista.add(web.getDireccion());
			}
		}
		return lista;
	}
	
	public ArrayList<String> web2Words(String pWeb){ //Método que devuelve las palabras que aparecen en una web dada como parámetro
		Web web = this.buscarWeb(pWeb);
		if(web!=null) {
			return web.getPalabrasClave();
		}else {
			return null;
		}
	}
	
	public String ident2String(int pX) { //Método que devuelve la web asociada a X
		return this.listaWebs[pX].getDireccion();
	}
	
	public void imprimir() { //Método utilizado para imprimir lan lista de webs
		for(Web web: this.listaWebs) { 
			System.out.println(web.getId()+"   :::   "+web.getDireccion());
			System.out.println("Salientes de "+web.getId()+" : ");
			web.imprimirSalientes();
			System.out.println();
		}
	}
	
	//Sólo lo usamos con los JUnit
	public Web getWebPorId(int pId) { //Método utilizado para obtener la web con identificador igual al parámetro dado
		return this.listaWebs[pId];
	}
}

































