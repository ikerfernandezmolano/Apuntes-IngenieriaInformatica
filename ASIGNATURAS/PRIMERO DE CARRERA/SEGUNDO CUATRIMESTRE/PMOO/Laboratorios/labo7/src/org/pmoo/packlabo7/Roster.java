package org.pmoo.packlabo7;

import java.util.*;

public class Roster
{
	// atributos
	private ArrayList<Concursante> lista;
	private static Roster miRoster= new Roster();
	
	// constructora
	private Roster() {
		this.lista=new ArrayList<Concursante>();
	}

	// otros metodos
	
	/**
	 * @return la unica instancia del Roster
	 */
	public static Roster getRoster()
	{
		return miRoster;
	}

	/**
	 * 
	 * @return el iterador del Roster de concursantes
	 */
	private Iterator<Concursante> getIterador()
	{
		return this.lista.iterator();
	}
	
	/**
	 * 
	 * @param pNombre
	 * @return el concursante del Roster cuyo nombre es igual a pNnombre
	 *         Si no existe tal concursante, se devuelve null
	 */
	private Concursante buscarConcursantePorNombre(String pNombre)
	{
		Concursante c=null;
		Iterator<Concursante> itr= this.getIterador();
		boolean enc=false;
		while(itr.hasNext()&&!enc) {
			c=itr.next();
			if(c.obtenerNombre()==pNombre) {
				enc=true;
			}
		}
		return c;
	}
	
	/**
	 * 
	 * @param pConcursante
	 *   post: se annade al Roster al concursante pConcursante, salvo que ya exista un concursante
	 *         con el mismo nombre que pConcursante, en cuyo caso no se annade y se muestra un mensaje
	 *         por pantalla.            
	 */
	public void anadirConcursante(Concursante pConcursante)
	{
		if(this.buscarConcursantePorNombre(pConcursante.obtenerNombre())==null) {
			this.lista.add(pConcursante);
		}
	}
	/**
	 * 
	 * @return un booleano que indica si, para todos los concursantes del roster, su lista
	 *         de nominados cumple las reglas definidas en el enunciado.  
	 *        
	 */
	private boolean seCumplenLasReglas()
	{
		boolean seCumplen=true;
		Iterator<Concursante> itr=this.getIterador();
		Concursante c;
		while(itr.hasNext()&&seCumplen) {
			c=itr.next();
			if(!c.cumpleLasReglas()) {
				seCumplen=false;
			}
		}
		return seCumplen;
	}

	/**
	 * @return el umbral para entrar en la lista de concursantes expulsables, es decir, el numero
	 *         maximo de nominaciones recibidas por un concursante de tipo Tronero 	 *       
	 */
	private int calcularUmbral()
	{
		Iterator<Concursante> itr=this.getIterador();
		Concursante c;
		int umbral=0;
		while(itr.hasNext()) {
			c=itr.next();
			if(umbral<c.cuantasNominacionesTiene()&&c instanceof Tronero) {
				umbral=c.cuantasNominacionesTiene();
			}
		}
		return umbral;
	}

	/**
	 * @return la lista de concursantes expulsables, segun lo expuesto en el enunciado. 
	 *       
	 */
	public ListaConcursantes obtenerListaDeConcursantesExpulsables()
	{
		int umbral=this.calcularUmbral();
		ListaConcursantes listaConcursantesExpulsables=new ListaConcursantes();
		Concursante c;
		Iterator<Concursante> itr=this.getIterador();
		if(this.seCumplenLasReglas()) {
			while(itr.hasNext()) {
				c=itr.next();
				if(c.cuantasNominacionesTiene()>=umbral) {
					listaConcursantesExpulsables.anadir(c);
				}
			}
		}
		return listaConcursantesExpulsables;
	}
	
	/**
	 * vacia el Roster de concursantes
	 */
	public void resetear()
	{
		this.lista = new ArrayList<Concursante>();
	}
}
