package org.eda.practicareda15;

public class Prueba {

	public static void main(String args[]) {
		
		Persona p1= new Persona("Pedro", 20);
		Persona p2= new Persona("Jon", 30);
		Persona p3= new Persona("Amaia", 7);
		Persona p4= new Persona("Xabi", 44);
		Persona p5= new Persona("Iker", 77);
		Persona p6= new Persona("Markel", 43);
		Persona p7= new Persona("Jorge", 31);
		Persona p8= new Persona("Santi", 12);
		Persona p9= new Persona("Bego", 68);
		Persona p10= new Persona("Kepa", 37);
		Persona p11= new Persona("Juan", 63);
		Persona p12= new Persona("Sara", 29);
		Persona p13= new Persona("Gorka", 25);
		Persona p14= new Persona("Joseba", 4);
		Persona p15= new Persona("Pilar", 55);
		Persona p16= new Persona("Luisa", 45);
		Persona p17= new Persona("Aurora", 12);
		Persona p18= new Persona("Ana", 32);
		Persona p19= new Persona("Ander", 65);
		Persona p20= new Persona("Luis", 14);
		Persona p21= new Persona("Oscar", 33);
		
		Persona[] vertices= new Persona[21];
		vertices[0]=p1;
		vertices[1]=p2;
		vertices[2]=p3;
		vertices[3]=p4;
		vertices[4]=p5;
		vertices[5]=p6;
		vertices[6]=p7;
		vertices[7]=p8;
		vertices[8]=p9;
		vertices[9]=p10;
		vertices[10]=p11;
		vertices[11]=p12;
		vertices[12]=p13;
		vertices[13]=p14;
		vertices[14]=p15;
		vertices[15]=p16;
		vertices[16]=p17;
		vertices[17]=p18;
		vertices[18]=p19;
		vertices[19]=p20;
		vertices[20]=p21;
		
		Grafo g=new Grafo(vertices);
		
		g.crearAdjMatrix(1, 2);
		g.crearAdjMatrix(1, 3);
		g.crearAdjMatrix(1, 4);
		g.crearAdjMatrix(1, 5);
		g.crearAdjMatrix(3, 4);
		g.crearAdjMatrix(3, 6);
		g.crearAdjMatrix(4, 5);
		g.crearAdjMatrix(4, 7);
		g.crearAdjMatrix(4, 8);
		g.crearAdjMatrix(5, 9);
		g.crearAdjMatrix(5, 10);
		g.crearAdjMatrix(6, 13);
		g.crearAdjMatrix(7, 14);
		g.crearAdjMatrix(8, 15);
		g.crearAdjMatrix(10, 11);
		g.crearAdjMatrix(10, 12);
		g.crearAdjMatrix(11, 18);
		g.crearAdjMatrix(11, 19);
		g.crearAdjMatrix(18, 19);
		g.crearAdjMatrix(14, 16);
		g.crearAdjMatrix(14, 17);
		g.crearAdjMatrix(13, 20);
		g.crearAdjMatrix(20, 21);
		
		for(int i=1;i<vertices.length+1;i++) g.crearAdjMatrix(i, i);
		
		for(Persona p:g.cercanas("Pedro", 18, 2)) {
			System.out.println(p.nombre+ " "+p.edad);
		}
	}
	
}
