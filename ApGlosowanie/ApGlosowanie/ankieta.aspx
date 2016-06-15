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
                            <asp:Label ID="lb_wym_pytania" runat="server" ForeColor="Red"></asp:Label>
                            <br />
                            <asp:SqlDataSource ID="sql_ds_pytania" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" SelectCommand="SELECT [NumerPytania], [Pytanie], [WielWybor], [WymaganaOdp] FROM [Pytania] WHERE ([IdTestu] = @IdTestu) ORDER BY [NumerPytania] ASC">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="IdTestu" QueryStringField="nr" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:SqlDataSource ID="sql_ds_odpowiedzi" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" UpdateCommand="AktualizujLicznikOdpowiedzi" SelectCommand="SELECT o.Tekst, o.NumerOdpowiedzi, o.NumerPytania FROM Odpowiedzi o, Pytania p WHERE (o.NumerPytania = p.NumerPytania AND p.NumerPytania = @NumerPytania AND p.Id = o.IdPytania AND p.IdTestu = @IdTestu) ORDER BY [NumerOdpowiedzi] ASC" UpdateCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hf_nr_pytania" Name="NumerPytania" PropertyName="Value" Type="Int32" />
                                    <asp:QueryStringParameter DefaultValue="1" Name="IdTestu" QueryStringField="nr" Type="Int32" />
                                </SelectParameters>

                                <UpdateParameters>
                                    <asp:Parameter Name="NumerOdpowiedzi" Type="Int32" />
                                    <asp:Parameter Name="NumerPytania" Type="Int32" />
                                    <asp:QueryStringParameter Name="IdTestu" QueryStringField="nr" Type="Int32" />
                                </UpdateParameters>

                            </asp:SqlDataSource>
                            <br />
                            <asp:Label ID="lb_tresc_pytania" runat="server" Text="Label"></asp:Label>
                            <br />
                            <asp:Label ID="lb_typ_pytania" runat="server" Text="Label"></asp:Label>
                            <br />
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="sql_ds_odpowiedzi" DataTextField="Tekst" DataValueField="NumerOdpowiedzi">
                            </asp:RadioButtonList>
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="sql_ds_odpowiedzi" DataTextField="Tekst" DataValueField="NumerOdpowiedzi">
                            </asp:CheckBoxList>
                            <asp:Button ID="Button1" runat="server" Text="Poprzednie pytanie" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Anuluj wybór" />
                            <asp:Button ID="Button3" runat="server" Text="Następne pytanie" OnClick="Button3_Click" />
                            <br />
                        </div>

                    </td>

                    <td>

                        <div>
                            <asp:DropDownList ID="ddl_pytania" runat="server" DataSourceID="sql_ds_pytania" DataTextField="NumerPytania" DataValueField="NumerPytania" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                            <br />
                            <asp:Button ID="bt_skocz" runat="server" OnClick="bt_skocz_Click" Text="Przejdź" />
                            <br />
                            <asp:Button ID="bt_zakoncz" runat="server" Text="Zakończ wypełnianie" OnClick="bt_zakoncz_Click" />
                            <asp:SqlDataSource ID="sql_ds_wypeln_ankiety" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" InsertCommand="INSERT INTO WypelnioneAnkiety(IdTestu, IdUzytkownika) VALUES (@IdTestu, @IdUzytkownika)" SelectCommand="SELECT * FROM [WypelnioneAnkiety] WHERE (([IdTestu] = @IdTestu) AND ([IdUzytkownika] = @IdUzytkownika))">
                                <InsertParameters>
                                    <asp:QueryStringParameter Name="IdTestu" QueryStringField="nr" />
                                    <asp:Parameter Name="IdUzytkownika" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="IdTestu" QueryStringField="nr" />
                                    <asp:Parameter Name="IdUzytkownika" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:HiddenField ID="hf_nr_pytania" runat="server" Value="1" />
                        </div>

                    </td>
                </tr>
            </table>




        </div>
    </form>
</body>
</html>
