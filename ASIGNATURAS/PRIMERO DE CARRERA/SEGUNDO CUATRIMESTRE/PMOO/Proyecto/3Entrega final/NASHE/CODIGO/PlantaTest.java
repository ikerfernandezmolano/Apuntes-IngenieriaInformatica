package org.pmoo.packproyecto;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class PlantaTest {
	Planta p1;
	Fuego p2;
	Agua p3;

	@Before
	public void setUp() throws Exception {
		p1 = new Planta ("Bulbasur","Planta",100);
		p2=new Fuego ("Charmander","Fuego",100);
		p3=new Agua("Squirtle","Agua",100);
	}

	@After
	public void tearDown() throws Exception {
	} 
	
	@Test
	public void testPlanta() { 
		assertNotNull(p1);
	}
	
	@Test
	public void superEficazTest() {
		assertTrue(p1.supereficaz(p3));
		assertFalse(p1.supereficaz(p2));
	}
	
	@Test
	public void pocoEficazTest() {
		assertFalse(p1.pocoeficaz(p3));
		assertTrue(p1.pocoeficaz(p2));
	}
}
