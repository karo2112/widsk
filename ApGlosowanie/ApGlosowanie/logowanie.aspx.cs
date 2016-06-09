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
            /*
            String redir = Request.QueryString["r"];
            String login = Request.QueryString["l"];
            String haslo = Request.QueryString["h"];
            */
            int a = 2;
        }

        protected void Zaloguj(String login, String haslo, String redir)
        {
            //sprawdz, czy istnieje, jesli tak to zwroc jego role


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

            int rola = uw.CzyUzytkownikIstnieje(login, haslo);

            if (rola > -1)
            {
                myCookie = new HttpCookie("daneLogowania");
                myCookie.Expires = DateTime.Now.AddMinutes(30);//ile? 30 min?

                myCookie["ro"] = Convert.ToString(rola);

                Response.Cookies.Add(myCookie);

                Response.Redirect(redir);
            }
        }

        protected void bt_zaloguj_Click(object sender, EventArgs e)
        {
            //this.Zaloguj(this.tb_login.Text, FormsAuthentication.HashPasswordForStoringInConfigFile(this.tb_haslo.Text, "SHA1"));
        }
    }
}