package org.eda.edap2;

import java.util.Iterator;


public class PruebaDoubleLinkedList {
	
	public static void visualizarNodos(UnorderedDoubleLinkedList<Integer> l) {
		Iterator<Integer> it = l.iterator();
		System.out.println();
		while (it.hasNext()) {
			Integer num = it.next();
			System.out.println(num);
		}
	}
	
	
	public static void main(String[] args)  {
		
		System.out.println("-----------------------------------------------------------------------");
		UnorderedDoubleLinkedList<Integer> l = new UnorderedDoubleLinkedList<Integer>();
		System.out.println("\n");
		l.addToRear(1);
		l.addToRear(3);
		l.addToRear(6);
		l.addToRear(7);
		l.addToRear(9);
		l.addAfter(0, 9);
		l.addToRear(20);
		l.addToFront(8);
		l.remove(7);
		
		UnorderedDoubleLinkedList<Integer> lvacia = new UnorderedDoubleLinkedList<Integer>();
		
		l.visualizarNodos();
		System.out.println("Num elementos: " + l.size());
		
		System.out.println("\n Prueba Find ...............");
		System.out.println("9? " + l.find(9));
		System.out.println("0? " + l.find(0));
		System.out.println("20? " + l.find(20));
		System.out.println("8? " + l.find(8));
		System.out.println("7? " + l.find(7));
		System.out.println("1(lvacia)? " + lvacia.find(1));
		
		System.out.println("\n Prueba contains ...............");
		System.out.println("7? " + l.contains(7));
		System.out.println("0? " + l.contains(0));
		System.out.println("8? " + l.contains(8));
		System.out.println("9? " + l.contains(9));
		System.out.println("1(lvacia)? " + lvacia.contains(1));
		
		System.out.println("-----------------------------------------------------------------------");
		
		l.visualizarNodos();
		UnorderedDoubleLinkedList<Integer> lcopia=(UnorderedDoubleLinkedList<Integer>)l.clone();
		
		System.out.println(" Resultado, num elementos: " + lcopia.size());
				
		
		System.out.println("\nPrueba clone ...............");
		lcopia.visualizarNodos();
		
		System.out.println("\n-----------------------------------------------------------------------");
		UnorderedDoubleLinkedList<Integer> l1 = new UnorderedDoubleLinkedList<Integer>();
		System.out.println("\n");
		l1.addToFront(3);
		l1.addToFront(7);
		l1.addToFront(4);
		l1.addToFront(1);
		l1.addToFront(5);
		
		l1.visualizarNodos();
		System.out.println("Num elementos: " + l1.size());
		
		System.out.println("\n Prueba removeFirst ...............");
		System.out.println("5? " + l1.removeFirst());
		System.out.println("null(lvacia)? " + lvacia.removeFirst());
		l1.addToFront(5);
		
		System.out.println("\n Prueba removeLast ...............");
		System.out.println("3? " + l1.removeLast());
		System.out.println("null(lvacia)? " + lvacia.removeLast());
		l1.addToRear(3);
		
		System.out.println("\n Prueba remove ...............");
		System.out.println("4? " + l1.remove(4));
		System.out.println("5? " + l1.remove(5));
		System.out.println("3? " + l1.remove(3));
		System.out.println("33? " + lvacia.remove(33));
		System.out.println("1(lvacia)? " + lvacia.remove(1));
		
		
		System.out.println("\n-----------------------------------------------------------------------");
		UnorderedDoubleLinkedList<Integer> l2 = new UnorderedDoubleLinkedList<Integer>();
		System.out.println("\n");
		l2.addToFront(3);
		l2.addToFront(3);
		l2.addToFront(4);
		l2.addToFront(3);
		l2.addToFront(5);
		
		l2.visualizarNodos();
		System.out.println("Num elementos: " + l2.size());
		System.out.println("Num elementos(lvacia): " + lvacia.size());
		
		System.out.println("\n Prueba removeAll ...............");
		l2.removeAll(3);
		System.out.println("\nNueva lista, num elementos: "+ l2.size()+"\n");
		l2.visualizarNodos();
		
		lvacia.removeAll(3);
		System.out.println("\nNueva lista (lvacia), num elementos: "+ lvacia.size()+"\n");
		lvacia.visualizarNodos();

	}
}