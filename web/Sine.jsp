<%@page import="ProjetoSineBahia.SineBahia"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String Login= request.getParameter("sinenome");
            String Senha=request.getParameter("sinesenha");
            
            
            SineBahia sine= new SineBahia();
            
            sine.setSLogin(Login);
            sine.setSSenha(Senha);
            
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/cadastro", "root", "");
                
                //String sqlConsulta = "select * from cliente where nome=";
                 String sqlLogin = "SELECT * FROM login WHERE (nome,senha) LIKE'%'"; 
                //String sqlConsulta = "SELECT idTeste, Nome FROM teste WHERE Nome = 'Marcos'";
                
                PreparedStatement stmt2 = conexao.prepareStatement(sqlLogin);
                ResultSet rs = stmt2.executeQuery();
                
                while (rs.next()) {
                    if((Login==rs.getString("nome"))&&(Senha==rs.getString("senha"))){
                    
                    JOptionPane.showMessageDialog(null,"Logado");
                    
                 response.sendRedirect("Professor.html");
                    
                    
                    }
                        
                        
                        
                    
                }
                 
                    
                    }                
             catch (Exception e) {
                out.println("Erro ao selecionar dados " + e);
            }
        %>
    </body>
</html>