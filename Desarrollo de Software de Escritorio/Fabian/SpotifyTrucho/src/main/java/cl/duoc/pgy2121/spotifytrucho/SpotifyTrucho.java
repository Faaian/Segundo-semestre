/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package cl.duoc.pgy2121.spotifytrucho;

/**
 *
 * @author Cetecom
 */
public class SpotifyTrucho {
    private String nombre = "Fabian";
    
    
    public static void main(String[] args) {
        Cancion cancion1 = new Cancion("Despacito", "Fonsi", 5.00);
        cancion1.setArtista();
        cancion1.setTitulo();
        cancion1.setDuracion();
    }
    
}

