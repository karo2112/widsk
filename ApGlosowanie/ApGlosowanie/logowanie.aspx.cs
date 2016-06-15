using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ApGlosowanie.helpers;

namespace ApGlosowanie
{
    public partial class logowanie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //aby przeszlo
            //Response.Redirect(Request.QueryString["re"]);
            
            
            //rola, ktora wymaga strona
            String rola = Request.QueryString["ro"];
            //przekierowanie
            String re = Request.QueryString["re"];
            
            if (rola == null || re == null)
            {
                Response.Redirect("~/default.aspx");
            }

            
            String id = "";
            String kj = "";

            //String aa = Request.Cookies["daneLogowania"].ToString();
            if (Request.Cookies["daneLogowania"] != null)
            {
                id = Request.Cookies["daneLogowania"]["id"];
                kj = Request.Cookies["daneLogowania"]["kj"];
            }

            /*
            //jesli cookie niepopawny, zaloguj
            //if(String.IsNullOrEmpty(id
            int a = 2;

            //sprawdz czy jest cookie
            //jesli jest to sprawdz kod jednorazowy
            //jesli jest ok, to sprawdz, czy zwrocona rola jest zgodna z dopuszczalna dla strony

            Uwierzytelnianie uw = new Uwierzytelnianie();

            //if (Request.Cookies["DaneAnkiety"]["kj"] != null)
            uw.CzyUzytkownikAutoryzowany(Convert.ToInt32(rola), Request.Cookies["daneLogowania"]["id"], Request.Cookies["daneLogowania"]["kj"]);

            */
        }

        

        protected void Zaloguj(String login, String haslo, String redir)
        {
            //na wszelki wypadek proba usuniecia pozostalych cookie
            HttpCookie myCookie = new HttpCookie("DaneAnkiety");
            myCookie.Expires = DateTime.Now.AddDays(-1d);//ile? 30 min?

            Response.Cookies.Add(myCookie);

            //na wszelki wypadek proba usuniecia pozostalych cookie
            myCookie = new HttpCookie("daneLogowania");
            myCookie.Expires = DateTime.Now.AddDays(-1d);//ile? 30 min?

            Response.Cookies.Add(myCookie);

            Request.Cookies.Clear();
            Response.Cookies.Clear();

            Uwierzytelnianie uw = new Uwierzytelnianie();

            //sprawdz, czy istnieje, jesli tak to zwroc jego role
            int rola = uw.CzyUzytkownikIstnieje(login, haslo);

            if (rola > -1)
            {
                myCookie = new HttpCookie("daneLogowania");
                myCookie.Expires = DateTime.Now.AddMinutes(30);//ile? 30 min?

                myCookie["ro"] = Convert.ToString(rola);

                myCookie["id"] = login;

                String kodJednorazowy = FormsAuthentication.HashPasswordForStoringInConfigFile(login + haslo, "SHA1");
                myCookie["kj"] = kodJednorazowy;

                uw.UstawKodJednorazowy(login, kodJednorazowy);

                Response.Cookies.Add(myCookie);

                Response.Redirect(redir);
            }
            else
            {
                //przekieruj do? ankiety?
                //wyswietl info??
                Response.Redirect("~/ankiety.aspx");
            }
        }

        protected void bt_zaloguj_Click(object sender, EventArgs e)
        {
            String redir = Request.QueryString["re"];

            this.Zaloguj(this.tb_login.Text, FormsAuthentication.HashPasswordForStoringInConfigFile(this.tb_haslo.Text, "SHA1"), redir);
        }
    }
}