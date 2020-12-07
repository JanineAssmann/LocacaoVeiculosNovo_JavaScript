
package classes;

import java.util.List;
import utils.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Cliente {

    private int id;
    private String cpf;
    private String nome;
    private String numcartao;
    private String email;
    private String telefone;

    @Override
    public String toString() {
        return "Cadastro de Clientes: "
                + "\nCliente Nº: " + id 
                + "\nNome: " + nome 
                + "\nCPF: " + cpf 
                + "\nNº Cartão: " + numcartao 
                + "\nE-Mail: " + email 
                + "\nTelefone: " + telefone
                + "\n";
    }

    public boolean salvar() {
        String sql = "insert into cliente (nome, cpf, numcartao, ";
              sql += "email, telefone) values ";
              sql += "(?, ?, ?, ?, ?)";
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpf);
            stm.setString(3, this.numcartao);
            stm.setString(4, this.email);
            stm.setString(5, this.telefone);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public boolean alterar() {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "update cliente set nome = ?, cpf = ?, numcartao = ?, ";
              sql += "email = ?, telefone = ? where id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpf);
            stm.setString(3, this.numcartao);
            stm.setString(4, this.email);
            stm.setString(5, this.telefone);
            stm.setInt(6, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public boolean excluir() {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "delete from cliente where id = ?";
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
    
    public static Cliente consultar(int id) {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from cliente where id = ?";
        Cliente cliente = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setId(id);
                cliente.setNome(rs.getString("Nome"));
                cliente.setCpf(rs.getString("CPF"));
                cliente.setNumcartao(rs.getString("NumCartao"));
                cliente.setEmail(rs.getString("Email"));
                cliente.setTelefone(rs.getString("Telefone"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cliente;
    }

    public static Cliente consultar(String cpf) {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from cliente where cpf = ?";
        Cliente cliente = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, cpf);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setId(rs.getInt("Id"));
                cliente.setNome(rs.getString("Nome"));
                cliente.setCpf(rs.getString("CPF"));
                cliente.setNumcartao(rs.getString("NumCartao"));
                cliente.setEmail(rs.getString("Email"));
                cliente.setTelefone(rs.getString("Telefone"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cliente;
    }
    
    public static List<Cliente> consultar() {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from cliente";
        List<Cliente> listaCliente = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("Nome"));
                cliente.setCpf(rs.getString("CPF"));
                cliente.setNumcartao(rs.getString("NumCartao"));
                cliente.setEmail(rs.getString("Email"));
                cliente.setTelefone(rs.getString("Telefone"));
                listaCliente.add(cliente);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return listaCliente;
    }

    public static List<Cliente> consultarCpf(String cpf) {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from cliente where cpf=?";
        List<Cliente> listaCliente = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, cpf);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("Nome"));
                cliente.setCpf(rs.getString("CPF"));
                cliente.setNumcartao(rs.getString("NumCartao"));
                cliente.setEmail(rs.getString("Email"));
                cliente.setTelefone(rs.getString("Telefone"));
                listaCliente.add(cliente);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return listaCliente;
    }

    public static List<Cliente> consultarNome(String nome) {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from cliente where nome=?";
        List<Cliente> listaCliente = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nome);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("Nome"));
                cliente.setCpf(rs.getString("CPF"));
                cliente.setNumcartao(rs.getString("NumCartao"));
                cliente.setEmail(rs.getString("Email"));
                cliente.setTelefone(rs.getString("Telefone"));
                listaCliente.add(cliente);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return listaCliente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNumcartao() {
        return numcartao;
    }

    public void setNumcartao(String numcartao) {
        this.numcartao = numcartao;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
}