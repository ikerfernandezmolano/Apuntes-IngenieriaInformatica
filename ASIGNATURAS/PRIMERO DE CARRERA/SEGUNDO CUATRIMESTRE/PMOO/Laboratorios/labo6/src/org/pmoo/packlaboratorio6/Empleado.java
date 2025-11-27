package org.pmoo.packlaboratorio6;

public class Empleado {
	private int id;
	private String nombre;
	private String apellido;
	private ListaConceptos listaConceptos;
	
	public Empleado(int pId,String pNombre, String pApellido) {
		this.id=pId;
		this.apellido=pApellido;
		this.nombre=pNombre;
		this.listaConceptos= new ListaConceptos();
	}
}
