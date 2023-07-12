package com.jobportal.jobportal.dao;

import com.jobportal.jobportal.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    public static int saveUser(User user)  {
       int i =0;
       try {
           Connection con = DbCon.getConn();
           PreparedStatement pst = con.prepareStatement("insert into users(user_name, user_email,user_pass,user_type, user_phone) values (?,?,?,?,?)");
           pst.setString(1, user.getUserName());
           pst.setString(2, user.getUserEmail());
           pst.setString(3, user.getUserPassword());
           pst.setInt(4, user.getUserType());
           pst.setInt(5, user.getUserPhone());
           i = (pst.executeUpdate());
           con.close();
       }
       catch (Exception e){
           e.printStackTrace();
       }
       return i;
    }
    public static List<User> getUsersByType(int typeId){
        List<User> userList = new ArrayList<>();
        ResultSet rs= null;
        try {
            Connection con= DbCon.getConn();
            PreparedStatement pst = con.prepareStatement("select * from users where user_type = ?");
            pst.setInt(1, typeId);
            rs = pst.executeQuery();
            while (rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("user_name"));
                user.setUserEmail(rs.getString("user_email"));
                user.setUserPassword(rs.getString("user_pass"));
                user.setUserType(rs.getInt("user_type"));
                user.setUserPhone(rs.getInt("user_phone"));
                userList.add(user);
            }
            con.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }

    public static User getUsersById(int Id){
        ResultSet rs= null;
        User myUser = new User();
        try {
            Connection con= DbCon.getConn();
            PreparedStatement pst = con.prepareStatement("select * from users where id = ?");
            pst.setInt(1, Id);
            rs = pst.executeQuery();
            while (rs.next()){
                myUser.setId(rs.getInt("id"));
                myUser.setUserName(rs.getString("user_name"));
                myUser.setUserEmail(rs.getString("user_email"));
                myUser.setUserPassword(rs.getString("user_pass"));
                myUser.setUserType(rs.getInt("user_type"));
                myUser.setUserPhone(rs.getInt("user_phone"));
            }
            con.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return myUser;
    }
    public static int updateUser(int Id, User myUser){
        int i=0;
        try {
            Connection con= DbCon.getConn();
            PreparedStatement pst = con.prepareStatement("UPDATE users SET user_name = ?, user_email = ?, user_pass = ?, user_type = ?, user_phone =? WHERE id = ?");
            pst.setString(1, myUser.getUserName());
            pst.setString(2, myUser.getUserEmail());
            pst.setString(3, myUser.getUserPassword());
            pst.setInt(4, myUser.getUserType());
            pst.setInt(5, myUser.getUserPhone());
            pst.setInt(6, Id);
            i = pst.executeUpdate();
            con.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
    public static int deleteUser(int id){
        int i=0;
        try {
            Connection con= DbCon.getConn();
            PreparedStatement pst = con.prepareStatement("DELETE from users where id = ?");
            pst.setInt(1,id);
            i = pst.executeUpdate();
            con.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static User auth(String email, String pass) {
        User authenticatedUser = null;
        try {
            Connection con = DbCon.getConn();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE user_email = ? AND user_pass = ?");
            pst.setString(1, email);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                authenticatedUser = new User();
                authenticatedUser.setId(rs.getInt("id"));
                authenticatedUser.setUserName(rs.getString("user_name"));
                authenticatedUser.setUserEmail(rs.getString("user_email"));
                authenticatedUser.setUserPassword(rs.getString("user_pass"));
                authenticatedUser.setUserType(rs.getInt("user_type"));
                authenticatedUser.setUserPhone(rs.getInt("user_phone"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return authenticatedUser;
    }


}
