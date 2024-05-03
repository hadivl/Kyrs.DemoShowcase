<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DemoShowcase.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #e8d2f2;
            /* #f0e9f6*/
            font-family: Arial, sans-serif;
        }
    </style>

    <script>  
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblMsg"></asp:Label>
                </div>

            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <img id="userlogin" src="../Images/Login.jpg" alt="" class="img-thumbnail" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">
                        <h2 style="color: #333; font-weight: bold;">Login</h2>
                        <div class="input-group input">
                    
                            <asp:RequiredFieldValidator ID="rfvLogin" runat="server" ErrorMessage="Login is required" ControlToValidate="txtLogin"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>   
                            <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control" placeholder="Enter Login"></asp:TextBox>
                        </div>

                        <div class="input-group input">
                            
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="btn-box">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                                OnClick="btnLogin_Click" Style="background-color: #28a745; border-color: #28a745;"></asp:Button>
                            <span class="pl-3 text-info">New User? <a href="Registration.aspx" class="badge badge-info ">Register Here...</a></span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
