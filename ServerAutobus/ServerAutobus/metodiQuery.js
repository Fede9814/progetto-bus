const influx = require('influx');

const influx = new Influx.InfluxDB({
    host: 'localhost:8086',
    database: 'time_bus',
    schema: [
        {
            measurement: 'Bus',
            fields: { Num: Influx.FieldType.INTEGER, Lat: Influx.FieldType.FLOAT, Long: Influx.FieldType.FLOAT, Door1_open: Influx.FieldType.BOOLEAN, Door2_open: Influx.FieldType.BOOLEAN, Door3_open: Influx.FieldType.BOOLEAN, Door4_open: Influx.FieldType.BOOLEAN, N_persone: Influx.FieldType.INTEGER }
        }
    ]
});

influx.query("INSERT Bus Num=1i,Lat=45.94755569546808,Long=12.609926930892641,Door1_open=false,Door2_open=false,Door3_open=false,Door4_open=false,N_persone=22i 1556808474000000000")
    .then(result => response.status(200).json(result))
    .catch(error => response.status(500).json({ error })
);

