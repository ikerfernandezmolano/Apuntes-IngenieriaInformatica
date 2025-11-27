package org.eda.practicareda7;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

public class Impresoras {
	
	public void procesarTrabajos(ArrayList<Peticion> lista) {
		Queue<Integer>[] impresoras= (Queue<Integer>[])new LinkedList[6];
		for(int i=0;i<impresoras.length;i++) impresoras[i]=new LinkedList<Integer>();
		
		boolean apagon=false;
		while(!lista.isEmpty()) {
			Peticion p= lista.remove(0);
			if(p.tipoEvento.equals('A')) {
				apagon=true;
				for(int i=1;i<impresoras.length;i++) {
					while(!impresoras[i].isEmpty()) {
						impresoras[0].add(impresoras[i].remove());
					}
				}
			}
			else if(p.tipoEvento.equals('S')) apagon=false;
			else {
				if(!apagon) {
					if(p.tipoEvento.equals('P')) impresoras[p.impresora].add(p.trabajo);
					else impresoras[p.impresora].remove();
				}
				else {
					if(p.tipoEvento.equals('P')) impresoras[0].add(p.trabajo);
					else impresoras[0].remove();
				}
			}	
		}	
		this.print(impresoras);
	}
	
	private void print(Queue<Integer>[] impresoras) {
	    for (int i = 0; i < impresoras.length; i++) {
	        System.out.print("Imp " + i + ": ");
	        if (impresoras[i].isEmpty()) {
	            System.out.println("vacia");
	        } else {
	            for (Integer trabajo : impresoras[i]) {
	                System.out.print(trabajo + " ");
	            }
	            System.out.println();
	        }
	    }
	}
	
	public static void main(String args[]) {
		Impresoras impresoras=new Impresoras();
		ArrayList<Peticion> lista= new ArrayList<Peticion>();
		lista.add(new Peticion('P', 2, 1));
		lista.add(new Peticion('P', 3, 2));
		lista.add(new Peticion('P', 5, 3));
		lista.add(new Peticion('P', 5, 4));
		lista.add(new Peticion('F', 5, null));
		lista.add(new Peticion('P', 2, 5));
		lista.add(new Peticion('A', null, null));
		lista.add(new Peticion('F', 0, null));
		lista.add(new Peticion('P', 1, 6));
		lista.add(new Peticion('S', null, null));
		lista.add(new Peticion('P', 1, 7));
		impresoras.procesarTrabajos(lista);
	}
}
