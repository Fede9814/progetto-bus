const Influx = require('influx');

const influx = new Influx.InfluxDB({
   host: 'localhost',
   port: 8086,
   database: 'time_bus',
   username: 'fede',
   password: 'fede',
   schema: [
       {
           measurement: 'Bus',
           fields: {
                Num: Influx.FieldType.INTEGER, 
                Lat: Influx.FieldType.FLOAT, 
                Long: Influx.FieldType.FLOAT, 
                Door1_open: Influx.FieldType.BOOLEAN, 
                Door2_open: Influx.FieldType.BOOLEAN, 
                Door3_open: Influx.FieldType.BOOLEAN, 
                Door4_open: Influx.FieldType.BOOLEAN, 
                N_persone: Influx.FieldType.INTEGER
           },
           tags: []
       }
   ]
})

// const Influx = new Influx.InfluxDB('http://fede:fede@loalhost:8086/prova')




influx.query("SELECT * FROM Bus")
    .then(rows => console.log(rows))



