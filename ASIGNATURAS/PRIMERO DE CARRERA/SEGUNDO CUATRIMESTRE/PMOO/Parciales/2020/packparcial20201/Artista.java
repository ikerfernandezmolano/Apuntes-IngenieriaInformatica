package org.pmoo.packparcial20201;

public class Artista 
{
	private String nombre;
	private String estilo;
	private int cache;
	private int duracionActuacion;
	
	public Artista(String pNombre, String pEstilo, int pDuracion, int pCache) {
		this.cache=pCache;
		this.duracionActuacion=pDuracion;
		this.estilo=pEstilo;
		this.nombre=pNombre;
	}
	public String getEstilo() {
		return this.estilo;
	}
	
	public int getCache() {
		return this.cache;
	}
	
	public boolean esDeEsteEstilo(String pEstilo) {
		boolean mismoEstilo=false;
		if(this.estilo==pEstilo) {
			mismoEstilo=true;
		}
		return mismoEstilo;
	}
}
