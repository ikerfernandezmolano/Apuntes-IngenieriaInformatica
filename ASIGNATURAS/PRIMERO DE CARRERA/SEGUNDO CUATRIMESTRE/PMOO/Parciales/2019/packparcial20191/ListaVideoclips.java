package org.pmoo.packparcial20191;

import java.util.ArrayList;

public class ListaVideoclips 
{
	private ArrayList<Videoclip> lista;
	
	public ListaVideoclips() 
	{
		this.lista = new ArrayList<Videoclip>();
	}
	
	public void añadirVideoclip(Videoclip pVideoclip) 
	{
		this.lista.add(pVideoclip);
	}
	
}
