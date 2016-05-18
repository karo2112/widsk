<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ankieta.aspx.cs" Inherits="ApGlosowanie.ankieta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div id="pytanie" style="width: 100%">
    <table style="text-align: center">
        <tr>
            <td>

<div>
    <h1>Lista ankiet</h1>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" SelectCommand="SELECT [NumerPytania], [Pytanie], [WielWybor], [WymaganaOdp] FROM [Pytania] WHERE ([IdTestu] = @IdTestu)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="IdTestu" QueryStringField="nr" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" SelectCommand="SELECT [Tekst], [NumerPytania] FROM [Odpowiedzi] WHERE ([NumerPytania] = @NumerPytania)">
            <SelectParameters>
                <asp:CookieParameter CookieName="ap" DefaultValue="1" Name="NumerPytania" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Tekst" DataValueField="Tekst">
        </asp:RadioButtonList>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Tekst" DataValueField="Tekst">
        </asp:CheckBoxList>
        <asp:Button ID="Button1" runat="server" Text="Poprzednie pytanie" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Anuluj wybór" />
        <asp:Button ID="Button3" runat="server" Text="Następne pytanie" OnClick="Button3_Click" />
        <br />
    </div>

            </td>

            <td>

    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NumerPytania" DataValueField="NumerPytania" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Label ID="Label3" runat="server" Text="0"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" SelectCommand="SELECT [Tekst] FROM [Odpowiedzi] WHERE ([NumerPytania] = @NumerPytania)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="NumerPytania" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="bt_skocz" runat="server" OnClick="bt_skocz_Click" Text="Przejdź" />
    </div>

            </td>
        </tr>
    </table>
    



    </div>
    </form>
</body>
</html>
