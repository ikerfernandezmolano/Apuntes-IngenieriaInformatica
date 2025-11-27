import java.util.ArrayList;
import java.util.Comparator;
import java.util.DoubleSummaryStatistics;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.*;
import static java.util.stream.Collectors.*;
import static java.util.Comparator.*;

public class IngenieriaSoftware {
    
    private static IngenieriaSoftware mIngenieriaSoftware;
    private List<Alumno> lMatriculados = new ArrayList<Alumno>();
    
    private IngenieriaSoftware(){}
    
    public static IngenieriaSoftware getIngenieriaSoftware()
    {
	if(mIngenieriaSoftware==null)
	    {
		mIngenieriaSoftware = new IngenieriaSoftware();
	    }
	return mIngenieriaSoftware;
    }
    
    public void addAlumno(Alumno pAl)
    {
	lMatriculados.add(pAl);
    }
    
    
    ////////////////////////////JAVA7////////////////////////////////
    private Iterator<Alumno> obtIterador()
    {
	return lMatriculados.iterator();
    }	
	
    public void mostrarNotasTotales() {
		lMatriculados.stream().mapToDouble(a -> a.calcularNotaFinal()).forEach(a->System.out.println(a));
	}
    
    public List<Alumno> obtenerAlumnosSuspendidos()
    {
	return lMatriculados.stream().filter(a->a.haSuspendido()).toList();
    }
    
    public double obtenerNotaMediaDeLasEntregas()
	{
	    double ema = 0.0;
	    Iterator<Alumno> it = obtIterador();
	    while(it.hasNext())
		{
		    ema = ema + it.next().calcularNotaEntregablesJava8();
		}
	    ema = ema/lMatriculados.size();
	    return ema;
	}
    
    ////////////////////////////JAVA8////////////////////////////////
    public void mostrarNotasTotalesJava8()
    {
	//lMatriculados.stream().forEach(Alumno::calcularNotaFinal);
	lMatriculados.stream()
	    .mapToDouble(Alumno::calcularNotaFinalJava8)
	    .forEach(System.out::println);
    }
    
    public List<Alumno> obtenerAlumnosSuspendidosJava8()
    {
		return lMatriculados.stream().filter(Alumno::haSuspendido).collect(Collectors.toList());
    }
    
    public List<Alumno> obtenerListaAprobadosOrdenadosNombreJava8()
    {
		return lMatriculados.stream().filter(a->!a.haSuspendido()).
				sorted(Comparator.comparing(Alumno::getNombre)).collect(Collectors.toList());
    }
    
    public List<Alumno> obtenerListaAprobadosOrdenadosNombreApellidoJava8()
    {
		return lMatriculados.stream().filter(a->!a.haSuspendido()).
				sorted(Comparator.comparing(Alumno::getNombre).thenComparing(Alumno::getApellido)).
				collect(Collectors.toList());
    }	
    
    public double porcentajeAprobados()
    {
		return (double)lMatriculados.stream().filter(a->!a.haSuspendido()).count()/ lMatriculados.size()*100;
    }
	
    public List<String> obtenerPaisesRepresentadosJava8()
    {
		return lMatriculados.stream().map(Alumno::getPais).distinct().collect(Collectors.toList());
    }	
    
    
    
    public List<Alumno> obtenerAlumnosTodosEntregablesAprobados()
    {
		return lMatriculados.stream().filter(Alumno::todosEntregablesAprobados).collect(Collectors.toList());
    }	
    
    public List<Alumno> obtenerAlumnosQueSuperanNotaEnEntregable(double nota)
    {
		return lMatriculados.stream().filter(a->a.superaNotaEnEntregable(nota)).collect(Collectors.toList());
    }
    
    public Map<Boolean,List<Alumno>> obtenerListaAprobadosSuspensos()
    {
		return lMatriculados.stream().collect(Collectors.partitioningBy(Alumno::haSuspendido));
    }
    
    public Map<String,Double> obtenerNotasMediasPorPaisesJava8()
    {
		return lMatriculados.stream().
				collect(Collectors.groupingBy(Alumno::getPais,Collectors.averagingDouble(Alumno::calcularNotaFinalJava8)));
    }
    
    
    public void imprimirEstadisticas() {
		DoubleSummaryStatistics st=lMatriculados.stream().mapToDouble(Alumno::calcularNotaFinalJava8).summaryStatistics();
		System.out.println(st.getMax()+" "+st.getMin()+" "+st.getAverage());
    }	
    
    public Map<String,List<Alumno>> obtenerAlumnosPorPais()
    {
		return lMatriculados.stream().collect(Collectors.groupingBy(Alumno::getPais));
    }
	
    
    public Map<String,Double> obtenerNotasMediasPorPais()
    {
		return lMatriculados.stream().
				collect(Collectors.groupingBy(Alumno::getPais,Collectors.averagingDouble(Alumno::calcularNotaFinalJava8)));
	}
    
    public Map<String,Optional<Alumno>> obtenerAlumnoMaxPorPaisOptional()
    {
		return lMatriculados.stream().
				collect(Collectors.groupingBy(Alumno::getPais,
						Collectors.maxBy(comparingDouble(Alumno::calcularNotaFinalJava8))));
    }
    
    
    public Map<String,Alumno> obtenerAlumnoConNotaMaxPorPais()
    {
		return lMatriculados.stream()
			.collect(groupingBy(Alumno::getPais,
					collectingAndThen(maxBy(comparing(Alumno::calcularNotaFinalJava8)),
							  Optional::get))); //devuelve alumnos
    }
    
    
    public Map<String,Double> obtenerNotaMaxPorPais()
    {
		return lMatriculados.stream().
				collect(Collectors.groupingBy(Alumno::getPais,
						collectingAndThen(Collectors.maxBy(comparingDouble(Alumno::calcularNotaFinalJava8)),
								a->a.get().calcularNotaFinalJava8())));
    }
	
    public double obtenerNotaMediaDeLasEntregasJava8()
    {
	return lMatriculados.stream()
	    .mapToDouble(Alumno::calcularNotaEntregablesJava8)
	    .average()
	    .orElse(0.0);
    }

	public List<Alumno> obtenerAlumnosAprobadosOrdenadosNombre(){
		return lMatriculados.stream().filter(a->!a.haSuspendido()).sorted(comparing(a->a.getNombre())).toList();
	}

	public void imprimirEstadisticasAlumnosJava8(){
		lMatriculados.stream().map(a->a.calcularNotaEntregablesJava8());
	}
}
