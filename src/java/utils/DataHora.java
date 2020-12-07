
package utils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class DataHora {
    
    public static LocalDate data() {
        LocalDate ldNow = LocalDate.now();
        return ldNow;
    }

    public static LocalDate dateFormato(String data) {
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate localDate = LocalDate.parse(data, formatterDate);
        return localDate;
    }

    public static LocalDateTime dateTimeFormato(String data) {
        DateTimeFormatter formatterDateTime = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        LocalDateTime localDateTime = LocalDateTime.parse(data, formatterDateTime);
        return localDateTime;
    }

    public static LocalTime hora() {
        LocalTime ltNow = LocalTime.now();
        return ltNow;
    }
    /*
    public static LocalDateTime dataPrazo() {
        LocalDateTime ldtPrazo = LocalDate.now().p
    }
    */
    public static LocalDateTime dataHora() {
        LocalDateTime ldtNow = LocalDateTime.now();
        return ldtNow;
    }
    
}
