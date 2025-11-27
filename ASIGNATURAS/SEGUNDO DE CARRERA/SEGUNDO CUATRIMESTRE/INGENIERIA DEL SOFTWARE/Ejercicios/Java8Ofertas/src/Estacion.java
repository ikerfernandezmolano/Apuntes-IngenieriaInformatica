public class Estacion {
    private String ciudad;
    private float costeParada;

    public Estacion(String pCiudad, float pCoste){
        this.ciudad=pCiudad;
        this.costeParada=pCoste;
    }

    public String getDestino(){
        return ciudad;
    }

    public boolean esOrigen(String pOrigen){
        return ciudad==pOrigen;
    }

    public boolean esCiudad(String pCiudad){
        return ciudad==pCiudad;
    }
}
