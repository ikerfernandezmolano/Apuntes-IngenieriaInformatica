package org.pmoo.packparcial20201;

import java.util.ArrayList;
import java.util.Iterator;

public class ListaArtistas 
{
	private ArrayList<Artista> listaArtistas;
	
	public ListaArtistas() 
	{
		this.listaArtistas=new ArrayList<Artista>();
	}
	
	private Iterator<Artista> getIterador()
	{
		return this.listaArtistas.iterator();
	}
	
	public int numArtistasUnEstilo(String pEstilo) 
	{
		int numArtEstilo=0;
		Iterator<Artista> itr= this.getIterador();
		while(itr.hasNext()) {
			Artista artista=itr.next();
			if(artista.getEstilo()==pEstilo) {
				numArtEstilo++;
			}
		}
		return numArtEstilo;
	}
	
	public Artista primerArtistaConCacheMayorQue(int pCache) {
		Artista artistaMayorCacheQue=null;
		boolean parar = false;
		Iterator<Artista> itr= this.getIterador();
		while(itr.hasNext() || !parar) 
		{
			artistaMayorCacheQue=itr.next();
			if(artistaMayorCacheQue.getCache()>pCache) {
				parar=true;
			}
		}
		return artistaMayorCacheQue;
	}
}
