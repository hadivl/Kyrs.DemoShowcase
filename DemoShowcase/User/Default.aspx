<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DemoShowcase.User.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <!-- offer section -->

  <section class="offer_section layout_padding-bottom">
    <div class="offer_container">
      <div class="container ">
        <div class="row">
          <div class="col-md-6  ">
            <div class="box ">
              <div class="img-box">
                <img src="../TemplateFiles/images/actor1.jpg" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Тан Сан
                </h5>
                <h6>
                  <span>Боевой континент</span> 
                </h6>
             
              </div>
            </div>
          </div>
          <div class="col-md-6  ">
            <div class="box ">
              <div class="img-box">
                <img src="../TemplateFiles/images/actor2.jpg" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Сяочунь Бай
                </h5>
                <h6>
                  <span>Вечная воля</span> 
                </h6>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end offer section -->


    <!-- about section -->

  <section class="about_section layout_padding">
    <div class="container  ">

      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="../TemplateFiles/images/about_main.png" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
                Вы готовы?
              </h2>
            </div>
            <p>
             С помощью нашего приложения вы сможете фильтровать сериалы по жанру, году выпуска, рейтингу, актерам, режиссерам и многим другим критериям. Также у вас будет возможность сохранять понравившиеся сериалы в избранное, чтобы легко вернуться к ним позже.
             Наше приложение обновляется регулярно, чтобы предоставлять вам самую актуальную информацию о сериалах. Мы стремимся сделать ваш поиск и выбор сериалов максимально удобным и приятным.
            </p>
          
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->

     <!-- client section -->

  <section class="client_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center psudo_white_primary mb_45">
        <h2>
         Что говорят наши клиенты
        </h2>
      </div>
      <div class="carousel-wrap row ">
        <div class="owl-carousel client_owl-carousel">
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
                  Супер приложение! Очень удобно фильтровать сериалы по жанрам, рейтингу и другим параметрам. Наконец-то я могу легко выбирать, что посмотреть вечером. Спасибо за ваш труд!
                </p>
                <h6>
                  София Власенко
                </h6>
              </div>
              <div class="img-box">
                <img src="../TemplateFiles/images/с1.jpg" alt="" class="box-img">
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
                  Я в восторге от этого приложения! Теперь я всегда знаю, какие сериалы мне еще посмотреть, благодаря широкому выбору фильтров. Очень рекомендую всем сериаломанам!
                </p>
                <h6>
                  Роман Лебедев
                </h6>
            
              </div>
              <div class="img-box">
                <img src="../TemplateFiles/images/c2.jpg" alt="" class="box-img">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end client section -->


</asp:Content>
