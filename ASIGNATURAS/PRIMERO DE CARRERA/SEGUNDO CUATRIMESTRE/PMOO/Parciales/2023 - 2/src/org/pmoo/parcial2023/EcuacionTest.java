package org.pmoo.parcial2023;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class EcuacionTest {
	Ecuacion e;
	Fraccion f;
	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testEcuacion() {
		try {
			e=new Ecuacion(new Fraccion(1, 1), new Fraccion(2, 2));
			assertNotNull(e);
		}
		catch(DenominadorCeroException dce){
			fail("Ha saltado una DenominadorCeroException");
		}
		catch(EcuacionNoLinealException enle) {
			fail("Ha saltado una EcuacionNoLinealException");
		}
	}
	
	@Test
	public void testEcuacionNoLinealException() {
		try {
			e=new Ecuacion(new Fraccion(0, 1), new Fraccion(1, 2));
			fail("No ha saltado ninguna excepcion");
		}
		catch(DenominadorCeroException dce){
			fail("Ha saltado una DenominadorCeroException");
		}
		catch(EcuacionNoLinealException enle) {
			assertNull(e);
		}
		
	}

	@Test
	public void testResolver() {
		try {
			e=new Ecuacion(new Fraccion(2, 1), new Fraccion(2, 3));//Ecucacion con fracciones positivas
			f=e.resolver();
			assertEquals(f.getNumerador(),-2);
			assertEquals(f.getDenominador(),6);
		}
		catch(DenominadorCeroException dce){
			fail("Ha saltado una DenominadorCeroException");
		}
		catch(EcuacionNoLinealException enle) {
			fail("Ha saltado una EcuacionNoLinealException");
		}
	}
	
	@Test
	public void testResolverNominador0() {
		try {
			e=new Ecuacion(new Fraccion(1, 1), new Fraccion(0, 1));//Numerador 0
			f=e.resolver();
			assertEquals(f.getNumerador(),0);
			assertEquals(f.getDenominador(),1);
		}
		catch(DenominadorCeroException dce){
			fail("Ha saltado una DenominadorCeroException");
		}
		catch(EcuacionNoLinealException enle) {
			fail("Ha saltado una EcuacionNoLinealException");
		}
	}
	
	@Test
	public void testResolverDenNumNegativos() {
		try {
			e=new Ecuacion(new Fraccion(-1, 1), new Fraccion(2, 3));//Numerador y denominador negativo
			f=e.resolver();
			assertEquals(f.getNumerador(),-2);
			assertEquals(f.getDenominador(),-3);
			e=new Ecuacion(new Fraccion(1, -1), new Fraccion(2, 3));//Numerador y denominador positivos
			f=e.resolver();
			assertEquals(f.getNumerador(),2);
			assertEquals(f.getDenominador(),3);
			e=new Ecuacion(new Fraccion(-1, -1), new Fraccion(2, 3));//Numerador positivo y denominador negativo
			f=e.resolver();
			assertEquals(f.getNumerador(),2);
			assertEquals(f.getDenominador(),-3);
		}
		catch(DenominadorCeroException dce){
			fail("Ha saltado una DenominadorCeroException");
		}
		catch(EcuacionNoLinealException enle) {
			fail("Ha saltado una EcuacionNoLinealException");
		}
	}
}
