public class Entregable {

	private String enunciado;
	private String respUrl;
	private double nota;
	
	public Entregable(String pEnunciado)
	{
		enunciado = pEnunciado;
	}
	
	public void setNota(double pNota)
	{
		nota = pNota;
	}
	
	public void setRespuestaUrl(String pRespUrl)
	{
		respUrl = pRespUrl;
	}
	
	public double getNota()
	{
		return nota;
	}
	
	
}
