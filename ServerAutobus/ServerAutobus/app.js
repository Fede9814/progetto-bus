const fastify = require('fastify')({
    logger: true,
    ignoreTrallingSlash: true
});


fastify.post('/', async (request, reply) => {
    var list = request.body;
    console.log(list);
    /*var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
      if ((new Date().getTime() - start) > 5000){
        break;
      }
    }*/
    return list;
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