package org.pmoo.packparcial2015;

public abstract class Actividad {
	int dificultad;
	
	protected Actividad(int pDificultad) {
		this.dificultad=pDificultad;
	}
	
	public abstract boolean resolverActividad();

}
