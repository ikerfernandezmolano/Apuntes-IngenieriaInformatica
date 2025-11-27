package org.pmoo.packparcial20231;

public class Combate 
{
	private int identificador;
	private Luchador luchador1;
	private Luchador luchador2;
	
	public Combate(int pIdentificador, Luchador pLuchador1, Luchador pLuchador2) {
		this.identificador=pIdentificador;
		this.luchador1=pLuchador1;
		this.luchador2=pLuchador2;
	}
	
	public boolean existeElLuchador(Luchador pLuchador) {
		boolean tieneAlLuchador=false;
		if(this.luchador1==pLuchador || this.luchador2==pLuchador) {
			tieneAlLuchador=true;
		}
		return tieneAlLuchador;
	}
	
	public boolean tieneAlLuchadorBuscadoPorNombre(String pNombre) {
		boolean loTiene=false;
		if(this.luchador1.luchadorBuscado(pNombre) || this.luchador2.luchadorBuscado(pNombre)) {
			loTiene=true;
		}
		return loTiene;
	}
	
	public void imprimirDatosCombate() 
	{
		System.out.println("Identificador del combate: " + this.identificador);
		System.out.println("Luchador 1 ");
		this.luchador1.imprimirDatosLuchador();
		System.out.println("Luchador 2");
		this.luchador2.imprimirDatosLuchador();
	}
}
