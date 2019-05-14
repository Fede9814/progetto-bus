const fastify = require('fastify')({
    logger: true,
    ignoreTrallingSlash: true
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

const start = async () => {
    try {
        await fastify.listen(3000, '192.168.43.131')

        fastify.log.info(`server listening on ${fastify.server.address().port}`)

    } catch (err) {
        fastify.log.error(err)
        process.exit(1)
    }
}
start()