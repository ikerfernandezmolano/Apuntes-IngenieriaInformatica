package org.eda.ej1;

public class Lista {
	Node first;
	public Lista obtenerListaComplementaria(int pN) {
		Lista lista=new Lista();
		int ultNum=1;
		Node actual=this.first;
		Node actualAux=null;
		while(actual!=null) {
			int num=actual.data;
			while(ultNum<num) {
				Node nuevo=new Node(ultNum);
				if(actualAux!=null) {
					actualAux.next=nuevo;
					actualAux=actualAux.next;
				}
				else {
					lista.first=nuevo;
					actualAux=lista.first;
				}
				ultNum++;
			}
			ultNum++;
			actual=actual.next;
		}
		while(ultNum<pN) {
			ultNum++;
			Node nuevo=new Node(ultNum);
			if(actualAux!=null) {
				actualAux.next=nuevo;
				actualAux=actualAux.next;
			}
			else {
				lista.first=nuevo;
				actualAux=lista.first;
			}
		}
		return lista;
	}
	
	public void imprimirLista() {
		Node actual=this.first;
		while(actual!=null) {
			int num=actual.data;
			System.out.println(Integer.toString(num));
			actual=actual.next;
		}
	}
}
