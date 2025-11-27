package org.eda.practicareda13;

import java.util.HashMap;

public class Prueba {

	public static void main(String args[]) {
		HashMap<String,String> localidades=new HashMap<String,String>();
		localidades.put("Derio", "Bizkaia");
		localidades.put("Bilbo", "Bizkaia");
		localidades.put("Bakio", "Bizkaia");
		localidades.put("Donostia", "Gipuzkoa");
		localidades.put("Gasteiz", "Araba");
		
		BinaryTreeNode<Persona> bt1=new BinaryTreeNode<Persona>(new Persona("Carlos", "Derio"), null, null);
		BinaryTreeNode<Persona> bt2=new BinaryTreeNode<Persona>(new Persona("Gontzal", "Bakio"), null, null);
		BinaryTreeNode<Persona> bt3=new BinaryTreeNode<Persona>(new Persona("Dina", "Bakio"), bt2, null);
		BinaryTreeNode<Persona> bt4=new BinaryTreeNode<Persona>(new Persona("Borja", "Derio"), bt1, bt3);
		BinaryTreeNode<Persona> bt5=new BinaryTreeNode<Persona>(new Persona("Jone", "Bilbo"), null, null);
		BinaryTreeNode<Persona> bt6=new BinaryTreeNode<Persona>(new Persona("Horacio", "Bilbo"), bt5, null);
		BinaryTreeNode<Persona> bt7=new BinaryTreeNode<Persona>(new Persona("Kasto", "Bilbo"), null, null);
		BinaryTreeNode<Persona> bt8=new BinaryTreeNode<Persona>(new Persona("Lupe", "Gasteiz"), null, null);
		BinaryTreeNode<Persona> bt9=new BinaryTreeNode<Persona>(new Persona("Ines", "Bilbo"), bt7, bt8);
		BinaryTreeNode<Persona> bt10=new BinaryTreeNode<Persona>(new Persona("Fermin", "Donostia"), bt6, bt9);
		BinaryTreeNode<Persona> bt11=new BinaryTreeNode<Persona>(new Persona("Elene", "Bilbo"), bt10, null);
		BinaryTreeNode<Persona> bt12=new BinaryTreeNode<Persona>(new Persona("Ane", "Derio"), bt4, bt11);
		
		ArbolGenealogico ag=new ArbolGenealogico(bt12);
		
		ag.print();
		
		System.out.println(ag.esVizcainoPuraCepa("Ane", localidades));
		
	}
}
