package org.pmoo.packproyecto;

public class Ataque {
	private String nombre;
	private String tipo;
	private int daño;
	private int usos;
	
	public Ataque(String pNombre,String pTipo,int pDaño,int pUsos) {
		this.nombre=pNombre;
		this.tipo=pTipo;
		this.daño=pDaño;
		this.usos=pUsos;
	}
	
	public void imprimir(int pPosAtaqueEnLista) {
		System.out.println(pPosAtaqueEnLista + ".   NOMBRE : " + this.nombre + ", TIPO : " + this.tipo + ", DAÑO : " + this.daño + ", USOS : " + this.usos);
	}
	
	public int getDaño() {
		return this.daño;
	}
	
	public void disminuirUso() {
		this.usos--;
	} 
	
	public boolean ataqueGastado() {
		boolean gastado=false;
		if(this.usos<=0) {
			gastado=true;
		}
		return gastado;
	}
}
