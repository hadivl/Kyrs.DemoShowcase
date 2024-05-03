<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Serials.aspx.cs" Inherits="DemoShowcase.Admin.P" %>

  <%--ВИДЕО 5 ПОСМОТРЕТЬ И ДОДЕЛАТЬ--%>  

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
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgSerials.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Serials</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Serials name</label>
                                                    <div>
                                                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control"
                                                            placeholder="Enter Serials Name" required></asp:TextBox>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                            ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic"
                                                             SetFocusOnError="false" ControlToValidate="txtname" ></asp:RequiredFieldValidator>

                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Serials Image</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuSerialsImage" runat="server" CssClass="form-control"
                                                            onchange="ImagePreview(this);" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Serials Episode_Number</label>
                                                    <div>
                                                        <asp:TextBox ID="txtEpisode_Number" runat="server" CssClass="form-control"
                                                            placeholder="Enter Serials Episode Number" required></asp:TextBox>
                                                        <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Serials Number Of Episodes</label>
                                                    <div>
                                                        <asp:TextBox ID="txtNumber_Of_Episodes" runat="server" CssClass="form-control"
                                                            placeholder="Enter Serials lNumber Of Episodes" required></asp:TextBox>
                                                        <asp:HiddenField ID="HiddenField2" runat="server" Value="0" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Serial Number Released Episodes</label>
                                                    <div>
                                                        <asp:TextBox ID="txtNumber_Released_Episodes" runat="server" CssClass="form-control"
                                                            placeholder="Enter Serial Number Released Episodes" required></asp:TextBox>
                                                        <asp:HiddenField ID="HiddenField3" runat="server" Value="0" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Serial FK id Serial</label>
                                                    <div>
                                                        <asp:TextBox ID="txtFK_id_Serial" runat="server" CssClass="form-control"
                                                            placeholder="Enter Serial FK id Serial" required></asp:TextBox>
                                                        <asp:HiddenField ID="HiddenField4" runat="server" Value="0" />
                                                    </div>
                                                </div>

                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive"
                                                        CssClass="form-check-input" />
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />

                                                    &nbsp;
                            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary"
                                CausesValidation="false" OnClick="btnClear_Click" />
                                                </div>
                                                <div>
                                                    <asp:Image ID="imgSerials" runat="server" CssClass="img-thumbnail" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Serials List</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rSerials" runat="server" OnItemCommand="rSerials_ItemCommand" OnItemDataBound="rSerials_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Name_serial</th>
                                                                        <th class="table-plus">Age_Restriction</th>
                                                                        <th class="table-plus">Year_Of_Release</th>
                                                                        <th class="table-plus">Rating</th>
                                                                        <th>Image</th>
                                                                        <th>IsActive</th>
                                                                        <th>CreatedDate</th>
                                                                        <th class="datatable-nosort">Action</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>

                                                            <tr>
                                                                <td class="table-plus"><%# Eval("Name_serial")  %></td>
                                                                <td class="table-plus"><%# Eval("Age_Restriction")  %></td>
                                                                <td><%# Eval("Year_Of_Release")  %></td>
                                                                <td><%# Eval("Rating")  %></td>
                                                                <td>
                                                                    <%--НЕ ОТОБРАЖАЕТСЯ фото--%>
                                                                    <%--      <%# Eval("ImageUrl")  %>--%>
                                                                    <img alt="" width="40" src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" />
                                                                </td>

                                                                <td>
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive")%>'></asp:Label>
                                                                </td>
                                                                <td><%# Eval("CreatedDate")  %></td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary"
                                                                        CommandArgument='<%# Eval("id_Serial") %>' CommandName="edit">
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>

                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CssClass="badge bg-danger"
                                                                        CommandArgument='<%# Eval("id_Serial") %>' CommandName="delete" OnClientClick="return confirm('Do you want to delete this serial?');">
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
