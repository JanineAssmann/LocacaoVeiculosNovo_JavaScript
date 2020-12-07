
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    private static Connection con;

    /*
    public static Connection conectar() {
        Connection con = null;
        String url = "jdbc:postgresql://localhost:5432/locacaoveiculos";
        String user = "postgres";
        String password = "123";
       try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro de conexão");
        }
        return con;
    }
    */

    public static Connection getInstance(){
        if (con == null) {
            String url = "jdbc:postgresql://localhost:5432/locacaoveiculos";
            String user = "postgres";
            String password = "123";
            try {
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection(url, user, password);
            } catch (SQLException | ClassNotFoundException ex) {
                System.out.println("Erro de conexão");
            }
        }
        return con;
    }
}
