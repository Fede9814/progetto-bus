<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mappe.aspx.cs" Inherits="SitoBus.Mappe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.0.1/css/ol.css" type="text/css">
    <script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.0.1/build/ol.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

    <style>
      .map {
        height: 700px;
        width: 100%;
      }
    </style>
    <div class="position-relative p-3 p-md-5 m-md-3 text-center bg-light">
        <div class="col-md-5 p-lg-5 mx-auto my-5 text-center bg-light">
            <asp:Label ID="Label1" runat="server" Text="Mappe Utili"></asp:Label><br />
            <asp:Label ID="Label2" runat="server" Text="Localizzazione degli autobus"></asp:Label>
        </div>
    </div>
    <div class="flex-md-equal w-100 my-md-3 pl-md-3">
        <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white" style="width: 100%;">
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

                var cella = $('.divpass').text();

                try {
                    var o = JSON.parse(cella);

                        var LonLat = new OpenLayers.LonLat(o[0].Long, o[0].Lat)
                            .transform(
                                new OpenLayers.Projection("EPSG:4326"),
                                Mappa.getProjectionObject()
                        );
                        var LayerMarkers = new OpenLayers.Layer.Markers("Markers");
                        Mappa.addLayer(LayerMarkers);

                        LayerMarkers.addMarker(new OpenLayers.Marker(LonLat));


                    var val;
                    for (var i = 0; i < o.length; i++) {
                        if (i != 0) {
                            val = 0;
                            var vector = new OpenLayers.Layer.Vector();
                            Mappa.addLayers([vector]);
                            var start_point = new OpenLayers.Geometry.Point(o[i - 1].Long, o[i - 1].Lat).transform(
                                new OpenLayers.Projection("EPSG:4326"),
                                Mappa.getProjectionObject()
                            );
                            var end_point = new OpenLayers.Geometry.Point(o[i].Long, o[i].Lat).transform(
                                new OpenLayers.Projection("EPSG:4326"),
                                Mappa.getProjectionObject()
                            );

                            var line = new OpenLayers.Feature.Vector(new OpenLayers.Geometry.LineString([start_point, end_point]));
                            vector.addFeatures([line]);

                        }
                    }
                    
                    

                }catch (e) {
                    console.log(e.message);
                }
                

                //var LayerMarkers = new OpenLayers.Layer.Markers("Markers");
                //Mappa.addLayer(LayerMarkers);

                //LayerMarkers.addMarker(new OpenLayers.Marker(LonLat));

                
           </script>
    </div>
</asp:Content>
