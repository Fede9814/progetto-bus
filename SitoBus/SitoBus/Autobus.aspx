<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Autobus.aspx.cs" Inherits="SitoBus.Autobus" %>
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
        text-align:right;
      }

      #close{
          top: 50px;
          right: 10px;
          position: absolute;
          z-index: 1;
          visibility: hidden;
      }
      #open{
          top: 60px;
          right: 10px;
          position: absolute;
          visibility: hidden;
      }

      #small{
          top: 60px;
          right: 60px;
          position: absolute;
          visibility: hidden;
          z-index: 1;
      }

      #big{
          top: 60px;
          right: 60px;
          position: absolute;
          visibility: hidden;
          z-index: 1;
      }
      #tabella{
          right: 10px;
      }
      #gen_tab{
          border: 1px solid black;
          width: 100%;
      }
      #first_line{
          background-color: #28a745;
          font-weight: bold;
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
      -webkit-animation-duration: 5.0s;
      animation-name: fade;
      animation-duration: 5.0s;
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

    @keyframes mapin {
      from {left: 0%} 
      to {left: 50%}
    }

    @keyframes mapsmall {
      from {width: 0%} 
      to {width: 50%}
    }

    @keyframes mapout {
      from {left: 50%} 
      to {left: 0%}
    }

    @keyframes mapbig {
      from {width: 50%} 
      to {width: 0%}
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
        <div id="tabella"></div>
        <div id="divpass" class="divpass" runat="server" style="display:none"></div>
        <i class="fas fa-times fa-4x" id="close"></i> 
        <i class="fas fa-expand fa-3x" id="open"></i>
        <i class="fas fa-compress-arrows-alt fa-3x" id="small"></i>
        <i class="fas fa-expand-arrows-alt fa-3x" id="big"></i>
         <div id="map" class="map"></div>
        <script src="http://www.openlayers.org/api/OpenLayers.js"></script>
            <script type="text/javascript">

                var Mappa = new OpenLayers.Map("map");
                Mappa.addLayer(new OpenLayers.Layer.OSM());
                var zoom = 1;
                var LonLat = new OpenLayers.LonLat(12.628847, 45.956183)
                    .transform(
                        new OpenLayers.Projection("EPSG:4326"),
                        Mappa.getProjectionObject()
                    );
                Mappa.setCenter(LonLat, zoom);

                setTimeout(function () { Mappa.updateSize(); }, 50);

                document.getElementById("map").style.position = "absolute";
                document.getElementById("map").style.top = "45px";
                document.getElementById("map").style.left = "0px";
                document.getElementById("map").style.visibility = "visible";
                document.getElementById("close").style.visibility = "visible";
                document.getElementById("small").style.visibility = "visible";
                document.getElementById("map").style.height = "94%";

                $("#close").click(function () {
                    document.getElementById("map").style.display = "none";
                    document.getElementById("tabella").style.width = "100%";
                    document.getElementById("close").style.visibility = "hidden";
                    document.getElementById("open").style.visibility = "visible";
                    document.getElementById("big").style.visibility = "hidden";
                    document.getElementById("small").style.visibility = "hidden";
                });

                $("#small").click(function () {
                    document.getElementById("map").style.width = "50%";
                    document.getElementById("map").style.animation = "mapin 1s forwards";
                    document.getElementById("tabella").style.width = "48%";
                    document.getElementById("map").style.left = "50%";
                    document.getElementById("close").style.visibility = "visible";
                    document.getElementById("small").style.visibility = "hidden";
                    document.getElementById("big").style.visibility = "visible";
                });

                $("#big").click(function () {
                    document.getElementById("map").style.width = "100%";
                    document.getElementById("map").style.animation = "mapout 1s forwards";
                    document.getElementById("tabella").style.width = "100%";
                    document.getElementById("map").style.left = "0px";
                    document.getElementById("close").style.visibility = "visible";
                    document.getElementById("small").style.visibility = "visible";
                    document.getElementById("big").style.visibility = "hidden";
                });

                $("#open").click(function () {
                    document.getElementById("map").style.display = "block";
                    document.getElementById("tabella").style.width = "48%";
                    document.getElementById("close").style.visibility = "visible";
                    document.getElementById("open").style.visibility = "hidden";
                    document.getElementById("big").style.visibility = "hidden";
                    document.getElementById("small").style.visibility = "visible";
                });

                try {
                    getBus().then(function (data) {
                        for (var i = 1; i <= data.data[0].count; i++) {
                            getOneOfAllBus(i).then(function (mezzo) {
                                var LonLat = new OpenLayers.LonLat(mezzo.data[0].Long, mezzo.data[0].Lat)
                                    .transform(
                                        new OpenLayers.Projection("EPSG:4326"),
                                        Mappa.getProjectionObject()
                                    );
                                var LayerMarkers = new OpenLayers.Layer.Markers("Markers");
                                Mappa.addLayer(LayerMarkers);

                                LayerMarkers.addMarker(new OpenLayers.Marker(LonLat));
                            });
                        }
                    });
                    cicle_time1();
                }catch (e) {
                    console.log(e.message);
                }
                setInterval(() => { clearInterval(); cicle_time1() }, 1000);
           </script>
    </div>
</asp:Content>
