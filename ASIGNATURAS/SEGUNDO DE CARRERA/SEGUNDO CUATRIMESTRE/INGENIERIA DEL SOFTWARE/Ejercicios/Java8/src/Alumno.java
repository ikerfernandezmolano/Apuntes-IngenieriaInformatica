import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Alumno {

	private String nombre;
	private String apellido;
	private String mail;
	private double notaExamen;
	private String pais;
	private List<Entregable> lEntregables = new ArrayList<Entregable>() ;

	public Alumno(String pNombre, String pApellido, String pMail,  String pPais)
	{
		nombre = pNombre;
		apellido = pApellido;
		mail = pMail;
		pais = pPais;
		
	}
	/////GETTERS/////////////////////////
	public String getNombre()
	{
		return nombre;
	}
	public String getApellido()
	{
		return apellido;
	}
	
	public String getPais()
	{
		return pais;
	}
	
	///////////////////
	
	public void setNotaExamen(double pNotaExamen)
	{
		notaExamen = pNotaExamen;
	}
	
	public void addEntregable(Entregable pEnt)
	{
		lEntregables.add(pEnt);
	}
	
	public boolean haSuspendido() {
		return calcularNotaFinalJava8()<5;
	}
	
	public String toString()
	{
		return "nombre: " + nombre + " " + apellido + ", mail:" + mail; 
	}
	
	////////////////////////////JAVA7////////////////////////////////
	private Iterator<Entregable> obtIterador()
	{
		return lEntregables.iterator();
	}
	
	public double calcularNotaEntregables()
	{
		double nota = 0;

		Iterator<Entregable> it = obtIterador();
		while(it.hasNext())
		{
			nota = nota + it.next().getNota();
		}
		return nota;
	}
	
	public double calcularNotaFinal()
	{
		double notaFinal = 0;

		notaFinal = calcularNotaEntregables()/lEntregables.size();
		notaFinal = notaFinal*0.6 + notaExamen*0.4;

		return notaFinal;
	}
	
	////////////////////////////JAVA8////////////////////////////////
	public double calcularNotaFinalJava8()
	{
		return calcularNotaEntregablesJava8()*0.6+notaExamen*0.4;
	}
	
	public double calcularNotaEntregablesJava8()
	{
		return lEntregables.stream().mapToDouble(Entregable::getNota).average().orElse(0.0);
	}
	
	public boolean superaNotaEnEntregable(double nota)
	{
		return lEntregables.stream().anyMatch(e->e.getNota()>nota);
	}
	
	public boolean todosEntregablesAprobados()
	{
		return lEntregables.stream().
				allMatch(e->e.getNota()>=5);
	}
	
}
