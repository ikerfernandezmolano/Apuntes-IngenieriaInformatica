package org.pmoo.packlabo7;

public abstract class Concursante
{
	// atributos
	private String nombre;
	private int puntuacion;
	private int nomRecibidas=0;
	private ListaConcursantes listaNominados;
	
	// constructora

	/**
	 * 
	 * @param pNombre
	 * @param pPuntuacion
	 *            post: se inicializa un nuevo objeto de la clase Concursante con nombre pNombre,
	 *            puntuacion pPuntuacion, cero nominaciones recibidas, y una lista de nominaciones vacia
	 */
	protected Concursante(String pNombre, int pPuntuacion)
	{
		this.nombre=pNombre;
		this.puntuacion=pPuntuacion;
		this.listaNominados=new ListaConcursantes();
	}


	// otros métodos

	/** 
	 * 
	 * @return el nombre del concursante
	 */
	public String obtenerNombre()
	{
		return this.nombre;
	}

	/** 
	 * 
	 * @return la puntuacion del concursante
	 */
	protected int obtenerPuntuacion()
	{
		return this.puntuacion;
	}

	/** 
	 * 
	 * @return la lista de nominados del concursante
	 */
	protected ListaConcursantes obtenerListaNominados()
	{
		return this.listaNominados;
	}

	/** 
	 * 
	 * post: el numero de nominaciones recibidas por el concursante es cero
	 */
	public void ponerACeroSusNominaciones()
	{
		this.nomRecibidas=0;
	}

	/**
	 * 
	 * @return el numero de nominaciones recibidas por el concursante
	 */
	public int cuantasNominacionesTiene()
	{
		return this.nomRecibidas;
	}

	/** 
	 * 
	 * @param pCantidad
	 * post: se incrementa en pCantidad unidades el numero de nominaciones recibidas por el concursante.
	 */
	public void incrementarNominacionesRecibidas(int pCantidad)
	{
		this.nomRecibidas=this.nomRecibidas+pCantidad;
	}

	/**
	 *  @return el numero de troneros que hay en la lista de nominados del concursante actual.    
	 */
	public int numeroDeTronerosQueHaNominado()
	{
		return this.listaNominados.numeroTroneros();
	}
	
	/**
	 *  @return el numero de pretendistas que hay en la lista de nominados del concursante actual.    
	 */
	public int numeroDePretendistasQueHaNominado()
	{
		return this.listaNominados.numeroPretendistas();
	}
	
	
	/**
	 * @param pNominado
	 *   post: se annade el concursante pNominado a la lista de nominados del concursante actual, salvo
	 *         que pNominado ya se encuentre en la lista o que pNominado sea el propio concursante actual
	 *         (es decir, que se este nominando a si mismo). Si se da alguna de estas dos situaciones,
	 *         entonces se muestra un mensaje por pantalla y pNominado no se annade a la lista de nominados
	 *         del concursante actual.            
	 */
	public  void nominar(Concursante pNominado)
	{
		this.listaNominados.anadir(pNominado);
	}


	/**
	 *   post: se recorre la lista de nominados del concursante y se aplica la nominacion correspondiente a cada uno de ellos
	 *         
	 */
	public void aplicarNominaciones()
	{
		int pos=0;
		Concursante c;
		while(pos<this.listaNominados.numeroConcursantes()) {
			c=this.listaNominados.obtenerConcursanteEnPos(pos);
			aplicarNominacion(c);
			pos++;
		}
	}
		
	/**
	 *  @return un booleano que indica si la lista de nominados del concursante cumple las
	 *          reglas definidas en el enunciado.  
	 *    Se trata de un metodo abstracto, porque cada subclase de Concursante lo implementa de
	 *    un modo diferente.
	 */
	public abstract boolean cumpleLasReglas();

	/**
	 *  @param pConcursanteNominado
	 *   post: se incrementa el numero de nominaciones de pConcursanteNominado en 1, 2 o 5,
	 *         dependiendo de la situacion.           
	 *    Se trata de un metodo abstracto, porque cada subclase de Concursante lo implementa de
	 *    un modo diferente.
	 */
	protected abstract void aplicarNominacion(Concursante pConcursanteNominado);

}
