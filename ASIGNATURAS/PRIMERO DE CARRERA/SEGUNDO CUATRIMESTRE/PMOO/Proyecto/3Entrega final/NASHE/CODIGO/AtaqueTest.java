package org.pmoo.packproyecto;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class AtaqueTest {

	Ataque a1,a2,a3;
	
	@Before
	public void setUp() throws Exception
	{
		 a1= new Ataque("Llama", "Fuego", 50, 4);
		 a2= new Ataque("Follaje", "Planta", 50, 1);
		 a3= new Ataque("Chorro", "Agua", 50, 0);
	}

	@After
	public void tearDown() throws Exception {
		a1 = null;
		a2 = null;
		a3 = null;
	}
	
	@Test
	public void testAtaque() { 
		assertNotNull(a1);
	} 

	@Test
	public void testGetDaño() {
		a1= new Ataque("Llama", "Fuego", 50, 4);
		assertEquals(50,a1.getDaño());
	}

	@Test
	public void testDisminuirUso() {
		a2.disminuirUso();
		assertTrue(a2.ataqueGastado());
	}

	@Test
	public void testAtaqueGastado() {
		assertFalse(a1.ataqueGastado());
		assertTrue(a3.ataqueGastado());
	}

}
