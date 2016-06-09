<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logowanie.aspx.cs" Inherits="ApGlosowanie.logowanie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Table runat="server" ID="logon">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lb_login" runat="server" Text="login:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tb_login" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lb_haslo" runat="server" Text="haslo:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tb_haslo" runat="server" TextMode="Password"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="bt_zaloguj" runat="server" Text="Zaloguj się" OnClick="bt_zaloguj_Click"/>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    </form>
</body>
</html>
