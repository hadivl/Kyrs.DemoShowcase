<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="DemoShowcase.User.Favorites" %>

<%@ Import Namespace="DemoShowcase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  


    <section class="book_section layout_padding">
        <div class="container">

            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <h2>Your Favorites</h2>
            </div>
        </div>
        <!-- Добавляем таблицу для отображения данных -->
        <div class="container">
          <asp:Repeater ID="rFavoritItem" runat="server" OnItemCommand="rFavoritItem_ItemCommand" OnItemDataBound="rFavoritItem_ItemDataBound">
       <HeaderTemplate>

        <table class="table">
            <thead>
                <tr>
                    <th >Name</th>
                    <th>Image</th>
                    <th >Genre</th>
                    <th >Rating</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name_serial") %>'></asp:Label>
                            </td>
                            <td>
                                <img width="60" src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" />
                            </td>
                            <td>
                                <asp:Label ID="lblGenre" runat="server" Text='<%#Eval("Genre") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblRating" runat="server" Text='<%#Eval("Rating") %>'></asp:Label>
                                <asp:HiddenField ID="hdnProductId" runat="server" Value='<%#Eval("FK_id_Serial") %>' />
                            </td>
                            <td>
                                <asp:LinkButton ID="lbDelete" runat="server" Text="Remove" CommandName="remove" CommandArgument='<%#Eval("FK_id_Serial") %>' OnClientClick="return confirm('Do you wamt to remove rhis serial from favorite?');"
                                     ><i class="fa fa-close"></i></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                        
        
</table>
                        <!-- Добавляем оставшуюся разметку -->
                        <div class="container">
                            <div class="pl-lg-5">
                                <%--<b>Добро пожаловать! Здесь находятся ваши избранные сериалы</b>--%>
                            </div>
                            <div>
                                <%--<asp:Label ID="lblUserID" runat="server" Text='<% Response.Write(Session["FK_id_User"]); %>'></asp:Label>--%>
                            </div>
                            <div>
                                <a href="CatalogSerial.aspx" class="btn btn-info"><i class="fa fa-arrow-circle-left mr-2">На страницу каталога</i></a>
                            </div>
                        </div>

                        </td>
                        <td></td>
                        </tr>
                    </tbody>
                    </table>
                    </FooterTemplate>

                </asp:Repeater>
                
    </section>

</asp:Content>
