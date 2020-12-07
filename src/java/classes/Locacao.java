
package classes;

import utils.DataHora;
import utils.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class Locacao {

    private int id;
    private Carro carro;
    private Cliente cliente;
    private LocalDate data; // precisa utilizar date cfe banco
    private LocalDateTime dataretirada; // precisa utilizar date cfe banco
    private LocalDate dataprevretirada; // precisa utilizar date cfe banco
    private LocalDate dataprevdevolucao; // precisa utilizar date cfe banco
    private LocalDateTime datadevolucao; // precisa utilizar date cfe banco
    private int prazolocacao;
    private int kminicial;
    private int kmfinal;

    @Override
    public String toString() {
        return "Relação de Locações: " 
                + "\nLocação Nº: " + id 
                + "\nCarro Código: " + carro.getId() 
                + "\nCliente Cadastro: " + cliente.getId() 
                + "\nData da Reserva: " + data 
                + "\nData Prevista para Retirada: " + dataprevretirada 
                + "\nData de Retirada: " + dataretirada 
                + "\nData Prevista para Devolução: " + dataprevdevolucao 
                + "\nData de Devolução: " + datadevolucao 
                + "\nPrazo de Locação: " + prazolocacao 
                + "\nKm na Retirada: " + kminicial 
                + "\nKm na Devolução: " + kmfinal;
    }

    public boolean salvar() {
        String sql = "insert into locacao (idcarro, idcliente, data, "
                + "dataprevretirada, prazolocacao,kminicial) "
                + "values (?, ?, ?, ?, ?, ?)";
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, carro.getId());
            stm.setInt(2, cliente.getId());
            stm.setObject(3, DataHora.data());
            stm.setObject(4, this.dataprevretirada);
            //stm.setObject(5, DataHora.dataHora());// dataRetirada informar na efetivação da locação
            stm.setInt(5, this.prazolocacao);
            stm.setInt(6, this.kminicial);
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
        String sql = "update locacao set idcarro = ?, idcliente = ?, data = ?, "
                    + "dataprevretirada = ?, dataprevdevolucao = ?, "
                    + "prazolocacao = ?, kminicial = ?, kmfinal = ? where id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, carro.getId());
            stm.setInt(2, cliente.getId());
            stm.setObject(3, this.data);
            stm.setObject(4, this.dataprevretirada);
            stm.setObject(5, this.dataprevdevolucao);
            stm.setInt(6, this.prazolocacao);
            stm.setInt(7, this.kminicial);
            stm.setInt(8, this.kmfinal);
            stm.setInt(9, this.id);
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
        String sql = "delete from locacao ";
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

    public static Locacao consultarPlaca(String Placa) {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select loc.* from locacao loc, carro car where "
                   + "loc.idcarro = car.id and car.placa = ?";
        Locacao locacao = null;
        Carro car = Carro.consultarPlaca(Placa);
        if (car != null) {
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, car.getPlaca());
                ResultSet rs = stm.executeQuery();
                if (rs.next()) {
                    locacao = new Locacao();
                    locacao.setId(rs.getInt("Id"));
                    locacao.setCarro(car);
                    locacao.setCliente(Cliente.consultar(rs.getInt("idcliente")));
                    locacao.setData(rs.getObject("data", LocalDate.class));
                    locacao.setDataprevretirada(rs.getObject("Dataprevretirada", LocalDate.class));
                    locacao.setDataretirada(rs.getObject("Dataretirada", LocalDateTime.class));
                    locacao.setDataprevdevolucao(rs.getObject("Dataprevdevolucao", LocalDate.class));
                    locacao.setDatadevolucao(rs.getObject("Datadevolucao", LocalDateTime.class));
                    locacao.setPrazolocacao(rs.getInt("Prazolocacao"));
                    locacao.setKminicial(rs.getInt("Kminicial"));
                    locacao.setKmfinal(rs.getInt("Kmfinal"));
                }
            } catch (SQLException ex) {
                System.out.println("Erro: " + ex.getMessage());
            }
        }
        return locacao;
    }

    public static Locacao consultar(int id) {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from locacao where id = ?";
        Locacao locacao = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                ResultSet rs = stm.executeQuery();
                if (rs.next()) {
                    locacao = new Locacao();
                    locacao.setId(id);
                    locacao.setCarro(Carro.consultar(rs.getInt("idcarro")));
                    locacao.setCliente(Cliente.consultar(rs.getInt("idcliente")));
                    locacao.setData(rs.getObject("data", LocalDate.class));
                    locacao.setDataprevretirada(rs.getObject("Dataprevretirada", LocalDate.class));
                    locacao.setDataretirada(rs.getObject("Dataretirada", LocalDateTime.class));
                    locacao.setDataprevdevolucao(rs.getObject("Dataprevdevolucao", LocalDate.class));
                    locacao.setDatadevolucao(rs.getObject("Datadevolucao", LocalDateTime.class));
                    locacao.setPrazolocacao(rs.getInt("Prazolocacao"));
                    locacao.setKminicial(rs.getInt("Kminicial"));
                    locacao.setKmfinal(rs.getInt("Kmfinal"));
                }
            } catch (SQLException ex) {
                System.out.println("Erro: " + ex.getMessage());
            }
        return locacao;
    }

    public static List<Locacao> consultar() {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from locacao";
        List<Locacao> listaLocacao = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                    Locacao locacao = new Locacao();
                    locacao.setId(rs.getInt("Id"));
                    Carro car = Carro.consultar(rs.getInt("idcarro"));
                    locacao.setCarro(car);
                    locacao.setCliente(Cliente.consultar(rs.getInt("idcliente")));
                    locacao.setData(rs.getObject("data", LocalDate.class));
                    locacao.setDataprevretirada(rs.getObject("Dataprevretirada", LocalDate.class));
                    locacao.setDataretirada(rs.getObject("Dataretirada", LocalDateTime.class));
                    locacao.setDataprevdevolucao(rs.getObject("Dataprevdevolucao", LocalDate.class));
                    locacao.setDatadevolucao(rs.getObject("Datadevolucao", LocalDateTime.class));
                    locacao.setPrazolocacao(rs.getInt("Prazolocacao"));
                    locacao.setKminicial(rs.getInt("Kminicial"));
                    locacao.setKmfinal(rs.getInt("Kmfinal"));
                    listaLocacao.add(locacao);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return listaLocacao;
    }

    public static List<Locacao> consultarNome(String nome) {
        //Connection con = Conexao.conectar();
        Connection con = Conexao.getInstance();
        String sql = "select * from locacao loc, cliente cli where "
                + "loc.idcliente = cli.id and cli.nome like ?";
        List<Locacao> listaLocacao = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nome + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                    Locacao locacao = new Locacao();
                    locacao.setId(rs.getInt("id"));
                    Cliente cliente = new Cliente();
                    cliente = cliente.consultar(rs.getString("cpf"));
                    locacao.setCliente(cliente);
                    Carro carro = new Carro();
                    carro = carro.consultar(rs.getInt("idcarro"));
                    locacao.setCarro(carro);
                    locacao.setData(rs.getObject("data", LocalDate.class));
                    locacao.setDataprevretirada(rs.getObject("Dataprevretirada", LocalDate.class));
                    locacao.setDataretirada(rs.getObject("Dataretirada", LocalDateTime.class));
                    locacao.setDataprevdevolucao(rs.getObject("Dataprevdevolucao", LocalDate.class));
                    locacao.setDatadevolucao(rs.getObject("Datadevolucao", LocalDateTime.class));
                    locacao.setPrazolocacao(rs.getInt("Prazolocacao"));
                    locacao.setKminicial(rs.getInt("Kminicial"));
                    locacao.setKmfinal(rs.getInt("Kmfinal"));
                    listaLocacao.add(locacao);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return listaLocacao;
    }
       
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Carro getCarro() {
        return carro;
    }

    public void setCarro(Carro carro) {
        this.carro = carro;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public LocalDateTime getDataretirada() {
        return dataretirada;
    }

    public void setDataretirada(LocalDateTime dataretirada) {
        this.dataretirada = dataretirada;
    }

    public LocalDate getDataprevretirada() {
        return dataprevretirada;
    }

    public void setDataprevretirada(LocalDate dataprevretirada) {
        this.dataprevretirada = dataprevretirada;
    }

    public LocalDate getDataprevdevolucao() {
        return dataprevdevolucao;
    }

    public void setDataprevdevolucao(LocalDate dataprevdevolucao) {
        this.dataprevdevolucao = dataprevdevolucao;
    }

    public LocalDateTime getDatadevolucao() {
        return datadevolucao;
    }

    public void setDatadevolucao(LocalDateTime datadevolucao) {
        this.datadevolucao = datadevolucao;
    }

    public int getPrazolocacao() {
        return prazolocacao;
    }

    public void setPrazolocacao(int prazolocacao) {
        this.prazolocacao = prazolocacao;
    }

    public int getKminicial() {
        return kminicial;
    }

    public void setKminicial(int kminicial) {
        this.kminicial = kminicial;
    }

    public int getKmfinal() {
        return kmfinal;
    }

    public void setKmfinal(int kmfinal) {
        this.kmfinal = kmfinal;
    }
    
}