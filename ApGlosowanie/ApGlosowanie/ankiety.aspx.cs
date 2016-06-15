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
            String id_ankiety = Convert.ToString(dvSql[this.gv_ankiety.SelectedIndex][0]);
            Response.Redirect("~/logowanie.aspx?ro=0&re=~/ankieta.aspx?nr=" + id_ankiety);
            //Response.Redirect("~/ankieta.aspx?nr=" + id_ankiety);
        }
    }
}