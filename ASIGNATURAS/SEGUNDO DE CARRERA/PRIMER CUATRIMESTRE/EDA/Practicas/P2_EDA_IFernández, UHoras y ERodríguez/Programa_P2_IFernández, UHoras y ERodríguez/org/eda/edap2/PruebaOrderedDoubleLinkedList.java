package org.eda.edap2;

public class PruebaOrderedDoubleLinkedList {	
		
	public static void main(String[] args)  {
		
		System.out.println("-----------------------------------------------------------------------");
		OrderedDoubleLinkedList<Integer> l = new OrderedDoubleLinkedList<Integer>();
		l.add(1);
		l.add(3);
		l.add(6);
		l.add(7);
		l.add(9);
		l.add(0);
		l.add(20);
		l.remove(7);

		l.visualizarNodos();
		System.out.println(" Num elementos: " + l.size());
		
		OrderedDoubleLinkedList<Persona> lvacia = new OrderedDoubleLinkedList<Persona>();
		
		System.out.println("Prueba Find ...............");
		System.out.println("20? " + l.find(20));
		System.out.println("9? " + l.find(9));
		System.out.println("9? " + l.find(9));
		System.out.println("0? " + l.find(0));
		System.out.println("7? " + l.find(7));
		
		System.out.println("-----------------------------------------------------------------------");
		
		l.visualizarNodos();
		OrderedDoubleLinkedList<Integer> lcopia=(OrderedDoubleLinkedList<Integer>)l.clone();
		
		System.out.println(" Resultado, num elementos: " + lcopia.size());
				
		
		System.out.println("\nPrueba clone ...............");
		lcopia.visualizarNodos();
		
		System.out.println("-----------------------------------------------------------------------");
		OrderedDoubleLinkedList<Persona> l2 = new OrderedDoubleLinkedList<Persona>();
		System.out.println("\n");
		l2.add(new Persona("jon", "1111"));
		l2.add(new Persona("ana", "7777"));
		l2.add(new Persona("amaia", "3333"));
		l2.add(new Persona("unai", "8888"));
		l2.add(new Persona("pedro", "2222"));
		l2.add(new Persona("olatz", "5555"));

		l2.remove(new Persona("", "8888"));

		
		l2.visualizarNodos();
		System.out.println(" Num elementos: " + l2.size());
				
		
		System.out.println("Prueba Find ...............");
		System.out.println("2222? " + l2.find(new Persona("", "2222")));
		System.out.println("5555? " + l2.find(new Persona("", "5555")));
		System.out.println("7777? " + l2.find(new Persona("", "7777")));	
		System.out.println("8888? " + l2.find(new Persona("", "8888")));
		System.out.println("7777(lvacia)? " + lvacia.find(new Persona("", "7777")));
		
		System.out.println("-----------------------------------------------------------------------");
		UnorderedDoubleLinkedList<Integer> l1 = new UnorderedDoubleLinkedList<Integer>();
		System.out.println("\n");
		l1.addToRear(5);
		l1.addToRear(2);
		l1.addToRear(4);
		l1.addToRear(7);
		l1.addToRear(1);
		
		l1.visualizarNodos();
		System.out.println(" Num elementos: " + l1.size());
		
		System.out.println("Prueba merge (Dada una lista desordenada)...............");
		l.merge(l1);
		
		System.out.println("\n Resultado, num elementos: "+ l.size());
		l.visualizarNodos();
		
		
		System.out.println("-----------------------------------------------------------------------");
		System.out.println("\n 1.");
		l=new OrderedDoubleLinkedList<Integer>();
		l.add(1);
		l.add(3);
		l.add(6);
		l.add(9);
		l.add(0);
		l.add(20);
		
		l.visualizarNodos();
		
		OrderedDoubleLinkedList<Integer> l3 = new OrderedDoubleLinkedList<Integer>();
		l3.add(3);
		l3.add(5);
		l3.add(6);
		l3.add(4);
		l3.add(1);
		System.out.println(" 2.");
		l3.visualizarNodos();
		System.out.println(" Num elementos: " + l3.size());
		
		System.out.println("Prueba merge (Dada otra lista ordenada)...............");
		l.merge(l3);
		
		System.out.println("\n Resultado, num elementos: "+ l.size());
		l.visualizarNodos();
		
		System.out.println("-----------------------------------------------------------------------");
		System.out.println("\n 1.");
		l2.visualizarNodos();
		OrderedDoubleLinkedList<Persona> l4 = new OrderedDoubleLinkedList<Persona>();
		System.out.println("\n");
		l4.add(new Persona("iker", "8888"));
		l4.add(new Persona("urko", "5474"));
		l4.add(new Persona("eneko", "3945"));
		System.out.println("\n 2.");
		l4.visualizarNodos();
		System.out.println(" Num elementos: " + l4.size());
				
		
		System.out.println("Prueba merge (Con Persona)...............");
		l2.merge(l4);
		System.out.println("\n Resultado, num elementos: "+ l2.size());
		l2.visualizarNodos();
	}
}