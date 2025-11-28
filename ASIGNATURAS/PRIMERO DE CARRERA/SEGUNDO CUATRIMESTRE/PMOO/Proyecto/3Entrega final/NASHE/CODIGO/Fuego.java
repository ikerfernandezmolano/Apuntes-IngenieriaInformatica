package org.pmoo.packproyecto;

public class Fuego extends Pokemon{
	public Fuego(String pNombre,String pTipo, int pVida) {
		super(pNombre,pTipo,pVida);
	}
	
	protected ListaAtaque crearListaAtaques() {
		ListaAtaque lista=new ListaAtaque();
		Ataque atq1=new Ataque("Ascuas", "Fuego", 10, 15);
		lista.añadirAtaque(atq1);
		Ataque atq2=new Ataque("Llamarada", "Fuego", 20, 8);
		lista.añadirAtaque(atq2);
		Ataque atq3=new Ataque("Bomba termica", "Fuego", 25, 3);
		lista.añadirAtaque(atq3);
		Ataque atq4=new Ataque("Antibomberos", "Fuego", 5, 20);
		lista.añadirAtaque(atq4);
		return lista;
	}

	@Override
	protected boolean supereficaz(Pokemon pPK) {
		boolean supereficaz=false;
		if(pPK instanceof Planta) {
			supereficaz=true;
		}
		return supereficaz;
	} 
	
	@Override
	protected boolean pocoeficaz(Pokemon pPK) {
		boolean pocoeficaz=false;
		if(pPK instanceof Agua) {
			pocoeficaz=true;
		}
		return pocoeficaz;
	}
}
