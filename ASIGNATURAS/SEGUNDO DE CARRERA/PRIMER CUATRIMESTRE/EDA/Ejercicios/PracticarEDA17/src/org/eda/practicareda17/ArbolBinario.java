package org.eda.practicareda17;

public class ArbolBinario {
	Nodo root;
	
	public ArbolBinario() {
		Nodo n1=new Nodo(7, null, null);
		Nodo n2=new Nodo(25, null, null);
		Nodo n3=new Nodo(29, n2, null);
		Nodo n4=new Nodo(22, n1, n3);
		Nodo n5=new Nodo(46, null, null);
		Nodo n6=new Nodo(49, null, null);
		Nodo n7=new Nodo(43, null, n5);
		Nodo n8=new Nodo(50, n6, null);
		Nodo n9=new Nodo(48, n7, n8);
		Nodo n10=new Nodo(70, null, null);
		Nodo n11=new Nodo(54, n9, n10);
		root=new Nodo(40, n4, n11);
	}
	
	public void cerrarArbol() {
		cerrarArbol(root);
	}
	
	private void cerrarArbol(Nodo a) {
		if(a.der==null) a.der=new Nodo(-1, null, null);
		else cerrarArbol(a.der);
		if(a.izq==null) a.izq=new Nodo(-1, null, null);
		else cerrarArbol(a.izq);
	}
	
	public static void main(String args[]) {
		ArbolBinario ab=new ArbolBinario();
		ab.cerrarArbol();
		ab.print(ab.root);
	}
	
	private void print(Nodo a) {
		if(a.izq!=null) print(a.izq);
		System.out.println(a.info);
		if(a.der!=null) print(a.der);
	}
	
	private class Nodo {
		int info;
		Nodo izq,der;
		
		public Nodo(int pInfo,Nodo pIzq,Nodo pDer) {
			this.info=pInfo;
			this.der=pDer;
			this.izq=pIzq;
		}
	}
}


