import Fastify from 'fastify';

const fastify = Fastify({ logger: true });

// Define the hello world route
fastify.get('/hello', async (request, reply) => {
  return { hello: 'world' };
});

// Start the server
const start = async () => {
  try {
    await fastify.listen({ port: 3000, host: '0.0.0.0' });
  } catch (err) {
    fastify.log.error(err);
    process.exit(1);
  }
};

start();
