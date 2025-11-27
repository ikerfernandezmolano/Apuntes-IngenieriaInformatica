package org.pmoo.parcial2023;

public class Ecuacion {
	private Fraccion coefA, coefB;
	
	public Ecuacion(Fraccion pCoeficienteA, Fraccion pCoeficienteB) throws EcuacionNoLinealException{
		if(pCoeficienteA.getNumerador()==0) {
			throw(new EcuacionNoLinealException());
		}
		this.coefA = pCoeficienteA;
		this.coefB = pCoeficienteB;
	}
	
	 public Fraccion resolver()throws DenominadorCeroException{
		 int num = -this.coefB.getNumerador()*this.coefA.getDenominador();
		 int den = this.coefB.getDenominador()*this.coefA.getNumerador();
		 Fraccion sol = new Fraccion(num, den);
		 return sol;
	 }

}
