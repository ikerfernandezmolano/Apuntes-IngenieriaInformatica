package main;
import model.GestorSemaforos;
import viewController.SemaforoCoches;
import viewController.SemaforoPeatones;

public class ProgramaPrincipal {
	public static void main(String[] args) {
		//MODELO//
		GestorSemaforos.getGestorSemaforos();
		//VISTA//
		@SuppressWarnings("unused")
		SemaforoCoches sc = new SemaforoCoches();
		@SuppressWarnings("unused")
		SemaforoPeatones sp = new SemaforoPeatones();
	}
}
