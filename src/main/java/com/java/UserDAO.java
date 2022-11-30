package com.java;


//import java.util.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

	public static Connection getConnection(){
		Connection con=null;
		try{
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","");
		}catch(Exception e){System.out.println(e);}
		return con;
	}
	
	public static int save(User u){
		int status=0;
		try{
			Connection con=UserDAO.getConnection();
			PreparedStatement ps=con.prepareStatement("insert into users(name,password,email,address,phone) values (?,?,?,?,?)");
			ps.setString(1,u.getName());
			ps.setString(2,u.getPassword());
			ps.setString(3,u.getEmail());
			ps.setString(4,u.getAddress());
			ps.setString(5,u.getPhone());
		
			status=ps.executeUpdate();
			con.close();
		}catch(Exception ex){ex.printStackTrace();}
		
		return status;
	}
	
	public static List<User> getAllUsers(){
		List<User> list=new ArrayList<User>();
		
		try{
			Connection con=UserDAO.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from users");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				User u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setPassword(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setAddress(rs.getString(5));
				u.setPhone(rs.getString(6));
				list.add(u);
			}
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
		return list;
	}

	public static User getUserById(int id){
		User u=new User();
		
		try{
			Connection con=UserDAO.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from users where id=?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setPassword(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setAddress(rs.getString(5));
				u.setPhone(rs.getString(6));

			}
			con.close();
		}catch(Exception ex){ex.printStackTrace();}
		
		return u;
	}
	public static User getUserByName(String name){
		User u=new User();
		
		try{
			Connection con=UserDAO.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from users where name=?");
			ps.setString(1,name);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setPassword(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setAddress(rs.getString(5));
				u.setPhone(rs.getString(6));

			}
			con.close();
		}catch(Exception ex){ex.printStackTrace();}
		
		return u;
	}

	public static int update(User u){
		int status=0;
		try{
			Connection con=UserDAO.getConnection();
			PreparedStatement ps=con.prepareStatement("update users set name=?,password=?,email=?,address=?,phone=? where id=?");
			ps.setString(1,u.getName());
			ps.setString(2,u.getPassword());
			ps.setString(3,u.getEmail());
			ps.setString(4,u.getAddress());
			ps.setString(5,u.getPhone());
			ps.setInt(6,u.getId());
			
			status=ps.executeUpdate();
			
			con.close();
		}catch(Exception ex){ex.printStackTrace();}
		
		return status;
	}
	public static int delete(int id){
		int status=0;
		try{
			Connection con=UserDAO.getConnection();
			PreparedStatement ps=con.prepareStatement("delete from users where id=?");
			ps.setInt(1,id);
			status=ps.executeUpdate();
			
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
		return status;
	}

}
