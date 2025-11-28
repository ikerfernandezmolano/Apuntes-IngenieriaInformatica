package org.pmoo.packproyecto;

import java.util.ArrayList;
import java.util.Iterator;

public class ListaAtaque {
	private ArrayList<Ataque> listaAtaque;
	
	public ListaAtaque() {
		this.listaAtaque=new ArrayList<Ataque>();
	}
	
	private Iterator<Ataque> getIterador(){
		return this.listaAtaque.iterator();
	}
	
	public void imprimir() {
		Iterator<Ataque> itr=this.getIterador();
		Ataque ataque;
		int posEnLista=1;
		System.out.println("\nLos ataques de tu Pokemon son :");
		while(itr.hasNext()) {
			ataque=itr.next();
			ataque.imprimir(posEnLista);
			posEnLista++;
		} 
	}
	
	public int usarAtaque(int pPosAtaqueEnLista) {
		Ataque ataque=this.listaAtaque.get(pPosAtaqueEnLista);
		int daño=-100000;
		if(!ataque.ataqueGastado()&&ataque!=null) {
			daño=ataque.getDaño();
			ataque.disminuirUso();
		}
		else{
			System.out.println("\nSe han agotado los usos de este ataque.");
		}
		return daño;
	}
	
	public void añadirAtaque(Ataque pAtaque) {
		this.listaAtaque.add(pAtaque);
	}
}
