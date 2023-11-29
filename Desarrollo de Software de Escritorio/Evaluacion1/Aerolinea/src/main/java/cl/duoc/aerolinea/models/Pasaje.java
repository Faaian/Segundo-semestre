package cl.duoc.aerolinea.models;

import java.time.LocalDate;

public class Pasaje {

    private static int numVuelo = 1;

    private String pasajero;
    private String destino;
    private LocalDate fecha;
    private int valor;
    private int numAsiento;
    private boolean equipaje;

    public Pasaje(String pasajero, String destino, LocalDate fecha, int valor, int numAsiento, boolean equipaje) {
        this.pasajero = pasajero;
        this.destino = destino;
        this.fecha = fecha;
        this.valor = valor;
        this.numAsiento = numAsiento;
        this.equipaje = equipaje;
    }

    public Pasaje() {
    }

    public int getNumVuelo() {
        return numVuelo;
    }

    public String getPasajero() {
        return pasajero;
    }

    public void setPasajero(String pasajero) {
        this.pasajero = pasajero;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(int dia, int mes, int año) {
        LocalDate fechaActual = LocalDate.now();
        LocalDate fechaPasaje = LocalDate.of(año, mes, dia);
        if (fechaPasaje.isBefore(fechaActual)) {
            System.out.println("ERROR: La fecha del pasaje es menor a la actual.");
        } else {
            this.fecha = fechaPasaje;
        }
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        if (valor < 10000) {
            System.out.println("ERORR: El valor debe ser mayor a $10.000.");
        } else {
            if (this.equipaje == true) {
                valor = valor + (valor * 20) / 100;
                this.valor = valor;
            } else {
                this.valor = valor;
            }
        }
    }

    public int getNumAsiento() {
        return numAsiento;
    }

    public void setNumAsiento(int numAsiento) {
        if (numAsiento < 1 || numAsiento > 90) {
            System.out.println("ERORR: El asiento debe ser entre 1 y 90.");
        } else {
            this.numAsiento = numAsiento;
        }
    }

    public boolean isEquipaje() {
        return equipaje;
    }

    public void setEquipaje(String confirmacion) {
        if (confirmacion == "si") {
            this.equipaje = true;
        } else {
            this.equipaje = false;
        }
    }

    public String toString(String pasajero) {
        return "** PASAJE **"
                + "\nNumero de Vuelo: " + numVuelo
                + "\n" + pasajero
                + "\nDestino: " + destino
                + "\nFecha: " + fecha
                + "\nValor: $" + valor
                + "\nNumero Asiento: " + numAsiento;
    }

}
