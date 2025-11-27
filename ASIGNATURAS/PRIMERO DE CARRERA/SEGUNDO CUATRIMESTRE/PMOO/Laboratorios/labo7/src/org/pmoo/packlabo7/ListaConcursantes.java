package org.pmoo.packlabo7;

import java.util.*;

public class ListaConcursantes
{
	// atributos
	private ArrayList<Concursante> listaConcursantes;
	
	// constructora
	
	/**
	 * post: inicializa la lista de concursantes a una lista vacia
	 */
	public ListaConcursantes()
	{
		this.listaConcursantes=new ArrayList<Concursante>();
	}
	
	// otros metodos
	
	/**
	 * @return el concursantes que ocupa la posicion pPos de la lista
	 *   post: si el parametro pPos no es valido, se muestra un mensaje por pantalla y se devuelve null.
	 *         Las posiciones de la lista se cuentan empezando en 0 y terminando en n-1, siendo n el numero
	 *         de concursantes que hay en ella.
	 *         
	 */
	public Concursante obtenerConcursanteEnPos(int pPos)
	{
		return this.listaConcursantes.get(pPos);
	}
	
	/**
	 * @return el numero de concursantes que hay en la lista
	 */
	public int numeroConcursantes()
	{
		return this.listaConcursantes.size();
	}

		
	/**
	 * @return el numero concursantes Troneros que hay en la lista
	 */
	public int numeroTroneros()
	{
		int nTroneros=0;
		int pos=0;
		Concursante c;
		while(pos<this.listaConcursantes.size()) {
			c=listaConcursantes.get(pos);
			if(c instanceof Tronero) {
				nTroneros++;
			}
			pos++;
		}
		
		return nTroneros;
	}
	
	/**
	 * @return el numero concursantes Pretendistas que hay en la lista
	 */
	public int numeroPretendistas()
	{
		return this.numeroConcursantes()-this.numeroTroneros();
	}
	
	/**
	 * @param pConcursante
	 *            post: annade el concursante pConcursante a la lista
	 */
	public void anadir(Concursante pConcursante)
	{
		this.listaConcursantes.add(pConcursante);
	}

	/**
	 * @param pConcursante
	 * @return un booleano que indica si pConcursante esta en la lista de concursantes
	 */
	public boolean esta(Concursante pConcursante)
	{
		boolean esta=false;
		int pos=0;
		while(pos<this.listaConcursantes.size()&&!esta) {
			if(this.listaConcursantes.get(pos)==pConcursante) {
				esta=true;
			}
			pos++;
		}
		return esta;
	}
}
