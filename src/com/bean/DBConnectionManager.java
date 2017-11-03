package com.bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionManager
{
	private String DriverName;
	private String url="jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=utf-8&useSSL=true";
	private String user="root";
	private String password="123456";
	public String getDriverName() {
		return DriverName;
	}
	public void setDriverName(String driverName) {
		DriverName = driverName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url,user,password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

}
