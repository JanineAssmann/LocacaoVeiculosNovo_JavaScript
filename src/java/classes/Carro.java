
package classes;

import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import utils.Conexao;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;

public class Carro {

    private int id;
    private String placa;
    private String marca;
    private String modelo;
    private int km;
    private boolean arcond;
    private boolean dirhidraulica;
    private boolean cambioautom;

    @Override
    public String toString() {
        return "Cadastro de Carros: "
                + "\nRegistro Carro Nº: " + id 
                + "\nMarca: " + marca 
                + "\nModelo: " + modelo 
                + "\nPlaca: " + placa 
                + "\nKm: " + km 
                + "\nAr Condicionado: " + arcond 
                + "\nDireção Hidráulica: " + dirhidraulica 
                + "\nCâmbio Automático: " + cambioautom
                + "\n";
    }

    public void salvar() throws Exception{
        String sql = "insert into carro (placa, marca, modelo, km, arcond,";
               sql += "dirhidraulica, cambioautom) ";
               sql += "values(?, ?, ?, ?, ?, ?, ?)";
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placa);
            stm.setString(2, this.marca);
            stm.setString(3, this.modelo);
            stm.setInt(4, this.km);
            stm.setBoolean(5, this.arcond);
            stm.setBoolean(6, this.dirhidraulica);
            stm.setBoolean(7, this.cambioautom);
            stm.execute();
        } catch (SQLException ex) {
            throw new Exception(ex.getMessage());
            //System.out.println("Erro: " + ex.getMessage());
        }
    }
    
    public boolean alterar(){
        //Connection con = Conexao.conectar
        Connection con = Conexao.getInstance();
        String sql = "update carro set ";
               sql += "placa = ?, ";
               sql += "marca = ?, ";
               sql += "modelo = ?, ";
               sql += "km = ?, ";
               sql += "arcond = ?, ";
               sql += "dirhidraulica = ?, ";
               sql += "cambioautom = ? ";
               sql += "where id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placa);
            stm.setString(2, this.marca);
            stm.setString(3, this.modelo);
            stm.setInt(4, this.km);
            stm.setBoolean(5, this.arcond);
            stm.setBoolean(6, this.dirhidraulica);
            stm.setBoolean(7, this.cambioautom);
            stm.setInt(8, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public boolean excluir(){
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "delete from carro ";
               sql += "where id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public static Carro consultar(int id){
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from carro where id = ?";
        Carro carro = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                carro = new Carro();
                carro.setId(id);
                carro.setMarca(rs.getString("Marca"));
                carro.setModelo(rs.getString("Modelo"));
                carro.setPlaca(rs.getString("Placa"));
                carro.setKm(rs.getInt("Km"));
                carro.setArcond(rs.getBoolean("ArCond"));
                carro.setDirhidraulica(rs.getBoolean("DirHidraulica"));
                carro.setCambioautom(rs.getBoolean("CambioAutom"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return carro;
    }

    public static Carro consultarPlaca(String placa){
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from carro where placa = ?";
        Carro carro = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, placa);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                carro = new Carro();
                carro.setId(rs.getInt("Id"));
                carro.setMarca(rs.getString("Marca"));
                carro.setModelo(rs.getString("Modelo"));
                carro.setPlaca(rs.getString("Placa"));
                carro.setKm(rs.getInt("Km"));
                carro.setArcond(rs.getBoolean("ArCond"));
                carro.setDirhidraulica(rs.getBoolean("DirHidraulica"));
                carro.setCambioautom(rs.getBoolean("CambioAutom"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return carro;
    }

    public static List<Carro> consultarMarca(String marca){
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from carro where marca = ?";
        List<Carro> listaCarro = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, marca);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
               Carro carro = new Carro();
               carro.setId(rs.getInt("id"));
               carro.setMarca(rs.getString("Marca"));
               carro.setModelo(rs.getString("Modelo"));
               carro.setPlaca(rs.getString("Placa"));
               carro.setKm(rs.getInt("km"));
               carro.setArcond(rs.getBoolean("ArCond"));
               carro.setDirhidraulica(rs.getBoolean("DirHidraulica"));
               carro.setCambioautom(rs.getBoolean("CambioAutom"));
               listaCarro.add(carro);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return listaCarro;
    }

    public static List<Carro> consultarModelo(String modelo){
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from carro where modelo = ?";
        List<Carro> listaCarro = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, modelo);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
               Carro carro = new Carro();
               carro.setId(rs.getInt("id"));
               carro.setMarca(rs.getString("Marca"));
               carro.setModelo(rs.getString("Modelo"));
               carro.setPlaca(rs.getString("Placa"));
               carro.setKm(rs.getInt("km"));
               carro.setArcond(rs.getBoolean("ArCond"));
               carro.setDirhidraulica(rs.getBoolean("DirHidraulica"));
               carro.setCambioautom(rs.getBoolean("CambioAutom"));
               listaCarro.add(carro);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return listaCarro;
    }

    public static List<Carro> consultar(){
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from carro";
        List<Carro> listaCarro = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
               Carro carro = new Carro();
               carro.setId(rs.getInt("id"));
               carro.setMarca(rs.getString("Marca"));
               carro.setModelo(rs.getString("Modelo"));
               carro.setPlaca(rs.getString("Placa"));
               carro.setKm(rs.getInt("km"));
               carro.setArcond(rs.getBoolean("ArCond"));
               carro.setDirhidraulica(rs.getBoolean("DirHidraulica"));
               carro.setCambioautom(rs.getBoolean("CambioAutom"));
               listaCarro.add(carro);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return listaCarro;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getKm() {
        return km;
    }

    public void setKm(int km) {
        this.km = km;
    }

    public boolean isArcond() { 
        return arcond;
    }

    public void setArcond(boolean arcond) {
        this.arcond = arcond;
    }

    public boolean isDirhidraulica() { 
        return dirhidraulica;
    }

    public void setDirhidraulica(boolean dirhidraulica) {
        this.dirhidraulica = dirhidraulica;
    }

    public boolean isCambioautom() { 
        return cambioautom;
    }

    public void setCambioautom(boolean cambioautom) {
        this.cambioautom = cambioautom;
    }
    
}