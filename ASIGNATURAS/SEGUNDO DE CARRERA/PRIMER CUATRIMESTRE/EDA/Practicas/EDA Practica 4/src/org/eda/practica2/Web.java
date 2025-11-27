package org.eda.practica2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;

public class Web {
	private int id;
	private String direccion;
	private LinkedList<Web> salientes;
	
	public Web(int id, String dir) { //M�todo constructor de la clase Web
		this.id = id;
		this.direccion = dir;
		this.salientes = new LinkedList<Web>();
	}

	public void anadirSaliente(Web pSaliente) { //M�todo que a�ade un enlace saliente
		this.salientes.addLast(pSaliente);;
	}
	
	public ArrayList<String> getSalientes() { //M�todo que obtiene todos los enlaces salientes de la web
		ArrayList<String> al=new ArrayList<String>();
		Iterator<Web> itr = this.salientes.iterator();
		while(itr.hasNext()) {
			Web w=itr.next();
			al.add(w.direccion);
		}
		return al;
	}
	
	public boolean esLaMismaDir(String pDir) { //M�todo que verifica si la web tiene la misma direcci�n que la pasada por par�metro
		return this.direccion.equals(pDir);
	}
	
	public void imprimirSalientes() { //M�todo que imprime todos los enlaces salientes de la web
		Iterator<Web> itr = this.salientes.iterator();
		while(itr.hasNext()) {
			System.out.println(itr.next().getDireccion()+" ");
		}
	}
	
	public int getId() { //M�todo que obtiene el ide de la web
		return this.id;
	}

	public void setId(int pId) { //M�todo que establece el id de una Web
		this.id = pId;
	}

	public String getDireccion() { //M�todo que obtiene la direcci�n de una web
		return this.direccion;
	}

	public void setDireccion(String pDir) { //M�todo que establece la direcci�n de una web
		this.direccion = pDir;
	}
}