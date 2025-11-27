package org.pmoo.packlaboratorio8;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class RosterTest {

	@Before
	public void setUp() throws Exception {
		Roster.getRoster().anadirParticipante("Iker", 123, 19);
	}

	@After
	public void tearDown() throws Exception {
		Roster.getRoster().resetear();
	}
	
	@Test
	public void testAnadirParticipante() {
		assertEquals(Roster.getRoster().obtenerNumeroDeParticipantes(),1);
		Roster.getRoster().anadirParticipante("Iker", 124, 20); //Mismo nombre
		assertEquals(Roster.getRoster().obtenerNumeroDeParticipantes(),2);
		Roster.getRoster().anadirParticipante("Javier", 125, 19); //Misma edad
		assertEquals(Roster.getRoster().obtenerNumeroDeParticipantes(),3);
	}
	
	@Test
	public void testAnadirParticipanteConIdYaExistente() {
		Roster.getRoster().anadirParticipante("Javier", 123, 19); //Se añade con id+1
		assertEquals(Roster.getRoster().obtenerNumeroDeParticipantes(),2);
		assertTrue(Roster.getRoster().buscarParticipantePorId(124).tieneEsteId(124));
		Roster.getRoster().anadirParticipante("Manolo", 123, 19); //Se añade con id+2
		assertEquals(Roster.getRoster().obtenerNumeroDeParticipantes(),3);
		assertTrue(Roster.getRoster().buscarParticipantePorId(125).tieneEsteId(125));
	}
	
	@Test
	public void testAnadirParticipanteMenorDeEdad() {
		Roster.getRoster().anadirParticipante("Javier", 125, 16);
		assertEquals(Roster.getRoster().obtenerNumeroDeParticipantes(),1);
		assertNull(Roster.getRoster().buscarParticipantePorId(125));
	}

	@Test
	public void testObtenerNumeroDeParticipantes() {
		assertEquals(Roster.getRoster().obtenerNumeroDeParticipantes(),1);
	}

	@Test
	public void testBuscarParticipantePorId() {
		Participante p=Roster.getRoster().buscarParticipantePorId(123);
		assertTrue(p.tieneEsteId(123));
		p=Roster.getRoster().buscarParticipantePorId(125);
		assertNull(p);
	}

	@Test
	public void testResetear() {
		Roster.getRoster().resetear();
		assertEquals(Roster.getRoster().obtenerNumeroDeParticipantes(),0);
	}

}
