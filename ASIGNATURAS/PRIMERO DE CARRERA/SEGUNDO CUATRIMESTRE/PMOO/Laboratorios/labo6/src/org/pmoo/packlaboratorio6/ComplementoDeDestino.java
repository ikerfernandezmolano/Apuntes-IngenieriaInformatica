package org.pmoo.packlaboratorio6;

public class ComplementoDeDestino extends Complementos{
	private String destinoActual;
	private static double impuesto=50.0;
	
	public ComplementoDeDestino(String pDestinoActual,double pImporteBruto) {
		super(pImporteBruto);
		this.destinoActual=pDestinoActual;
	}

	@Override
	protected double getImpuesto() {
		return impuesto;
	}
}