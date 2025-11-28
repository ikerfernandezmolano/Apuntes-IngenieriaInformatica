package org.pmoo.packproyecto;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class ListaAtaqueTest {
	
	private ListaAtaque l1;

	@Before
	public void setUp() {
		l1 = new ListaAtaque();
	}
	
	@After
	public void tearDown() {
		l1 = null;
	}
	@Test
	public void testListaAtaque() {
		assertNotNull(l1);
	} 

	@Test
	public void testUsarAtaque() {
		Ataque a = new Ataque("PRUEBA", "TIPO1", 100, 2);
		l1.añadirAtaque(a);
		assertEquals(100, l1.usarAtaque(0));
		assertEquals(100, l1.usarAtaque(0));
		assertEquals(-100000, l1.usarAtaque(0));
	}
	public void testAñadirAtaque(Ataque pAtaque) { 
		Ataque a1 = new Ataque("Pepe", "Agua", 50, 1);
		l1.añadirAtaque(a1);
		assertEquals(50, l1.usarAtaque(0));
		
	}
}
