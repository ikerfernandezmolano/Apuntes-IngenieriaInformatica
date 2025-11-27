package org.eda.ej2;


public class Probar {
	public static void main(String[] args) {
		DoubleCircularLinkedList lista=new DoubleCircularLinkedList();
		String[] s1=new String[3];
		String[] s2=new String[5];
		s1[0]="col";
		s1[1]="oir";
		s1[2]="pan";
		s2[0]="ama";
		s2[1]="gas";
		s2[2]="mar";
		s2[3]="rio";
		s2[4]="zar";
		lista.fusionarSecuencias(s1, s2);
		lista.imprimirLista();
	}
}
