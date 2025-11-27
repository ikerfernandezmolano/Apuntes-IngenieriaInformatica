package org.pmoo.packlaboratorio6;

import java.util.ArrayList;

public class Empresa {
	private ArrayList<Empleado> listaEmpleados;
	private static Empresa miLE= new Empresa();
	
	private Empresa() {
		this.listaEmpleados=new ArrayList<Empleado>();
	}
	
	public static Empresa getEmpresa() {
	return miLE; 
	}
	
	public double obtenerDiferenciaMaxima() {
		return 0.0;
	}
}
