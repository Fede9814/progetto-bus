<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SitoBus._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #text_box{
            color: black;
        }
    .mySlides {display: none}
    img {vertical-align: middle;}

    .slideshow-container {
      position: relative;
      margin: auto;
    }

    .prev, .next {
      cursor: pointer;
      position: absolute;
      top: 50%;
      width: auto;
      padding: 16px;
      margin-top: -22px;
      color: white;
      font-weight: bold;
      font-size: 18px;
      transition: 0.6s ease;
      border-radius: 0 3px 3px 0;
      user-select: none;
    }

    .next {
      right: 0;
      border-radius: 3px 0 0 3px;
    }

    .prev:hover, .next:hover {
      background-color: rgba(0,0,0,0.8);
    }

    .active, .dot:hover {
      background-color: #717171;
    }

    .fade {
      -webkit-animation-name: fade;
      -webkit-animation-duration: 1.5s;
      animation-name: fade;
      animation-duration: 1.5s;
        animation-fill-mode: forwards;
    }

    @-webkit-keyframes fade {
      from {opacity: .4} 
      to {opacity: 1}
    }

    @keyframes fade {
      from {opacity: .4} 
      to {opacity: 1}
    }

    @media only screen and (max-width: 300px) {
      .prev, .next,.text {font-size: 11px}
    }
</style>
    <div class="slideshow-container">
        <div class="position-relative p-3 p-md-5 m-md-3 text-center mySlides fade" style="background-image:url('Image/1.jpg')">
            <div class="col-md-5 p-lg-5 mx-auto my-5 text-center bg-light">
                <asp:Label ID="Label1" runat="server" Text="WeBusIt" class="display-4 font-weight-normal"></asp:Label><br />
                <asp:Label ID="Label2" runat="server" Text="Web Bus Intelligence" class="lead font-weight-normal"></asp:Label>
            </div>
        </div>
        <div class="position-relative p-3 p-md-5 m-md-3 text-center mySlides fade" style="background-image:url('Image/2.jpg')">
            <div class="col-md-5 p-lg-5 mx-auto my-5 text-center bg-light">
                <asp:Label ID="Label3" runat="server" Text="WeBusIt" class="display-4 font-weight-normal"></asp:Label><br />
                <asp:Label ID="Label4" runat="server" Text="Web Bus Intelligence" class="lead font-weight-normal"></asp:Label>
            </div>
        </div>
        <div class="position-relative p-3 p-md-5 m-md-3 text-center mySlides fade" style="background-image:url('Image/3.jpeg')">
            <div class="col-md-5 p-lg-5 mx-auto my-5 text-center bg-light">
                <asp:Label ID="Label5" runat="server" Text="WeBusIt" class="display-4 font-weight-normal"></asp:Label><br />
                <asp:Label ID="Label6" runat="server" Text="Web Bus Intelligence" class="lead font-weight-normal"></asp:Label>
            </div>
        </div>
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>

    </div>

    <script>
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";
        }
    </script>
    <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
        <div class="bg-success mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white div-msg">
            <div class="my-3 py-3">
                <h2 class="display-5">Presentazione del progetto</h2>
                <p class="lead">Cos'è WeBusIt</p>
            </div>
            <div class="bg-light shadow-sm mx-auto text-box" id="text_box" style="width: 80%; border-radius: 21px 21px 0 0;">
                <br />
                WeBusIt è un applicazione web che permette il monitoraggio <br />da remoto di tutti gli autobus connessi a questo sistema.
                <br />
                <br />
                Il ogni autobus dotato dell'attrezzatura sarà in grado di inviare<br /> informazioni utili a server centrale, cosi da permettere al server di elaborare i dati, <br />
                immagazzinarli nel databse e inviarli al sito web.<br />
                <br />
                La demo del sito presenta alcune funzionalità che permettono la visualizzazione di questi dati.<br />
                Per primo abbiamo al visualizzazione di dei vari autobus e della<br /> rotta che stanno percorrendo in tempo reale e alcuni dati utili.<br />
                Nella seconda videata abbiamo la possibilità di vedere la posizione<br /> di tutti gli autobus collegati nell'ultima posizione registrata,<br />
                in più è presente una tabella che in tempo reale registra quei dati<br /> e permette la visualizzazione di ogni informazionie utile sugli autobus.<br />
                <br />
            </div>
        </div>
        <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden div-login">
            <div class="my-3 p-3">
                <h2 class="display-5">Login</h2>
            </div>
            <div class="bg-success shadow-sm mx-auto div-login-dark" style="width: 80%; height: 300px;">
                <div class="login-area">
                    <label for="inputEmail" class="sr-only">Email address</label>
                    <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="" />
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="" />
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
