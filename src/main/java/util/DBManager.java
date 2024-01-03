package util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.*;

public class DBManager {
	
	public static Connection getConnection() throws Exception {
	      Connection conn = null;
	      
	      try {
	    	  Context init = new InitialContext();
		      Context env = (Context)init.lookup("java:/comp/env");
		      DataSource ds = (DataSource)env.lookup("jdbc/myoracle");
		      
		      conn = ds.getConnection();
	      } catch(Exception e)
	      {
	    	  e.printStackTrace();
	      }
	      
	      return conn;
	      
	   }
	
	
	   public static void close(Connection conn, Statement stmt)
	   {
		   try {
			   if(conn != null)
				   conn.close();
			   if(stmt != null)
				   conn.close();
		
		   } catch(Exception e)
		   {
			   e.printStackTrace();
		   }
	   }
	   
	   public static void close(Connection conn, Statement stmt, ResultSet rs)
	   {
		   try {
			   if(conn != null)
				   conn.close();
			   if(stmt != null)
				   conn.close();
			   if(rs != null)
				   rs.close();
		
		   } catch(Exception e)
		   {
			   e.printStackTrace();
		   }
	   }

}
