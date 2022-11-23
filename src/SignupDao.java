package career.dao;

import java.sql.*;
import career.connection.*;
import career.dto.*;

public class SignupDao
{
	public static int newuser_save(SignupBean ob)
	{
		int z=0;
		try
		{
			Connection con = ConnectionProvider.makeConnection();
			PreparedStatement ps = con.prepareStatement("insert into dp_signup values(?,?,?,?,?,?,?,?,?,?)");	
			ps.setString(1,ob.getChoose());
			ps.setString(2,ob.getPassword());
			ps.setString(3,ob.getFirst());
			ps.setString(4,ob.getLast());
			ps.setString(5,ob.getGender());
			ps.setString(6,ob.getDob());
			ps.setString(7,ob.getAddress());
			ps.setString(8,ob.getCountry());
			ps.setString(9,ob.getMobile());
			ps.setString(10,ob.getEmail());
			z = ps.executeUpdate();
			
		}
		catch(Exception e)
		{
			
		}
		return z;
	}
}
