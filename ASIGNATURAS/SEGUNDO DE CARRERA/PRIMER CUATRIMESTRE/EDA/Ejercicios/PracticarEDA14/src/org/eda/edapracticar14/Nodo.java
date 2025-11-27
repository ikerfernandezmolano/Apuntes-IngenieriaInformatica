package org.eda.edapracticar14;

public class Nodo {
	Info content;
	Nodo izq,der;
	Nodo padre;
	
	public Nodo(Info pContent, Nodo pIzq, Nodo pDer) {
		this.content=pContent;
		this.der=pDer;
		this.izq=pIzq;
	}
	
	public void setNodoPadre(Nodo pPadre) {
		this.padre=pPadre;
	}
}
