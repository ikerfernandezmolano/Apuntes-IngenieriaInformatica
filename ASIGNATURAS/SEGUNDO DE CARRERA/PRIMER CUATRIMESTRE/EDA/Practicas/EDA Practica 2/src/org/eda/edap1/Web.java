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
	
	public Web(int id, String dir) { //M�todo constructor de la clase Web
		this.id = id;
		this.direccion = dir;
		this.salientes = new UnorderedDoubleLinkedList<Web>();
		this.palabrasClave = new HashSet<>();
	}
	
	public void anadirPalabraClave(String pPalCla) { //M�todo que a�ade una palabra clave pasada por par�metro al HashSet.
		this.palabrasClave.add(pPalCla.toLowerCase());
	}
	public ArrayList<String> getPalabrasClave(){ //M�todo utilizado para obtener las palabras clave.
		ArrayList<String> lista = new ArrayList<>(this.palabrasClave);
		return lista;
	}
	
	public boolean tienePalabraClave(String pPalCla) { //M�todo que indica si una web tiene o no alguna palabra clave asociada.
		return this.direccion.toLowerCase().contains(pPalCla.toLowerCase().trim());
	}

	public void anadirSaliente(Web pSaliente) { //M�todo que a�ade un enlace saliente
		this.salientes.addToRear(pSaliente);;
	}
	
	public ArrayList<Web> getSalientes() { //M�todo que obtiene todos los enlaces salientes de la web
		ArrayList<Web> al=new ArrayList<Web>();
		Iterator<Web> itr = this.salientes.iterator();
		while(itr.hasNext()) {
			Web w=itr.next();
			al.add(w);
		}
		return al;
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
	
	public boolean esLaMismaDir(String pDir) { //M�todo que verifica si la web tiene la misma direcci�n que la pasada por par�metro
		return this.direccion.equals(pDir);
	}
	
	public void imprimirSalientes() { //M�todo que imprime todos los enlaces salientes de la web
		Iterator<Web> itr = this.salientes.iterator();
		while(itr.hasNext()) {
			System.out.println(itr.next().getDireccion()+" ");
		}
	}
}