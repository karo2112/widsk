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
        </p>
    </div>
    </form>
</body>
</html>
