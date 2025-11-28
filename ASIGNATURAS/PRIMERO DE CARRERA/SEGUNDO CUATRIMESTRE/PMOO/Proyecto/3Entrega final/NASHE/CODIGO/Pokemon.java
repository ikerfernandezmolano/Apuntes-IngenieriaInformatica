package org.pmoo.packproyecto;

public abstract class Pokemon {
	private String nombre;
	private String tipo;
	private int vida;
	private ListaAtaque listaAtaques=new ListaAtaque();
	
	public Pokemon(String pNombre,String pTipo, int pVida) {
		this.nombre=pNombre;
		this.tipo=pTipo;
		this.vida=pVida;
		this.listaAtaques=crearListaAtaques();
	}
	
	public void imprimir() {
		System.out.println("\nNOMBRE : " + this.nombre + ", VIDA : " + this.vida +", TIPO : " + this.tipo);
		this.listaAtaques.imprimir();
	}
	
	private int usarAtaque(int pPosAtaqueEnLista) {
		return this.listaAtaques.usarAtaque(pPosAtaqueEnLista);
	} 
	
	public void cambiarVida(int pDaño) {
		this.vida=this.vida-pDaño;
	}
	
	public boolean muerto() {
		boolean muerto=false;
		if(this.vida<=0) {
			muerto=true;
		}
		return muerto;
	}
	
	public void atacar(Pokemon pPK) throws CambiarDePokemonException,UsarCuraException{
		int num=0;
		boolean repetir=true;
		int daño=0;
		while(num==0||repetir) {
			num=Teclado.getTeclado().leerNumero(6);
			if(num==5) {
				throw(new CambiarDePokemonException());
			}
			else if(num==6) {
				throw(new UsarCuraException());
			}
			daño=this.usarAtaque(num-1);
			if((num<1&&num>4)||daño==-100000) {
				System.out.println("ERROR: Su respuesta no es la esperada.");
				System.out.println("¡VUELVE A INTENTARLO!");
			}
			else{
				repetir=false;
			}	
		}
		if(this.supereficaz(pPK)) {
			daño=daño+(daño/5);
			System.out.println("Tu ataque es SUPEREFICAZ");
		}
		else if(this.pocoeficaz(pPK)) {
			daño=daño-(daño/5);
			System.out.println("Tu ataque es POCO EFICAZ");
		}
		pPK.cambiarVida(daño);
	}
	
	protected abstract ListaAtaque crearListaAtaques();
	
	protected abstract boolean supereficaz(Pokemon pPK);
	
	protected abstract boolean pocoeficaz(Pokemon pPK);
	
	public void imprimirSoloInfoPK() {
		System.out.println("                           NOMBRE : " + this.nombre + ", VIDA : " + this.vida +", TIPO : " + this.tipo);
	}
	
	public int getVida() {
		return this.vida;
	}
}
