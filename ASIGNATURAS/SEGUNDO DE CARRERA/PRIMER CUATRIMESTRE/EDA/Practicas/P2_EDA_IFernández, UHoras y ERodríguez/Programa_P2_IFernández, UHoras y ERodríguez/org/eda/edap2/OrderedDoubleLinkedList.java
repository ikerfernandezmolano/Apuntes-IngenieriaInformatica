package org.eda.edap2;

public class OrderedDoubleLinkedList<T> extends DoubleLinkedList<T> implements OrderedListADT<T>{
	
	//Añade un elemento en la posición correspondiente
	public void add(T elem){ //Tiene coste O(n), lineal. Recorre la lista hasta que encuentra el valor mayor que elem, entonces lo coloca delante
		Node<T> nuevo=new Node<T>(elem);
		if(!this.isEmpty()) {	
			Node<T> actual=first;
			while(actual!=null&&((Comparable<T>)elem).compareTo(actual.data)>=0) {
				actual=actual.next;
			}
			if(actual!=null) {
				if(actual!=first) {
					actual.prev.next=nuevo;
					nuevo.prev=actual.prev;
				}
				else {
					first=nuevo;
				}
				actual.prev=nuevo;
				nuevo.next=actual;
			}
			else {
				last.next=nuevo;
				nuevo.prev=last;
				last=nuevo;
			}
		}
		else {
			first=nuevo;
			last=nuevo;
		}
		count++;
	}

	public void merge(DoubleLinkedList<T> pLista){ //add tiene coste O(n) y como se recorre pLista para añadir elemento a elemento el coste acaba resultando en O(n*m)
		Node<T> actual=pLista.first;
		while(actual!=null) {
			this.add(actual.data);
			actual=actual.next;
		}
	}
	
	@Override
	protected DoubleLinkedList<T> createList() {
		return new OrderedDoubleLinkedList<T>();
	}
}
