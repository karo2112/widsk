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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" SelectCommand="SELECT [Nazwa], [Id] FROM [Ankiety] WHERE ([Stan] = @Stan)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="Stan" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
    </form>
</body>
</html>
