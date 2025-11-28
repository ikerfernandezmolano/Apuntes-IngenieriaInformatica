package org.pmoo.packproyecto;

public class ListaJugador {
	private Jugador jugador1;
	private Jugador jugador2;
	private static ListaJugador miLJ=new ListaJugador();
	
	private ListaJugador() {
		this.jugador1=new Jugador(null);
		this.jugador2=new Jugador(null);
	}
	
	public static ListaJugador getListaJugador() {
		return miLJ;
	}
	
	public void imprimir(int pNumJugador) {
		if(pNumJugador==1) {
			this.jugador1.imprimirLista();
		}
		else if(pNumJugador==2) {
			this.jugador2.imprimirLista();
		}	
	}
	
	public boolean listaVacia(int pPosJugador) {
		boolean vacia=false;
		if(pPosJugador==1&&this.jugador1.listaVacia()) {
			vacia=true;
		}
		else if(pPosJugador==2&&this.jugador2.listaVacia()) {
			vacia=true;
		}
		return vacia;
	}
	
	public String getNombre(int pNumJugador) {
		String nombre=null;
		if(pNumJugador==1) {
			nombre=this.jugador1.getNombre();
		}
		else if(pNumJugador==2) {
			nombre=this.jugador2.getNombre();
		}	
		return nombre;
	} 
	
	public Pokemon sacarPokemon(int pNumJugador, int pPosPK){
		Pokemon pokemon=null;
		if(pNumJugador==1) {
			pokemon=this.jugador1.sacarPokemon(pPosPK);
		}
		else if(pNumJugador==2) {
			pokemon=this.jugador2.sacarPokemon(pPosPK);
		}	
		return pokemon;
	}
	
	public void añadirPokemon(int pNumJugador, Pokemon pPK) {
		if(pNumJugador==1) {
			this.jugador1.añadirPokemon(pPK);
		}
		else if(pNumJugador==2) {
			this.jugador2.añadirPokemon(pPK);
		}	
	}
	
	public void eliminarPokemon(int pNumJugador, Pokemon pPK) {
		if(pNumJugador==1) {
			this.jugador1.eliminarPokemon(pPK);
		}
		else if(pNumJugador==2) {
			this.jugador2.eliminarPokemon(pPK);
		}	
	}
	
	public void setNombres(String pNomJugador1,String pNomJugador2) {
		this.jugador1.setNombre(pNomJugador1);
		this.jugador2.setNombre(pNomJugador2);
	}
	
	public boolean usarCura(int pNumJugador) {
		boolean agotada=false;
		if(pNumJugador==1) {
			agotada=this.jugador1.usarCura();
		}
		else if(pNumJugador==2) {
			agotada=this.jugador2.usarCura();
		}
		return agotada;
	}
	
	public void imprimirNumCuras(int pNumJugador) {
		if(pNumJugador==1) {
			this.jugador1.imprimirNumCuras();
		}
		else if(pNumJugador==2) {
			this.jugador2.imprimirNumCuras();
		}	
	}
}
