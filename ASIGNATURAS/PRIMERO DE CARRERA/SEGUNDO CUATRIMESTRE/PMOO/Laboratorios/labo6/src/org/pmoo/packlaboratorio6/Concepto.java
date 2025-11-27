package org.pmoo.packlaboratorio6;

public abstract class Concepto {
	private double importeBruto;
	
	protected Concepto(double pImporteBruto) {
		this.importeBruto=pImporteBruto;
	}
	
	public abstract double calcularCantidadNeta();

	protected double getImporteBruto() {
		return importeBruto;
	}
}
