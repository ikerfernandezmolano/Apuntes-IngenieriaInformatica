package org.pmoo.packproyecto;

public class Planta extends Pokemon{
	public Planta(String pNombre,String pTipo, int pVida) {
		super(pNombre,pTipo,pVida);
	}
	
	protected ListaAtaque crearListaAtaques() {
		ListaAtaque lista=new ListaAtaque();
		Ataque atq1=new Ataque("Ortiga Salvaje", "Planta", 20, 8);
		lista.añadirAtaque(atq1);
		Ataque atq2=new Ataque("Fotosintesis", "Planta", 10, 15);
		lista.añadirAtaque(atq2);
		Ataque atq3=new Ataque("Espora", "Planta", 5, 20);
		lista.añadirAtaque(atq3);
		Ataque atq4=new Ataque("Abrazo de Cactus", "Planta", 25, 3);
		lista.añadirAtaque(atq4);
		return lista;
	} 
	
	@Override
	protected boolean supereficaz(Pokemon pPK) {
		boolean supereficaz=false;
		if(pPK instanceof Agua) {
			supereficaz=true;
		}
		return supereficaz;
	}

	@Override
	protected boolean pocoeficaz(Pokemon pPK) {
		boolean pocoeficaz=false;
		if(pPK instanceof Fuego) {
			pocoeficaz=true;
		}
		return pocoeficaz;
	}
}
