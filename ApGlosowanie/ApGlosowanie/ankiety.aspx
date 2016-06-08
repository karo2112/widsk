<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ankiety.aspx.cs" Inherits="ApGlosowanie.ankiety" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Lista ankiet</h1>
        <p>
            <asp:GridView ID="gv_ankiety" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sql_ds_ankiety" EnableModelValidation="True" OnSelectedIndexChanged="gv_ankiety_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                    <asp:BoundField DataField="Stan" HeaderText="Stan" SortExpression="Stan" Visible="False" />
                    <asp:BoundField DataField="DataZakonczenia" HeaderText="DataZakonczenia" SortExpression="DataZakonczenia" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sql_ds_ankiety" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" SelectCommand="SELECT a.Id, a.Nazwa, a.DataZakonczenia FROM Ankiety a WHERE GETDATE() <= a.DataZakonczenia AND a.Stan = 1;">
            </asp:SqlDataSource>
        </p>
    </div>
    </form>
</body>
</html>
