package org.pmoo.packproyecto;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class JugadorTest {

	private Jugador j1;
	private Agua pk1;
	private Fuego pk2;
	private Planta pk3;
	
	@Before
	public void setUp() throws Exception {
		j1 = new Jugador("Jugador1");
		pk1 = new Agua("PK1", "Agua", 10);
		pk2 = new Fuego("PK2", "fuego", 3);
		pk3 = new Planta("PK3", "Planta", 11);
		j1.añadirPokemon(pk1);
		j1.añadirPokemon(pk2);
		j1.añadirPokemon(pk3);
	}

	@After
	public void tearDown() throws Exception {
		j1 = null;
	}

	@Test
	public void testSacarPokemon() {
		Pokemon p;
		try {
			p = j1.sacarPokemon(2);
			assertEquals(p,pk2);
		} 
		catch (IndexOutOfBoundsException e) {
			fail("Ha saltado una IndexOutOfBoundsException");
		}
	}
	
	@Test
	public void testSacarPokemonConExcepcion() {
		try {
			j1.sacarPokemon(19);
			fail("No ha saltado una excepción");
		}
		catch(IndexOutOfBoundsException e) {}
	}

	@Test
	public void testListaVacia() {
		assertFalse(j1.listaVacia());
	}

	@Test
	public void testGetNombre() {
		assertEquals("Jugador1", j1.getNombre());
	}

	@Test
	public void testEliminarPokemon() {
		j1.eliminarPokemon(pk2);
		Pokemon p;
		try {
			p = j1.sacarPokemon(2);
			assertNotEquals(p,pk2);
		} 
		catch (IndexOutOfBoundsException e) {
			fail("Ha saltado una IndexOutOfBoundsException");
		}
	}

	@Test
	public void testAñadirPokemon() {
		Agua pk4 = new Agua("PK4", "Agua", 8);
		j1.añadirPokemon(pk4);
		Pokemon p;
		try {
			p = j1.sacarPokemon(4);
			assertEquals(p,pk4);
		} 
		catch (IndexOutOfBoundsException e) {
			fail("Ha saltado una IndexOutOfBoundsException");
		}
	}

	@Test
	public void testSetNombre() {
		assertEquals("Jugador1", j1.getNombre());
		j1.setNombre("J1");
		assertEquals("J1", j1.getNombre());
	}
}
