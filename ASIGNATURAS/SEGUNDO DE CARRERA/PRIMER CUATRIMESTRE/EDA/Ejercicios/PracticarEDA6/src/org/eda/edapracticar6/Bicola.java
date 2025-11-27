package org.eda.edapracticar6;

import java.util.LinkedList;

public class Bicola<T> {
	private LinkedList<Carta> bicola;
	public Bicola(){
		this.bicola=new LinkedList<Carta>();
	}
	public boolean estaVacia() {
		return this.bicola.isEmpty();
	}
	public void insertarIzq(Carta c) {
		this.bicola.addFirst(c);
	}
	public void insertarDer(Carta c) {
		this.bicola.addLast(c);
	}
	public void eliminarIzq() {
		this.bicola.removeFirst();
	}
	public void eliminarDer() {
		this.bicola.removeLast();
	}
	public Carta obtenerIzq() {
		return this.bicola.getFirst();
	}
	public Carta obtenerDer() {
		return this.bicola.getLast();
	}
}
