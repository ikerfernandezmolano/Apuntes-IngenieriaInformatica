package org.pmoo.packproyecto;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class PokemonTest {

	private Agua pk1;
	private Fuego pk2; 
	private Planta pk3;
	@Before
	public void setUp() throws Exception {
		pk1 = new Agua("Pk1", "Agua", 10);
		pk2 = new Fuego("Pk2", "Fuego", 3);
		pk3 = new Planta("Pk3","Planta", 11);
	}

	@After
	public void tearDown() throws Exception {
		pk1=null;
		pk2=null;
		pk3=null;
	}
	
	@Test
	public void testPokemon() { 
		assertNotNull(pk1);
	} 

	@Test
	public void testCambiarVida() {
		pk1.cambiarVida(5);
		assertFalse(pk1.muerto());
	}

	@Test
	public void testMuerto() {
		pk1.cambiarVida(10);
		assertTrue(pk1.muerto());
	}
}
