package career.connection;

import java.sql.*;

public class ConnectionProvider
{
	public static Connection makeConnection()
	{
		Connection con=null;
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","607997");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
}