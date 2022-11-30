package com.java;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
import com.java.Product;  

public class ProductDAO {
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}  
	public static int save(Product p){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into products(name,category,price,qty) values(?,?,?,?)");  
	        ps.setString(1,p.getName());  
	        ps.setString(2,p.getCategory());  
	        ps.setInt(3,p.getPrice());  
	        ps.setInt(4,p.getQty());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static int saveToCart(Product p){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into cart(name,category,price,qty) values(?,?,?,?)");  
	        ps.setString(1,p.getName());  
	        ps.setString(2,p.getCategory());  
	        ps.setInt(3,p.getPrice());  
	        ps.setInt(4,p.getQty());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  

	public static int update(Product p){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"update products set name=?,category=?,price=?,qty=? where id=?");  
	        ps.setString(1,p.getName());  
	        ps.setString(2,p.getCategory());  
	        ps.setInt(3,p.getPrice());  
	        ps.setInt(4,p.getQty());  
	        ps.setInt(6,p.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static int delete(Product p){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from products where id=?");  
	        ps.setInt(1,p.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
	
	public static int deleteFromCart(Product p){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from cart where id=?");  
	        ps.setInt(1,p.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  

	public static List<Product> getAllRecords(){  
	    List<Product> list=new ArrayList<Product>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from products");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            Product p=new Product();  
	            p.setId(rs.getInt("id"));  
	            p.setName(rs.getString("name"));  
	            p.setCategory(rs.getString("category"));  
	            p.setPrice(rs.getInt("price"));  
	            p.setQty(rs.getInt("qty"));  
	            list.add(p);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	public static Product getRecordById(int id){  
	    Product p=null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from products where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            p=new Product();  
	            p.setId(rs.getInt("id"));  
	            p.setName(rs.getString("name"));  
	            p.setCategory(rs.getString("category"));  
	            p.setPrice(rs.getInt("price"));  
	            p.setQty(rs.getInt("qty"));  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return p;  

	
}
}
