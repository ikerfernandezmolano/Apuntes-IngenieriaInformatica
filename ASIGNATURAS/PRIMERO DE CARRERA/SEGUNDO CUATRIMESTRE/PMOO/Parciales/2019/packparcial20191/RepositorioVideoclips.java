package org.pmoo.packparcial20191;

import java.util.ArrayList;
import java.util.Iterator;

public class RepositorioVideoclips 
{
	
	private ArrayList<Videoclip> lista;
	private static RepositorioVideoclips miRV= new RepositorioVideoclips();
	
	private RepositorioVideoclips() 
	{
		this.lista=new ArrayList<Videoclip>();
	}
	
	public static RepositorioVideoclips getRepositorioVideoclips() 
	{
		return miRV;
	}
	
	private Iterator<Videoclip> getIterador() 
	{
		return this.lista.iterator();
	}
	public ListaVideoclips obtenerVideoclips(String pEstilo, int pCuantos) 
	{
		Iterator<Videoclip> itr = this.getIterador();
		Videoclip videoclip;
		ListaVideoclips listaVideoclipsMismoGen= new ListaVideoclips();
		while(itr.hasNext() || pCuantos!=0) {
			videoclip=itr.next();
			if(videoclip.esDeEsteEstiloMusical(pEstilo)) {
				listaVideoclipsMismoGen.añadirVideoclip(videoclip);
				pCuantos--;
			}
		}
		return listaVideoclipsMismoGen;
	}
}
