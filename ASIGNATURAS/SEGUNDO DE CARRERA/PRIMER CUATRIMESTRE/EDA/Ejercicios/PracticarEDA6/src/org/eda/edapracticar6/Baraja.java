package org.eda.edapracticar6;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

public class Baraja implements Iterable<Carta>{
	private ArrayList<Carta> cartas;
	
	public Baraja() {
		this.cartas=new ArrayList<Carta>();
		for(int i=0;i<4;i++) {
			for(int j=1;j<11;j++) {
				this.cartas.add(new Carta(i, j));		
			}
		}
		Collections.shuffle(cartas);
		for(int i=1;i<this.cartas.size();i++)System.out.println("La carta "+this.cartas.get(i-1).valor+" del palo "+ this.cartas.get(i-1).palo);		
	}
	
	@Override
    public Iterator<Carta> iterator() {
        return this.cartas.iterator();
	}
}
