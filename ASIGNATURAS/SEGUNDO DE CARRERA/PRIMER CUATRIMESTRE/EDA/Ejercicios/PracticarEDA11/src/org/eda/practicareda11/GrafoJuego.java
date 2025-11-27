package org.eda.practicareda11;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;

public class GrafoJuego {
	private HashMap<Integer,ArrayList<Casilla>> adyacentes;
	
	public GrafoJuego() {
		this.adyacentes=new HashMap<Integer,ArrayList<Casilla>>();
	}
	
	public LinkedList<Casilla> camino(Casilla comienzo,Casilla fin){
		LinkedList<Casilla> camino = new LinkedList<Casilla>();
		Queue<Casilla> porEx=new LinkedList<Casilla>();
		HashMap<Casilla,Casilla> examinados = new HashMap<Casilla,Casilla>();
		
		porEx.add(comienzo);
		examinados.put(comienzo, null);
		
		boolean caminoEnc=false;
		
		while(!porEx.isEmpty()&& !caminoEnc) {
			Casilla casActual=porEx.remove();
			for(Casilla cas:adyacentes.get(casActual.valor)) {
				if(!examinados.containsKey(cas)) {
					if(!casActual.color.equals(cas.color)) {
						porEx.add(cas);
						examinados.put(cas, casActual);
						if(cas.equals(fin)) caminoEnc=true;
					}
				}
			}
		}
		if(caminoEnc) {
			Casilla casAPoner=fin;
			while(!casAPoner.equals(comienzo)) {
				camino.addFirst(casAPoner);
				casAPoner=examinados.get(casAPoner);
			}
			camino.addFirst(comienzo);
		}
		return camino;
	}
	
	public void put(Integer i,ArrayList<Casilla> al) {
		this.adyacentes.put(i, al);
	}
	
	public void print() {
		for(Integer keys:adyacentes.keySet()) {
			System.out.print("Casilla origen: "+ keys + " >>> ");
			for(Casilla cas:adyacentes.get(keys)) {
				System.out.print(cas.valor+" ");
			}
			System.out.println();
		}
	}
}
