<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edytorKont.aspx.cs" Inherits="ApGlosowanie.edytor.edytorKont" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Table id="tb_dodawanie_wiersza" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lb_login" runat="server" Text="Login:"></asp:Label>  
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tb_login" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lb_haslo" runat="server" Text="Hasło:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="tb_haslo" runat="server"></asp:TextBox>    
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="bt_dodaj" runat="server" Text="Dodaj konto" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
  
        <asp:Table id="Table1" runat="server">

        </asp:Table>


    </div>
    </form>
</body>
</html>
