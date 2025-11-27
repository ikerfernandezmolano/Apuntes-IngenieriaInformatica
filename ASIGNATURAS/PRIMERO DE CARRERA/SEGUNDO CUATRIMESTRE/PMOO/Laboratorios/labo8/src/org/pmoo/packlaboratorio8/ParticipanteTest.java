package org.pmoo.packlaboratorio8;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class ParticipanteTest {
	Participante p;
	
	@Before
	public void setUp() throws Exception {
		try {
			p=new Participante("Iker", 123, 18);
		}
		catch(MenorDeEdadException mdee) {
		}
	}

	@After
	public void tearDown() throws Exception {
		p=null;
	}

	@Test
	public void testParticipante() {
		assertNotNull(p);
	}

	@Test
	public void testTieneEsteId() {
		assertTrue(p.tieneEsteId(123));
		assertFalse(p.tieneEsteId(654));
	}

	@Test
	public void testObtenerNombre() {
		assertEquals(p.obtenerNombre(),"Iker");
		assertNotEquals(p.obtenerNombre(),"Javier");
	}

	@Test
	public void testObtenerEdad() {
		assertEquals(18,p.obtenerEdad());
		assertNotEquals(p.obtenerEdad(),21);
	}

}
