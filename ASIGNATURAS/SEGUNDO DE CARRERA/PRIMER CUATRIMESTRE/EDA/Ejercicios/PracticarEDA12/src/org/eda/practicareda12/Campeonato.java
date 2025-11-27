package org.eda.practicareda12;

public class Campeonato {
	private Nodo root;
	
	public Campeonato(Nodo pRoot) {
		this.root=pRoot;
	}
	
	public String campeon() {
		return this.campeon(this.root);
	}
	
	private String campeon(Nodo a) {
		String campeon=null;
		
		if(a.info.golesDer==-1 && a.info.golesIzq==-1) campeon=a.info.ganador;
		
		else {
			if(a.info.golesIzq>a.info.golesDer) {
				campeon=campeon(a.izq);
				campeon(a.der);
			} else {
				campeon=campeon(a.der);
				campeon(a.izq);
			}	
			a.info.ganador=campeon;
		}
		
		return campeon;
	}
	
	public void print() {
		print(root);
	}
	
	private void print(Nodo a) {
		if(a.izq!=null&&a.der!=null) {
			print(a.izq);
			print(a.der);
		}
		System.out.println("Marcador: "+a.info.golesIzq+" - "+a.info.golesDer+" Ganador: "+ a.info.ganador);
	}
}
