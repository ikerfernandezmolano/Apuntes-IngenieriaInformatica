package org.pmoo.packproyecto;

import java.util.Random;

public class Tablero {
	private Pokemon pokemon1;
	private Pokemon pokemon2;
	private static Tablero miTAB=new Tablero();
	
	private Tablero() {}
	
	public static Tablero getTablero() {
		return miTAB;
	}
	
	public void empezarPartida() {
		System.out.println("¿Quieres empezar una partida? (Escribe 'Si' o 'No')");
		boolean respuesta=Teclado.getTeclado().leerSiNo();
		if(respuesta) {
			partida();
		}
		else {
			System.out.println("¡¡Esperamos que vuelvas pronto!!");
		}
	}
	
	private void partida() {
		System.out.println("COMIENZA LA PARTIDA");
		crearJugadores();
		try {
			this.pokemon1=ListaJugador.getListaJugador().sacarPokemon(1,this.generarNumRandom(3));
			this.pokemon2=ListaJugador.getListaJugador().sacarPokemon(2,this.generarNumRandom(3));
		}
		catch(Exception e) {}
		while(!ListaJugador.getListaJugador().listaVacia(1)&&!ListaJugador.getListaJugador().listaVacia(2)) {
			this.atacar();
		}
		if(ListaJugador.getListaJugador().listaVacia(1)) {
			System.out.println("EL GANADOR ES "+ListaJugador.getListaJugador().getNombre(2));
		}
		else if(ListaJugador.getListaJugador().listaVacia(2)) {
			System.out.println("EL GANADOR ES "+ListaJugador.getListaJugador().getNombre(1));
		}
	}
	
	private void crearJugadores() {
		System.out.println("\nEscribe el nombre del Jugador1");
		String nombre1=Teclado.getTeclado().leerString();
		System.out.println("Escribe el nombre del Jugador2");
		String nombre2=Teclado.getTeclado().leerString();
		ListaJugador.getListaJugador().setNombres(nombre1, nombre2);
		this.elegirListaPokemon();
	}
	
	private void elegirListaPokemon() {
		System.out.println("ELIGE LOS TRES POKEMON QUE QUIERAS UTILIZAR.");
		int terminar=0;
		while(terminar<3) {
			ListaPokemonAElegir.getListaPokemonAElegir().imprimir();
			this.elegirPokemon(1);
			ListaPokemonAElegir.getListaPokemonAElegir().imprimir();
			this.elegirPokemon(2);
			terminar++;
		}
	}
	
	private void elegirPokemon(int pPosJug) {
		System.out.println("\nTE TOCA ELEGIR "+ListaJugador.getListaJugador().getNombre(pPosJug));
		int num=Teclado.getTeclado().leerNumero(12);
		try { 
			Pokemon pk=ListaPokemonAElegir.getListaPokemonAElegir().sacarPokemon(num);
			ListaPokemonAElegir.getListaPokemonAElegir().eliminarPokemon(pk);
			ListaJugador.getListaJugador().añadirPokemon(pPosJug, pk);
		}
		catch(Exception e) {
			System.out.println("ERROR: Su repuesta no es la esperada.");
			this.elegirPokemon(pPosJug);
		}
	}
	
	private int generarNumRandom(int pMax) {
		Random r=new Random();
		return r.nextInt(pMax)+1;
	}
	
	private void atacar() {
		try {
			System.out.println("\n¿Qué ataque quieres usar "+ListaJugador.getListaJugador().getNombre(1)+"?");
			System.out.println("\n                                               CONTRINCANTE");
			this.pokemon2.imprimirSoloInfoPK();
			this.pokemon1.imprimir();
			System.out.println("\n5.   CAMBIAR DE POKEMON");
			ListaJugador.getListaJugador().imprimirNumCuras(1);
			this.pokemon1.atacar(pokemon2);
			if(this.pokemon2.muerto()) {
				ListaJugador.getListaJugador().eliminarPokemon(2, this.pokemon2);
				this.pokemon2=null;
				while(this.pokemon2==null&&!ListaJugador.getListaJugador().listaVacia(1)&&!ListaJugador.getListaJugador().listaVacia(2)) {
					this.muerto(2);
				}
			}
		}
		catch(CambiarDePokemonException cdpe){
			this.cambiarPokemon(1);
		}
		catch(UsarCuraException uce) {
			if(!ListaJugador.getListaJugador().usarCura(1)) {
				this.pokemon1.cambiarVida(-15);
			}
		}
		try {
			if(!ListaJugador.getListaJugador().listaVacia(1)&&!ListaJugador.getListaJugador().listaVacia(2)) {
				System.out.println("\n¿Qué ataque quieres usar "+ListaJugador.getListaJugador().getNombre(2)+"?");
				System.out.println("\n                                               CONTRINCANTE");
				this.pokemon1.imprimirSoloInfoPK();
				this.pokemon2.imprimir();
				System.out.println("\n5.   CAMBIAR DE POKEMON");
				ListaJugador.getListaJugador().imprimirNumCuras(2);
				this.pokemon2.atacar(pokemon1);
				if(this.pokemon1.muerto()&&!ListaJugador.getListaJugador().listaVacia(1)&&!ListaJugador.getListaJugador().listaVacia(2)) {
					ListaJugador.getListaJugador().eliminarPokemon(1, this.pokemon1);
					this.pokemon1=null;
					while(this.pokemon1==null&&!ListaJugador.getListaJugador().listaVacia(1)&&!ListaJugador.getListaJugador().listaVacia(2)) {
						this.muerto(1);
					}
				}
			}
		}
		catch(CambiarDePokemonException cdpe) {
			this.cambiarPokemon(2);
		}
		catch(UsarCuraException uce) {
			if(!ListaJugador.getListaJugador().usarCura(2)) {
				this.pokemon2.cambiarVida(-15);
			}
		}
	}
	
	private void muerto(int pPosJugador) {
		System.out.println("Ha muerto tu pokemon " + ListaJugador.getListaJugador().getNombre(pPosJugador) + " ¿Que pokemon quieres sacar ahora?");
		ListaJugador.getListaJugador().imprimir(pPosJugador);
		boolean parar=false;
		while(!parar) {
			int num=Teclado.getTeclado().leerNumero();
			if(pPosJugador==1) {
				try {
					this.pokemon1=ListaJugador.getListaJugador().sacarPokemon(pPosJugador,num);
					parar=true;
				}
				catch(Exception e) {
					System.out.println("ERROR: Su repuesta no es la esperada.");
				}
			}
			else if(pPosJugador==2) {
				try {
					this.pokemon2=ListaJugador.getListaJugador().sacarPokemon(pPosJugador,num);
					parar=true;
				}
				catch(Exception e) {
					System.out.println("ERROR: Su respuesta no es la esperada.");
				}
			}
		}
	}
	
	private void cambiarPokemon(int pPosJugador) {
		System.out.println("¿Qué pokemon de tu lista quieres sacar?");
		ListaJugador.getListaJugador().imprimir(pPosJugador);
		boolean parar=false;
		while(!parar){
			try {
				int num=Teclado.getTeclado().leerNumero(3);
				if(pPosJugador==1){
					this.pokemon1=ListaJugador.getListaJugador().sacarPokemon(1,num);
					parar=true;
				}
				else if(pPosJugador==2) {
					this.pokemon2=ListaJugador.getListaJugador().sacarPokemon(2,num);
					parar=true;
				}
			}
			catch(Exception e) {
				System.out.println("ERROR: Su respuesta no es la esperada.");
			}
		}
	}
	
	public static void main(String[]args) {
		miTAB.empezarPartida();
	}
}