package org.eda.practica4;

import java.util.HashMap;

import org.eda.practica2.ListaWebs;
import org.eda.practica2.Web;

public class Prueba {
	
	public static void main(String[] args) {
		
		ListaWebs listaWebs1=new ListaWebs(11);
		Web webA=new Web(1, "A");
		Web webB=new Web(2, "B");
		Web webC=new Web(3, "C");
		Web webD=new Web(4, "D");
		Web webE=new Web(5, "E");
		Web webF=new Web(6, "F");
		Web webI=new Web(7, "I");
		Web webJ=new Web(8, "J");
		Web webK=new Web(9, "K");
		Web webL=new Web(10, "L");
		Web webM=new Web(11, "M");
		
		webB.anadirSaliente(webC);
		webC.anadirSaliente(webB);
		webD.anadirSaliente(webA);
		webD.anadirSaliente(webB);
		webE.anadirSaliente(webB);
		webE.anadirSaliente(webD);
		webE.anadirSaliente(webF);
		webF.anadirSaliente(webB);
		webF.anadirSaliente(webE);
		webI.anadirSaliente(webB);
		webI.anadirSaliente(webE);
		webJ.anadirSaliente(webB);
		webJ.anadirSaliente(webE);
		webK.anadirSaliente(webB);
		webK.anadirSaliente(webE);
		webL.anadirSaliente(webE);
		webM.anadirSaliente(webE);
		
		listaWebs1.anadirWeb(webA);
		listaWebs1.anadirWeb(webB);
		listaWebs1.anadirWeb(webC);
		listaWebs1.anadirWeb(webD);
		listaWebs1.anadirWeb(webE);
		listaWebs1.anadirWeb(webF);
		listaWebs1.anadirWeb(webI);
		listaWebs1.anadirWeb(webJ);
		listaWebs1.anadirWeb(webK);
		listaWebs1.anadirWeb(webL);
		listaWebs1.anadirWeb(webM);
		
		//PRUEBA CON EL GRAFO QUE APARECE DE EJEMPLO EN EL ENUNCIADO
		
		Graph grafo1=new Graph(listaWebs1);
		HashMap<String, Double> res1=grafo1.calcularRandomWalkRank(10000);
		System.out.println("UTILIZANDO EL ALGORITMO RANDOM WALK RANK EN EL GRAFO UTILIZADO COMO EJEMPLO EN EL ENUNCIADO, LOS VALORES OBTENIDOS SON: ");
		grafo1.imprimirLosDeMejorPageRank(res1, 20);
		
		HashMap<String, Double> res2=grafo1.calcularPageRank();
		System.out.println("UTILIZANDO EL ALGORITMO PAGE RANK EN EL GRAFO UTILIZADO COMO EJEMPLO EN EL ENUNCIADO, LOS VALORES OBTENIDOS SON: ");
		grafo1.imprimirLosDeMejorPageRank(res2, 20);
		
		//PRUEBA CON LA LISTA DE WEBS
		
		ListaWebs listaWebs2=new ListaWebs();
		listaWebs2.cargarLista("datuak-2024-2025/index-2024-25");
		listaWebs2.cargarSalientes("datuak-2024-2025/pld-arcs-1-N-2024-25");
		
		Graph grafo2=new Graph(listaWebs2);
		
		HashMap<String, Double> res3=grafo2.calcularRandomWalkRank(10);
		System.out.println("UTILIZANDO EL ALGORITMO RANDOM WALK RANK EN EL GRAFO DE WEBS, LOS VALORES OBTENIDOS SON: ");
		grafo2.imprimirLosDeMejorPageRank(res3, 20);
		
		HashMap<String, Double> res4=grafo2.calcularPageRank();
		System.out.println("UTILIZANDO EL ALGORITMO PAGE RANK EN EL GRAFO DE WEBS, LOS VALORES OBTENIDOS SON: ");
		grafo2.imprimirLosDeMejorPageRank(res4, 20);
		
	}
}
