package org.eda.edap1;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import org.eda.edap2.UnorderedDoubleLinkedList;

public class Web {
	private int id;
	private String direccion;
	private UnorderedDoubleLinkedList<Web> salientes;
	private HashSet<String> palabrasClave; 
	
	public Web(int id, String dir) { //Método constructor de la clase Web
		this.id = id;
		this.direccion = dir;
		this.salientes = new UnorderedDoubleLinkedList<Web>();
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

	public void añadirSaliente(Web pSaliente) { //Método que añade un enlace saliente
		this.salientes.addToRear(pSaliente);;
	}
	
	public ArrayList<Web> getSalientes() { //Método que obtiene todos los enlaces salientes de la web
		ArrayList<Web> al=new ArrayList<Web>();
		Iterator<Web> itr = this.salientes.iterator();
		while(itr.hasNext()) {
			Web w=itr.next();
			al.add(w);
		}
		return al;
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
		Iterator<Web> itr = this.salientes.iterator();
		while(itr.hasNext()) {
			System.out.println(itr.next().getDireccion()+" ");
		}
	}
}