using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApGlosowanie
{
    public partial class ankieta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //jesli nie podano numeru ankiety
            if (Request.QueryString["nr"] == null)
            {
                Response.Redirect("~/ankiety.aspx");
            }

            //jest cookie? jesli nie, to utworz, z numerem pytania 1

            this.hf_nr_pytania.Value = Convert.ToString(this.WczytajAktywnePytanieZCookie());
            String pytanie = this.hf_nr_pytania.Value;
            
            ZaladujDanePytania();
            
            int a = 2;

            //jesli cos oznaczono wczesniej, odzyskaj te zaznaczenia
            WczytajOdpowiedzZCookie();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
            int a = Convert.ToInt32(this.DropDownList1.SelectedIndex);
//            string s = (DropDownList)sender.SelectedValue;
            
            //1) wez numer pytania z listy, zapisz go do cookie
            ZapiszAktywnePytanieDoCookie(Convert.ToInt32(this.DropDownList1.SelectedValue));
            //2) usun wszystkie elementy??
            //3) wywolaj ponownie page load?
            Response.Redirect("~/ankieta.aspx");
            */
            int va = 2;
        }

        //wyczysc wybor
        protected void Button2_Click(object sender, EventArgs e)
        {
            this.RadioButtonList1.ClearSelection();
            this.CheckBoxList1.ClearSelection();            
         }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (WczytajAktywnePytanieZCookie() < this.ddl_pytania.Items.Count)
            {
                //1) zapisz odpowiedz do cookie
                ZapiszOdpowiedzDoCookie();
                //2) zaktualizuj numer pytania
                ZapiszAktywnePytanieDoCookie(WczytajAktywnePytanieZCookie() + 1);
                //3) wywolaj ponownie page load?
                Response.Redirect("~/ankieta.aspx?nr=" + Request.QueryString["nr"]);
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (WczytajAktywnePytanieZCookie() > 1)
            {
                //1) zapisz odpowiedz do cookie
                ZapiszOdpowiedzDoCookie();
                //2) zaktualizuj numer pytania
                ZapiszAktywnePytanieDoCookie(WczytajAktywnePytanieZCookie() - 1);
                //3) wywolaj ponownie page load?
                Response.Redirect("~/ankieta.aspx?nr=" + Request.QueryString["nr"]);
            }
        }

        protected void bt_skocz_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(this.ddl_pytania.SelectedIndex);
            //            string s = (DropDownList)sender.SelectedValue;

            /*
            //1) zapisz odpowiedz do cookie
            ZapiszOdpowiedzDoCookie();
            //2) wez numer pytania z listy, zapisz go do cookie
            ZapiszAktywnePytanieDoCookie(Convert.ToInt32(this.ddl_pytania.SelectedValue));
            //3) wywolaj ponownie page load?
             */
            Response.Redirect("~/ankieta.aspx");
        }

        protected int WczytajAktywnePytanieZCookie()
        {
            if (Request.Cookies["DaneAnkiety"] != null)
            {
                if (Request.Cookies["DaneAnkiety"]["ap"] != null)
                {
                    //int a = Convert.ToInt32(Request.Cookies["DaneAnkiety"]["ap"]);
                    return Convert.ToInt32(Request.Cookies["DaneAnkiety"]["ap"]);
                }
            }

            return 1;
        }

        protected void ZapiszAktywnePytanieDoCookie(int numer)
        {
            HttpCookie myCookie = new HttpCookie("DaneAnkiety");

            if (Request.Cookies["DaneAnkiety"] != null)//.HasKeys)
            {
                System.Collections.Specialized.NameValueCollection pary = Request.Cookies["DaneAnkiety"].Values;

                for (int i = 0; i < pary.Count; i++)
                    myCookie[pary.GetKey(i)] = pary[pary.GetKey(i)];
            }

            Request.Cookies.Clear();

            myCookie["ap"] = Convert.ToString(numer);

            myCookie.Expires = DateTime.Now.AddDays(1d);//ile? 30 min?
            Response.Cookies.Add(myCookie);
        }

        protected void ZaladujDanePytania()
        {
            //wszystkie wczytane odpowiedzi
            DataView dvSql = (DataView)this.sql_ds_pytania.Select(DataSourceSelectArguments.Empty);


            //znajdz indeks wiersza ze zgodnym numerem
            int qIndex = 0;
            int nr_pyt = Convert.ToInt32(this.hf_nr_pytania.Value);
            //trzeba jednak sprawdzac w petli, bo pytania moga byc nie po kolei?
            //wymusic tez przy tworzeniu, ze aktywna ankieta nie moze byc pusta!! 
            for (int i = 0; i < dvSql.Count; i++)
                if (Convert.ToInt32(dvSql[i][0]) == nr_pyt)
                {
                    qIndex = i;
                    i = dvSql.Count;
                }

            //error indeksu
            //nr,tresc,wielokr,wymagana odp
            this.lb_tresc_pytania.Text = "Pytanie " + dvSql[qIndex][0].ToString() + ". " + dvSql[qIndex][1].ToString();

            if (Convert.ToBoolean(dvSql[qIndex][2].ToString()))
            {
                this.CheckBoxList1.Visible = true;
                this.RadioButtonList1.Visible = false;

                this.lb_tresc_pytania.Text += "(" + "proszę zaznaczyć conajmniej jedną odpowiedź" + ")";
            }
            else
            {
                this.CheckBoxList1.Visible = false;
                this.RadioButtonList1.Visible = true;

                this.lb_tresc_pytania.Text += "(" + "proszę zaznaczyć tylko jedną odpowiedź" + ")";
            }

            this.ddl_pytania.SelectedIndex = 0;

            //wymagana odpowiedz
            if (Convert.ToBoolean(dvSql[qIndex][3].ToString()))
            {
                this.lb_typ_pytania.Text = "To pytanie wymaga odpowiedzi.";
            }
            else
            {
                this.lb_typ_pytania.Text = "To pytanie nie wymaga odpowiedzi.";
            }

            this.Label3.Text = dvSql[qIndex][0] + "|" + dvSql[qIndex][1] + "|" + dvSql[qIndex][2] + "|" + dvSql[qIndex][3];
        }

        protected void ZapiszOdpowiedzDoCookie()
        {
            HttpCookie myCookie = new HttpCookie("DaneAnkiety");

            //numer ankiety?
            string klucz = "p" + this.hf_nr_pytania.Value;

            if (this.RadioButtonList1.Visible == true)
            {
                if (this.RadioButtonList1.SelectedIndex < 0)
                    return;

                if (Request.Cookies["DaneAnkiety"] != null)//.HasKeys)
                {
                    System.Collections.Specialized.NameValueCollection pary = Request.Cookies["DaneAnkiety"].Values;

                    for (int i = 0; i < pary.Count; i++)
                        myCookie[pary.GetKey(i)] = pary[pary.GetKey(i)];
                }

                myCookie[klucz] = Convert.ToString(this.RadioButtonList1.SelectedValue);
                //myCookie[klucz] = Convert.ToString(this.RadioButtonList1.SelectedIndex);
            }
            else
            {
                string wartosc = "";

                for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
                    if (this.CheckBoxList1.Items[i].Selected == true)
                        wartosc += Convert.ToString(i) + "_";

                if (String.Compare(wartosc, "") == 0)
                    return;

                if (Request.Cookies["DaneAnkiety"] != null)//.HasKeys)
                {
                    System.Collections.Specialized.NameValueCollection pary = Request.Cookies["DaneAnkiety"].Values;

                    for (int i = 0; i < pary.Count; i++)
                        myCookie[pary.GetKey(i)] = pary[pary.GetKey(i)];
                }

                myCookie[klucz] = wartosc.Substring(0, wartosc.Length - 1);
            }


            myCookie.Expires = DateTime.Now.AddDays(1d);//ile? 30 min?
            Response.Cookies.Add(myCookie);

        }

        protected void WczytajOdpowiedzZCookie()
        {//a co jesli nie jest liczba etc...
            if (Request.Cookies["DaneAnkiety"] != null)
            {
                string wybraneOdpowiedzi = "";
                string[] wybraneIndeksy;

                string klucz = "p";

                klucz += this.hf_nr_pytania.Value;

                if (Request.Cookies["DaneAnkiety"][klucz] != null)
                    wybraneOdpowiedzi = Request.Cookies["DaneAnkiety"][klucz];

                if (wybraneOdpowiedzi.CompareTo("") == 0)
                    return;

                wybraneIndeksy = wybraneOdpowiedzi.Split('_');

                /*
                if (this.CheckBoxList1.Visible == true)
                {
                    if (this.CheckBoxList1.Items != null)
                        for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
                        {
                            //na wszelki wypadek (no gdyby ktos np dopisal w cookie wiecej odp niz jest i np z indeksem wyzszym niz zakres...)
                            for (int j = 0; j < wybraneIndeksy.Length; j++)
                                if (Convert.ToInt32(wybraneIndeksy[j]) == i)
                                    this.CheckBoxList1.Items[i].Selected = true;
                        }
                }
                else
                {//cos jest do dupy. nie zmienia sie odpowiedz
                    //tu tez
                    if (this.RadioButtonList1.Items != null)//gowno
                        if (wybraneIndeksy.Length > 0)// && Convert.ToInt32(wybraneIndeksy[0]) < this.RadioButtonList1.Items.Count)     
                            this.RadioButtonList1.SelectedIndex = Convert.ToInt32(wybraneIndeksy[0]);
                }
                */
            }
        }
    }
}