function getBus() {
    return axios.get('http://192.168.43.131:3000/getBus');
}

function getOneOfAllBus(num) {
    return axios.get('http://192.168.43.131:3000/getFirstBus/' + num);
}

function getBusByNum(num) {
    return axios.get('http://192.168.43.131:3000/getBus/' + num);
}

function cicle_time1() {
    chiamaTest();
}

function door_open(door) {
    if (door == true) {
        return "Si";
    } else {
        return "No";
    }
}

function test(dataz) {
    return new Promise((si, no) => {
        let pullman = []
            for (var i = 1; i <= dataz; i++) {
                getOneOfAllBus(i).then(function (mezzo) {
                    pullman.push("<tr><td>" + mezzo.data[0].Num + "</td><td>" + mezzo.data[0].Long + "</td><td>" + mezzo.data[0].Lat + "</td><td>" + door_open(mezzo.data[0].Door1_open) + "</td><td>" + door_open(mezzo.data[0].Door2_open) + "</td><td>" + door_open(mezzo.data[0].Door3_open) + "</td><td>" + door_open(mezzo.data[0].Door4_open) + "</td><td>" + mezzo.data[0].N_persone + "</td><td>" + mezzo.data[0].time + "</td></tr>");
                });
        } 
        setTimeout(() => {
            si(pullman)
        },400)
        });
}

async function chiamaTest() {
    dataz = []
    await getBus().then(function (data) { 
        dataz = data.data[0].count
    })
    await test(dataz).then((res) => {
        var titles = "<tr id=\"first_line\"><td>NUMERO MEZZO</td><td>LONGITUDINE</td><td>LATITUDINE</td><td>PORTA N° 1</td><td>PORTA N° 2</td><td>PORTA N° 3</td><td>PORTA N° 4</td><td>NUMERO PERSONE A BORDO</td><td>RACCOLTA DATI</td></tr>";
        var table = "<table id=\"gen_tab\">" + titles;
        document.getElementById("tabella").innerHTML = table + res;
        document.getElementById("tabella").innerHTML += "</table>";
    })
}

async function chiamaTest1(num) {
    await getBusByNum(num).then(function (mezzo) {
        var str = "<b>N° Mazzo: </b>" + mezzo.data[0].Num + "<br>" + "<b>Longitudine: </b>" + mezzo.data[0].Long + "<br>" + "<b>Latitudine: </b>" + mezzo.data[0].Lat + "<br>" + "<b>N° Passeggieri: </b>" + mezzo.data[0].N_persone + "<br>";
        document.getElementById("dati").innerHTML = str;
    })
}






function cicle_time2() {
    var num = document.getElementById('MainContent_DropDownList1').value;
    chiamaTest1(num);
    getBusByNum(num).then(function (mezzo) {
        
        
        /*var LonLat = new OpenLayers.LonLat(mezzo.data[0].Long, mezzo.data[0].Lat)
            .transform(
                new OpenLayers.Projection("EPSG:4326"),
                Mappa.getProjectionObject()
            );
        var LayerMarkers = new OpenLayers.Layer.Markers("Markers");
        Mappa.addLayer(LayerMarkers);

        LayerMarkers.addMarker(new OpenLayers.Marker(LonLat));
        var vectorLayer = new OpenLayers.Layer.Vector("Overlay");

        var feature = new OpenLayers.Feature.Vector(
            new OpenLayers.Geometry.Point(mezzo.data[0].Long, mezzo.data[0].Lat).transform(
                new OpenLayers.Projection("EPSG:4326"),
                Mappa.getProjectionObject()),
            { description: 'Numero Passeggieri ' + mezzo.data[0].N_persone }
        );
        vectorLayer.addFeatures(feature);

        Mappa.addLayer(vectorLayer);

        var controls = {
            selector: new OpenLayers.Control.SelectFeature(vectorLayer, { onSelect: createPopup, onUnselect: destroyPopup })
        };

        function createPopup(feature) {
            feature.popup = new OpenLayers.Popup.FramedCloud("pop",
                feature.geometry.getBounds().getCenterLonLat(),
                null,
                '<div class="markerContent">' + feature.attributes.description + "</div><div> Long: " + mezzo.data[0].Long + ",</div><div> Lat: " + mezzo.data[0].Lat + '</div>',
                null,
                true,
                function () { controls['selector'].unselectAll(); }
            );
            Mappa.addPopup(feature.popup);
        }

        function destroyPopup(feature) {
            feature.popup.destroy();
            feature.popup = null;
        }

        Mappa.addControl(controls['selector']);
        controls['selector'].activate();*/

        for (var i = 0; i < mezzo.data.length; i++) {
            if (i != 0) {
                var styleMap = new OpenLayers.StyleMap({
                    'strokeWidth': 3,
                    'strokeColor': '#ff0000'
                });
                var vector = new OpenLayers.Layer.Vector("Vector Layer",
                    {
                        styleMap: styleMap
                    });
                Mappa.addLayers([vector]);
                var start_point = new OpenLayers.Geometry.Point(mezzo.data[i-1].Long, mezzo.data[i-1].Lat).transform(
                    new OpenLayers.Projection("EPSG:4326"),
                    Mappa.getProjectionObject()
                );
                var end_point = new OpenLayers.Geometry.Point(mezzo.data[i].Long, mezzo.data[i].Lat).transform(
                    new OpenLayers.Projection("EPSG:4326"),
                    Mappa.getProjectionObject()
                );

                var line = new OpenLayers.Feature.Vector(new OpenLayers.Geometry.LineString([start_point, end_point]));
                vector.addFeatures([line]);
            }
        }
    });
}