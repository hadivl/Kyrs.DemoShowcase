<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Filter.aspx.cs" Inherits="DemoShowcase.User.Filter" %> 
<%@ Import Namespace="DemoShowcase" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
    <script type="text/javascript">
        function filterSerials() {
            var genre = document.getElementById('txtGenre').value;
            var year = document.getElementById('txtYear').value;
            var country = document.getElementById('txtCountry').value;
            var age = document.getElementById('txtAge').value;

            var rows = document.getElementById('rSerial').getElementsByTagName('tr');

            for (var i = 1; i < rows.length; i++) {
                var cells = rows[i].getElementsByTagName('td');
                var showRow = false;

                if (genre !== "" && cells[4].innerText.includes(genre)) {
                    showRow = true;
                }

                if (year !== "" && cells[1].innerText === year) {
                    showRow = true;
                }

                if (country !== "" && cells[3].innerText.includes(country)) {
                    showRow = true;
                }

                if (age !== "" && cells[2].innerText === age) {
                    showRow = true;
                }

                if (showRow) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }
    </script>

    <style>
    .filters-content_new {
        margin-top: 20px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .table_new_n {
        width: 100%;
        border-collapse: collapse;
    }

    .table_new_n th, .table_new_n td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
</style>


</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <section class="food_section layout_padding"> 
        <div class="container"> 
            <div class="heading_container heading_center"> 
                <div class="align-self-end"> 
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label> 
                </div> 
                <h2>Фильтрация сериалов</h2> 
            </div> 
            <div class="filters-content_new"> 
                <input type="text" id="txtGenre" ClientIDMode="Static" placeholder="Жанр">
                <input type="text" id="txtYear" placeholder="Год выпуска" ClientIDMode="Static">
                <input type="text" id="txtCountry" placeholder="Страна">
                <input type="text" id="txtAge" placeholder="Возрастное ограничение">
                <input type="button" value="Применить фильтр" onclick="filterSerials()">
                <table id="rSerial" class="table_new_n"> 
                    <tr> 
                        <th>Название сериала</th> 
                        <th>Год выпуска</th> 
                        <th>Возрастное ограничение</th> 
                        <th>Страна</th> 
                        <th>Жанр</th> 
                        <th>Рейтинг</th> 
                    </tr> 
                    <asp:Repeater ID="rSerial" runat="server" OnItemCommand="rSerial_ItemCommand"> 
                        <ItemTemplate> 
                            <tr> 
                                <td><%# Eval("Name_serial") %></td> 
                                <td><%# Eval("Year_Of_Release") %></td> 
                                <td><%# Eval("Age_Restriction") %></td> 
                                <td><%# Eval("Country") %></td> 
                                <td><%# Eval("Genre") %></td> 
                                <td><%# Eval("Rating") %></td> 
                            </tr> 
                        </ItemTemplate> 
                    </asp:Repeater> 
                </table> 
            </div> 
        </div> 
    </section> 
</asp:Content>
