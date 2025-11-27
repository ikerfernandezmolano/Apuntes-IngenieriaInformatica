package org.eda.practicareda11;

import java.util.ArrayList;
import java.util.LinkedList;

public class Prueba {
	public static void main(String args[]) {
		
		GrafoJuego grafo=new GrafoJuego();
		
		Casilla cas11= new Casilla("Blanca",11);
		Casilla cas5= new Casilla("Blanca",5);
		Casilla cas13= new Casilla("Negra",13);
		Casilla cas8= new Casilla("Blanca",8);
		Casilla cas9= new Casilla("Negra",9);
		Casilla cas7= new Casilla("Negra",7);
		Casilla cas3= new Casilla("Negra",3);
		Casilla cas1= new Casilla("Blanca",1);
		Casilla cas12= new Casilla("Negra",12);
		Casilla cas17= new Casilla("Negra",17);
		Casilla cas4= new Casilla("Blanca",4);
		Casilla cas20= new Casilla("Blanca",20);
		
		ArrayList<Casilla> al=new ArrayList<Casilla>();
		al.add(cas5);
		al.add(cas13);
		grafo.put(11, al);
		al=new ArrayList<Casilla>();
		al.add(cas11);
		al.add(cas13);
		al.add(cas8);
		al.add(cas9);
		grafo.put(5, al);
		al=new ArrayList<Casilla>();
		al.add(cas11);
		al.add(cas8);
		al.add(cas5);
		grafo.put(13, al);
		al=new ArrayList<Casilla>();
		al.add(cas13);
		al.add(cas5);
		al.add(cas9);
		grafo.put(8, al);
		al=new ArrayList<Casilla>();
		al.add(cas8);
		al.add(cas5);
		al.add(cas7);
		al.add(cas3);
		al.add(cas12);
		al.add(cas1);
		grafo.put(9, al);
		al=new ArrayList<Casilla>();
		al.add(cas1);
		al.add(cas4);
		al.add(cas17);
		al.add(cas9);
		al.add(cas12);
		grafo.put(3, al);
		al=new ArrayList<Casilla>();
		al.add(cas9);
		al.add(cas12);
		grafo.put(7, al);
		al=new ArrayList<Casilla>();
		al.add(cas7);
		al.add(cas9);
		al.add(cas3);
		al.add(cas17);
		al.add(cas20);
		grafo.put(12, al);
		al=new ArrayList<Casilla>();
		al.add(cas4);
		al.add(cas3);
		al.add(cas17);
		al.add(cas9);
		grafo.put(1, al);
		al=new ArrayList<Casilla>();
		al.add(cas1);
		al.add(cas3);
		al.add(cas17);
		al.add(cas20);
		grafo.put(4, al);
		al=new ArrayList<Casilla>();
		al.add(cas1);
		al.add(cas4);
		al.add(cas20);
		al.add(cas12);
		al.add(cas3);
		grafo.put(17, al);
		al=new ArrayList<Casilla>();
		al.add(cas4);
		al.add(cas17);
		al.add(cas12);
		grafo.put(20, al);
		
		grafo.print();
		
		LinkedList<Casilla> res=grafo.camino(cas11, cas20);
		
		System.out.println();
		for(Casilla cas:res) {
			System.out.println("Casilla: "+cas.valor+", Color: "+ cas.color);
		}
		System.out.println();
		for(Casilla cas:res) {
			System.out.print(cas.valor + " > ");
		}
	}
}