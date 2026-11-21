package pe.edu.cibertec.matricula_api.bdd.gancho;

import io.cucumber.java.Before;
import net.serenitybdd.screenplay.actors.OnStage;
import net.serenitybdd.screenplay.actors.OnlineCast;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class PreparacionDelEscenario {

    @Before
    public void prepararEscenario() {
        OnStage.setTheStage(new OnlineCast());
        System.out.println("Estudiante: Aron Pacheco Huamani");
        System.out.println("Codigo: i202507085");
        System.out.println("Fecha y hora: "
                + LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss")));
    }
}
