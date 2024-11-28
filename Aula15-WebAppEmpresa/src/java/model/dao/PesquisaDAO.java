/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import model.Pesquisa;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import util.ConectaDB;
/**
 *
 * @author alunocmc
 */
public class PesquisaDAO {
   //Atributos
    // Sem atributos
    
    //Métodos
   public boolean insPesq(Pesquisa p_pesq) throws ClassNotFoundException {
        //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();
                        //INSERT INTO pesquisa(dt_pesq, nome, email, q1, q2, q3, q4) VALUES ('2024-10-23', 'Ana Maria','ana@umc.br', 2, 1, 5, 3);           
                        
            String sql = "INSERT INTO pesquisa(dt_pesq, nome, email, q1, q2, q3, q4) VALUES ('" + p_pesq.getDt_pesq()+
                                                                                    "','" + p_pesq.getNome()+
                                                                                    "', '" + p_pesq.getEmail() + 
                                                                                    "'," + p_pesq.getQ1()+ 
                                                                                    "," + p_pesq.getQ2()+ 
                                                                                    "," + p_pesq.getQ3()+ 
                                                                                    "," + p_pesq.getQ4() + ")";
                         
            stmt.executeUpdate(sql); // Executa o SQL: Insert / Delete ou Update
                        
            conexao.close();
            return true;
        }catch(SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return false;
        }                 
    }  
    
   public Pesquisa consPesqReg(Pesquisa pesquisa) throws ClassNotFoundException{
    //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "SELECT * from pesquisa where nome = '" + pesquisa.getNome() + "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {   
                pesquisa.setId(Integer.parseInt(rs.getString("pk_id")));  
                pesquisa.setNome(rs.getString("nome"));  
                pesquisa.setEmail(rs.getString("email"));                
                pesquisa.setQ1( Integer.parseInt(rs.getString("q1")));                
                pesquisa.setQ2( Integer.parseInt(rs.getString("q2")));                
                pesquisa.setQ3( Integer.parseInt(rs.getString("q3")));                
                pesquisa.setQ4( Integer.parseInt(rs.getString("q4"))); 
                pesquisa.setDt_pesq(rs.getString("dt_pesq"));  
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return pesquisa;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }   

   public Pesquisa consPesqRegId(Pesquisa pesquisa) throws ClassNotFoundException{
    //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "SELECT * from pesquisa where email = '" + pesquisa.getEmail()+ "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                pesquisa.setId(Integer.parseInt(rs.getString("pk_id")));  
                pesquisa.setNome(rs.getString("nome"));  
                pesquisa.setEmail(rs.getString("email"));                
                pesquisa.setQ1( Integer.parseInt(rs.getString("q1")));                
                pesquisa.setQ2( Integer.parseInt(rs.getString("q2")));                
                pesquisa.setQ3( Integer.parseInt(rs.getString("q3")));                
                pesquisa.setQ4( Integer.parseInt(rs.getString("q4"))); 
                pesquisa.setDt_pesq(rs.getString("dt_pesq"));  
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return pesquisa;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    } 
     
   public Pesquisa consPesqRegIdent(Pesquisa pesquisa) throws ClassNotFoundException{
    //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "SELECT * from pesquisa where pk_id = '" + pesquisa.getId()+ "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                pesquisa.setId(Integer.parseInt(rs.getString("pk_id")));  
                pesquisa.setNome(rs.getString("nome"));  
                pesquisa.setEmail(rs.getString("email"));                
                pesquisa.setQ1( Integer.parseInt(rs.getString("q1")));                
                pesquisa.setQ2( Integer.parseInt(rs.getString("q2")));                
                pesquisa.setQ3( Integer.parseInt(rs.getString("q3")));                
                pesquisa.setQ4( Integer.parseInt(rs.getString("q4"))); 
                pesquisa.setDt_pesq(rs.getString("dt_pesq"));  
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return pesquisa;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    } 
  
   public List consPesqLista() throws ClassNotFoundException{
    //Connectar
        List lista = new ArrayList(); // Minha Lista
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "SELECT * from pesquisa";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                Pesquisa pesquisa = new Pesquisa();
                pesquisa.setId(Integer.parseInt(rs.getString("pk_id")));  
                pesquisa.setNome(rs.getString("nome"));  
                pesquisa.setEmail(rs.getString("email"));                
                pesquisa.setQ1( Integer.parseInt(rs.getString("q1")));                
                pesquisa.setQ2( Integer.parseInt(rs.getString("q2")));                
                pesquisa.setQ3( Integer.parseInt(rs.getString("q3")));                
                pesquisa.setQ4( Integer.parseInt(rs.getString("q4"))); 
                pesquisa.setDt_pesq(rs.getString("dt_pesq")); 
                lista.add(pesquisa);
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return lista;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }   
   
   public boolean exPesqId(Pesquisa pesquisa) throws ClassNotFoundException{
    //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "DELETE from pesquisa where pk_id = " + pesquisa.getId();
            stmt.executeUpdate(sql);            
            conexao.close();            
            return true;
            
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    } 
   
   public boolean altPesq(Pesquisa p_pesq) throws ClassNotFoundException {
        //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();
                        //UPDATE pesquisa SET dt_pesq='2024-11-13', nome='Carla', email='carla@umc.br', q1=5, q2=5, q3=5, q4=5 WHERE pkid = 7                      
            String sql = "UPDATE pesquisa SET dt_pesq='" + p_pesq.getDt_pesq()+ "'" +
                                                    ", nome='" + p_pesq.getNome()+ "'" +
                                                    ", email='" + p_pesq.getEmail() + "'" +
                                                    ", q1=" + p_pesq.getQ1()+ 
                                                    ", q2=" + p_pesq.getQ2()+ 
                                                    ", q3=" + p_pesq.getQ3()+ 
                                                    ", q4=" + p_pesq.getQ4() + " WHERE pkid = " + p_pesq.getId();
                         
            stmt.executeUpdate(sql); // Executa o SQL: Insert / Delete ou Update
                        
            conexao.close();
            return true;
        }catch(SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return false;
        }                 
    } 
}
