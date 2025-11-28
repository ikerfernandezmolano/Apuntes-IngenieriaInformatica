package org.pmoo.packproyecto;

public class ListaPokemonAElegir {

	private ListaPokemon listaPAE;
	private static ListaPokemonAElegir miLPAE=new ListaPokemonAElegir();
	
	private ListaPokemonAElegir() {
		this.listaPAE = new ListaPokemon();
		this.crearListaPokemons();
	}
	
	public static ListaPokemonAElegir getListaPokemonAElegir() {
		return miLPAE;
	} 
	
	private void crearListaPokemons() {
		Fuego Pokemon1 = new Fuego ("Typhlosion", "Fuego", 110);
		this.listaPAE.añadirPokemon(Pokemon1);
		Fuego Pokemon2 = new Fuego ("Infernia", "Fuego", 110);
		this.listaPAE.añadirPokemon(Pokemon2);
		Planta Pokemon3 = new Planta ("Venusaur", "Planta", 90);
		this.listaPAE.añadirPokemon(Pokemon3);
		Planta Pokemon4 = new Planta ("Sylvanis", "Planta", 90);
		this.listaPAE.añadirPokemon(Pokemon4);
		Agua Pokemon5 = new Agua ("Greninja", "Agua", 100);
		this.listaPAE.añadirPokemon(Pokemon5);
		Agua Pokemon6 = new Agua ("Marinna", "Agua", 100);
		this.listaPAE.añadirPokemon(Pokemon6);
		Fuego Pokemon7 = new Fuego ("Charizard", "Fuego", 100);
		this.listaPAE.añadirPokemon(Pokemon7);
		Fuego Pokemon8 = new Fuego ("Flamaris", "Fuego", 100);
		this.listaPAE.añadirPokemon(Pokemon8);
		Planta Pokemon9 = new Planta ("Sceptile", "Planta", 110);
		this.listaPAE.añadirPokemon(Pokemon9);
		Planta Pokemon10 = new Planta ("Petalina", "Planta", 110);
		this.listaPAE.añadirPokemon(Pokemon10);
		Agua Pokemon11 = new Agua ("Gyarados", "Agua", 90);
		this.listaPAE.añadirPokemon(Pokemon11);
		Agua Pokemon12 = new Agua ("Nereidra", "Agua", 90);
		this.listaPAE.añadirPokemon(Pokemon12);
	}
	
	public void imprimir() {
		this.listaPAE.imprimir();
	}
	
	public void eliminarPokemon(Pokemon pPK) {
		this.listaPAE.eliminarPokemon(pPK);
	}
	
	public Pokemon sacarPokemon(int pPosPK) throws Exception {
		return this.listaPAE.sacarPokemon(pPosPK-1);
	}
}