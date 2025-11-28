package org.pmoo.packproyecto;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class ListaPokemonTest {
	private Agua pk1;
	private Fuego pk2; 
	private Planta pk3;
	private ListaPokemon lp;
	private ListaPokemon lp2;
	@Before
	public void setUp() throws Exception {
		lp = new ListaPokemon();
		lp2 = new ListaPokemon();
		pk1 = new Agua("Pk1", "Agua", 10);
		pk2 = new Fuego("Pk2", "Fuego", 3);
		pk3 = new Planta("Pk3","Planta", 11);
		lp.añadirPokemon(pk1);
		lp.añadirPokemon(pk2);
		lp.añadirPokemon(pk3);
	}

	@After
	public void tearDown() throws Exception {
		lp=null;
		lp2=null;
	}
	
	@Test
	public void testListaPokemon() { 
		assertNotNull(lp);
	}

	@Test
	public void testSacarPokemon() {	
		try {
			Pokemon pk = lp.sacarPokemon(0);
			assertEquals(pk,pk1);
		} catch (IndexOutOfBoundsException e) {
			fail("Ha saltado una IndexOutOfBoundsException");
		}
	}
	
	@Test
	public void testSacarPokemonConExcepcion() {	
		try {
			lp.sacarPokemon(7);
			fail("No ha saltado ninguna excepción");
		} catch (IndexOutOfBoundsException e) {
		}
	}

	@Test
	public void testListaVacia() {
		assertFalse(lp.listaVacia());
		assertTrue(lp2.listaVacia());
	} 

	@Test
	public void testEliminarPokemon() {
		lp.eliminarPokemon(pk2);
		Pokemon pk;
		try {
			pk = lp.sacarPokemon(1);
			assertNotEquals(pk,pk2);
		} catch (IndexOutOfBoundsException e) {
			fail("Ha saltado una IndexOutOfBoundsException");
		}
	}

	@Test
	public void testAñadirPokemon() {
		Agua pk4 = new Agua("PK4", "Agua", 8);
		lp.añadirPokemon(pk4);
		Pokemon pk;
		try {
			pk = lp.sacarPokemon(3);
			assertEquals(pk,pk4);
		} catch (IndexOutOfBoundsException e) {
			fail("Ha saltado una IndexOutOfBoundsException");
		}
	}
}
