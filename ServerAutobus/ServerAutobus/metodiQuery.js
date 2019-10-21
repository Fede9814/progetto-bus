const Influx = require('influx');
var CONFIG = require('./config.json');

var influxAddress = CONFIG.InfluxAddress;
var influxPort = CONFIG.InfluxPort;

const influx = new Influx.InfluxDB({
    host: influxAddress,
    port: influxPort,
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


module.exports.sendDate = async function (list) {

    
    influx.writePoints([
        {
            measurement: 'Bus',
            tags: {},
            fields: {
                Num: list.Mezzo,
                Lat: list.Latitudine,
                Long: list.Longitudine,
                Door1_open: isTrue(list.Door1_open),
                Door2_open: isTrue(list.Door2_open),
                Door3_open: isTrue(list.Door3_open),
                Door4_open: isTrue(list.Door4_open),
                N_persone: list.N_ppl
            },
            timestamp: list.Time,
        }
    ], {
            pecision: 'rfc339'
        })

    function isTrue(val) {
        if (val == "True") {
            return true;
        } else {
            return false;
        }
    }
    
    return list;

}





