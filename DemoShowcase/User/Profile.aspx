<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DemoShowcase.User.Profile" %>
<%@ Import Namespace="DemoShowcase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<%  
    string imageUrl = "";

        if (Session["imageUrl"] != null)
    {
         imageUrl = Session["imageUrl"].ToString();
    }
%>


    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                </div>
                <h2>User Information</h2>
            </div>


            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title mb-4">
                                <div class="d-flex justify-content-start">
                                    <div class="image-container">
                                        <img src="<%= Utils.GetImageUrl(imageUrl) %>" id="imgProfile" style="width:150px; height:150px;" class="img-thumbnail" />
                                    <%--    <div class="middle pt-1">
                                            <a href="Registration.aspx"?id=<%Response.Write(Session["idUser"]);%> class="btn btn-warning">
                                                <i class="fa fa-pencil"></i> Edit Details
                                            </a>
                                        </div>--%>
                                    </div>

                                    <div class="userData ml-3">
                                        <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
                                            <a href="javascript:void(0);"><%Response.Write(Session["fullname"]); %></a>
                                        </h2>
                                        <h6 class="d-block">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblFullname" runat="server" ToolTip="Unique Fullname">
                                                    <%Response.Write(Session["fullname"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>
                                         <h6 class="d-block">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="LabLogin" runat="server" ToolTip="Unique Login">
                                                    @<%Response.Write(Session["login"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>

                                            <h6 class="d-block">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblEmail" runat="server" ToolTip="Unique Email">
                                                    <%Response.Write(Session["email"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>

                                           <h6 class="d-block">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="LabCreateDate" runat="server" ToolTip="Unique CreateData">
                                                    <%Response.Write(Session["createDate"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>

                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active text-info" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab"
                                             aria-controls="basicInfo" aria-selected="true"><i class="fa fa-id-badge mr-2"></i> Basic Info</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-item text-info" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab"
                                             aria-controls="connectedServices" aria-selected="false"><i class="fa fa-clock-o mr-2"></i> Favourites History</a>
                                    </li>
                                        </ul>

                                    <div class="tab-content ml-1" id="myTabContent">
                                     <%--   <%Basic User Info Starts%>--%>
                                        <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                            <asp:Repeater ID="rUserProfile" runat="server">
                                                <ItemTemplate>

                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Full Name</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Full_name") %>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Login</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Login") %>
                                                          </div>
                                                      </div>
                                                       <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Email</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Email") %>
                                                          </div>
                                                      </div>
                                                       <hr />

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                             <%--   <%Basic User Info Ends%>--%>

                                       <%-- Favorite History Starts--%>
                                        <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="connectedServices-tab">
                                            <h3>History</h3>
                                        </div>
                                        <%-- Favorite History Ends--%>

                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </section>


</asp:Content>
