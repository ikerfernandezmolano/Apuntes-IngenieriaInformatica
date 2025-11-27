package org.eda.practica2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;

public class Web {
	private int id;
	private String direccion;
	private LinkedList<Web> salientes;
	
	public Web(int id, String dir) { //Método constructor de la clase Web
		this.id = id;
		this.direccion = dir;
		this.salientes = new LinkedList<Web>();
	}

	public void añadirSaliente(Web pSaliente) { //Método que añade un enlace saliente
		this.salientes.addLast(pSaliente);;
	}
	
	public ArrayList<String> getSalientes() { //Método que obtiene todos los enlaces salientes de la web
		ArrayList<String> al=new ArrayList<String>();
		Iterator<Web> itr = this.salientes.iterator();
		while(itr.hasNext()) {
			Web w=itr.next();
			al.add(w.direccion);
		}
		return al;
	}
	
	public boolean esLaMismaDir(String pDir) { //Método que verifica si la web tiene la misma dirección que la pasada por parámetro
		return this.direccion.equals(pDir);
	}
	
	public void imprimirSalientes() { //Método que imprime todos los enlaces salientes de la web
		Iterator<Web> itr = this.salientes.iterator();
		while(itr.hasNext()) {
			System.out.println(itr.next().getDireccion()+" ");
		}
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
}