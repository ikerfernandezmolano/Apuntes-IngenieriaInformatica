package org.pmoo.packlaboratorio6;

public class SueldoBase extends ConceptoImpuestos {
	private int id;
	
	public SueldoBase(int pId,double pImporteBruto) {
		super(pImporteBruto);
		this.id=pId;
	}

	@Override
	public double calcularCantidadNeta() {
		// TODO Auto-generated method stub
		return 0;
	}
}
