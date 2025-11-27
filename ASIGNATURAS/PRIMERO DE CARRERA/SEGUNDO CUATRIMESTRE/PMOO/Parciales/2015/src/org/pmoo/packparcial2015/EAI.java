package org.pmoo.packparcial2015;

public class EAI {
	
	private ListaActividades listaActividades;
	private static EAI miEAI=new EAI();
	
	private EAI() {
		this.listaActividades=new ListaActividades();
	}
	
	public static EAI getListaActividades() {
		return miEAI;
	}
	
	public int resolverEAI(int pMax) {
		int nota=0;
		int numActividades=0;
		int dificultadActual=0;
		Actividad actividad;
		while(numActividades<pMax) {
			try {
				numActividades++;
				actividad=this.listaActividades.darUnaActividadDeDificultad(dificultadActual);
				if(actividad.resolverActividad()){
					dificultadActual++;
					nota++;
				}
				else {
					dificultadActual--;
					nota--;
				}	
			}
			catch(ActividadNoEncontradaException anee) {
				System.out.println("No existe ninguna pregunta de la siguiente dificultad");
			}
		}
		return nota;
	}

}
