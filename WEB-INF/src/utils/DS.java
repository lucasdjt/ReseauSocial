package utils;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DS {

    public static Connection getConnection() throws Exception{
        try {
            Properties p = new Properties();
            p.load(new FileInputStream("config.prop"));
            Class.forName(p.getProperty("driver"));
            String url = p.getProperty("url");
            String login = p.getProperty("login");
            String password = p.getProperty("password");
            return DriverManager.getConnection(url, login, password);
        } catch (Exception e) {
            try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/reseau_social";
            String login = "postgres";
            String password = "moi";
            return DriverManager.getConnection(url, login, password);
            } catch (Exception ex) {
            throw new Exception("Connexion fail", ex);
            }
        }
    }
}