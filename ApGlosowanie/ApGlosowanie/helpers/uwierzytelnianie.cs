using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ApGlosowanie.helpers
{       
    public class Uwierzytelnianie
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs_glosowanie"].ConnectionString);

        //jesli istnieje, zwroc jego role
        public Int32 CzyUzytkownikIstnieje(String login, String haslo)
        {
            try
            {
                con.Open();

                SqlCommand cmd = con.CreateCommand();

                cmd.CommandType = System.Data.CommandType.Text;

                cmd.CommandText = "SELECT Rola FROM Uzytkownicy WHERE Id = @Id AND Haslo = @Haslo";

                cmd.Parameters.Add("Id", SqlDbType.NVarChar);
                cmd.Parameters["Id"].Value = login;

                cmd.Parameters.Add("Haslo", SqlDbType.NVarChar);
                cmd.Parameters["Haslo"].Value = haslo;

                Object rola = cmd.ExecuteScalar();

                if (rola != null)
                {
                    return Convert.ToInt32(rola);
                }
            }
            catch (Exception e)
            {
                
            }

            return -1;
        }
    }
}