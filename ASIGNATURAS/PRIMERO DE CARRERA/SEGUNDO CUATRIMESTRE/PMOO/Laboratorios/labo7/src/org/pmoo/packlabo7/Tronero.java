package org.pmoo.packlabo7;

public class Tronero extends Concursante
{
	// constructora
	public Tronero(String pNombre, int pPuntuacion)
	{
		super(pNombre,pPuntuacion);
	}

	// otros metodos
			
	/**
	 *  @return un booleano que indica si la lista de nominados del tronero cumple las reglas
	 *          definidas en el enunciado. Es decir: la puntuacion p del tronero debe ser mayor
	 *          o igual que cero, en su lista de nominados no puede haber mas de p concursantes,
	 *          y todos ellos deben ser troneros o pretendistas (esto es, no se pueden mezclar).           
	 *    
	 */
	@Override
	public boolean cumpleLasReglas()
	{
		boolean cumpleReglas=true;
		int numConcursantes=super.obtenerListaNominados().numeroConcursantes();
		int p=super.obtenerPuntuacion();
		int nNomPret=super.obtenerListaNominados().numeroPretendistas();
		int nNomTron=super.obtenerListaNominados().numeroTroneros();
		if(p<0||numConcursantes>p||(nNomPret!=0&&nNomTron!=0)) {
			cumpleReglas=false;
		}
		return cumpleReglas;
	}

	
	/**
	 *  @param pConcursanteNominado
	 *   post: se incrementa el numero de nominaciones de pConcursanteNominado en 2, dado que las 
	 *         nominaciones de un Tronero siempre penalizan doble. 
	 */
	@Override
	protected void aplicarNominacion(Concursante pConcursanteNominado)
	{
		pConcursanteNominado.incrementarNominacionesRecibidas(2);
	}

	
	/**
	 *  @param pPretendista
	 *  @return un booleano que indica si pPretendista se encuentra en la lista de nominados
	 *          del tronero actual.    
	 */
	public boolean estaEntreSusNominados(Pretendista pPretendista)
	{
		return super.obtenerListaNominados().esta(pPretendista);
	}

}
