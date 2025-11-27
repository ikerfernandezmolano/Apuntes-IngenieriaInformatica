package org.eda.practicareda8;

import java.util.Queue;

public class Accion {
	char tipo;
	String nan;
	int taquilla;
	int atraccion;
	Queue<Integer> atracciones;
	
	public Accion(char tipo, String nan, int taquilla, int atraccion, Queue<Integer> atracciones) {
		this.tipo=tipo;
		this.nan=nan;
		this.taquilla=taquilla;
		this.atraccion=atraccion;
		this.atracciones=atracciones;
	}
}
