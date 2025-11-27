package org.pmoo.parcial2023;

public class Fraccion {
	private int numerador, denominador;
	
	public Fraccion(int pNumerador, int pDenominador)throws DenominadorCeroException{ 
		if(pDenominador==0) {
			throw(new DenominadorCeroException());
		}
		this.numerador = pNumerador;
		this.denominador = pDenominador;
	}
	
	public int getNumerador(){ 
		return this.numerador; 
	}
	
	public int getDenominador(){ 
		 return this.denominador;
	}
	 
	public void imprimir(){ 
		 System.out.println(this.numerador + "/" + this.denominador); 
	}
}
