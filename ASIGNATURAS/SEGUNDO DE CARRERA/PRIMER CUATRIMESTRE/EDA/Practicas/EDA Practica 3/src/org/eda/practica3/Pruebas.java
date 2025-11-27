package org.eda.practica3;

import java.util.ArrayList;

import org.eda.practica2.ListaWebs;

public class Pruebas {
	
	public static void main(String[] args) {
		
		Stopwatch reloj=new Stopwatch();
		ListaWebs listaWebs=new ListaWebs();
		listaWebs.cargarLista("datuak-2024-2025/index-2024-25");
		listaWebs.cargarSalientes("datuak-2024-2025/pld-arcs-1-N-2024-25");
		double tiempoCarga=reloj.elapsedTime();
		System.out.println("Se han tardado "+String.format("%.4f", tiempoCarga)+" segundos en cargar la lista de webs y cargar los salientes de cada una");
		
		Graph grafo=new Graph(listaWebs);
		grafo.print();
		tiempoCarga=reloj.elapsedTime();
		
		boolean estan=grafo.estanConectados("0-00.pl","dziennikustaw.gov.pl");
		System.out.println("¿Están 0-00.pl y dziennikustaw.gov.pl conectados? "+ estan);
		
		ArrayList<String>a=grafo.estanConectadosCamino("0-00.pl","dziennikustaw.gov.pl");
		System.out.println("El camino recorrido es : ");
		for(String str:a) System.out.print(str+" > "+"");
		
		System.out.println();
		double tiempoConectados=reloj.elapsedTime()-tiempoCarga;
		System.out.println("\nSe han tardado "+String.format("%.4f", tiempoConectados)+" segundos en saber si están conectados y en calcular el camino");
	}
}
