package org.pmoo.packlaboratorio6;

public abstract class Complementos extends ConceptoImpuestos{
	
	
	protected Complementos(double pImporteBruto) {
		super(pImporteBruto);
	}
	
	protected abstract double getImpuesto();

	public double calcularCantidadNeta() {
		return super.calcularCantidadNeta()-this.getImpuesto();
	}
}


