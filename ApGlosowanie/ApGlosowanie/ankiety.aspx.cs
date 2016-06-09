using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApGlosowanie
{
    public partial class ankiety : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gv_ankiety_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dvSql = (DataView)this.sql_ds_ankiety.Select(DataSourceSelectArguments.Empty);
            String id_pytania = Convert.ToString(dvSql[this.gv_ankiety.SelectedIndex][0]);
            Response.Redirect("~/logowanie.aspx?r=~/ankieta.aspx?nr=" + id_pytania);//Response.Redirect("~/ankieta.aspx?nr=" + id_pytania);
        }
    }
}