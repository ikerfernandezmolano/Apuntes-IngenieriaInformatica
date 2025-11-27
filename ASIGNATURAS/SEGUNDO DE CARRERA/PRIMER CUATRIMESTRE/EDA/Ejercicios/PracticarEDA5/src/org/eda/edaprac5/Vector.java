package org.eda.edaprac5;

public class Vector {
	
	Node first;
	
	public Vector suma(Vector v1) {
		 Vector res=new Vector();
		 Node actual1=this.first;
		 Node actual2=v1.first;
		 Node actualres=res.first;
		 while(actual1!=null||actual2!=null) {
			 Node nuevo;
			 if(actual2==null||actual1.posicion<actual2.posicion) {
				 nuevo=new Node(actual1.posicion, actual1.dato);
				 actual1=actual1.next;
			 }
			 else if(actual1==null||actual2.posicion<actual1.posicion) {
				 nuevo=new Node(actual2.posicion, actual2.dato);
				 actual2=actual2.next;
			 }
			 else {
				 nuevo=new Node(actual1.posicion, actual1.dato+actual2.dato);
				 actual1=actual1.next;
				 actual2=actual2.next;
			 }
			 if(res.first==null) {
				 res.first=nuevo;
				 actualres= res.first;
			 }
			 else {
				 actualres.next=nuevo;
				 actualres=actualres.next;
			 } 
		 }
		 
		 return res;
	}
	
	private void anadirAlFinal(Integer pPos, Integer pDato) {
		Node nuevo=new Node(pPos, pDato);
		if(this.first==null) {
			this.first=nuevo;
		}
		else {
			Node actual=this.first;
			while(actual.next!=null) {
				actual=actual.next;
			}
			actual.next=nuevo;
		}
	}
	
	private void imprimirVector() {
		Node actual=this.first;
		if(this.first!=null) {
			while(actual!=null) {
				System.out.println("POS: "+actual.posicion+", DATO: "+actual.dato);
				actual=actual.next;
			}
		}
	}
	
	public static void main(String[] args) {
		Vector res=null;
		
		Vector v1=new Vector();
		v1.anadirAlFinal(3, 1);
		v1.anadirAlFinal(4, 3);
		v1.anadirAlFinal(6, 6);
		v1.anadirAlFinal(9, 3);
		v1.imprimirVector();
		
		System.out.println("\n");
		Vector v2=new Vector();
		v2.anadirAlFinal(2, 3);
		v2.anadirAlFinal(3, 2);
		v2.anadirAlFinal(5, 4);
		v2.anadirAlFinal(8, 6);
		v2.imprimirVector();
		
		System.out.println("\n");
		res=v1.suma(v2);
		res.imprimirVector();
		
	}
	
	private class Node{
		Integer dato;
		Integer posicion;
		Node next;
		
		public Node(Integer pPos, Integer pDato) {
			this.posicion=pPos;
			this.dato=pDato;
			this.next=null;
		}
	}
}
