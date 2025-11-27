package org.pmoo.packlaboratorio6;

public abstract class ConceptoImpuestos extends Concepto{
	private double descuento;
	
	protected ConceptoImpuestos(double pImporteBruto) {
		super(pImporteBruto);
		this.descuento=0.95;
	}
	
	protected ConceptoImpuestos(double pImporteBruto, double pDescuento) {
		super(pImporteBruto);
		this.descuento=pDescuento;
	}
	
	public double calcularCantidadNeta() {
		return super.getImporteBruto()*this.descuento;
	}

	protected double getDescuento() {
		return descuento;
	}	
}
