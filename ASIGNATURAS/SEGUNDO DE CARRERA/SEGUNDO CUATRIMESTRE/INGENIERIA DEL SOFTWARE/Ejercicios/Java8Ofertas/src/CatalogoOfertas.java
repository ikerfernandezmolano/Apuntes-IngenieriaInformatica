import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;


public class CatalogoOfertas {
    private Collection<Oferta> lista = new ArrayList<Oferta>();
    private static CatalogoOfertas miCO = new CatalogoOfertas();

    private CatalogoOfertas(){
        lista.add(new Oferta("Bilbao", 1,"Madrid",2));
        lista.add(new Oferta("Pamplona", 1,"Madrid",2));
        lista.add(new Oferta("Madrid", 1,"Jeréz",2));
        lista.add(new Oferta("Málaga", 1,"Sevilla",2));
        lista.add(new Oferta("Bilbao", 1,"Mallorca",2));
        lista.add(new Oferta("Barcelona", 1,"Madrid",2));
        lista.add(new Oferta("Bilbao", 1,"Oviedo",2));
        lista.add(new Oferta("Bilbao", 1,"Oviedo",2));
        lista.add(new Oferta("Bilbao", 1,"Madrid",2));
    }

    public static CatalogoOfertas getCatalogoOfertas(){return miCO;}

    public void imprimirPosiblesDestinos(String pOrigen){
        lista.stream().filter(o->o.esOrigen(pOrigen)).forEach(Oferta::impDest);
    }

    public void imprimirPosiblesDestinos2(String pOrigen){
        lista.stream().filter(o->o.esOrigen(pOrigen)).map(Oferta::getDestino).distinct().forEach(System.out::println);
    }

    public List<Oferta> getOfertasOrdenadasOrigen(){
        return lista.stream().sorted(Comparator.comparing(Oferta::getOrigen)).collect(Collectors.toList());
    }

    public List<Oferta> getOfertasOrdenadasOrigenDestino(){
        return lista.stream().sorted(Comparator.comparing(Oferta::getOrigen)
                        .thenComparing(Oferta::getDestino))
                        .collect(Collectors.toList());
    }

    public List<Oferta> ofertasConEstacion(String pCiudad){
        return lista.stream().
                filter(o->o.tieneCiudad(pCiudad)).
                collect(Collectors.toList());
    }

    public void buscarOfertas(String pOrigen, String pDestino){
        return lista.stream().
                ;
    }
}
