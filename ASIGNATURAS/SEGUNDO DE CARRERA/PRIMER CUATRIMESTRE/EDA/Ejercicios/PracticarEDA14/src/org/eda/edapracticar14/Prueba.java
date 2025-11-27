package org.eda.edapracticar14;

public class Prueba {
	
	public static void main(String args[]) {
		
		Nodo nd= new Nodo(new Info("D"), null, null);
		Nodo nf= new Nodo(new Info("F"), null, null);
		Nodo nc= new Nodo(new Info("C"), nd, nf);
		nd.setNodoPadre(nc);
		nf.setNodoPadre(nc);
		
		Nodo ng= new Nodo(new Info("G"), null, null);
		Nodo nh= new Nodo(new Info("H"), ng, null);
		Nodo nk= new Nodo(new Info("K"), null, null);
		Nodo nj= new Nodo(new Info("J"), nh, nk);
		
		ng.setNodoPadre(nh);
		nh.setNodoPadre(nj);
		nk.setNodoPadre(nj);
		
		Nodo nb= new Nodo(new Info("B"), nc, nj);
		nc.setNodoPadre(nb);
		nj.setNodoPadre(nb);
		
		Nodo ni= new Nodo(new Info("I"), null, null);
		Nodo na= new Nodo(new Info("A"), nb, ni);
		ni.setNodoPadre(na);
		
		Arbol a=new Arbol(na);
		
		a.print();
		a.premiar(3, "H");
		System.out.println();
		a.print();
	}
}
