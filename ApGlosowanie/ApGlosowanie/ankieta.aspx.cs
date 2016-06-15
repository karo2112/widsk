using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApGlosowanie
{
    /*do dokonczenia:
     * -waznosc cookie
     * -przekierowanie po zakonczeniu ankiety
     * -autoryzacja przed zakonczeniem?
     * 
     * cos sie je..wali przy wczytywaniu do ddl.. czasem.. (chociaz narazie jest ok...)
    */
    public partial class ankieta : System.Web.UI.Page
    {
        //potrzebne do zakonczenia ankiety
        protected System.Collections.Specialized.NameValueCollection paryAkt;

        protected void Page_Load(object sender, EventArgs e)
        {
            //jesli nie podano numeru ankiety
            if (Request.QueryString["nr"] == null)
            {
                Response.Redirect("~/ankiety.aspx");
            }

            //jest cookie? jesli nie, to utworz, z numerem pytania 1

            this.hf_nr_pytania.Value = Convert.ToString(this.WczytajAktywnePytanieZCookie());

            //testowe, lista pytan zawsze wskakuje na pierwsze, a i tak pozniej wywolujemy page_load...
            if (!Page.IsPostBack)
            {

                ZaladujDanePytania();

                //jesli cos oznaczono wczesniej, odzyskaj te zaznaczenia
                WczytajOdpowiedzZCookie();

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
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
                //taka kolejnosc jest OK!!!!!!
                //1) zaktualizuj numer pytania
                ZapiszAktywnePytanieDoCookie(WczytajAktywnePytanieZCookie() + 1);
                //2) zapisz odpowiedz do cookie
                ZapiszOdpowiedzDoCookie();
                //3) wywolaj ponownie page load
                Response.Redirect("~/ankieta.aspx?nr=" + Request.QueryString["nr"]);
            }         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (WczytajAktywnePytanieZCookie() > 1)
            {
                //taka kolejnosc jest OK!!!!!!
                //1) zaktualizuj numer pytania
                ZapiszAktywnePytanieDoCookie(WczytajAktywnePytanieZCookie() - 1);
                //2) zapisz odpowiedz do cookie
                ZapiszOdpowiedzDoCookie();
                //3) wywolaj ponownie page load
                Response.Redirect("~/ankieta.aspx?nr=" + Request.QueryString["nr"]);
            }
        }

        protected void bt_skocz_Click(object sender, EventArgs e)
        {
            //1) zaktualizuj numer pytania
            ZapiszAktywnePytanieDoCookie(Convert.ToInt32(this.ddl_pytania.SelectedValue));
            //2) zapisz odpowiedz do cookie
            ZapiszOdpowiedzDoCookie();
            //3) wywolaj ponownie page load
            Response.Redirect("~/ankieta.aspx?nr=" + Request.QueryString["nr"]);
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
            //wszystkie wczytane pytania
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
            //[NumerPytania], [Pytanie], [WielWybor], [WymaganaOdp]
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

            //sprobuj zaktualizowac
            this.ddl_pytania.SelectedValue = this.hf_nr_pytania.Value;

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

            Boolean nieDodawaj = false;
            Boolean moznaDodac = true;

            if (this.RadioButtonList1.Visible == true)
            {
                if (Request.Cookies["DaneAnkiety"] != null)//.HasKeys)
                {
                    System.Collections.Specialized.NameValueCollection pary = Request.Cookies["DaneAnkiety"].Values;

                    moznaDodac = true;
                    for (int i = 0; i < pary.Count; i++)
                    {
                        moznaDodac = true;

                        //jesli nic nie wybrano
                        if (this.RadioButtonList1.SelectedIndex < 0)
                        {
                            //to sprawdz czy jest wpis z takim kluczem, jesli tak, to nie dodawaj go
                            if(String.Compare(klucz, pary.GetKey(i)) == 0)
                            {
                                moznaDodac = false;
                                nieDodawaj = true;
                            }
                        }

                        if(moznaDodac)
                        {
                            myCookie[pary.GetKey(i)] = pary[pary.GetKey(i)];
                        }
                    }
                }

                if (!nieDodawaj)
                {
                    myCookie[klucz] = Convert.ToString(this.RadioButtonList1.SelectedValue);
                }
            }
            else
            {
                string wartosc = "";

                for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
                    if (this.CheckBoxList1.Items[i].Selected == true)
                        wartosc += Convert.ToString(CheckBoxList1.Items[i].Value) + "_";

                if (String.Compare(wartosc, "") != 0)
                    wartosc = wartosc.Substring(0, wartosc.Length - 1);
                
                if (Request.Cookies["DaneAnkiety"] != null)//.HasKeys)
                {
                    System.Collections.Specialized.NameValueCollection pary = Request.Cookies["DaneAnkiety"].Values;

                    for (int i = 0; i < pary.Count; i++)
                    {
                        //jesli nic nie wybrano
                        if (String.Compare(wartosc, "") == 0)
                        {
                            //to sprawdz czy jest wpis z takim kluczem, jesli tak, to nie dodawaj go
                            if (String.Compare(klucz, pary.GetKey(i)) == 0)
                            {
                                moznaDodac = false;
                                nieDodawaj = true;
                            }
                        }

                        if (moznaDodac)
                        {
                            myCookie[pary.GetKey(i)] = pary[pary.GetKey(i)];
                        }
                    }
                }

                if (!nieDodawaj)
                {
                    myCookie[klucz] = wartosc;
                }
            }

            //potrzene tylko do zakonczenia
            this.paryAkt = myCookie.Values;

            myCookie.Expires = DateTime.Now.AddDays(1d);//ile? 30 min?
            Response.Cookies.Add(myCookie);


        }

        protected void WczytajOdpowiedzZCookie()
        {//a co jesli nie jest liczba etc...

            //trzeba na sile wymusic!!!!
            this.CheckBoxList1.DataBind();
            this.RadioButtonList1.DataBind();

            if (Request.Cookies["DaneAnkiety"] != null)
            {
                string wybraneOdpowiedzi = "";
                string[] wybraneNumery;

                string klucz = "p";

                klucz += this.hf_nr_pytania.Value;

                if (Request.Cookies["DaneAnkiety"][klucz] != null)
                    wybraneOdpowiedzi = Request.Cookies["DaneAnkiety"][klucz];

                if (wybraneOdpowiedzi.CompareTo("") == 0)
                    return;

                wybraneNumery = wybraneOdpowiedzi.Split('_');

                
                if (this.CheckBoxList1.Visible == true)
                {
                    if (this.CheckBoxList1.Items != null)
                    {
                        for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
                        {
                            //na wszelki wypadek (no gdyby ktos np dopisal w cookie wiecej odp niz jest i np z indeksem wyzszym niz zakres...)
                            for (int j = 0; j < wybraneNumery.Length; j++)
                            {
                                if (Convert.ToInt32(wybraneNumery[j]) == Convert.ToInt32(this.CheckBoxList1.Items[i].Value))
                                    this.CheckBoxList1.Items[i].Selected = true;
                            }
                        }
                        
                    }
                }
                else
                {
                    if (this.RadioButtonList1.Items != null)
                    {
                        if (wybraneNumery.Length > 0)
                        {
                            this.RadioButtonList1.SelectedValue = wybraneNumery[0];
                        }
                    }
                }
                
            }
        }

        protected void UaktualnijLiczniki(List<KeyValuePair<int, List<int>>> pytOdp)
        {
            int a = 2;

            for (int i = 0; i < pytOdp.Count; i++)
            {
                this.sql_ds_odpowiedzi.UpdateParameters["NumerPytania"].DefaultValue = Convert.ToString(pytOdp[i].Key);
                for (int j = 0; j < pytOdp[i].Value.Count; j++)
                {
                    this.sql_ds_odpowiedzi.UpdateParameters["NumerOdpowiedzi"].DefaultValue = Convert.ToString(pytOdp[i].Value[j]);
                    //update
                    this.sql_ds_odpowiedzi.Update();
                }
            }
        }

        protected void bt_zakoncz_Click(object sender, EventArgs e)
        {
            //1. Zapisz aktualna odpowiedz
            ZapiszOdpowiedzDoCookie();

            //2. Pobierz liste wszystkich odpowiedzi zapisanych do cookie
            //a) lista kluczy
            String[] klucze = null;

            if(this.paryAkt != null)
                klucze = this.paryAkt.AllKeys;

            List<KeyValuePair<int, List<int>>> pytOdp = new List<KeyValuePair<int,List<int>>>();

            if (klucze != null)
            {
                for (int i = 0; i < klucze.Length; i++)
                {
                    if (String.Compare(klucze[i], "ap") != 0)
                    {
                        String[] odpS = this.paryAkt[klucze[i]].Split('_');

                        List<int> odp = new List<int>();

                        for (int j = 0; j < odpS.Length; j++)
                        {
                            if (!String.IsNullOrEmpty(odpS[j]))
                            {
                                odp.Add(Convert.ToInt32(odpS[j]));
                            }
                        }

                        pytOdp.Add(new KeyValuePair<int, List<int>>(Convert.ToInt32(klucze[i].Substring(1)), odp));
                    }
                }
            }

            //3. Majac pary pytanie - odpowiedzi, sprawdz czy na wymagane udzielono >= 1 odpowiedzi
            
            //lista wszystkich pytan
            DataView dvSql = (DataView)this.sql_ds_pytania.Select(DataSourceSelectArguments.Empty);

            Boolean udzielonoOdp = false;
            //dla kazdego pytania...
            for (int i = 0; i < dvSql.Count; i++)
            {
                udzielonoOdp = false;
                //[NumerPytania], [Pytanie], [WielWybor], [WymaganaOdp]
                if (Convert.ToBoolean(dvSql[i][3]) == false)
                {
                    //jesli nie jest wymagana odpowiedz, to przejdz dalej
                    udzielonoOdp = true;
                }

                if (udzielonoOdp == false)
                {
                    int nrPytania = Convert.ToInt32(dvSql[i][0]);
                    int indeks = 0;

                    for (int j = 0; j < pytOdp.Count; j++)
                    {
                        //jesli numer pytania jest taki sam, i liczba wybranych odpowiedzi > 0
                        if (pytOdp[j].Key == nrPytania && pytOdp[j].Value.Count > 0)
                        {
                            indeks = j;
                            j = pytOdp.Count;
                            udzielonoOdp = true;
                        }
                    }           
                }

                //jesli tutaj sprawdzono, ze nie udzielono odpowiedz, to... koniec... nie wypelniono wymaganych elementow ankiety
                if (udzielonoOdp == false)
                {
                    i = dvSql.Count;
                }
            }


            //4. Jesli nie udzielono odpowiedzi, to wyswietl powiadomienie, ze trzeba wypelnic wymagane pytania
            if (udzielonoOdp == false)
            {
                this.lb_wym_pytania.Text = "Proszę wypełnić wszystkie wymagane pytania."; 
                return;
            }

            //sprawdz kod jednorazowy??

            this.UaktualnijLiczniki(pytOdp);

            //przekieruj do listy ankiet czy do glownego?
            //na razie do listy ankiet
            Response.Redirect("~/ankiety.aspx");
        }
    }
}