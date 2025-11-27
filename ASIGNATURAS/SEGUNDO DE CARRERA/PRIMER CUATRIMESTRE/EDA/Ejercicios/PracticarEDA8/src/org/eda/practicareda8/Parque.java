package org.eda.practicareda8;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

public class Parque {
	
	private ArrayList<String> simularParque(ArrayList<Accion> listaAcciones){
		Queue<Cliente>[] taquillas=(Queue<Cliente>[])new LinkedList[10];
		for(int i=0;i<taquillas.length;i++) taquillas[i]=new LinkedList<Cliente>();
		Queue<Cliente>[] atracciones=(Queue<Cliente>[])new LinkedList[20];
		for(int i=0;i<atracciones.length;i++) atracciones[i]=new LinkedList<Cliente>();
		ArrayList<String> jugMontado=new ArrayList<String>();
		Cliente c=null;
		while(!listaAcciones.isEmpty()) {
			Accion a=listaAcciones.remove(0);
			if(a.tipo=='I') {
				taquillas[a.taquilla].add(new Cliente(a.nan, a.atracciones));
			} else if (a.tipo=='S') {
				c=taquillas[a.taquilla].remove();
				atracciones[c.atracciones.remove()].add(c);
			} else {
				c=atracciones[a.atraccion].remove();
				if(c.atracciones.isEmpty()) jugMontado.add(c.nan);
				else atracciones[c.atracciones.remove()].add(c);
			}
		}
		return jugMontado;
	}
	
	public static void main(String args[]) {
		Parque parque=new Parque();
		ArrayList<Accion> listaAcciones=new ArrayList<Accion>();
		Queue<Integer> listaAtracciones=new LinkedList<Integer>();
		listaAtracciones.add(5);
		listaAtracciones.add(4);
		listaAcciones.add(new Accion('I', "333", 5, 0, listaAtracciones));
		listaAcciones.add(new Accion('S', null, 5, 0, null));
		listaAtracciones=new LinkedList<Integer>();
		listaAtracciones.add(4);
		listaAtracciones.add(2);
		listaAtracciones.add(7);
		listaAcciones.add(new Accion('I', "444", 7, 0, listaAtracciones));
		listaAtracciones=new LinkedList<Integer>();
		listaAtracciones.add(2);
		listaAtracciones.add(1);
		listaAtracciones.add(9);
		listaAcciones.add(new Accion('I', "777", 1, 0, listaAtracciones));
		listaAcciones.add(new Accion('S', null, 7, 0, null));
		listaAcciones.add(new Accion('E', null, 0, 5, null));
		listaAcciones.add(new Accion('E', null, 0, 4, null));
		listaAtracciones=new LinkedList<Integer>();
		listaAtracciones.add(9);
		listaAtracciones.add(7);
		listaAcciones.add(new Accion('I', "888", 5, 0, listaAtracciones));
		listaAcciones.add(new Accion('S', null, 5, 0, null));
		listaAcciones.add(new Accion('E', null, 0, 4, null));
		
		ArrayList<String>res=parque.simularParque(listaAcciones);
		for(String str:res) {
			System.out.println(str);
		}
	}
}
