import java.util.List;
import java.util.stream.Collectors;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        //1
        CatalogoOfertas.getCatalogoOfertas().imprimirPosiblesDestinos("Bilbao");
        System.out.println();
        //2
        CatalogoOfertas.getCatalogoOfertas().imprimirPosiblesDestinos2("Bilbao");
        System.out.println();
        //3
        List<Oferta> lista= CatalogoOfertas.getCatalogoOfertas().getOfertasOrdenadasOrigen();
        lista.stream().map(Oferta::getOrigen).forEach(System.out::println);
        System.out.println();
        //4
        List<Oferta> lista2= CatalogoOfertas.getCatalogoOfertas().getOfertasOrdenadasOrigenDestino();
        lista2.stream()
                .map(oferta -> oferta.getOrigen() + " -> " + oferta.getDestino())
                .forEach(System.out::println);

    }
}