import cors from "@fastify/cors";
import helmet from "@fastify/helmet";
import "dotenv/config";
import Fastify from "fastify";
import { CORS_URL, env } from "~/constants";

const fastify = Fastify();

fastify.register(cors, { origin: CORS_URL });
fastify.register(helmet, { global: true, hidePoweredBy: true });

fastify.get("/", async (_, reply) => {
	reply.send({ hello: "world" });
});

fastify.listen({ host: env.HOST, port: env.PORT }, (err, address) => {
	console.info(`ℹ️ NODE_ENV="${env.NODE_ENV}"`);
	console.info(`🚀 Server listening on ${address}`);
	if (err) {
		fastify.log.error(err);
		process.exit(1);
	}
});
