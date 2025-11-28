package org.pmoo.packproyecto;
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
	
	public String leerString() {
		return sc.next();
	}
	
	public int leerNumero() {
		int num=0;
		boolean seguir=true;
		do {
			try {
				seguir=false;
				num=sc.nextInt();
			}
			catch(Exception e) {
				sc.next();
				seguir=true;
			}
		}while(seguir);
		return num;
	}
	
	public int leerNumero(int pMax) {
		int num=0;
		boolean seguir=true;
		do {
			try {
				seguir=false;
				num=sc.nextInt();
				while(num>pMax||num<0) {
					System.out.println("ERROR: Su respuesta no es el esperada.");
					num=sc.nextInt();
				}
			}
			catch(Exception e) {
				sc.next();
				seguir=true;
			}
		} while(seguir);
		return num;
	} 
	
	public boolean leerSiNo() {
		boolean sino=false;
		boolean hecho=false;
		String respuesta;
		while(!hecho) {
			respuesta=sc.next().toLowerCase();
			if(respuesta.equals("sí") || respuesta.equals("si")) {
				sino=true;
				hecho=true;
			}
			else if(respuesta.equals("no")){
				sino=false;
				hecho=true;
			}
			else {
				System.out.println("ERROR: Su respuesta no es la esperada");
			}
		}
		return sino;
	}
}