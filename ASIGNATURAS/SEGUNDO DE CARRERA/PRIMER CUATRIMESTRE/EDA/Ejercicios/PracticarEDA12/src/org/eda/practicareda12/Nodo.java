package org.eda.practicareda12;

public class Nodo {
	Marcador info;
	Nodo izq,der;
	
	public Nodo(Marcador pInfo,Nodo pIzq,Nodo pDer) {
		this.info=pInfo;
		this.der=pDer;
		this.izq=pIzq;
	}
}
