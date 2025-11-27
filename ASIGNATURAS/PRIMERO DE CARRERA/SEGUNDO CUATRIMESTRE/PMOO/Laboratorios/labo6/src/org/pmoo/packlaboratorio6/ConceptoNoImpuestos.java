package org.pmoo.packlaboratorio6;

public class ConceptoNoImpuestos extends Concepto{
	private String descripcionTrabajo;
	private int horasInvertidas;
	
	public ConceptoNoImpuestos(String pDescTrabajo, int pHorasInvertidas,double pImporteBruto) {
		super(pImporteBruto);
		this.descripcionTrabajo=pDescTrabajo;
		this.horasInvertidas=pHorasInvertidas;
	}

	@Override
	public double calcularCantidadNeta() {
		return super.getImporteBruto()*this.horasInvertidas;
	}
	
	
}
