package org.eda.practica4;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Random;



import org.eda.practica2.*;

public class Graph {
	
    HashMap<String, ArrayList<String>> enlaces;
      
    public Graph(ListaWebs lista) {
    	  this.enlaces=new HashMap<String,ArrayList<String>>();
    	  this.crearGrafo(lista);
    }

    private void crearGrafo(ListaWebs lista){
		// Post: crea el grafo desde la lista de webs
		//       Los nodos son nombres de p�ginas web		
    	for(Web w:lista.getLista()) {
  			this.enlaces.put(w.getDireccion(), w.getSalientes());
  		}
	}
	
	public void print(){
	   for (String web : enlaces.keySet()){
		System.out.print("Element: " + web + " >>> ");
		for (String saliente : enlaces.get(web))  System.out.print(saliente + " ### ");
		System.out.println();
	   }
	}
	
	public boolean estanConectados(String a1, String a2){
		boolean enc = false;
		if(!this.enlaces.isEmpty()) {
			Queue<String> porExaminar = new LinkedList<String>();
			HashSet<String> examinados = new HashSet<String>();
			porExaminar.add(a1);
			examinados.add(a1);
			String actual=null;
			while(!enc && !porExaminar.isEmpty()) {
				actual=porExaminar.remove();
				if(actual.equals(a2)) enc=true;
				else for(String saliente:this.enlaces.get(actual)) {
						if(!examinados.contains(saliente)) {
							examinados.add(saliente);
							porExaminar.add(saliente);
						}
					}
			}
		}
		return enc;
	}
	
	public ArrayList<String> estanConectadosCamino(String a1, String a2) {
		ArrayList<String> camino=new ArrayList<String>();
		if(this.estanConectados(a1, a2)) {
			HashMap<String,String> deDonde=new HashMap<String,String>();
			Queue<String> porExaminar=new LinkedList<String>();
			boolean enc=false;
			deDonde.put(a1, null);
			porExaminar.add(a1);
			String actual=null;
			while(!enc&&!porExaminar.isEmpty()) {
				actual=porExaminar.remove();
				if(actual.equals(a2)) enc=true;
				else for(String saliente:this.enlaces.get(actual)) {
						if(!deDonde.containsKey(saliente)) {
							deDonde.put(saliente, actual);
							porExaminar.add(saliente);
						}
				}
			}
			String aux=a2;
			while(aux!=null) {
				camino.add(0, aux);
				aux=deDonde.get(aux);
			}
		}
		return camino;
	}
	
    public HashMap<String, Double> calcularRandomWalkRank(int nTests) {
    	
    	Stopwatch reloj=new Stopwatch();
    	
    	double d = 0.85; // damping factor
    	Random r = new Random();
    	String[] webs=this.enlaces.keySet().toArray(new String[0]);
    	HashMap<String,Double> resultado = new HashMap<String,Double>();
		
		for (String web : webs) {
	        resultado.put(web, 0.0);
	    }
		int numElem=0;
	
		for(int i=0;i<nTests;i++) {
			HashSet<String> examinados=new HashSet<String>();
			int x=r.nextInt(webs.length);
			String web=webs[x];
			examinados.add(web);
			boolean parar=false;
			numElem++;
			
			while(!parar) {
				double y=r.nextDouble();
				if(y<=d) {
					if(!this.enlaces.get(web).isEmpty()) {
						x=r.nextInt(this.enlaces.get(web).size());
						web=this.enlaces.get(web).get(x);
						if(examinados.contains(web)) parar=true;
						else {
							numElem++;
							examinados.add(web);
						}
					}
				} else parar=true;
			}
			for(String w:examinados) resultado.put(w, resultado.get(w)+1.0);
		}
		
		for(String w:resultado.keySet()) resultado.put(w, resultado.get(w)/numElem);
		
		double tiempo=reloj.elapsedTime();
		System.out.println("\nEL M�TODO calcularRandomWalkRank HA TARDADO "+String.format("%.4f", tiempo)+" SEGUNDOS EN EJECUTARSE");
		
		return resultado;
   }     
       
   public HashMap<String, Double> calcularPageRank() {
	   
	    Stopwatch reloj=new Stopwatch();
	    
		double d = 0.85; // damping factor
		double valorDamping=(1-d)/this.enlaces.size(); //(1-d)/N
		HashMap<String,Double> iteracionAnterior= new HashMap<String,Double>();
		HashMap<String,Double> resultado= new HashMap<String,Double>();

		for(String web:this.enlaces.keySet()) {
			iteracionAnterior.put(web, 1.0/this.enlaces.size());
			resultado.put(web, 0.0);
		}
		double sumatorioIteracion=1.0;
		while(sumatorioIteracion>0.0001) {
			sumatorioIteracion=0.0;
			for(String web:this.enlaces.keySet()) {
				double contribucion=iteracionAnterior.get(web)/this.enlaces.get(web).size();
				for(String saliente:this.enlaces.get(web)) {
					resultado.put(saliente,resultado.get(saliente)+contribucion);
				}
			}
			for(String w:resultado.keySet()) {
				resultado.put(w, valorDamping+d*resultado.get(w));
				sumatorioIteracion+=Math.abs(iteracionAnterior.get(w)-resultado.get(w));
			}
			if(sumatorioIteracion>0.0001) {
				for(String web:resultado.keySet()) {
					iteracionAnterior.put(web, resultado.get(web));
					resultado.put(web, 0.0);
				}
			}
		}
		double tiempo=reloj.elapsedTime();
		System.out.println("\nEL M�TODO calcularPageRank HA TARDADO "+String.format("%.4f", tiempo)+" SEGUNDOS EN EJECUTARSE");
		return resultado;
   }
   
   public void imprimirLosDeMejorPageRank(HashMap<String, Double> pMapa, int n) {
       // Usamos una cola de prioridad para mantener los n elementos de mayor valor
       PriorityQueue<Map.Entry<String, Double>> pq = new PriorityQueue<>(
               Comparator.comparingDouble(Map.Entry::getValue)); 

       for (Map.Entry<String, Double> entry : pMapa.entrySet()) {
           if (pq.size() < n) {
               pq.add(entry);
           } else if (entry.getValue() > pq.peek().getValue()) {
               pq.poll();
               pq.add(entry);
           }
       }

       // Convertimos la cola de prioridad a una lista y la ordenamos en orden descendente
       List<Map.Entry<String, Double>> result = new ArrayList<>(pq);
       result.sort((e1, e2) -> Double.compare(e2.getValue(), e1.getValue()));

       // Imprimimos los n elementos de mayor valor
       int i=0;
       for (Map.Entry<String, Double> entry : result) {
           System.out.println("La web en la posici�n de importancia "+ ++i+" es: " + entry.getKey() + ", con un valor de: " + String.format("%.6f", entry.getValue()));
       }
   }
}

