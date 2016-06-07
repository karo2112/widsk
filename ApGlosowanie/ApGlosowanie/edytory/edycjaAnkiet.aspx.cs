using System;
using System.Collections.Generic;
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

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //String data = (this.gv_ankiety.FindControl("awwdw") as TextBox).ToString();
            //tb_data_zakonczenia
            //String data = (this.gv_ankiety.FindControl("tb_data_zakonczenia") as TextBox).ToString();
            //String data = (this.gv_ankiety.FindControl("Calendar1") as Calendar).ToString();//.SelectedDate.ToString();
            int a = 2;

            /*
                             <asp:Parameter Name="Nazwa" Type="String" />
                <asp:Parameter Name="Stan" Type="Int32" />
                <asp:Parameter Name="DataZakonczenia" Type="DateTime" /> 
             */

            //e.OldValues["DataZakonczenia"] = "1999-01-02 00:00:00";
            Calendar cal;
            

            //this.sql_ds_ankiety.UpdateParameters["DataZakonczenia"].DefaultValue = "1999-01-02 00:00:00";
            
        }

        protected void sql_ds_ankiety_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            
            int a = 2;
            //e.Cancel = true;
            //String yolo = this.sql_ds_ankiety.UpdateParameters["DataZakonczenia"].DefaultValue;
            //this.sql_ds_ankiety.UpdateParameters["DataZakonczenia"].DefaultValue = "1999-01-02 00:00:00";
        }

        protected void gv_ankiety_SelectedIndexChanged(object sender, EventArgs e)
        {
            int a = 2;
        }
    }
}