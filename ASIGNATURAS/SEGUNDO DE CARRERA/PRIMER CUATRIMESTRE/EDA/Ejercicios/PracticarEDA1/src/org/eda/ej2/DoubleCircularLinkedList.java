package org.eda.ej2;

public class DoubleCircularLinkedList {
	DoubleNode<String> first;
	
	public void fusionarSecuencias(String[] s1, String[] s2) {
		DoubleNode<String> actual=null;
		String str;
		int pos1=0;
		int pos2=0;
		while(pos1<s1.length||pos2<s2.length) {
			String str1=null;
			String str2=null;
			if(pos1>=s1.length) {
				str2=s2[pos2];
			}
			else if(pos2>=s2.length) {
				str1=s1[pos1];
			}
			else {
				str1=s1[pos1];
				str2=s2[pos2];
			}
			if(str1!=null&&str2!=null) {
				if(str1.compareTo(str2)<0) {
					str=str1;
					pos1++;
				}
				else {
					str=str2;
					pos2++;
				}
			}
			else if(str1==null) {
				str=str2;
				pos2++;
			}
			else {
				str=str1;
				pos1++;
			}
			DoubleNode<String> nuevo=new DoubleNode<String>(str);
			if(first==null) {
				first=nuevo;
				actual=first;
				first.next=first;
				first.prev=first;
			}
			else {
				actual.next=nuevo;
				nuevo.next=first;
				nuevo.prev=actual;
				first.prev=nuevo;
				actual=actual.next;
			}
		}
	}
	
	public void imprimirLista() {
		DoubleNode<String> actual=first;
		if(first!=null) {
			do {
				System.out.println(actual.data);
				actual=actual.next;
			}while(actual!=first);
		}
	}
}
