using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApGlosowanie.edytor
{
    public partial class edytorKont : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //String hash = FormsAuthentication.HashPasswordForStoringInConfigFile(Convert.ToString("admin"), "SHA1");
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String haslo = Convert.ToString(e.NewValues["Haslo"]);//e.OldValues["Haslo"]);
            
            String hash = FormsAuthentication.HashPasswordForStoringInConfigFile(Convert.ToString(haslo), "SHA1");
            e.NewValues["Haslo"] = hash;
        }

        protected void dodajKonto(object sender, EventArgs e)
        {
            //dodawanie parametrow
            this.sql_ds_uzytkownicy.InsertParameters["Id"].DefaultValue = ((TextBox)this.GridView1.FooterRow.FindControl("tb_login")).Text;

            String haslo = ((TextBox)this.GridView1.FooterRow.FindControl("tb_haslo")).Text;
            String hash = FormsAuthentication.HashPasswordForStoringInConfigFile(Convert.ToString(haslo), "SHA1");

            this.sql_ds_uzytkownicy.InsertParameters["Haslo"].DefaultValue = hash;
            this.sql_ds_uzytkownicy.InsertParameters["Rola"].DefaultValue = ((DropDownList)this.GridView1.FooterRow.FindControl("ddl_rola")).SelectedValue;

            //insert
            this.sql_ds_uzytkownicy.Insert();
        }
    }
}