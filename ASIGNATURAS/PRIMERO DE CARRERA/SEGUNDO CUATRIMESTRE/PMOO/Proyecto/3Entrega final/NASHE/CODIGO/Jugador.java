package org.pmoo.packproyecto;

public class Jugador {
	private String nombre;
	private int numCuras=3;
	private ListaPokemon listaPokemon;
	
	public Jugador(String pNombre) {
		this.nombre=pNombre;
		this.listaPokemon=new ListaPokemon();
	}
	
	public Pokemon sacarPokemon(int pPosPK){
		return this.listaPokemon.sacarPokemon(pPosPK-1);
	}
	
	public boolean listaVacia() {
		return this.listaPokemon.listaVacia();
	}
	
	public void imprimirLista() {
		this.listaPokemon.imprimir();
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public boolean usarCura() {
		boolean agotadas=false;
		if(this.numCuras<=0) {
			agotadas=true;
			System.out.println("No te quedan curas.");
		}
		else {
			this.numCuras--;
		}
		return agotadas;
	}
	
	public void imprimirNumCuras() {
		System.out.println("\n6.   USAR CURA (Te quedan "+this.numCuras+" curas).");
	}
	
	public void eliminarPokemon(Pokemon pPK) {
		this.listaPokemon.eliminarPokemon(pPK);
	}
	
	public void añadirPokemon(Pokemon pPK) {
		this.listaPokemon.añadirPokemon(pPK);
	}
	
	public void setNombre(String pNombre) {
		this.nombre=pNombre;
	}
}