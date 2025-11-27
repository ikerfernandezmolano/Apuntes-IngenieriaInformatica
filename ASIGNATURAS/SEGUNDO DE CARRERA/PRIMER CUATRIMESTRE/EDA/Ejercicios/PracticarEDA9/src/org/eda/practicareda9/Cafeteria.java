package org.eda.practicareda9;
import java.util.LinkedList;
import java.util.Queue;

public class Cafeteria {
	Queue<Queue<Integer>> cola=new LinkedList<Queue<Integer>>();
	
	public void insertar(Integer elem) {
		Queue<Integer> colaGrupo=null;
		if(cola.isEmpty()) {
			colaGrupo=new LinkedList<Integer>();
			colaGrupo.add(elem);
			cola.add(colaGrupo);
		} else {
			boolean enc=false;
			colaGrupo=cola.remove();
			Integer primerElem=colaGrupo.peek();
			if(mismoGrupo(elem,primerElem)) {
				colaGrupo.add(elem);
				enc=true;
			}
			cola.add(colaGrupo);
			while(!cola.peek().peek().equals(primerElem)) {
				colaGrupo=cola.remove();
				if(mismoGrupo(elem,colaGrupo.peek())) {
					colaGrupo.add(elem);
					enc=true;
				}
				cola.add(colaGrupo);
			}
			if(!enc) {
				colaGrupo=new LinkedList<Integer>();
				colaGrupo.add(elem);
				cola.add(colaGrupo);
			}
		}
	}
	public Integer borrar() {
		Queue<Integer> colaGrupo=cola.remove();
		Integer elem=colaGrupo.remove();
		Integer elemPrimer=colaGrupo.peek();
		if(!colaGrupo.isEmpty()) cola.add(colaGrupo);
		else if(colaGrupo.isEmpty()&&cola.isEmpty()){
			colaGrupo=cola.remove();
			elemPrimer=colaGrupo.peek();
			cola.add(colaGrupo);
		}

		while(!cola.peek().peek().equals(elemPrimer)&&cola.isEmpty()) {
			colaGrupo=cola.remove();
			cola.add(colaGrupo);
		}
		return elem;
	}
	public boolean mismoGrupo(int p1, int p2) {
		boolean mismo=false;
		if((p1==1||p1==5||p1==7)&&(p2==1||p2==5||p2==7)) {
			mismo=true;
		} else if((p1==2||p1==4||p1==8||p1==10)&&(p2==2||p2==4||p2==8||p2==10)) {
			mismo=true;
		} else if((p1==3||p1==6||p1==11)&&(p2==3||p2==6||p2==11)) {
			mismo=true;
		} 
		return mismo;
	}
	
	public void print() {
		int grupo=0;
		for(Queue<Integer> lista:cola) {
			System.out.println("\nGrupo "+ ++grupo);
			for(Integer i:lista) {
				System.out.print(i+" > ");
			}
		}
	}
	
	public static void main(String args[]) {
		Cafeteria caf=new Cafeteria();
		caf.insertar(2);
		caf.insertar(6);
		caf.insertar(8);
		caf.insertar(5);
		caf.insertar(4);
		caf.insertar(1);
		caf.insertar(3);
		caf.print();
		caf.borrar();
		caf.print();
		caf.borrar();
		caf.print();
		caf.borrar();
		caf.print();
		caf.insertar(11);
		caf.print();
	}
}
