package org.pmoo.packparcial2017;

public class FuncionConstante extends Funcion{
	private int coef1;
	public FuncionConstante(int pNum) {
		coef1=pNum;
	}
	
	@Override
	public int f(int pX) {
		return this.coef1*pX;
	}

}
