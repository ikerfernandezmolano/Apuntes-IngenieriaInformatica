package org.eda.practicareda10;

import java.util.LinkedList;

public class GraphAL {
	protected final int DEFAULT_CAPACITY=100;
	protected static int numVertices;
	protected LinkedList<Integer>[] adjList;
	protected Persona[] vertices;
	
	public int indexOf(String nom){
	    // Dado un string (nombre) devuelve el índice del nodo (-1 en caso de que no esté)
	    for (int i = 0; i < numVertices; i++)
	      if (nom.equals(this.vertices[i].nombre)) return i;
	    return -1;    
	}
	public void addNode(Persona p) {
	  // añade un nuevo nodo al grafo
	  if (numVertices == vertices.length) System.out.println("Array lleno");
	  else {
	      vertices[numVertices] = p;
	      numVertices++;
	  }
	}
	public void addArcAdjList(String n1, String n2) {
	    // pre: n1 y n2 se encuentran en el grafo
	    // post: se han añadido los arcos (n1, n2) y (n2, n1) (grafo no dirigido)
	    int index1 = indexOf(n1); 
	    int index2 = indexOf(n2);
	    adjList[index1].add(index2);
	    adjList[index2].add(index1); // Grafo no dirigido, hay que añadir el arco en los dos sentidos
	}
}
