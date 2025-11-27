package org.pmoo.packparcial2017;

public abstract class Funcion 
{
	public abstract int f(int pX);
	
	public void dibujar(int pAncho, int pAlto, int pIntentos) {
		if(pIntentos>0) {
			int x=0;
			Grafico graf = new Grafico(pAncho, pAlto);
			try {
				do {
					try {
						graf.dibujarPunto(x, f(x));
					}
					catch(XOutOfBoundsException xoobe) {}
					x++;
				}while(pAncho>x);
				graf.imprimir();
			}
			catch(ArithmeticException e) {
				System.out.println("ERROR algún cálculo ha fallado");
			}
			catch(YOutOfBoundsException yoobe) {
				dibujar(pAncho, pAlto+10, pIntentos-1);
			}
		}
		else {
			System.out.println("ERROR algún punto está fuera de rango");
		}
	}
}