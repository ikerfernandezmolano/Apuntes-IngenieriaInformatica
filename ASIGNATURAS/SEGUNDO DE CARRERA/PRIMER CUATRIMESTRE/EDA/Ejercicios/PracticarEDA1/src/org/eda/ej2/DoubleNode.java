package org.eda.ej2;

public class DoubleNode<T> {
	T data;
	DoubleNode<T> prev;
	DoubleNode<T> next;
	
	public DoubleNode (T pData){
		this.data=pData;
	}
}
