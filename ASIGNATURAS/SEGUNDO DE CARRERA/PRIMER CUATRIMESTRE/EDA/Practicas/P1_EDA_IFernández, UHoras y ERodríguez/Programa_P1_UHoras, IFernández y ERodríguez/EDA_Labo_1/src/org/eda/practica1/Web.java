package org.eda.practica1;

import java.util.ArrayList;
import java.util.HashSet;

public class Web {
	private int id;
	private String direccion;
	private HashSet<Integer> salientes;
	private HashSet<String> palabrasClave; 
	
	public Web(int id, String dir) { //Método constructor de la clase Web
		this.id = id;
		this.direccion = dir;
		this.salientes = new HashSet<>();
		this.palabrasClave = new HashSet<>();
	}
	
	public void añadirPalabraClave(String pPalCla) { //Método que añade una palabra clave pasada por parámetro al HashSet.
		this.palabrasClave.add(pPalCla.toLowerCase());
	}
	public ArrayList<String> getPalabrasClave(){ //Método utilizado para obtener las palabras clave.
		ArrayList<String> lista = new ArrayList<>(this.palabrasClave);
		return lista;
	}
	
	public boolean tienePalabraClave(String pPalCla) { //Método que indica si una web tiene o no alguna palabra clave asociada.
		return this.direccion.toLowerCase().contains(pPalCla.toLowerCase().trim());
	}

	public void añadirSaliente(int pId) { //Método que añade un enlace saliente, cuyo id se obtiene en forma de parámetro, al HashSet
		this.salientes.add(pId);
	}
	
	public HashSet<Integer> getSalientes() { //Método que obtiene todos los enlaces salientes de la web
		return this.salientes;
	}

	public int getId() { //Método que obtiene el ide de la web
		return this.id;
	}

	public void setId(int pId) { //Método que establece el id de una Web
		this.id = pId;
	}

	public String getDireccion() { //Método que obtiene la dirección de una web
		return this.direccion;
	}

	public void setDireccion(String pDir) { //Método que establece la dirección de una web
		this.direccion = pDir;
	}
	
	public boolean esLaMismaDir(String pDir) { //Método que verifica si la web tiene la misma dirección que la pasada por parámetro
		return this.direccion.equals(pDir);
	}
	
	public void imprimirSalientes() { //Método que imprime todos los enlaces salientes de la web
		for(int saliente:this.salientes) {
			System.out.println(saliente+" ");
		}
	}
}