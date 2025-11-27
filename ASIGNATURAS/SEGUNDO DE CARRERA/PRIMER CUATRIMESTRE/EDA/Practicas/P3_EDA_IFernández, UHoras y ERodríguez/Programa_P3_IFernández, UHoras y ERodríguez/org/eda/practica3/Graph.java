package org.eda.practica3;
import org.eda.practica2.ListaWebs;
import org.eda.practica2.Web;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;

public class Graph {
	
    HashMap<String, ArrayList<String>> enlaces;
    
    public Graph(ListaWebs pLista) {
    	this.enlaces=new HashMap<String,ArrayList<String>>();
    	this.crearGrafo(pLista);
    }
    
	private void crearGrafo(ListaWebs lista){
		// Post: crea el grafo desde la lista de webs
		//       Los nodos son nombres de páginas web		
		for(Web w:lista.getLista()) {
			this.enlaces.put(w.getDireccion(), w.getSalientes());
		}
	}
	
	public void print(){
		for (String web : enlaces.keySet()){
			System.out.print("Element: " + web + " >>> ");
			for (String saliente : enlaces.get(web)) {
				System.out.print(saliente + " ### ");
			}
			System.out.println();
	    }
	}
	
	public boolean estanConectados(String a1, String a2){
		Stopwatch reloj=new Stopwatch();
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
		System.out.println("\nSe han tardado "+String.format("%.4f", reloj.elapsedTime())+" segundos en realizar la llamada al método estanConectados");
		return enc;
	}
	
	public ArrayList<String> estanConectadosCamino(String a1, String a2) {
		Stopwatch reloj=new Stopwatch();
		ArrayList<String> camino=new ArrayList<String>();
		double tiempoEstanConectados=0;
		if(this.estanConectados(a1, a2)) {
			tiempoEstanConectados=reloj.elapsedTime();
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
		System.out.println("Se han tardado "+String.format("%.4f", reloj.elapsedTime()-tiempoEstanConectados)+" segundos en realizar la llamada al método estanConectadosCamino \n");
		return camino;
	}
}
