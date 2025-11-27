package org.pmoo.packlaboratorio8;


public class Participante 
{
	private String nombre;
	private int id;
	private int edad;

	/**
	 * 
	 * @param pNombre
	 * @param pId
	 * @param pEdad
	 *            
	 * @exception se lanza una MenorDeEdadException si pEdad es menor de 18.
	 *            Si no, se inicializa un nuevo objeto de la clase Participante con nombre pNombre,
	 *            identificador pId, y edad pEdad
	 * 
	 * 
	 */
	public Participante(String pNombre, int pId, int pEdad) throws MenorDeEdadException{
		this.edad=pEdad;
		this.id=pId;
		this.nombre=pNombre;
		if(pEdad<18) {
			throw(new MenorDeEdadException());
		}
	}
		
	public boolean tieneEsteId(int pId) {
		boolean igual=false;
		if(this.id==pId) {
			igual=true;
		}
		return igual;
	}
	
	public String obtenerNombre() {
		return this.nombre;
	}
		
	public int obtenerEdad() {
		return this.edad;
	}

}
