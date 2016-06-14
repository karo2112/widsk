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

        public bool CzyUzytkownikAutoryzowany(int rolaWymagana, String id, String kodJednorazowy)
        {
            try
            {
                con.Open();

                SqlCommand cmd = con.CreateCommand();

                cmd.CommandType = System.Data.CommandType.Text;

                cmd.CommandText = "SELECT COUNT(*) FROM Uzytkownicy WHERE Id = @Id AND KodJednorazowy = @KodJednorazowy AND Rola = @Rola";

                cmd.Parameters.Add("Id", SqlDbType.NVarChar);
                cmd.Parameters["Id"].Value = id;

                cmd.Parameters.Add("KodJednorazowy", SqlDbType.NVarChar);
                cmd.Parameters["KodJednorazowy"].Value = kodJednorazowy;

                cmd.Parameters.Add("Rola", SqlDbType.Int);
                cmd.Parameters["Rola"].Value = rolaWymagana;

                Object wynik = cmd.ExecuteScalar();

                if (wynik != null)
                {
                    return true;
                }
            }
            catch (Exception e)
            {

            }           

            return false;
        }
    }
}