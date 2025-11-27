package org.eda.edap2;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class DoubleLinkedList<T> implements ListADT<T>{

	// Atributos
	protected Node<T> first;  // apuntador al primero
	protected Node<T> last;  // apuntador al último
	protected String descr;  // descripción
	protected int count;

	// Constructor
	public DoubleLinkedList() {
        first = null;
        last = null;
		descr = "";
		count = 0;
	}
	
	public void setDescr(String nom) {
	  descr = nom;
	}

	public String getDescr() {
	  return descr;
	}

	// Elimina el primer elemento de la lista
	public T removeFirst() { //Coste O(1), constante. Trata los casos de que sea vacía, sólo haya 1 elemento o que haya varios.
		T data=null;
		if(!this.isEmpty()) {
			data=this.first();
			first=first.next;
			if(first!=null) {
				first.prev.next=null;
				first.prev=null;
			}	
			else {
				
				last=null;
			}
			count--;
		}
		return data;
		
	}

	// Elimina el último elemento de la lista
	public T removeLast() { //Coste O(1), constante. removeFirst() es constante y las instrucciones en el else son constantes
		T data=null;
		if(!this.isEmpty()) {
			if(this.count==1) {
				data=this.removeFirst();
			}
			else{
				Node<T> actual=last;
				data=this.last();
				last=last.prev;
				last.next=null;
				actual.prev=null;
				count--;
			}
		}
		return data;
    }
	
    //Elimina un elemento concreto de la lista (primera aparición)
    public T remove(T elem) { 
    	//En el caso de que el elemento a borrar sea el primero o el último el coste será O(1), constante. 
    	//En el caso de que se encuentre en el medio el coste será de O(n-1), es decir O(n), lineal.
    	//Por lo que su coste es O(n), lineal.
    	T data=null;
    	if(!this.isEmpty()) {
	    	Node<T> actual=first;
	    	
	    	if(elem.equals(first.data)) {
    			return this.removeFirst(); //O(1)
    		}
	    	
    		else if(elem.equals(last.data)){ //O(1)
    			return this.removeLast();
    		}
	    	
	    	boolean enc=false;
	    	while(!enc&&actual!=null) {
	    		data=actual.data;
	    		if(data.equals(elem)) {
	    			enc=true;
	    		}
	    		else {
	    			actual=actual.next;
	    		}
	    	}
	    	if(enc) {
	    		actual.prev.next=actual.next;
	    		actual.next.prev=actual.prev;
	    		actual.next=null;
	    		actual.prev=null;
	    		count--;
	    	}
    	}
    	return data;
    }

	//Elimina todas las apariciones de elem
	public void removeAll(T elem) { //Coste O(n), lineal. Recorre elemento a elemento la lista viendo si es o no el elemento dado y lo elimina en caso de que lo sea.
		if(!this.isEmpty()) {
			
			while(first!=null&&elem.equals(first.data)) {
	    		this.removeFirst(); //O(1)
			}
			
			Node<T> actual=first;
			while(actual!=null) {
				if(elem.equals(actual.data)){
					if(actual==last){
		    			this.removeLast(); //O(1)
		    			actual=null;
		    		}
					else{
						Node<T> nodoAEliminar=null;
						nodoAEliminar=actual;
						actual=actual.next;
						nodoAEliminar.prev.next=nodoAEliminar.next;
						nodoAEliminar.next.prev=nodoAEliminar.prev;
						nodoAEliminar.next=null;
						nodoAEliminar.prev=null;
			    		count--;
					}	
		    	}
				else{
					actual=actual.next;
				}
	    	}
    	}	
	}
	
	//Da acceso al primer elemento de la lista
	public T first() { //Coste O(1), constante
	      if (isEmpty())
	          return null;
	      else return first.data;
	}
	
	protected DoubleLinkedList<T> createList() {
		return new DoubleLinkedList<T>();
	}
	
	// Devuelve una copia de la lista (copia todos los nodos)
	public DoubleLinkedList<T> clone() { //Coste O(n), lineal, recorre toda la lista y clona los nodos
	    DoubleLinkedList<T> clonado = createList();
	    Node<T> actualaux=null;
        for (Node<T> actual = this.first; actual != null; actual = actual.next) {
            if(clonado.isEmpty()) {
            	clonado.first=actual;
            	clonado.last=actual;
            	actualaux=clonado.first;
            }
            else {
            	actualaux.next=actual;
            	actual.prev=actualaux;
            	clonado.last=actual;  	
            	actualaux=actualaux.next;
            }
            clonado.count++;
        }
        return clonado;
 }

	//Da acceso al último elemento de la lista
	public T last() { //Coste O(1), constante
		if (isEmpty())return null;
	    else return last.data;
	}

	//Determina si la lista contiene un elemento concreto
	public boolean contains(T elem) { 
		//En el mejor de los casosm si la lista es vacía el coste es O(1), constante. 
		//El peor de los casos es O(n), si está en la última posición o no está. Por lo que el coste es O(n), lineal.
		if (isEmpty()) return false;
		else {
			T data=this.find(elem);
			if(data==null)return false;
			else return true;
		}
    }

	//Determina si la lista contiene un elemento concreto, y develve su referencia, null en caso de que no esté
	public T find(T elem) { 
		//En el mejor de los casos el coste es O(1), constante, si es el primero. 
		//El peor de los casos es O(n), lineal, si está en la última posición o no está. Por lo que el coste es O(n), lineal
		T data=null;
		boolean enc=false;
    	if(!this.isEmpty()) {
	    	Node<T> actual=first;
	    	while(!enc&&actual!=null) {
	    		data=actual.data;
	    		if(data.equals(elem)) {
	    			enc=true;
	    		}
	    		else {
	    			actual=actual.next;
	    		}
	    	}
    	}
    	if(!enc) data=null;
    	return data;
	}

	//Determina si la lista está vacía
	public boolean isEmpty() { //Coste constante, O(1), hace una única comparación
		return first == null;
	}
	
	//Determina el número de elementos de la lista
	public int size() { //Coste constante, O(1), devuelve el tamaño de la lista
		return count;
	}
	
	public Iterator<T> iterator() { //Coste constante O(1)
		return new ListIterator(); 
	} 

	private class ListIterator implements Iterator<T> { 
		private Node<T> actual=first;
		
		@Override
		public boolean hasNext() { //Coste constante O(1), devuelve un booleano diciendo si actual es null
			return actual!=null;
		}
		@Override
		public void remove() { //Coste constante O(1), únicamente lanza una excepción
			throw new UnsupportedOperationException();
		}
		@Override
		public T next() { //Coste constante, hasNext() es constante, y el resto de instrucciones también lo son, por lo que O(1)
			if(!hasNext()) {
				throw new NoSuchElementException();
			}
			T data=actual.data;
			actual=actual.next;
			return data;
		}
	}
		
		
    public void visualizarNodos() { //Coste lineal, ya que imprime los datos del nodo uno a uno, O(n)
		System.out.println(this.toString());
    }

	@Override
	public String toString() { //Coste lineal, ya que devuelve un String con todos los datos de la lista
		String result = new String();
		Iterator<T> itr = iterator();
		while (itr.hasNext()) {
			T elem = itr.next();
			result = result + "[" + elem.toString() + "] \n";
		}	
		return "Lista ...............\n" + result ;
	}

}
