package org.pmoo.packlaboratorio8;

import java.util.ArrayList;
import java.util.Iterator;

public class ListaParticipantes
{
	private ArrayList<Participante> lista;
	
	public ListaParticipantes() {
		this.lista=new ArrayList<Participante>();
	}

	private Iterator<Participante> getIterador(){
		return this.lista.iterator();
	}

	public int obtenerNumeroDeParticipantes() {
		return this.lista.size();
	}

	private boolean existeUnParticipanteConEsteId(int pId) {
		Iterator<Participante> itr=this.getIterador();
		Participante participante;
		boolean existe=false;
		while(itr.hasNext()&&!existe) {
			participante=itr.next();
			if(participante.tieneEsteId(pId)) {
				existe=true;
			}
		}
		return existe;
	}


	/**
	 * 
	 * @param pNombre
	 * @param pId
	 * @param pEdad
	 * @exception se lanza una YaExisteIdException si en la lista ya hay un participante cuyo
	 *            identificador es pId.
	 *            En este método NO se realiza el tratamiento de MenorDeEdadException.
	 *            Si no ocurre ninguna situación excepcional, se añade a la lista un  participante 
	 *            cuyo nombre es pNombre, su identificador es pId, y su edad es pEdad.
	 *                    
	 */
	public void anadirParticipante(String pNombre, int pId, int pEdad) throws YaExisteIdException, MenorDeEdadException{
		this.lista.add(new Participante(pNombre, pId, pEdad));
		if(this.existeUnParticipanteConEsteId(pId)) {
			throw (new YaExisteIdException());
		}
	}
	
	/**
	 * 
	 * @param pId
	 * @return el participante de la lista cuyo identificador es igual a pId.
	 * @exception se lanza una NoEncontradoException si no existe tal participante.
	 */
	public Participante obtenerParticipanteCuyoIdEs(int pId) throws NoEncontradoException{
		Iterator<Participante> itr=this.getIterador();
		Participante participante=null;
		boolean parar=false;
		while(itr.hasNext()) {
			participante=itr.next();
			if(participante.tieneEsteId(pId)) {
				parar=true;
			}
		}
		if(!parar) {
			throw(new NoEncontradoException());
		}
		return participante;
	}
}

