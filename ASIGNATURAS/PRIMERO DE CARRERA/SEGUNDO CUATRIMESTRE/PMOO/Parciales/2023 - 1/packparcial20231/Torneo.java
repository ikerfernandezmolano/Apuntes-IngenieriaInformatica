package org.pmoo.packparcial20231;

import java.util.ArrayList;
import java.util.Iterator;

public class Torneo {
	private ArrayList<Combate> listaCombates;
	private static Torneo miLC= new Torneo();
	
	private Torneo() 
	{
		this.listaCombates= new ArrayList<Combate>();
	}
	
	public static Torneo getTorneo() {
		return miLC;
	}
	
	private Iterator<Combate> getIterador()
	{
		return this.listaCombates.iterator();
	}
	
	private boolean buscarSiExisteElLuchador(Luchador pLuchador) 
	{
		Iterator<Combate> itr= this.getIterador();
		boolean existeLuchador=false;
		while(!existeLuchador && itr.hasNext()) 
		{
			Combate combate = itr.next();
			existeLuchador=combate.existeElLuchador(pLuchador);
		}
		return existeLuchador;
	}
	
	private Combate crearCombateNoExistente(int pId) 
	{
		boolean hecho=false;
		Luchador luchador1;
		Luchador luchador2;
		while(!hecho) {
			luchador1=ListaLuchadores.getListaLuchadores().obtenerLuchadorAlAzar();
			if(!this.buscarSiExisteElLuchador(luchador1)) {
				hecho=true;
			}
		}
		hecho=false;
		while(!hecho) {
			luchador2=ListaLuchadores.getListaLuchadores().obtenerLuchadorAlAzar();
			if(!this.buscarSiExisteElLuchador(luchador2)) {
				hecho=true;
			}
		}
		Combate combate=new Combate(pId, luchador1, luchador2);
		return combate;
	}
	
	public void organizarCombates() 
	{
		int id=1;
		Combate combate;
		while(id!=6) 
		{	
			combate=crearCombateNoExistente(id);
			this.listaCombates.add(combate);
			id++;
		}
	}
	
	public void imprimirPrimerCombateDeLuchador(String pNombre) 
	{
		Iterator<Combate> itr=this.getIterador();
		boolean hecho=false;
		while(itr.hasNext() && !hecho) {
			Combate combate=itr.next();
			if(combate.tieneAlLuchadorBuscadoPorNombre(pNombre)) {
				combate.imprimirDatos();
				hecho=true;
			}
		}
	}
}
