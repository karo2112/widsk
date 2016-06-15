<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ApGlosowanie._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Strona startowa programu do ankietowania</h1>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Zagłosuj" PostBackUrl="~/ankiety.aspx" />
            <asp:Button ID="Button2" runat="server" Text="Edycja ankiet" PostBackUrl="~/edytory/edycjaAnkiet.aspx"/>
            <asp:Button ID="Button3" runat="server" Text="Wyniki głosowań" PostBackUrl="~/podgladWynikow.aspx"/>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="IdPytania" HeaderText="IdPytania" SortExpression="IdPytania" />
                    <asp:BoundField DataField="LicznikGlosow" HeaderText="LicznikGlosow" SortExpression="LicznikGlosow" />
                    <asp:BoundField DataField="NumerPytania" HeaderText="NumerPytania" SortExpression="NumerPytania" />
                    <asp:BoundField DataField="NumerOdpowiedzi" HeaderText="NumerOdpowiedzi" SortExpression="NumerOdpowiedzi" />
                    <asp:BoundField DataField="Tekst" HeaderText="Tekst" SortExpression="Tekst" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" DeleteCommand="DELETE FROM [Odpowiedzi] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Odpowiedzi] ([IdPytania], [LicznikGlosow], [NumerPytania], [NumerOdpowiedzi], [Tekst]) VALUES (@IdPytania, @LicznikGlosow, @NumerPytania, @NumerOdpowiedzi, @Tekst)" SelectCommand="SELECT [Id], [IdPytania], [LicznikGlosow], [NumerPytania], [NumerOdpowiedzi], [Tekst] FROM [Odpowiedzi]" UpdateCommand="UPDATE [Odpowiedzi] SET [IdPytania] = @IdPytania, [LicznikGlosow] = @LicznikGlosow, [NumerPytania] = @NumerPytania, [NumerOdpowiedzi] = @NumerOdpowiedzi, [Tekst] = @Tekst WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="IdPytania" Type="Int32" />
                    <asp:Parameter Name="LicznikGlosow" Type="Int64" />
                    <asp:Parameter Name="NumerPytania" Type="Int32" />
                    <asp:Parameter Name="NumerOdpowiedzi" Type="Int32" />
                    <asp:Parameter Name="Tekst" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IdPytania" Type="Int32" />
                    <asp:Parameter Name="LicznikGlosow" Type="Int64" />
                    <asp:Parameter Name="NumerPytania" Type="Int32" />
                    <asp:Parameter Name="NumerOdpowiedzi" Type="Int32" />
                    <asp:Parameter Name="Tekst" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </div>
    </form>
</body>
</html>
