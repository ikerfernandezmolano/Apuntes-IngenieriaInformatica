package org.pmoo.parcial2023;

public class Calculadora {
	private static Calculadora miCalcu=new Calculadora();
	
	private Calculadora() {
	}
	
	public static Calculadora getCalculadora() {
		return miCalcu;
	}
	
	public void resolverEcuacion() throws ImposibleResolverEcuacionException{
		Fraccion a, b, x;
		Ecuacion ecuacion;
		boolean terminar=false;
		int intentos=4;
		while(!terminar&&intentos>0) {
			try {
				Teclado t = Teclado.getTeclado();
				a = t.leerFraccion("Introduce el coeficiente a:");
				b = t.leerFraccion("Introduce el coeficiente b:");
				ecuacion = new Ecuacion(a, b);
				x = ecuacion.resolver();
				System.out.println("La soluci�n de la ecuaci�n es: ");
				x.imprimir();
			}
			catch(DenominadorCeroException dce) {
				intentos--;
			}
			catch(EcuacionNoLinealException enle) {
				System.out.println("La ecuacion no es lineal.");
				terminar=true;
			}
		}
		if(intentos<=0) {
			throw(new ImposibleResolverEcuacionException());
		}
	}
}
