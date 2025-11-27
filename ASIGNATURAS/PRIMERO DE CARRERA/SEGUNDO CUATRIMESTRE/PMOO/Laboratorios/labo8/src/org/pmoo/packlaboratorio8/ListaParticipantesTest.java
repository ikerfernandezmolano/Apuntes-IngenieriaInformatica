package org.pmoo.packlaboratorio8;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class ListaParticipantesTest {
	ListaParticipantes lp;

	@Before
	public void setUp() throws Exception {
		lp=new ListaParticipantes();
		try {
			lp.anadirParticipante("Iker", 1, 19);
			lp.anadirParticipante("Javier", 2, 20);
			lp.anadirParticipante("Txema", 3, 21);
		}
		catch(MenorDeEdadException mdee) {}
		catch(YaExisteIdException yeie) {}
	}

	@After
	public void tearDown() throws Exception {
		lp=null;
	}

	@Test
	public void testListaParticipantes() {
		assertNotNull(lp);
	}

	@Test
	public void testObtenerNumeroDeParticipantes() {
		assertEquals(lp.obtenerNumeroDeParticipantes(),3);
		assertNotEquals(lp.obtenerNumeroDeParticipantes(),0);
	}

	@Test
	public void testAnadirParticipante() {
		try {
			lp.anadirParticipante("Javier",4,19);	
			assertEquals(lp.obtenerNumeroDeParticipantes(),4);
		}
		catch(YaExisteIdException yaid) {
			fail("Ha saltado una YaExisteIdException");
		}
		catch(MenorDeEdadException mdee) {
			fail("Ha saltado una MenorDeEdadException");
		}
	}
	
	@Test
	public void testAnadirParticipanteYaExisteIdException() {
		try {
			lp.anadirParticipante("Iker", 1, 19);
			fail("No ha saltado ninguna excepcion");
		}
		catch(YaExisteIdException yaid) {
		}
		catch(MenorDeEdadException mdee) {
			fail("Ha saltado una MenorDeEdadException, que no es la esperada");
		}
	}
	
	@Test
	public void testAnadirParticipanteMenorDeEdadException() {
		try {
			lp.anadirParticipante("Iker", 4, 17);
			fail("No ha saltado ninguna excepcion");
		}
		catch(YaExisteIdException yaid) {
			fail("Ha saltado una YaExisteIdException, que no es la esperada");
		}
		catch(MenorDeEdadException mdee) {
		}
	}

	@Test
	public void testObtenerParticipanteCuyoIdEs() {
		Participante participante=null;
		try {
			participante=lp.obtenerParticipanteCuyoIdEs(1);//Principio lista
			assertTrue(participante.tieneEsteId(1));
			participante = lp.obtenerParticipanteCuyoIdEs(2);//Medio lista
			assertTrue(participante.tieneEsteId(2));
			participante = lp.obtenerParticipanteCuyoIdEs(3);//Final lista
			assertTrue(participante.tieneEsteId(3));
		}
		catch(NoEncontradoException nee) {
			fail("Ha saltado una NoEncontradoException");
		}
	}
	
	@Test
	public void testObtenerParticipanteCuyoIdEsNoEncontradoException() {
		try {
			lp.obtenerParticipanteCuyoIdEs(523);
			fail("No ha saltado ninguna excepcion");
		}
		catch(NoEncontradoException nee) {
		}
	}

}
