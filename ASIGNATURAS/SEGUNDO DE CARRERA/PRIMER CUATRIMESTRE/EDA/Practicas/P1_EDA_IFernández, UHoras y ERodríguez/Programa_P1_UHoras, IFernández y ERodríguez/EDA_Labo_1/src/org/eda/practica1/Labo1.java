package org.eda.practica1;

public class Labo1 {
	
	public static void main(String[] args) {
		ListaWebs lista = new ListaWebs();
		lista.cargarLista();
		lista.cargarSalientes();
		lista.cargarPalabraClave();
		lista.cargarListaEnFicheros();
		lista.ordenarWebs();
		lista.imprimir();
	}
}
