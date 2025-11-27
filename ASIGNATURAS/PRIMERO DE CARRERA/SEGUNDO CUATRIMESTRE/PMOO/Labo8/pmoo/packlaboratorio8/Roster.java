package org.pmoo.packlaboratorio8;


public class Roster
{
	// atributos y patrón Singleton
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
	 *   Se intenta añadir a la lista de participantes del Roster un participante cuyo nombre es 
	 *   pNombre, su identificador es pId, y su edad es pEdad.
	 *   Este método realiza el tratamiento de MenorDeEdadException, que consiste en no hacer 
	 *   nada, es decir, que si se captura una MenorDeEdadException, entonces no se añade ningún
	 *   participante a la lista de participantes del Roster.
	 *   Este método también realiza el tratamiento de YaExisteIdException. En este caso, si al 
	 *   intentar añadir a la lista de participantes del Roster un participante cuyo id ya existe
	 *   (esto es, hay ya un participante que tiene el identificador pId), entonces lo que se hará
	 *   es intentar añadir un participante con mismo nombre (pNombre) y misma edad (pEdad), pero
	 *   con identificador igual a pId+1. Si también existiera ya en la lista de participantes del
	 *   Roster un participante con identificador pId+1, entonces se intentaría con pId+2.... y así
	 *   sucesivamente hasta que en algún momento se encuentre un valor pId+x que esté libre (o lo 
	 *   que es lo mismo, que no exista ningún participante en la lista que lo tenga). De este modo,
	 *   finalmente se añadirá un participante {pNombre, pId+x, pEdad}.
	 *   	                     
  	 */
	public void anadirParticipante(String pNombre, int pId, int pEdad) {
		boolean añadido=false;
		while(!añadido) {
			try {
				this.lista.anadirParticipante(pNombre, pId, pEdad);
				añadido=true;
			}
			catch(MenorDeEdadException mdee) {
				System.out.println("No es mayor de edad");
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

