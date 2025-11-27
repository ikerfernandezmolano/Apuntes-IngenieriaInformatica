package org.eda.edap2;

public class UnorderedDoubleLinkedList<T> extends DoubleLinkedList<T> implements UnorderedListADT<T> {
	
	// añade un elemento al comienzo
	public void addToFront(T elem) { //Coste O(1), constante
		Node<T> nuevo=new Node<T>(elem);
		if(this.isEmpty()) {	
			this.first=nuevo;
			this.last=nuevo;
		}
		else {
			nuevo.next=first;
			first.prev=nuevo;
			first=nuevo;
		}
		this.count++;
	}

	// añade un elemento al final 
	public void addToRear(T elem) { //Coste O(1), constante
		Node<T> nuevo=new Node<T>(elem);
		if(this.isEmpty()) {	
			this.first=nuevo;
			this.last=nuevo;
		}
		else {
			nuevo.prev=last;
			last.next=nuevo;
			last=nuevo;
		}
		this.count++;
	}
	
	// Añade elem detrás de otro elemento concreto, target,  que ya se encuentra en la lista
	public void addAfter(T elem, T target) { //Coste O(n), lineal. Busca en la lista el target hasta que lo encuentra y entonces coloca el nuevo
		if(this.isEmpty()) {
			throw new IllegalStateException("La lista está vacía");
		}
		
		Node<T> nuevo= new Node<T>(elem);
		Node<T> actual=first;
		boolean enc=false;
		while(actual!=null && !enc) {
			if(actual.data.equals(target)) enc=true;
			else actual=actual.next;
		}
		if(enc) {
			nuevo.next=actual.next;
			nuevo.prev=actual;
			if(actual.next!=null) {
				nuevo.next.prev=nuevo;
			}
			else {
				last=nuevo;
			}
			actual.next=nuevo;
			this.count++;
		}
		else {
			throw new IllegalArgumentException("El elemento no se encuentra en la lista");
		}
	}
	
	@Override
	protected DoubleLinkedList<T> createList() {
		return new UnorderedDoubleLinkedList<T>();
	}
}
