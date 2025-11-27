package org.pmoo.packlaboratorio6;

public class ComplementoAntiguedad extends Complementos{
	private int numAnos;
	private static double impuesto=10.0;
	
	public ComplementoAntiguedad(int pNumAnos,double pImporteBruto) {
		super(pImporteBruto);
		this.numAnos=pNumAnos;
	}
	
	@Override
	public double calcularCantidadNeta() {
		return super.calcularCantidadNeta();
	}

	@Override
	protected double getImpuesto() {
		// TODO Auto-generated method stub
		return 0;
	}
}