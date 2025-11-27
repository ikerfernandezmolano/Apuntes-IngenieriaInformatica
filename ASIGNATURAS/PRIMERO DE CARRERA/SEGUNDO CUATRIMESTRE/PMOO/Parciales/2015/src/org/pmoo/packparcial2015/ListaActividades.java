package org.pmoo.packparcial2015;

import java.util.ArrayList;

public class ListaActividades {
	
	ArrayList<Actividad> listaActividades;
	
	public ListaActividades() {
		this.listaActividades=new ArrayList<Actividad>();
	}
	
	public Actividad darUnaActividadDeDificultad(int pDificultad) throws ActividadNoEncontradaException{
		throw(new ActividadNoEncontradaException());
	}

}
