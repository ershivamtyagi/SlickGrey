package career.tag;

import career.dto.SignupBean;
import career.dao.SignupDao;
import javax.servlet.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.lang.reflect.*;

public class SignupInsert extends TagSupport
{
	private String mth[]={"setChoose","setPassword","setFirst","setLast","setGender","setDob","setAddress","setCountry","setMobile","setEmail"};	
	private String data;
	
	public void setData(String x)
	{
		data = x;
	}

	public int doStartTag()throws JspException
	{
		String str[] = data.split(",");
		
		try
		{
		Class cs = Class.forName("career.dto.SignupBean");
		Object ob = cs.newInstance();

		for(int i=0 ; i<mth.length ; i++)
		{
			Method mth1 = cs.getDeclaredMethod(mth[i],String.class);
			mth1.setAccessible(true);	
				for(int k=0 ; k<str.length ; k++)
				{
					if(str[k].startsWith(mth[i]))
					{
					String val = str[k].substring((str[k].indexOf(":")+1));
					mth1.invoke(ob,val);
					}
				}
		}

		SignupDao.newuser_save((SignupBean)ob);
		
		}
		catch(Exception e)
		{
		}
		return SKIP_BODY;
	}
}
