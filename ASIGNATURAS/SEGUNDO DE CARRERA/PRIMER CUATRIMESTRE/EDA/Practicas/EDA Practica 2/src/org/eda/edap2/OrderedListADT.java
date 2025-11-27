package org.eda.edap2;

public interface OrderedListADT<T>  extends ListADT<T> {
	
	public void add(T pElem);
	// Añade un elemento a la lista (en el lugar de orden que le corresponde)

	public void merge(DoubleLinkedList<T> pLista);

}
