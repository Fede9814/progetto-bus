const fastify = require('fastify')({
    logger: true,
    ignoreTrallingSlash: true
});

fastify.register(require('fastify-cors'), {
    origin: true,
    allowedHeaders: ['Content-Type'],
    methods: ['GET']
})

var CONFIG = require('./config.json');

var listenAddress = CONFIG.ListenAddress;
var listenPort = CONFIG.ListenPort;

var child = require('child_process').exec;
var executablePath = "start ..\\..\\Influx\\influxd.exe";

child(executablePath, function (err, data) {
    console.log(err)
    console.log(data.toString());
});


var metodi = require("./metodiQuery");

fastify.post('/', async (request, reply) => {
    var list = request.body;
    let res = await metodi.sendDate(list);
    console.log(list);
    return res;
})

fastify.get('/ping', async (request, reply) => {
    var res = "ciao";
    return res;
})

fastify.get("/getBus/:num", async (request, reply) => {
    num = request.params['num'];
    return await metodi.getDateByNum(num);
});

fastify.get("/getBus", async (request, reply) => {
    return await metodi.getDate();
});

fastify.get("/getFirstBus/:num", async (request, reply) => {
    num = request.params['num'];
    return await metodi.getFirstBus(num);
});

const start = async () => {
    try {
        await fastify.listen(listenPort, listenAddress)

        fastify.log.info(`server listening on ${fastify.server.address().port}`)

    } catch (err) {
        //fastify.log.error(err)
        console.log(err)
        //process.exit(1)
    }
}
start()