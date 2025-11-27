package org.eda.practicareda12;

public class Prueba {
	
	public static void main(String args[]) {
		
		Nodo n1=new Nodo(new Marcador("E1", -1, -1),null,null);
		Nodo n2=new Nodo(new Marcador("E2", -1, -1),null,null);
		Nodo n3=new Nodo(new Marcador("E3", -1, -1),null,null);
		Nodo n4=new Nodo(new Marcador("E4", -1, -1),null,null);
		Nodo n5=new Nodo(new Marcador("E5", -1, -1),null,null);
		Nodo n6=new Nodo(new Marcador("E6", -1, -1),null,null);
		Nodo n7=new Nodo(new Marcador("E7", -1, -1),null,null);
		Nodo n8=new Nodo(new Marcador("E8", -1, -1),null,null);
		
		Nodo n9=new Nodo(new Marcador(null, 1, 0),n1,n2);
		Nodo n10=new Nodo(new Marcador(null, 2, 0),n3,n4);
		Nodo n11=new Nodo(new Marcador(null, 1, 3),n5,n6);
		Nodo n12=new Nodo(new Marcador(null, 1, 0),n7,n8);
		
		Nodo n13=new Nodo(new Marcador(null, 1, 2),n9,n10);
		Nodo n14=new Nodo(new Marcador(null, 2, 0),n11,n12);
		
		Nodo root=new Nodo(new Marcador(null, 0, 2), n13, n14);
		
		Campeonato camp=new Campeonato(root);
		
		camp.print();
		
		camp.campeon();
		System.out.println();
		camp.print();
	}
}
