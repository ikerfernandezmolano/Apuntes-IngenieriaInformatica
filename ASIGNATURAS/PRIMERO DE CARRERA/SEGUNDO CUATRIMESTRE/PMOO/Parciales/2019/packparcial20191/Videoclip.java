package org.pmoo.packparcial20191;

public class Videoclip 
{
	private String titulo;
	private String interprete;
	private String estiloMusical;
	private int duracion;
	
	public Videoclip(String pTitulo, String pInterprete, String pEstiloMusical, int pDuracion) 
	{
		this.titulo=pTitulo;
		this.interprete=pInterprete;
		this.estiloMusical=pEstiloMusical;
		this.duracion=pDuracion;
	}

	
	public boolean esDeEsteEstiloMusical(String pEstiloMusical) 
	{
		boolean esDeEsteEstilo=false;
		if(this.estiloMusical==pEstiloMusical) {
			esDeEsteEstilo=true;
		}
		return esDeEsteEstilo;
	}
}
