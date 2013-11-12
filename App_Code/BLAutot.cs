using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// Summary description for BLAutot
/// </summary>
public class BLAutot
{   
    static Regex _rekkariregex = new Regex(@"^[A-Za-z]{1,3}-\d{1,3}$");
	public BLAutot()
	{
    
		//
		// TODO: Add constructor logic here
		//
	}

    public static bool isValidRekkari(string s)
    {
        Match match = _rekkariregex.Match(s);
        if (match.Success)
        {
            return true;
        }
        else
        {
            return false;

        }
    }

    public static bool isValidHinta(string p)
    {
        try 
	{
        int i = Int32.Parse(p);
           if(i >= 0)
               return true;
	}
	catch (Exception)
	{
		
	return false;	
	}
        return false;

    }
}