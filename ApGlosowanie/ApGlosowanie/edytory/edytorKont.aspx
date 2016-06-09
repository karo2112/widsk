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

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sql_ds_uzytkownicy" EnableModelValidation="True" ShowFooter="True" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="bt_dodaj" runat="server" Text="Dodaj konto" OnClick="dodajKonto"/>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id" SortExpression="Id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tb_login" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Haslo" SortExpression="Haslo">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_haslo_e" runat="server" Text='<%# Bind("Haslo") %>' ReadOnly="False" TextMode="Password"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text="****"></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tb_haslo" runat="server" TextMode="Password"></asp:TextBox>  
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rola" SortExpression="Rola">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddl_rola_e" runat="server" SelectedValue='<%# Bind("Rola") %>'>
                            <asp:ListItem Text="Administrator" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Ankietowany" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Rola") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddl_rola" runat="server">
                            <asp:ListItem Text="Administrator" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Ankietowany" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                                                
        <asp:SqlDataSource ID="sql_ds_uzytkownicy" runat="server" ConnectionString="<%$ ConnectionStrings:cs_glosowanie %>" DeleteCommand="DELETE FROM [Uzytkownicy] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Uzytkownicy] ([Id], [Haslo], [Rola]) VALUES (@Id, @Haslo, @Rola)" SelectCommand="SELECT [Id], [Haslo], [Rola] FROM [Uzytkownicy]" UpdateCommand="UPDATE [Uzytkownicy] SET [Haslo] = @Haslo, [Rola] = @Rola WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="String" />
                <asp:Parameter Name="Haslo" Type="String" />
                <asp:Parameter Name="Rola" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Haslo" Type="String" />
                <asp:Parameter Name="Rola" Type="Int32" />
                <asp:Parameter Name="Id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    </form>
</body>
</html>
