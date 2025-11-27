package org.pmoo.packparcial20201;

import java.util.ArrayList;

public class Festival {
	private String fecha;
	private String localidad;
	private ListaArtistas listaArtistas;
	private static Festival miFestival = new Festival();  
	
	private Festival() 
	{
		this.fecha="15/07/2024";
		this.localidad="Bilbao";
		this.listaArtistas=new ListaArtistas();
	}
	
	public static Festival getFestival() 
	{
		return miFestival;
	}
	
	public int artistasMismoEstilo(String pEstilo) 
	{
		int num;
		num=this.listaArtistas.numArtistasUnEstilo(pEstilo);
		return num;
	}

	public Artista mayorCache(int pCache) 
	{
		Artista artista;
		artista=this.listaArtistas.primerArtistaConCacheMayorQue(pCache);
		return artista;
	}
}
