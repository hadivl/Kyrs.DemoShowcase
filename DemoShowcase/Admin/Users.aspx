<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="DemoShowcase.Admin.Users" %>

<%@ Import Namespace="DemoShowcase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="pcoded-inner-content pt-0">
        <div class="aling-aling-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">


                                        <div class="col-12 mobile-inputs">
                                            <h4 class="sub-title">Catalog List</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rUsers" runat="server" OnItemCommand="rUsers_ItemCommand" >
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th>SrNo</th>
                                                                        <th>Full_name</th>
                                                                        <th>Login</th>
                                                                        <th>Email</th>
                                                                        <th>Joiner Date</th>
                                                                        <th class="datatable-nosort" >Delete</th>
                                                                       
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>

                                                            <tr>
                                                                <td class="table-plus"><%# Eval("SrNo")  %></td>
                                                                <td><%# Eval("Full_name")  %></td>
                                                                <td><%# Eval("Login")  %></td>
                                                                <td><%# Eval("Email")  %></td>
                                                                <td><%# Eval("CreateDate")  %></td>
                                                                
                                                                <td>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CssClass="badge bg-danger"
                                                                        CommandArgument='<%# Eval("id_User") %>' CommandName="delete" OnClientClick="return confirm('Do you want to delete this User?');">
                                                                      <i class="ti-trash"></i>
                                                                    </asp:LinkButton>

                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                          </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
