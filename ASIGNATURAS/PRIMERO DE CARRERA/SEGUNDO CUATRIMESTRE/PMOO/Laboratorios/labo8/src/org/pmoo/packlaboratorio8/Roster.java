package org.pmoo.packlaboratorio8;


public class Roster
{
	// atributos y patron Singleton
	private ListaParticipantes lista;
	private static Roster miRoster=new Roster();
	// constructora
	
	private Roster() {
		this.lista=new ListaParticipantes();
	}

	public static Roster getRoster() {
		return miRoster;
	}

	public int obtenerNumeroDeParticipantes() {
		return this.lista.obtenerNumeroDeParticipantes();
	}
	
	/**
	 * 
	 * @param pNombre
	 * @param pId
	 * @param pEdad
	 * 
	 *   Se intenta a�adir a la lista de participantes del Roster un participante cuyo nombre es 
	 *   pNombre, su identificador es pId, y su edad es pEdad.
	 *   Este m�todo realiza el tratamiento de MenorDeEdadException, que consiste en no hacer 
	 *   nada, es decir, que si se captura una MenorDeEdadException, entonces no se a�ade ning�n
	 *   participante a la lista de participantes del Roster.
	 *   Este m�todo tambi�n realiza el tratamiento de YaExisteIdException. En este caso, si al 
	 *   intentar a�adir a la lista de participantes del Roster un participante cuyo id ya existe
	 *   (esto es, hay ya un participante que tiene el identificador pId), entonces lo que se har�
	 *   es intentar a�adir un participante con mismo nombre (pNombre) y misma edad (pEdad), pero
	 *   con identificador igual a pId+1. Si tambi�n existiera ya en la lista de participantes del
	 *   Roster un participante con identificador pId+1, entonces se intentar�a con pId+2.... y as�
	 *   sucesivamente hasta que en alg�n momento se encuentre un valor pId+x que est� libre (o lo 
	 *   que es lo mismo, que no exista ning�n participante en la lista que lo tenga). De este modo,
	 *   finalmente se a�adir� un participante {pNombre, pId+x, pEdad}.
	 *   	                     
  	 */
	public void anadirParticipante(String pNombre, int pId, int pEdad) {
		boolean anadido=false;
		while(!anadido) {
			try {
				this.lista.anadirParticipante(pNombre, pId, pEdad);
				anadido=true;
			}
			catch(MenorDeEdadException mdee) {
				System.out.println("No es mayor de edad");
				anadido=true;
			}
			catch(YaExisteIdException yeie) {
				pId++;
			}
		}
	}
	
	
	public Participante buscarParticipantePorId(int pId) {
		try {
		return this.lista.obtenerParticipanteCuyoIdEs(pId);
		}
		catch(NoEncontradoException nee) {
			System.out.println("No existe un participante con esa id");
			return null;
		}
	}

	public void resetear() {
		this.lista=new ListaParticipantes();
	}
}

