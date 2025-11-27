package org.eda.practicareda10;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;

public class GrafoPersonas extends GraphAL{
	
	public int repartir (int cantidad, int n, Persona p) {
		
		Queue<Integer> porEx=new LinkedList<Integer>();
		HashSet<Integer> examinados= new HashSet<Integer>();
		int pos=indexOf(p.nombre);
		
		porEx.add(pos);
		
		int nivel=0;
		
		while(!porEx.isEmpty() && nivel<n) {
			int sizePorExaminar=porEx.size();
			for(int i=0;i<sizePorExaminar;i++) {
				int persona=porEx.remove();
				examinados.add(persona);
				for(Integer j:adjList[persona]) {
					if(!examinados.contains(j)) porEx.add(j);
				}
			}
			nivel++;
		}
		
		return cantidad/(examinados.size()-1);
	}
}
