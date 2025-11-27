package org.eda.practicareda15;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

public class Grafo {
	final int DEFAULT_CAPACITY=100;
	int numVertices;
	boolean[][] adjMatrix;
	Persona[] vertices;
	
	public Grafo(Persona[] pVertices) {
		this.numVertices=pVertices.length;
		this.vertices=pVertices;
		this.adjMatrix=new boolean[numVertices][numVertices];
	}
	
	
	
	public ArrayList<Persona> cercanas(String p,int edad,int dist){
		ArrayList<Persona> resultado= new ArrayList<Persona>();
		
		Queue<Integer> porEx= new LinkedList<Integer>();
		boolean[] examinados= new boolean[numVertices];	
		porEx.add(indexOf(p));
		int nivel=0;
		
		while(!porEx.isEmpty()&&nivel<=dist) {
			int size=porEx.size();
			for(int i=0;i<size;i++) {
				Integer persona=porEx.remove();
				examinados[persona]=true;
				if(vertices[persona].edad>=edad&&!resultado.contains(vertices[persona])) resultado.add(vertices[persona]);
				for(int j=0;j<adjMatrix[persona].length;j++) {
					if(adjMatrix[persona][j] && !examinados[j]) porEx.add(j);
				}
			}
			nivel++;
		}
		return resultado;
	}
	
	private int indexOf(String nom){
	    // Dado un string (nombre) devuelve el índice del nodo (-1 en caso de que no esté)
	    for (int i = 0; i < numVertices; i++)
	      if (nom.equals(this.vertices[i].nombre)) return i;
	    return -1;    
	}
	
	public void crearAdjMatrix(int i,int j) {
		adjMatrix[i-1][j-1]=true;
		adjMatrix[j-1][i-1]=true;
	}
}
