<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edycjaAnkiet.aspx.cs" Inherits="ApGlosowanie.edytor.edycjaAnkiet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Edytor ankiet</h1>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" ReadOnly="True" SortExpression="Nazwa" />
                <asp:BoundField DataField="Stan" HeaderText="Stan" ReadOnly="True" SortExpression="Stan" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" SelectCommand="SELECT * FROM [Ankiety]"></asp:SqlDataSource>
        <br />

    </div>
    </form>
</body>
</html>
