package org.pmoo.packparcial20231;

public class Luchador {
	private String nombre;
	private int altura;
	private int peso;
	
	public Luchador(String pNombre,int pAltura, int pPeso)
	{
		this.nombre=pNombre;
		this.altura=pAltura;
		this.peso=pPeso;
	}
	
	public boolean luchadorBuscado(String pNombre) {
		boolean soyElLuchador=false;
		if(pNombre==this.nombre) {
			soyElLuchador=true;
		}
		return soyElLuchador;
	}
	
	public void imprimirDatosLuchador() {
		System.out.println("Nombre: " + this.nombre + " - Altura: " + this.altura + " - Peso: " + this.peso);
	}
}
