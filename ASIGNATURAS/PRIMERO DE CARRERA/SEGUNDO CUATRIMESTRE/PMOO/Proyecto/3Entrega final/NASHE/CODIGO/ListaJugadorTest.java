package org.pmoo.packproyecto;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class ListaJugadorTest {
	Agua pk1,pk4;
	Fuego pk2,pk5;
	Planta pk3,pk6;

	@Before
	public void setUp() throws Exception {
		 ListaJugador.getListaJugador().setNombres("Jugador1","Jugador2");
		 pk1=new Agua("PK1", "Agua", 10);
		 pk2=new Fuego("PK2", "Fuego", 3);
		 pk3=new Planta("PK3", "Planta", 11);
		 ListaJugador.getListaJugador().añadirPokemon(1, pk1);
		 ListaJugador.getListaJugador().añadirPokemon(1, pk2);
		 ListaJugador.getListaJugador().añadirPokemon(1, pk3);
		 pk4=new Agua("PK4", "Agua", 10);
		 pk5=new Fuego("PK5", "Fuego", 3);
		 pk6=new Planta("PK6", "Planta", 11);
		 ListaJugador.getListaJugador().añadirPokemon(2, pk4);
		 ListaJugador.getListaJugador().añadirPokemon(2, pk5);
		 ListaJugador.getListaJugador().añadirPokemon(2, pk6);
	}

	@After
	public void tearDown() throws Exception {
		ListaJugador.getListaJugador().eliminarPokemon(1, pk1);
		ListaJugador.getListaJugador().eliminarPokemon(1, pk2);
		ListaJugador.getListaJugador().eliminarPokemon(1, pk3);
		ListaJugador.getListaJugador().eliminarPokemon(2, pk4);
		ListaJugador.getListaJugador().eliminarPokemon(2, pk5);
		ListaJugador.getListaJugador().eliminarPokemon(2, pk6);
		
	}

	@Test
	public void testListaVacia() {
		assertFalse(ListaJugador.getListaJugador().listaVacia(1));
		assertFalse(ListaJugador.getListaJugador().listaVacia(2));
	}

	@Test
	public void testAñadirPokemon() {
		Pokemon pk7=new Fuego("PK7", "Fuego", 1);
		ListaJugador.getListaJugador().añadirPokemon(1, pk7);
		try {
			assertEquals(ListaJugador.getListaJugador().sacarPokemon(1,4),pk7);
		} catch (IndexOutOfBoundsException e) {
			fail("Ha saltado una IndexOutOfBoundsException");
		}
		ListaJugador.getListaJugador().eliminarPokemon(1, pk7);
	} 

	@Test
	public void testGetNombre() {
		assertEquals("Jugador1", ListaJugador.getListaJugador().getNombre(1));
		assertEquals("Jugador2", ListaJugador.getListaJugador().getNombre(2));
	}

	@Test
	public void testSacarPokemon() {
		Pokemon pk;
		try {
			pk = ListaJugador.getListaJugador().sacarPokemon(1, 1);
			assertEquals(pk,pk1);
		} catch (Exception e) {
			fail("Ha saltado una IndexOutOfBoundsException");
		}
		try {
			assertNotNull(ListaJugador.getListaJugador().sacarPokemon(2, 1));
		} catch (Exception e) {
			fail("Ha saltado una IndexOutOfBoundsException");
		}
	}
	
	@Test
	public void testSacarPokemonConExcepcion() {
		try {
			ListaJugador.getListaJugador().sacarPokemon(1, 10);
			fail("No ha saltado ninguna excepción");
		}
		catch(IndexOutOfBoundsException e) {
		}
	}

	@Test
	public void testEliminarPokemon() {
		ListaJugador.getListaJugador().eliminarPokemon(1, pk2);
		Pokemon pk;
		try {
			pk = ListaJugador.getListaJugador().sacarPokemon(1, 2);
			assertNotEquals(pk,pk2);
		} catch (Exception e) {
			fail("Ha saltado una IndexOutOfBoundsException");
		}	
	}

	@Test
	public void testSetNombres() {
		assertEquals("Jugador1", ListaJugador.getListaJugador().getNombre(1));
		assertEquals("Jugador2", ListaJugador.getListaJugador().getNombre(2));
		assertNotEquals("Jug1", ListaJugador.getListaJugador().getNombre(1));
		assertNotEquals("Jug2", ListaJugador.getListaJugador().getNombre(2));
		}
}
