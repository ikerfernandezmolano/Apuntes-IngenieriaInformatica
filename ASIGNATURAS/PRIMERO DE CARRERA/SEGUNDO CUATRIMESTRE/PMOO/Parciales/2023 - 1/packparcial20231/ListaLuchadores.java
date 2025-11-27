package org.pmoo.packparcial20231;

import java.util.ArrayList;
import java.util.Iterator;

public class ListaLuchadores {
	private ArrayList<Luchador> listaLuchadores;
	private static ListaLuchadores miLL= new ListaLuchadores();
	
	private ListaLuchadores() 
	{
		this.listaLuchadores=new ArrayList<Luchador>();
	}
	
	public static ListaLuchadores getListaLuchadores()
	{
		return miLL;
	}
	
	private Iterator<Luchador> getIterador()
	{
		return this.listaLuchadores.iterator();
	}
	
	public Luchador obtenerLuchadorAlAzar()
	{
		Iterator<Luchador> itr = this.getIterador();
		Luchador luchador=itr.next();
		return luchador;
	}
}
