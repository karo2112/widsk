<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="podgladWynikow.aspx.cs" Inherits="ApGlosowanie.podgladWynikow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="podglad" runat="server">

                <asp:TableRow ID="podglAnkiet">
                    <asp:TableCell>
                        <asp:GridView ID="gv_ankiety" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sql_ds_ankiety" EnableModelValidation="True" OnSelectedIndexChanged="gv_ankiety_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                                <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                                <asp:BoundField DataField="Stan" HeaderText="Stan" SortExpression="Stan" Visible="False" />
                                <asp:BoundField DataField="DataZakonczenia" HeaderText="DataZakonczenia" SortExpression="DataZakonczenia" />
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="bt_powrot_gl" runat="server" OnClick="bt_powrot_gl_Click" Text="Powrót do strony głównej" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="podglWynikow">
                    <asp:TableCell>
                        <asp:GridView ID="gv_wyniki_ankiety" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_wyniki_ankiety" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                                <asp:BoundField DataField="NumerPytania" HeaderText="NumerPytania" SortExpression="NumerPytania" />
                                <asp:BoundField DataField="Pytanie" HeaderText="Pytanie" SortExpression="Pytanie" />
                                <asp:CheckBoxField DataField="WielWybor" HeaderText="WielWybor" SortExpression="WielWybor" />
                                <asp:CheckBoxField DataField="WymaganaOdp" HeaderText="WymaganaOdp" SortExpression="WymaganaOdp" />
                                <asp:BoundField DataField="NumerOdpowiedzi" HeaderText="NumerOdpowiedzi" SortExpression="NumerOdpowiedzi" />
                                <asp:BoundField DataField="Tekst" HeaderText="Tekst" SortExpression="Tekst" />
                                <asp:BoundField DataField="LicznikGlosow" HeaderText="LicznikGlosow" SortExpression="LicznikGlosow" />
                            </Columns>
                        </asp:GridView>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="menu">
                    <asp:TableCell>
                        <asp:Button ID="bt_powrot" runat="server" OnClick="bt_powrot_Click" Text="Powrót" />
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>

            <asp:SqlDataSource ID="sql_ds_ankiety" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" SelectCommand="SELECT a.Id, a.Nazwa, a.DataZakonczenia FROM Ankiety a WHERE a.Stan > 0;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sql_ds_wyniki_ankiety" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" SelectCommand="SELECT Ankiety.Nazwa, Pytania.NumerPytania, Pytania.Pytanie, Pytania.WielWybor, Pytania.WymaganaOdp, Odpowiedzi.NumerOdpowiedzi, Odpowiedzi.Tekst, Odpowiedzi.LicznikGlosow FROM Ankiety INNER JOIN Pytania ON Ankiety.Id = Pytania.IdTestu INNER JOIN Odpowiedzi ON Pytania.Id = Odpowiedzi.IdPytania WHERE Ankiety.Id = @IdAnkiety ORDER BY Pytania.NumerPytania, Odpowiedzi.NumerOdpowiedzi ASC;">
                <SelectParameters>
                    <asp:ControlParameter ControlID="id_ankiety" Name="IdAnkiety" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:HiddenField ID="id_ankiety" runat="server" />

        </div>
    </form>
</body>
</html>
