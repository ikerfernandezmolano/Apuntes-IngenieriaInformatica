package org.pmoo.packlaboratorio6;

public class ComplementoDeCargo extends Complementos{
	private String descripcion;
	private static double impuesto=20.0;
	
	public ComplementoDeCargo(double pImporteBruto) {
		super(pImporteBruto);
	}
	
	@Override
	public double calcularCantidadNeta() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	protected double getImpuesto() {
		// TODO Auto-generated method stub
		return 0;
	}
}
