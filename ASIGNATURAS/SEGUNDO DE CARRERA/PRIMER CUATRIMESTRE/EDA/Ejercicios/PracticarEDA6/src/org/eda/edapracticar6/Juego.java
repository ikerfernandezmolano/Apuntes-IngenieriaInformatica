package org.eda.edapracticar6;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Iterator;

public class Juego {
	private Bicola<Carta>[] mesa;
	private Baraja baraja;
	private Queue<Carta>[] jugadores;
	
	public int jugar() {
		int jugGan=0;
		this.jugadores=(Queue<Carta>[])new LinkedList[4];
		for(int i=0;i<this.jugadores.length;i++) this.jugadores[i]=new LinkedList<Carta>();
		this.baraja=new Baraja();
		Iterator<Carta> itr=baraja.iterator();
		int i=0;
		while(itr.hasNext()) {
			if(i>3)i=0;
			this.jugadores[i].add(itr.next());
			i++;
		}
		this.mesa=new Bicola[4];
		for(int j=0;j<4;j++) this.mesa[j]=new Bicola<Carta>();
		boolean terminar=false;
		int turnoJug=0;
		int turno=0;
		while(!terminar) {
			if(turnoJug>3) turnoJug=0;
			Carta c=this.jugadores[turnoJug].remove();
			if(c.valor==6) {
				System.out.println("El jugador "+(turnoJug+1)+" ha colocado la carta "+ c.palo +" "+c.valor+ " en la mesa");
				this.mesa[c.palo].insertarDer(c);
			}
			else {
				if(this.mesa[c.palo].estaVacia()) {
					System.out.println("El jugador "+(turnoJug+1)+" ha devuelto a su baraja la carta "+ c.palo +" "+c.valor);
					this.jugadores[turnoJug].add(c);
				}
				else {	
					if((this.mesa[c.palo].obtenerDer().valor+1)==c.valor) {
						System.out.println("El jugador "+(turnoJug+1)+" ha colocado la carta "+ c.palo +" "+c.valor+ " en la mesa");
						this.mesa[c.palo].insertarDer(c);
					}
					else if((this.mesa[c.palo].obtenerIzq().valor-1)==c.valor) {
						System.out.println("El jugador "+(turnoJug+1)+" ha colocado la carta "+ c.palo +" "+c.valor+ " en la mesa");
						this.mesa[c.palo].insertarIzq(c);
					}
					else {
						System.out.println("El jugador "+(turnoJug+1)+" ha devuelto a su baraja la carta "+ c.palo +" "+c.valor);
						this.jugadores[turnoJug].add(c);
					}
				}
			}
			int j=0;
			while(j<4&&!terminar) {
				terminar=this.jugadores[j].isEmpty();
				j++;
			}
			if(terminar) jugGan=j;
			turnoJug++;
			turno++;
		}
		System.out.println("\nEl juego ha durado "+turno+" turnos.");
		return jugGan;
	}
}
