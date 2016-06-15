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

            <asp:Table ID="tblEdycjaAnkiet" runat="server">

                <asp:TableRow ID="tbl_ankiety">
                    <asp:TableCell>
                        <asp:GridView ID="gv_ankiety" runat="server" OnRowDeleting="gv_ankiety_RowDeleting" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sql_ds_ankiety" EnableModelValidation="True" ShowFooter="True" OnRowUpdating="gv_ankiety_RowUpdating" OnSelectedIndexChanged="gv_ankiety_SelectedIndexChanged" OnRowEditing="gv_ankiety_RowEditing" OnRowCancelingEdit="gv_ankiety_RowCancelingEdit" OnRowUpdated="gv_ankiety_RowUpdated">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Wybierz"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń"></asp:LinkButton>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="bt_dodaj_ankiete" runat="server" Text="Dodaj ankietę" OnClick="dodajAnkiete" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nazwa" SortExpression="Nazwa">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nazwa") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nazwa") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="tb_nazwa_ankiety" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Stan" SortExpression="Stan">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_stan_ankiety_edit" runat="server" SelectedValue='<%# Bind("Stan") %>'>
                                            <asp:ListItem Text="Nieaktywna" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Aktywna" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="C" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="D" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Stan") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>

                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DataZakonczenia" SortExpression="DataZakonczenia">
                                    <EditItemTemplate>
                                        <asp:Calendar ID="cal_koniec_e" runat="server" SelectedDate='<%# Bind("DataZakonczenia") %>' VisibleDate='<%# Eval("DataZakonczenia") %>'></asp:Calendar>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("DataZakonczenia") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Calendar ID="cal_koniec" runat="server" SelectedDate='<%# DateTime.Today %>'></asp:Calendar>
                                        <br />
                                        <asp:DropDownList ID="ddl_godzina" runat="server">
                                            <asp:ListItem Text="00" Value="00"></asp:ListItem>
                                            <asp:ListItem Text="01" Value="01"></asp:ListItem>
                                            <asp:ListItem Text="02" Value="02"></asp:ListItem>
                                            <asp:ListItem Text="03" Value="03"></asp:ListItem>
                                            <asp:ListItem Text="04" Value="04"></asp:ListItem>
                                            <asp:ListItem Text="05" Value="05"></asp:ListItem>
                                            <asp:ListItem Text="06" Value="06"></asp:ListItem>
                                            <asp:ListItem Text="07" Value="07"></asp:ListItem>
                                            <asp:ListItem Text="08" Value="08"></asp:ListItem>
                                            <asp:ListItem Text="09" Value="09"></asp:ListItem>
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                            <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                            <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                            <asp:ListItem Text="21" Value="21"></asp:ListItem>
                                            <asp:ListItem Text="22" Value="22"></asp:ListItem>
                                            <asp:ListItem Text="23" Value="23"></asp:ListItem>
                                            <asp:ListItem Text="24" Value="24"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddl_minuta" runat="server">
                                            <asp:ListItem Text="00" Value="00"></asp:ListItem>
                                            <asp:ListItem Text="01" Value="01"></asp:ListItem>
                                            <asp:ListItem Text="02" Value="02"></asp:ListItem>
                                            <asp:ListItem Text="03" Value="03"></asp:ListItem>
                                            <asp:ListItem Text="04" Value="04"></asp:ListItem>
                                            <asp:ListItem Text="05" Value="05"></asp:ListItem>
                                            <asp:ListItem Text="06" Value="06"></asp:ListItem>
                                            <asp:ListItem Text="07" Value="07"></asp:ListItem>
                                            <asp:ListItem Text="08" Value="08"></asp:ListItem>
                                            <asp:ListItem Text="09" Value="09"></asp:ListItem>
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                            <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                            <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                            <asp:ListItem Text="21" Value="21"></asp:ListItem>
                                            <asp:ListItem Text="22" Value="22"></asp:ListItem>
                                            <asp:ListItem Text="23" Value="23"></asp:ListItem>
                                            <asp:ListItem Text="24" Value="24"></asp:ListItem>
                                            <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                            <asp:ListItem Text="26" Value="26"></asp:ListItem>
                                            <asp:ListItem Text="27" Value="27"></asp:ListItem>
                                            <asp:ListItem Text="28" Value="28"></asp:ListItem>
                                            <asp:ListItem Text="29" Value="29"></asp:ListItem>
                                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                            <asp:ListItem Text="31" Value="31"></asp:ListItem>
                                            <asp:ListItem Text="32" Value="32"></asp:ListItem>
                                            <asp:ListItem Text="33" Value="33"></asp:ListItem>
                                            <asp:ListItem Text="34" Value="34"></asp:ListItem>
                                            <asp:ListItem Text="35" Value="35"></asp:ListItem>
                                            <asp:ListItem Text="36" Value="36"></asp:ListItem>
                                            <asp:ListItem Text="37" Value="37"></asp:ListItem>
                                            <asp:ListItem Text="38" Value="38"></asp:ListItem>
                                            <asp:ListItem Text="39" Value="39"></asp:ListItem>
                                            <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                            <asp:ListItem Text="41" Value="41"></asp:ListItem>
                                            <asp:ListItem Text="42" Value="42"></asp:ListItem>
                                            <asp:ListItem Text="43" Value="43"></asp:ListItem>
                                            <asp:ListItem Text="44" Value="44"></asp:ListItem>
                                            <asp:ListItem Text="45" Value="45"></asp:ListItem>
                                            <asp:ListItem Text="46" Value="46"></asp:ListItem>
                                            <asp:ListItem Text="47" Value="47"></asp:ListItem>
                                            <asp:ListItem Text="48" Value="48"></asp:ListItem>
                                            <asp:ListItem Text="49" Value="49"></asp:ListItem>
                                            <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                            <asp:ListItem Text="51" Value="51"></asp:ListItem>
                                            <asp:ListItem Text="52" Value="52"></asp:ListItem>
                                            <asp:ListItem Text="53" Value="53"></asp:ListItem>
                                            <asp:ListItem Text="54" Value="54"></asp:ListItem>
                                            <asp:ListItem Text="55" Value="55"></asp:ListItem>
                                            <asp:ListItem Text="56" Value="56"></asp:ListItem>
                                            <asp:ListItem Text="57" Value="57"></asp:ListItem>
                                            <asp:ListItem Text="58" Value="58"></asp:ListItem>
                                            <asp:ListItem Text="59" Value="59"></asp:ListItem>
                                        </asp:DropDownList>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="">
                                    <EditItemTemplate>
                                        <asp:Label ID="lb_inf_godzina" runat="server">Godzina</asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddl_godzina_e" SelectedValue='<%# Bind("Godzina") %>' runat="server">
                                            <asp:ListItem Text="00" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="01" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="02" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="03" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="04" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="05" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="06" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="07" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="08" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="09" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                            <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                            <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                            <asp:ListItem Text="21" Value="21"></asp:ListItem>
                                            <asp:ListItem Text="22" Value="22"></asp:ListItem>
                                            <asp:ListItem Text="23" Value="23"></asp:ListItem>
                                            <asp:ListItem Text="24" Value="24"></asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <EditItemTemplate>
                                        <asp:Label ID="lb_inf_minuta" runat="server">Minuta</asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddl_minuta_e" SelectedValue='<%# Bind("Minuta") %>' runat="server">
                                            <asp:ListItem Text="00" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="01" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="02" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="03" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="04" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="05" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="06" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="07" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="08" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="09" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                            <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                            <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                            <asp:ListItem Text="21" Value="21"></asp:ListItem>
                                            <asp:ListItem Text="22" Value="22"></asp:ListItem>
                                            <asp:ListItem Text="23" Value="23"></asp:ListItem>
                                            <asp:ListItem Text="24" Value="24"></asp:ListItem>
                                            <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                            <asp:ListItem Text="26" Value="26"></asp:ListItem>
                                            <asp:ListItem Text="27" Value="27"></asp:ListItem>
                                            <asp:ListItem Text="28" Value="28"></asp:ListItem>
                                            <asp:ListItem Text="29" Value="29"></asp:ListItem>
                                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                            <asp:ListItem Text="31" Value="31"></asp:ListItem>
                                            <asp:ListItem Text="32" Value="32"></asp:ListItem>
                                            <asp:ListItem Text="33" Value="33"></asp:ListItem>
                                            <asp:ListItem Text="34" Value="34"></asp:ListItem>
                                            <asp:ListItem Text="35" Value="35"></asp:ListItem>
                                            <asp:ListItem Text="36" Value="36"></asp:ListItem>
                                            <asp:ListItem Text="37" Value="37"></asp:ListItem>
                                            <asp:ListItem Text="38" Value="38"></asp:ListItem>
                                            <asp:ListItem Text="39" Value="39"></asp:ListItem>
                                            <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                            <asp:ListItem Text="41" Value="41"></asp:ListItem>
                                            <asp:ListItem Text="42" Value="42"></asp:ListItem>
                                            <asp:ListItem Text="43" Value="43"></asp:ListItem>
                                            <asp:ListItem Text="44" Value="44"></asp:ListItem>
                                            <asp:ListItem Text="45" Value="45"></asp:ListItem>
                                            <asp:ListItem Text="46" Value="46"></asp:ListItem>
                                            <asp:ListItem Text="47" Value="47"></asp:ListItem>
                                            <asp:ListItem Text="48" Value="48"></asp:ListItem>
                                            <asp:ListItem Text="49" Value="49"></asp:ListItem>
                                            <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                            <asp:ListItem Text="51" Value="51"></asp:ListItem>
                                            <asp:ListItem Text="52" Value="52"></asp:ListItem>
                                            <asp:ListItem Text="53" Value="53"></asp:ListItem>
                                            <asp:ListItem Text="54" Value="54"></asp:ListItem>
                                            <asp:ListItem Text="55" Value="55"></asp:ListItem>
                                            <asp:ListItem Text="56" Value="56"></asp:ListItem>
                                            <asp:ListItem Text="57" Value="57"></asp:ListItem>
                                            <asp:ListItem Text="58" Value="58"></asp:ListItem>
                                            <asp:ListItem Text="59" Value="59"></asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="bt_main" runat="server" Text="Powrót do strony głównej" OnClick="bt_main_OnClick" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="tbl_pytania">
                    <asp:TableCell>
                        <asp:GridView ID="gv_pytania" runat="server" DataKeyNames="Id" AutoGenerateColumns="False" OnRowDeleting="gv_pytania_RowDeleting" DataSourceID="sql_ds_pytania" EnableModelValidation="True" OnSelectedIndexChanged="gv_pytania_SelectedIndexChanged" ShowFooter="True" OnRowUpdating="gv_pytania_RowUpdating">
                            <EmptyDataTemplate>
                                <asp:Label ID="lb_pusty_w" runat="server" Text="Nie ma pytań, proszę dodać conajmniej jedno."></asp:Label><br />
                                <asp:Button ID="bt_dodaj_pytanie_p" runat="server" Text="Dodaj pytanie" OnClick="dodajPytanie_e" />
                                <asp:TextBox ID="tb_pytanie_ins_p" runat="server" Text="Treść pytania"></asp:TextBox>
                                <asp:CheckBox ID="chb_wiel_wyb_p" runat="server" Text="Wielokrotnego wyboru?" />
                                <asp:CheckBox ID="chb_wym_odp_p" runat="server" Text="Wymagana odpowiedź?" />
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Wybierz"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń"></asp:LinkButton>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="bt_dodaj_pytanie" runat="server" Text="Dodaj pytanie" OnClick="dodajPytanie" />
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="false">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IdTestu" SortExpression="IdTestu" Visible="false">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("IdTestu") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("IdTestu") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pytanie" SortExpression="Pytanie">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tb_pytanie_e" runat="server" Text='<%# Bind("Pytanie") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Pytanie") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="tb_pytanie_ins" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="WielWybor" SortExpression="WielWybor">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chb_wiel_wybor_e" runat="server" Checked='<%# Convert.ToBoolean(Eval("WielWybor")) %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chb_wiel_wybor" runat="server" Checked='<%# Convert.ToBoolean(Eval("WielWybor")) %>' Enabled="False" />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:CheckBox ID="chb_wiel_wybor_ins" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NumerPytania" SortExpression="NumerPytania">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("NumerPytania") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("NumerPytania") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="WymaganaOdp" SortExpression="WymaganaOdp">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chb_wym_odp_e" runat="server" Checked='<%# Convert.ToBoolean(Eval("WymaganaOdp")) %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chb_wym_odp" runat="server" Checked='<%# Convert.ToBoolean(Eval("WymaganaOdp")) %>' Enabled="false" />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:CheckBox ID="chb_wym_odp_ins" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="bt_b_pyt" runat="server" Text="Powrót do ankiet" OnClick="bt_b_pyt_OnClick" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="tbl_odpowiedzi">
                    <asp:TableCell>
                        <asp:GridView ID="gv_odpowiedzi" runat="server" DataKeyNames="Id" AutoGenerateColumns="False" DataSourceID="sql_ds_odpowiedzi" ShowFooter="True" OnRowUpdating="gv_odpowiedzi_RowUpdating" OnRowEditing="gv_odpowiedzi_RowEditing" OnRowCancelingEdit="gv_odpowiedzi_RowCancelingEdit" OnRowUpdated="gv_odpowiedzi_RowUpdated" OnRowDeleted="gv_odpowiedzi_RowDeleted">
                            <EmptyDataTemplate>
                                <asp:Label ID="lb_pusty_w_2" runat="server" Text="Nie ma odpowiedzi, proszę dodać conajmniej jedną."></asp:Label><br />
                                <asp:Button ID="bt_dodaj_odpowiedz_p" runat="server" Text="Dodaj odpowiedź" OnClick="dodajOdpowiedz_e" />
                                <asp:TextBox ID="tb_odp_ins_p" runat="server" Text="Treść odpowiedzi"></asp:TextBox>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń"></asp:LinkButton>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="bt_dodaj_odpowiedz" runat="server" Text="Dodaj odpowiedź" OnClick="dodajOdpowiedz" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label12523" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1321" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IdPytania" SortExpression="IdPytania" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("IdPytania") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("IdPytania") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NumerPytania" SortExpression="NumerPytania">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("NumerPytania") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("NumerPytania") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tekst" SortExpression="Tekst">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tb_tekst_e" runat="server" Text='<%# Bind("Tekst") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Tekst") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="tb_tekst_ins" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NumerOdpowiedzi" SortExpression="NumerOdpowiedzi">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("NumerOdpowiedzi") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("NumerOdpowiedzi") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="bt_b_odp" runat="server" Text="Powrót do pytań" OnClick="bt_b_odp_OnClick" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:SqlDataSource ID="sql_ds_pytania" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" OnDeleting="sql_ds_pytania_Deleting" SelectCommand="SELECT Id, IdTestu, Pytanie, WielWybor, NumerPytania, WymaganaOdp FROM Pytania WHERE ([IdTestu] = @IdTestu)" UpdateCommand="UPDATE [Pytania] SET [Pytanie] = @Pytanie, [WielWybor] = @WielWybor, [WymaganaOdp] = @WymaganaOdp WHERE [Id] = @Id" DeleteCommand="UsunPytanie" DeleteCommandType="StoredProcedure" InsertCommand="INSERT INTO [Pytania] ([IdTestu], [Pytanie], [WielWybor], [NumerPytania], [WymaganaOdp]) VALUES (@IdTestu, @Pytanie, @WielWybor, @NumerPytania, @WymaganaOdp)">
                <SelectParameters>
                    <asp:Parameter Name="IdTestu" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="IdPytania" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="IdTestu" Type="Int32" />
                    <asp:Parameter Name="Pytanie" Type="String" />
                    <asp:Parameter Name="WielWybor" Type="Boolean" />
                    <asp:Parameter Name="NumerPytania" Type="Int32" />
                    <asp:Parameter Name="WymaganaOdp" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Pytanie" Type="String" />
                    <asp:Parameter Name="WielWybor" Type="Boolean" />
                    <asp:Parameter Name="WymaganaOdp" Type="Boolean" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="sql_ds_ankiety" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" OnDeleting="sql_ds_odpowiedzi_Deleting" DeleteCommand="UsunAnkiete" DeleteCommandType="StoredProcedure"  InsertCommand="INSERT INTO [Ankiety] ([Nazwa], [Stan], [DataZakonczenia]) VALUES (@Nazwa, @Stan, @DataZakonczenia)" SelectCommand="SELECT Id, Nazwa, Stan, DataZakonczenia, Stan as Godzina, Stan as Minuta FROM Ankiety
UNION ALL
SELECT -1,'PUSTA, NIE DO EDYCJI',0,GETDATE(),0,0 FROM Ankiety HAVING COUNT(*)=0;"
                UpdateCommand="UPDATE [Ankiety] SET [Nazwa] = @Nazwa, [Stan] = @Stan, [DataZakonczenia] = @DataZakonczenia WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="IdAnkiety" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Nazwa" Type="String" />
                    <asp:Parameter Name="Stan" Type="Int32" />
                    <asp:Parameter Name="DataZakonczenia" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nazwa" Type="String" />
                    <asp:Parameter Name="Stan" Type="Int32" />
                    <asp:Parameter Name="DataZakonczenia" Type="DateTime" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="sql_ds_odpowiedzi" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" DeleteCommand="DELETE FROM [Odpowiedzi] WHERE [Id] = @Id" InsertCommand="INSERT INTO Odpowiedzi (Odpowiedzi.IdPytania, Odpowiedzi.NumerPytania, Odpowiedzi.Tekst, Odpowiedzi.NumerOdpowiedzi) VALUES (@IdPytania, @NumerPytania, @Tekst, @NumerOdpowiedzi)" UpdateCommand="UPDATE [Odpowiedzi] SET [Tekst] = @Tekst WHERE [Id] = @Id" SelectCommand="SELECT [Id], [IdPytania], [NumerPytania], [Tekst], [NumerOdpowiedzi] FROM [Odpowiedzi] WHERE ([IdPytania] = @IdPytania)" OnInserted="sql_ds_odpowiedzi_Inserted">
                <SelectParameters>
                    <asp:Parameter Name="IdPytania" Type="Int32" />
                    <asp:Parameter Name="NumerPytania" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Tekst" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="IdPytania" Type="Int32" />
                    <asp:Parameter Name="NumerPytania" Type="Int32" />
                    <asp:Parameter Name="Tekst" Type="String" />
                    <asp:Parameter Name="NumerOdpowiedzi" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>

            <asp:HiddenField ID="hf_id_ankiety" runat="server" />
            <asp:HiddenField ID="hf_id_pytania" runat="server" />
        </div>



    </form>
</body>
</html>
