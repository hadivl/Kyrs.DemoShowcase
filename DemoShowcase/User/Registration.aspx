<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="DemoShowcase.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                           
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtname"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name must be in character only"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-z\s]+$"
                                ControlToValidate="txtname"></asp:RegularExpressionValidator>
                             <asp:TextBox ID="txtname" runat="server" CssClass="form-control"
     placeholder="Enter Full Name" ToolTip="Full Name"></asp:TextBox>
                        </div>



                        <div>
                            
                            <asp:RequiredFieldValidator ID="rfvLogin" runat="server" ErrorMessage="Login is required" ControlToValidate="txtLogin"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control"
    placeholder="Enter Login" ToolTip="Login"></asp:TextBox>
                        </div>

                        <div>
                          
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                              <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
      placeholder="Enter Email" ToolTip="Email"></asp:TextBox>
                        </div>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">
                        <div>

                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image" onchange="ImagePreview(this);" />
                        </div>
                        <div>
                           
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator> 
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"
                                placeholder="Enter Password" ToolTip="Password" TextMode="Password"></asp:TextBox>
                            
                        </div>
                    </div>
                </div>
                <div class="row pl-4">
                    <div class="btn_box">

                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                            OnClick="btnRegister_Click" />
                        <div>
                  <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                       Text="Already registered? <a href='Login.aspx' class='badge '>Login here..</a"></asp:Label>
                        </div>
                      

                            </div>
                </div>
                <div class="align-items:center">
                    <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                </div>
            </div>
        </div>
    </section>

</asp:Content>
