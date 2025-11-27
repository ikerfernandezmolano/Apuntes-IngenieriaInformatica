package org.eda.edapracticar14;

public class Arbol {
	private Nodo root;
	
	public Arbol(Nodo pRoot) {
		this.root=pRoot;
	}
	
	public void premiar(int puntos,String elem) {
		Nodo nodo=buscar(this.root,elem);
		if(nodo!=null) {
			int i=0;
			while(nodo!=null && i!=puntos) {
				nodo.content.puntos=nodo.content.puntos+puntos-i;
				nodo=nodo.padre;
				i++;
			}
		}
	}
	
	private Nodo buscar(Nodo a,String elem) {
		Nodo nodo=null;
		if(a.content.s.equals(elem)) nodo=a;
		else {
			if(a.der!=null) nodo=buscar(a.der,elem);
			if(a.izq!=null&&nodo==null) nodo=buscar(a.izq,elem);
		}	
		return nodo;
	}
	
	public void print() {
		print(root);
	}
	
	private void print(Nodo a) {
		if(a.izq!=null) print(a.izq); 
		if(a.der!=null) print(a.der);
		System.out.println("Nombre: "+a.content.s+" Puntuación: "+ a.content.puntos);
	}
}
