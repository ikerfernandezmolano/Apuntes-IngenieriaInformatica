package org.pmoo.parcial2023;

public class Main {
	public static void main(String[] args){
		try {
			Calculadora.getCalculadora().resolverEcuacion();
		}
		catch(ImposibleResolverEcuacionException iree) {
			System.out.println("Esta ecuacion es imposible de resolver");
		}
	}
}
