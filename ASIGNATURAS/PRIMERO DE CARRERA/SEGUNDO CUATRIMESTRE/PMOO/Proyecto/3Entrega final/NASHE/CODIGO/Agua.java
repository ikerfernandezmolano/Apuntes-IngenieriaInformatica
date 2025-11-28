package org.pmoo.packproyecto;

public class Agua extends Pokemon{
	public Agua(String pNombre,String pTipo, int pVida) {
		super(pNombre,pTipo,pVida);
	}
	
	protected ListaAtaque crearListaAtaques() {
		ListaAtaque lista=new ListaAtaque();
		Ataque atq1=new Ataque("Tsunami", "Agua", 25, 3);
		lista.añadirAtaque(atq1);
		Ataque atq2=new Ataque("Manguerazo", "Agua", 5, 20);
		lista.añadirAtaque(atq2);
		Ataque atq3=new Ataque("Remolino", "Agua", 10, 15);
		lista.añadirAtaque(atq3);
		Ataque atq4=new Ataque("Maremoto", "Agua", 20, 8);
		lista.añadirAtaque(atq4);
		return lista;
	} 
	
	@Override
	protected boolean supereficaz(Pokemon pPK){
		boolean supereficaz=false;
		if(pPK instanceof Fuego) {
			supereficaz=true;
		}
		return supereficaz;
	}
	
	@Override
	protected boolean pocoeficaz(Pokemon pPK) {
		boolean pocoeficaz=false;
		if(pPK instanceof Planta) {
			pocoeficaz=true;
		}
		return pocoeficaz;
	}
}
