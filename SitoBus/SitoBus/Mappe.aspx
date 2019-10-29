<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mappe.aspx.cs" Inherits="SitoBus.Mappe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.0.1/css/ol.css" type="text/css">
    <script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.0.1/build/ol.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="js_bus.js"></script>


    <style>
      .map {
        width: 100%;
      }

      #close{
          top: 50px;
          right: 10px;
          position: absolute;
          z-index: 1;
          visibility: hidden;
      }
      #open{
          top: 50px;
          right: 10px;
          position: absolute;
          visibility: hidden;
      }
      #dati{
          position: absolute;
          right: 10px;
          bottom: 10px;
          height: 150px;
          width: 400px;
          z-index: 3;
          background-color: white;
          border-radius: 10px;
          border: 2px solid black;
          padding:10px;
          display: none;
      }
    .mySlides {
          display: none;
          background-position: center;
          background-repeat: no-repeat;
          background-size: cover;
          position: relative;
          transition: 0.5s;
    }
    img {vertical-align: middle;}


    .slideshow-container {
      left: 0px;
      right: 0px;
      position: relative;
      margin: auto;
    }

    .active {
      background-color: #717171;
    }

    .fade {
      -webkit-animation-name: fade;
      -webkit-animation-duration: 5s;
      animation-name: fade;
      animation-duration: 5s;
      animation-iteration-count: 2;
      animation-direction: alternate;
    }

    @-webkit-keyframes fade {
      from {opacity: 0} 
      to {opacity: 1}
    }

    @keyframes fade {
      from {opacity: 0} 
      to {opacity: 1}
    }

    @media only screen and (max-width: 300px) {
      .text {font-size: 11px}
    }
      
    </style>


    <div class="slideshow-container">
        <div class="position-relative p-3 p-md-5 m-md-3 text-center bg-light mySlides fade" style="background-image:url('Image/1.jpg')">
            <div class="col-md-5 p-lg-5 mx-auto my-5 text-center">
            </div>
        </div>
            <div class="position-relative p-3 p-md-5 m-md-3 text-center bg-light mySlides fade" style="background-image:url('Image/2.jpg')">
            <div class="col-md-5 p-lg-5 mx-auto my-5 text-center">
            </div>
        </div>
            <div class="position-relative p-3 p-md-5 m-md-3 text-center bg-light mySlides fade" style="background-image:url('Image/3.jpeg')">
            <div class="col-md-5 p-lg-5 mx-auto my-5 text-center">
            </div>
        </div>
    </div>
        <script>
            var slideIndex = 0;
            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) { slideIndex = 1 }
                slides[slideIndex - 1].style.display = "block";
                setTimeout(showSlides, 10000);
            }
            showSlides();
    </script>
    <div class="flex-md-equal w-100 my-md-3 pl-md-3">
        <div class="bg-success mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white" style="width: 100%;">
            <div class="my-3 py-3">
                <h2 class="display-5">
                    Seleziona il veicolo
                </h2>
                <p class="lead">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control">
                        <asp:ListItem Selected="True" Value="0">Seleziona</asp:ListItem>
                    </asp:DropDownList>
                </p>
            </div>
        </div>
        <div id="divpass" class="divpass" runat="server" style="display:none"></div>
        <div id="dati"></div>
        <i class="fas fa-times fa-3x" id="close"></i>    
        <i class="fas fa-expand fa-3x" id="open"></i>
         <div id="map" class="map" style="visibility:hidden">
         </div>
        <script src="http://www.openlayers.org/api/OpenLayers.js"></script>
            <script type="text/javascript">

                var Mappa = new OpenLayers.Map("map");
                Mappa.addLayer(new OpenLayers.Layer.OSM());
                var zoom = 15;
                var LonLat = new OpenLayers.LonLat(12.65324592590332, 45.96302386386836)
                    .transform(
                        new OpenLayers.Projection("EPSG:4326"),
                        Mappa.getProjectionObject()
                    );
                Mappa.setCenter(LonLat, zoom);
                setTimeout(function () { Mappa.updateSize(); }, 50);

                    

                try {
                    let el = document.getElementById('MainContent_DropDownList1').value
                    if (el != 0) {

                        document.getElementById("map").style.position = "absolute";
                        document.getElementById("map").style.top = "45px";
                        document.getElementById("map").style.left = "0px";
                        document.getElementById("map").style.visibility = "visible";
                        document.getElementById("close").style.visibility = "visible";
                        document.getElementById("map").style.height = "94%";
                        document.getElementById("dati").style.display = "block";

                        $("#close").click(function () {
                            document.getElementById("map").style.display = "none";
                            document.getElementById("close").style.visibility = "hidden";
                            document.getElementById("open").style.visibility = "visible";
                            document.getElementById("dati").style.display = "none";
                        });

                        $("#open").click(function () {
                            document.getElementById("map").style.display = "block";
                            document.getElementById("close").style.visibility = "visible";
                            document.getElementById("open").style.visibility = "hidden";
                            document.getElementById("dati").style.display = "block";
                        });

                        cicle_time2();
                    }
                    
                    
                } catch (e) {
                        console.log(e.message);
                }

                setInterval(() => { clearInterval(); cicle_time2()}, 1000);
           </script>
    </div>
</asp:Content>
