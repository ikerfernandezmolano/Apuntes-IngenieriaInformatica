package org.pmoo.parcial2023;

import java.util.Scanner;

public class Teclado {
	private static Teclado miTEC=new Teclado();
	private Scanner sc;
	
	private Teclado() {
		sc=new Scanner(System.in);
	}
	
	public static Teclado getTeclado() {
		return miTEC;
	}
	
	public Fraccion leerFraccion(String pMensajeDeCortesia)throws DenominadorCeroException{ 
		boolean hecho=false;
		int num, den;
		Fraccion frac=null;
		do {
			try {
				System.out.println(pMensajeDeCortesia);
				num = this.leerEntero("Introduce el numerador: ");
			    den = this.leerEntero("Introduce el denominador: ");
				frac = new Fraccion(num, den);
				hecho=true;
			}
			catch(NumberFormatException e) {
				System.out.println("El valor introducido no es el esperado");
			}
		}while(!hecho);
		return frac;
	}
	
	private int leerEntero(String pMensajeDeCortesia){ 
		System.out.println(pMensajeDeCortesia);
		String entrada = sc.nextLine();
		int entero = Integer.parseInt(entrada);
		return entero;
	}
}
