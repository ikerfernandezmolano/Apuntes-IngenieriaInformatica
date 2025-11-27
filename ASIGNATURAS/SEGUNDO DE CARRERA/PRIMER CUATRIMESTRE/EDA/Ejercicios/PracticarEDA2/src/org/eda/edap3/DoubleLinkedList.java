package org.eda.edap3;

public class DoubleLinkedList {
    // Lista doblemente enlazada
    DoubleNode first; // no se pueden añadir atributos

    public void obtenerLista(ListaDePersonas l){
        Node compActual=null;
        DoubleNode actual=null;
        
        for(int i=0; i<l.personas.length;i++) {
        	DoubleNode nuevo=new DoubleNode(l.personas[i]);
        	for(int j=0;j<l.compras[i].length;j++) {
        		Node nuevaComp= new Node(l.compras[i][j]);
        		if(nuevo.listaCompras==null) {
        			nuevo.listaCompras=nuevaComp;
        			nuevaComp.next=nuevaComp;
        			compActual=nuevaComp;
        		}
        		else {
        			compActual.next=nuevaComp;
        			compActual=compActual.next;
        			compActual.next=nuevo.listaCompras;
        		}
        	}
        	if(this.first==null) {
        		this.first=nuevo;
        		actual=this.first;
        	}
        	else {
        		actual.next=nuevo;
        		nuevo.prev=actual;
        		actual=actual.next;
        	}
        }      
    }

    public void print() {
        DoubleNode act = this.first;
        while (act != null) {
            System.out.print(act.data + ": ");
            Node actC = act.listaCompras;
            if (actC != null) {
                while (actC.next != act.listaCompras) {
                    System.out.print(actC.data + ", ");
                    actC = actC.next;
                }
                System.out.println(actC.data);
            }
            act = act.next;
        }
    }

    public static void main(String[] args) {
        DoubleLinkedList lista = new DoubleLinkedList();
        ListaDePersonas lp = new ListaDePersonas();
        lista.obtenerLista(lp);
        lista.print();

    }
}
