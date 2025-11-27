package org.pmoo.packlaboratorio6;

public class ConceptoExtra extends ConceptoImpuestos{
	private int horasExtra;
	private double precioACobrarHora;
	private String justTrabajo;
	
	public ConceptoExtra(int pHorasExtra,double pImporteBruto, double pPrecioPorHora,String pJustTrab) {
		super(pImporteBruto,0.90);
		this.horasExtra=pHorasExtra;
		this.precioACobrarHora=pPrecioPorHora;
		this.justTrabajo=pJustTrab;
	}

	@Override
	public double calcularCantidadNeta() {
		return super.calcularCantidadNeta()+(this.horasExtra*this.precioACobrarHora);
	}
}
