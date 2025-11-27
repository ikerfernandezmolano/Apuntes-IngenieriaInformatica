package org.eda.edap1;

public class PruebaConP1 {
	
	public static void main(String[] args) {
		ListaWebs lista = new ListaWebs();
		lista.cargarLista("datuak-2024-2025/index-2024-25");
		lista.cargarSalientes("datuak-2024-2025/pld-arcs-1-N-2024-25");
		lista.imprimir();
	}
}