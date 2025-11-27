package org.eda.practica1;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class ListaWebsTest {
	ListaWebs lista= new ListaWebs();

	@Before
	public void setUp() throws Exception {
		lista.cargarLista();
	}

	@After
	public void tearDown() throws Exception {
		lista=null;
	}

	@Test
	public void testBuscarWeb() {
		assertNull(lista.buscarWeb("51351251.com"));
		Web w=lista.getWebPorId(0);
		assertEquals(w,lista.buscarWeb("0-00.pl"));
		Web w2 =lista.getWebPorId(500000);
		assertEquals(w2,lista.buscarWeb("deventertelevisie.nl"));
		Web w3 =lista.getWebPorId(2039804);
		assertEquals(w3,lista.buscarWeb("zzzz6666.com"));
	}

	@Test
	public void testBorrarWeb() {
		lista.borrarWeb("deventertelevisie.nl");
		Web w =lista.getWebPorId(500000);
		assertNull(w);
	}

	@Test
	public void testAñadirWeb() {
		Web web=lista.getWebPorId(500000);
		lista.borrarWeb("deventertelevisie.nl");
		lista.añadirWeb(web);
		Web webaux=lista.getWebPorId(500000);
		assertEquals(web,webaux);
	}
	
	@Test
	public void testSalientes() {
		lista.cargarSalientes();
		ArrayList<String> al=new ArrayList<String>();
		al=lista.salientes("0-100.com.cn");
		assertEquals(al.get(0),"pooban.com");
		assertEquals(al.get(1),"yojochina.com");
		assertEquals(al.get(2),"nen.net.cn");
	}
	
	@Test
	public void testIdent2String() {
		assertEquals("0-00.pl",lista.ident2String(0));
	}
}
