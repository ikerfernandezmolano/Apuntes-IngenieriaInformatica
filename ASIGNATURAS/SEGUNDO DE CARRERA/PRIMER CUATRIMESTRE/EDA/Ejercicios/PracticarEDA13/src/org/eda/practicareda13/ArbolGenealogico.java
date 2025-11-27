package org.eda.practicareda13;

import java.util.HashMap;

public class ArbolGenealogico {
	BinaryTreeNode<Persona> root;
	
	public ArbolGenealogico(BinaryTreeNode<Persona> aRoot) {
		this.root=aRoot;
	}
	
	public boolean esVizcainoPuraCepa(String nombre, HashMap<String,String> localidades) {
		boolean vizcaino=false;
		BinaryTreeNode<Persona> persona=buscar(root,nombre);
		if(persona!=null) {
			if(localidades.get(persona.data.localidadNacimiento).equals("Bizkaia")) {
				vizcaino=esVizcainoPuraCepa(persona,localidades);
			}
		}
		return vizcaino;
	}
	
	private boolean esVizcainoPuraCepa(BinaryTreeNode<Persona> a,HashMap<String,String> localidades) {
		boolean vizcaino=true;
		if(!localidades.get(a.data.localidadNacimiento).equals("Bizkaia")) vizcaino=false;
		else {
			if(a.left!=null) vizcaino=esVizcainoPuraCepa(a.left,localidades);
			if(a.right!=null&&vizcaino) vizcaino=esVizcainoPuraCepa(a.right,localidades);
		}
		return vizcaino;
	}
	
	private BinaryTreeNode<Persona> buscar(BinaryTreeNode<Persona> a,String nombre){
		BinaryTreeNode<Persona> res=null;
		if(a.data.nombre.equals(nombre)) res=a;
		else {
			if(a.left!=null) res=buscar(a.left,nombre);
			if(a.right!=null&&res==null) res=buscar(a.right,nombre);
		}
		return res;
	}
	
	public void print() {
		print(root);
	}
	
	private void print(BinaryTreeNode<Persona> a) {
		if(a.left!=null) print(a.left); 
		if(a.right!=null) print(a.right);
		System.out.println("Persona: "+a.data.nombre+" Localidad: "+ a.data.localidadNacimiento);
	}
}
