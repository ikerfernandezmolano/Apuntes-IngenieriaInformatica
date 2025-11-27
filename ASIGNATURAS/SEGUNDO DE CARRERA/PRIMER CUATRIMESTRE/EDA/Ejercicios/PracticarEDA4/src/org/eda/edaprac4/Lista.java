package org.eda.edaprac4;

public class Lista {

	   Nodo first;
	   
	   public Lista(){
		   Nodo n1 = new Nodo();
		   Nodo n2 = new Nodo();
		   Nodo n3 = new Nodo();
		   
		   Persona p1 = new Persona("111");
		   Persona p2 = new Persona("555");
		   Persona p3 = new Persona("888");
		   
		   // p1 y p2 son amigos
		   p1.amigos[5] = p2;
		   p2.amigos[3] = p1;
		   
		   // p3 y p2 son amigos
		   p3.amigos[9] = p2;
		   p2.amigos[1] = p3;
		   
		   n1.info = p1;
		   n2.info = p2;
		   n3.info = p3;
		   first = n1;
		   n1.next = n2;
		   n2.next = n3;
	   }

	   public void eliminar(String id){
	   // Precondicion: â€œidâ€? corresponde a un elemento de la lista
	   // Postcondicion: se ha eliminado el elemento de la lista 
	   //                correspondiente a â€œidâ€?.
	   //                TambiÃ©n se han borrado (puesto a null) las referencias 
	   //                de los amigos que apuntaban a  â€œidâ€?
		   
		   Nodo actual = first;
		   Nodo anterior = null;
		   boolean enc=false;
		   while(actual!=null&&!enc) {
			   if(actual.info.id.equals(id)) {
				   enc=true;
				   if(actual==this.first) {
					   actual=actual.next;
					   this.first.next=null;
					   this.first=actual;
				   } else anterior.next=actual.next;
			   } else {
				   anterior=actual;
				   actual=actual.next;
			   }
		   }
		   actual=this.first;
		   while(actual!=null) {
			   boolean borrado=false;
			   int i=0;
			   while(!borrado&&i<actual.info.amigos.length) {
				   if(actual.info.amigos[i]!=null&&actual.info.amigos[i].id.equals(id)) {
					   actual.info.amigos[i]=null;
					   borrado=true;
				   } else i++;
			   }
			   actual=actual.next;
		   }
	   }
	   
	   public void print(){
		   Nodo act = first;

		   while (act != null){
			   System.out.print(act.info.id);
			   System.out.print( " Amigos: ");
			   for (Persona p: act.info.amigos) if (p != null) System.out.print(p.id + " ");
			   System.out.println();
			   act = act.next;
		   }
	   }
	
	public static void main(String[] args) {


		Lista l = new Lista();
		
		System.out.println("Lista original: ");
		l.print();
		
		l.eliminar("888");
		System.out.println("\nDespues de llamar a eliminar(555): ");
		l.print();
		
		
	}

}
