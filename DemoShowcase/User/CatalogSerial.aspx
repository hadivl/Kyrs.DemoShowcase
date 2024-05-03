<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="CatalogSerial.aspx.cs" Inherits="DemoShowcase.User.Catalog" %>

<%@ Import Namespace="DemoShowcase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <!-- каталог section -->

    <section class="food_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <div class="align-self-end">

                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <h2>Каталог сериалов
                </h2>
            </div>



           
            <div class="filters-content">
                <div class="row grid">

                    <asp:Repeater ID="rSerial" runat="server" OnItemCommand="rSerial_ItemCommand">
                        <ItemTemplate>
                            <div class="col-sm-6 col-lg-4 all <%# Eval("Category").ToString().ToLower() %>">
                                <div class="box">
                                    <div>
                                        <div class="img-box">
                                            <img src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="">
                                        </div>
                                        <div class="detail-box">
                                            <h5>
                                                <%# Eval("Name_serial") %>
                                            </h5>
                                            <p>
                                                <%# Eval("Year_Of_Release") %>, <%# Eval("Age_Restriction") %><br />
                                                <%# Eval("Country") %><br />
                                                <%# Eval("Genre") %><br />
                                            </p>
                                            <div class="options">
                                                <h6>
                                                    <%# Eval("Rating") %>
                                                </h6>
                                                <asp:LinkButton runat="server" ID="LbAddToCart" CommandName="addToCart" CommandArgument='<%# Eval("id_Serial") %>'>
                                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
                                                        <g>
                                                            <g>
                                                                <path d="M340.96,5.68C288.116-12.32,222.10,5.68,200,58.16C176.10,8,108-14.6,58.104,5.68C8.4,28.56-20.148,100,20.168,176.152
C52.132,232,108,272.44,200,346.124C292.184,272.44,348.156,232,378.32,176.152c42.116-74.84,16.128-140.96-36.136-166.84Z">
                                                                </path>
                                                            </g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                    </svg>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>   
        </div>
    </section>
</asp:Content>
