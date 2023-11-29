package cl.duoc.hoystmarkplanet.Service.impl;

import cl.duoc.hoystmarkplanet.DAO.ConexionDB;
import cl.duoc.hoystmarkplanet.DTO.PeliculaDTO;
import cl.duoc.hoystmarkplanet.Service.iPelicula;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class PeliculaService implements iPelicula {

    ConexionDB db;

    public PeliculaService() {
        db = new ConexionDB();
    }

    @Override
    public void guardar(PeliculaDTO p) {
        if (p.getTitulo().length() > 0 && p.getGenero().length() > 0 && p.getDirector().length() > 0) {
            try {
                String consulta = "INSERT INTO movies(titulo, director, año, duracion, genero)"
                        + " VALUES('" + p.getTitulo() + "', '" + p.getDirector() + "', " + p.getAño() + ", "
                        + "" + p.getDuracion() + ", '" + p.getGenero() + "');";
                System.out.println(consulta);
                db.ejecutarConsulta(consulta);
                JOptionPane.showMessageDialog(null, "Se ha guardado exitosamente.");
            } catch (SQLException ex) {
                System.out.println("Error" + ex.getMessage());
                JOptionPane.showMessageDialog(null, "Rellene todos los campos", "ERROR", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(null, "Datos vacios", "ERROR", JOptionPane.ERROR_MESSAGE);
        }

    }

    @Override
    public void editar(PeliculaDTO p, String id) {
        if (p.getTitulo().length() > 0 && p.getGenero().length() > 0 && p.getDirector().length() > 0) {
            try {
                String consulta = "UPDATE movies SET titulo = '" + p.getTitulo() + "', director = '" + p.getDirector()
                        + "', año = " + p.getAño() + ", duracion =" + p.getDuracion() + ", genero = '" + p.getGenero()
                        + "' WHERE id = " + id + ";";

                System.out.println(consulta);
                db.ejecutarConsulta(consulta);
                JOptionPane.showMessageDialog(null, "Se ha Modificado exitosamente.");
            } catch (SQLException ex) {
                System.out.println("Error" + ex.getMessage());
                JOptionPane.showMessageDialog(null, "Rellene todos los campos", "ERROR", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(null, "Datos vacios", "ERROR", JOptionPane.ERROR_MESSAGE);
        }

    }

    @Override
    public List<PeliculaDTO> listar() {
        List<PeliculaDTO> lista = new ArrayList<>();
        try {
            ResultSet rs = db.EjecutarQuery("SELECT * FROM `movies`");
            while (rs.next()) {
                lista.add(new PeliculaDTO(Integer.parseInt(rs.getString("id")),
                        rs.getString("titulo"),
                        rs.getString("director"),
                        Integer.parseInt(rs.getString("año")),
                        Integer.parseInt(rs.getString("duracion")),
                        rs.getString("genero")));
            }
        } catch (SQLException ex) {
            System.out.println("Hubo un error!" + ex);
        }
        return lista;
    }

    @Override
    public void eliminar(String id) {
        try {
            String query = "DELETE FROM movies WHERE id = '" + id + "';";
            db.ejecutarConsulta(query);
        } catch (SQLException ex) {
            System.out.println("Hubo un error" + ex);
            JOptionPane.showMessageDialog(null, "No se ha podido eliminar.", "ERROR", JOptionPane.ERROR_MESSAGE);

        }
        System.out.println("Eliminado");
        JOptionPane.showMessageDialog(null, "Se ha eliminado exitosamente");
    }

    @Override
    public PeliculaDTO traer(String id) {
        PeliculaDTO p = null;
        try {
            String sql = "SELECT * FROM `movies` WHERE id = " + id + ";";
            ResultSet rs = db.EjecutarQuery(sql);

            if (rs.next()) {
                p = new PeliculaDTO(
                        Integer.parseInt(rs.getString("id")),
                        rs.getString("titulo"),
                        rs.getString("director"),
                        Integer.parseInt(rs.getString("año")),
                        Integer.parseInt(rs.getString("duracion")),
                        rs.getString("genero")
                );
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex);
        }
        return p;
    }

    @Override
    public List<PeliculaDTO> busquedaAño(int menor, int mayor) {
        List<PeliculaDTO> lista = new ArrayList<>();
        try {
            ResultSet rs = db.EjecutarQuery("SELECT * FROM `movies` WHERE año BETWEEN " + menor + " AND " + mayor + ";");
            while (rs.next()) {
                lista.add(new PeliculaDTO(Integer.parseInt(rs.getString("id")),
                        rs.getString("titulo"),
                        rs.getString("director"),
                        Integer.parseInt(rs.getString("año")),
                        Integer.parseInt(rs.getString("duracion")),
                        rs.getString("genero")));
            }
        } catch (SQLException ex) {
            System.out.println("Hubo un error!" + ex);
        }
        return lista;
    }

    @Override
    public List<PeliculaDTO> busquedaGenero(String genero) {
        List<PeliculaDTO> lista = new ArrayList<>();
        try {
            ResultSet rs = db.EjecutarQuery("SELECT * FROM `movies` WHERE genero = '" + genero + "';");
            while (rs.next()) {
                lista.add(new PeliculaDTO(Integer.parseInt(rs.getString("id")),
                        rs.getString("titulo"),
                        rs.getString("director"),
                        Integer.parseInt(rs.getString("año")),
                        Integer.parseInt(rs.getString("duracion")),
                        rs.getString("genero")));
            }
        } catch (SQLException ex) {
            System.out.println("Hubo un error!" + ex);
        }
        return lista;
    }
}
