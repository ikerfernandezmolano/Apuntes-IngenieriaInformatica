package org.eda.ej1;

public class Ejecutar {
	
	public static void main(String[] args) {
		Lista lista=new Lista();
		lista.first=new Node(2);
		lista.first.next=new Node(5);
		lista.first.next.next=new Node(6);
		lista.first.next.next.next=new Node(8);
		lista.first.next.next.next.next=new Node(10);
		lista.first.next.next.next.next.next = new Node(11);
		
		Lista listaCom=lista.obtenerListaComplementaria(15);
		lista.imprimirLista();
		listaCom.imprimirLista();
	}
}
