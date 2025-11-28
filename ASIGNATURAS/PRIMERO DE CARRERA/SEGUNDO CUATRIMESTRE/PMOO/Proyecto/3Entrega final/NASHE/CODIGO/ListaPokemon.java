package org.pmoo.packproyecto;

import java.util.ArrayList;
import java.util.Iterator;

public class ListaPokemon {
	private ArrayList<Pokemon> listaPokemon;
	
	public ListaPokemon() {
		this.listaPokemon=new ArrayList<Pokemon>();
	}
	
	private Iterator<Pokemon> getIterador(){
		return this.listaPokemon.iterator();
	} 
	
	public void imprimir() {
		Iterator<Pokemon> itr=this.getIterador();
		Pokemon pokemon;
		int pos=1;
		while(itr.hasNext()) {
			pokemon=itr.next();
			System.out.println("\n"+pos+". ");
			pokemon.imprimir();
			pos++;
		}
	}
	
	public Pokemon sacarPokemon(int pPosPK){
		Pokemon pk=null;
		pk=this.listaPokemon.get(pPosPK);
		return pk;
	}
	
	public boolean listaVacia() {
		boolean vacia=false;
		if(this.listaPokemon.size()==0) {
			vacia=true;
		}
		return vacia;
	}
	
	public void eliminarPokemon(Pokemon pPK) {
		this.listaPokemon.remove(pPK);
	}
	
	public void añadirPokemon(Pokemon pPK) {
		this.listaPokemon.add(pPK);
	}
}
