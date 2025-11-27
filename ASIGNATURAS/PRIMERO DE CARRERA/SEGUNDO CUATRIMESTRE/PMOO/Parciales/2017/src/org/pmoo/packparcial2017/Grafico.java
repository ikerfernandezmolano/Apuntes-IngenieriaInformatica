package org.pmoo.packparcial2017;

public class Grafico {
	private char[][] matrizPuntos;
	
	public Grafico(int pAnchura, int pAltura) {
		this.matrizPuntos = new char[pAltura][pAnchura];
		for (int y=0; y<pAltura; y++) {
			for(int x=0; x<pAnchura; x++) {
				this.matrizPuntos[y][x] = ' ';
			}
		}
	}
	
	public void dibujarPunto(int pX, int pY) throws YOutOfBoundsException, XOutOfBoundsException{
		if(pY>this.matrizPuntos.length || pY<=0){
			throw(new YOutOfBoundsException());
		}
		else if(pX>this.matrizPuntos[0].length || pX<=0){
			throw(new XOutOfBoundsException());
		}
		else{
			this.matrizPuntos[pY][pX] = '*';
		}
	}
	
	public void imprimir(){
		for (int y = matrizPuntos.length-1; y >= 0; y--){
			for(int x = 0; x < matrizPuntos[0].length; x++){
				System.out.print(this.matrizPuntos[y][x]);
			}
			System.out.println();
		}
	}
}
