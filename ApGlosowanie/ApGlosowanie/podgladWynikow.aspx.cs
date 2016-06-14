using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApGlosowanie
{
    //mozna podejrzec wyniki ankiet ktore trwaja, lub sa zakonczone - >0
    //a co z data?
    public partial class podgladWynikow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.podglWynikow.Visible = false;
            this.menu.Visible = false;
        }

        protected void gv_ankiety_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dvSql = (DataView)this.sql_ds_ankiety.Select(DataSourceSelectArguments.Empty);
            String id_ankiety = Convert.ToString(dvSql[this.gv_ankiety.SelectedIndex][0]);
            this.sql_ds_wyniki_ankiety.SelectParameters["IdAnkiety"].DefaultValue = id_ankiety;

            this.podglWynikow.Visible = true;
            this.menu.Visible = true;
            this.podglAnkiet.Visible = false;
        }

        protected void bt_powrot_Click(object sender, EventArgs e)
        {
            //ukryj wyniki
            this.podglWynikow.Visible = false;
            this.menu.Visible = false;
            this.podglAnkiet.Visible = true;
        }

        protected void bt_powrot_gl_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }
    }
}