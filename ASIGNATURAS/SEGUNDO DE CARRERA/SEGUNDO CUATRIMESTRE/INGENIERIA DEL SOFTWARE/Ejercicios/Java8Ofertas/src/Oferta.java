import java.util.ArrayList;
import java.util.Collection;

public class Oferta {
    private Collection<Estacion> listaEstaciones=new ArrayList<Estacion>();
    private Estacion origen;
    private Estacion destino;

    public Oferta(String pOrigen, float pCO, String pDestino, float pCD){
        this.origen=new Estacion(pOrigen,pCO);
        this.destino=new Estacion(pDestino,pCD);
    }

    public boolean esOrigen(String pOrigen){
        return this.origen.esOrigen(pOrigen);
    }

    public void impDest(){
        System.out.println(this.destino.getDestino());
    }

    public String getDestino(){
        return destino.getDestino();
    }

    public String getOrigen(){
        return origen.getDestino();
    }

    public boolean tieneCiudad(String pCiudad){
        return listaEstaciones.stream().anyMatch(e->e.esCiudad(pCiudad));
    }
}
