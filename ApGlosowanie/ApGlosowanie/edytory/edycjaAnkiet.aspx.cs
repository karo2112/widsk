using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApGlosowanie.edytor
{
    public partial class edycjaAnkiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            String a = ((DropDownList)this.gv_ankiety.FooterRow.FindControl("ddl_godzina")).SelectedValue;

            if (!Page.IsPostBack)
            {
                this.gv_ankiety.Columns[this.gv_ankiety.Columns.Count - 1].Visible = false;
                this.gv_ankiety.Columns[this.gv_ankiety.Columns.Count - 2].Visible = false;
            }
        }

        protected void gv_ankiety_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //sklejanie daty z godzina i minutami
            String dataZakonczeniaS = Convert.ToString(e.NewValues["DataZakonczenia"]);
            String godzina = Convert.ToString(e.NewValues["Godzina"]);
            String minuta = Convert.ToString(e.NewValues["Minuta"]);

            DateTime dataZakonczenia = DateTime.Parse(dataZakonczeniaS);
            dataZakonczenia = dataZakonczenia.AddHours(Convert.ToInt32(godzina));
            dataZakonczenia = dataZakonczenia.AddMinutes(Convert.ToInt32(minuta));

            e.NewValues["DataZakonczenia"] = dataZakonczenia.ToString();

            //tu sprawdzenie, czy mozna wstawic...
            //czy nie wstecz, jaki stan etc...
            /*
            {
            e.Cancel = true;
            this.gv_ankiety.Columns[this.gv_ankiety.Columns.Count - 1].Visible = false;
            this.gv_ankiety.Columns[this.gv_ankiety.Columns.Count - 2].Visible = false;
            }
            */
        }

        protected void gv_ankiety_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            /*
            this.hf_id_ankiety = 
            int a = 2;
            
            int a = (sender as GridView).SelectedIndex;
            */
            //wybrano dana ankiete
            this.sql_ds_pytania.SelectParameters["IdTestu"].DefaultValue = Convert.ToString((sender as GridView).SelectedIndex);

            this.tbl_ankiety.Visible = false;
        }

        protected void gv_ankiety_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.gv_ankiety.Columns[this.gv_ankiety.Columns.Count - 1].Visible = true;
            this.gv_ankiety.Columns[this.gv_ankiety.Columns.Count - 2].Visible = true;
        }

        protected void gv_ankiety_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.gv_ankiety.Columns[this.gv_ankiety.Columns.Count - 1].Visible = false;
            this.gv_ankiety.Columns[this.gv_ankiety.Columns.Count - 2].Visible = false;
        }

        protected void gv_ankiety_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.gv_ankiety.Columns[this.gv_ankiety.Columns.Count - 1].Visible = false;
            this.gv_ankiety.Columns[this.gv_ankiety.Columns.Count - 2].Visible = false;
        }

        protected void dodajAnkiete(object sender, EventArgs e)
        {
            //dodawanie parametrow
            this.sql_ds_ankiety.InsertParameters["Nazwa"].DefaultValue = ((TextBox)this.gv_ankiety.FooterRow.FindControl("tb_nazwa_ankiety")).Text;
            this.sql_ds_ankiety.InsertParameters["Stan"].DefaultValue = ((DropDownList)this.gv_ankiety.FooterRow.FindControl("ddl_stan_ankiety_ins")).SelectedValue;

            //sklejanie daty z godzina i minutami
            String godzina = ((DropDownList)this.gv_ankiety.FooterRow.FindControl("ddl_godzina")).SelectedValue;
            String minuta = ((DropDownList)this.gv_ankiety.FooterRow.FindControl("ddl_minuta")).SelectedValue;

            DateTime dataZakonczenia = ((Calendar)this.gv_ankiety.FooterRow.FindControl("cal_koniec")).SelectedDate;
            dataZakonczenia = dataZakonczenia.AddHours(Convert.ToInt32(godzina));
            dataZakonczenia = dataZakonczenia.AddMinutes(Convert.ToInt32(minuta));

            this.sql_ds_ankiety.InsertParameters["DataZakonczenia"].DefaultValue = dataZakonczenia.ToString();

            //znowu sprawdzanie...

            //insert
            this.sql_ds_ankiety.Insert();
        }

        protected void dodajPytanie(object sender, EventArgs e)
        {
            /*
            //dodawanie parametrow
            this.sql_ds_ankiety.InsertParameters["Nazwa"].DefaultValue = ((TextBox)this.gv_ankiety.FooterRow.FindControl("tb_nazwa_ankiety")).Text;
            this.sql_ds_ankiety.InsertParameters["Stan"].DefaultValue = ((DropDownList)this.gv_ankiety.FooterRow.FindControl("ddl_stan_ankiety_ins")).SelectedValue;

            //sklejanie daty z godzina i minutami
            String godzina = ((DropDownList)this.gv_ankiety.FooterRow.FindControl("ddl_godzina")).SelectedValue;
            String minuta = ((DropDownList)this.gv_ankiety.FooterRow.FindControl("ddl_minuta")).SelectedValue;

            DateTime dataZakonczenia = ((Calendar)this.gv_ankiety.FooterRow.FindControl("cal_koniec")).SelectedDate;
            dataZakonczenia = dataZakonczenia.AddHours(Convert.ToInt32(godzina));
            dataZakonczenia = dataZakonczenia.AddMinutes(Convert.ToInt32(minuta));

            this.sql_ds_ankiety.InsertParameters["DataZakonczenia"].DefaultValue = dataZakonczenia.ToString();

            //znowu sprawdzanie...

            //insert
            this.sql_ds_ankiety.Insert();
            */
        }

        protected void gv_pytania_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}