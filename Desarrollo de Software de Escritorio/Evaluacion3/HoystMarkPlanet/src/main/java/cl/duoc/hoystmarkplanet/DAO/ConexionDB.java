package cl.duoc.hoystmarkplanet.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexionDB {

    Connection conexion;

    public ConexionDB() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/test",
                    "root",
                    ""
            );
            System.out.println("Conexion exitosa");
        } catch (Exception ex) {
            System.out.println("Error en DB" + ex.getMessage());
        }
    }

    public ResultSet ejecutarConsulta(String sql) throws SQLException {
        try (Statement statement = conexion.createStatement()) {
            statement.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            return statement.getGeneratedKeys();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ResultSet EjecutarQuery(String sql) throws SQLException {
        Statement statement = conexion.createStatement();
        return statement.executeQuery(sql);
    }

}
