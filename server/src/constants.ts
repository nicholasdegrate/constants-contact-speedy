import { z } from "zod";

export const environmentSchema = z.object({
	NODE_ENV: z.enum(["development", "production", "staging"]).default("development"),
	PORT: z.coerce.number().default(3000),
	HOST: z.string().default("0.0.0.0"),
});

export const env = environmentSchema.parse(process.env);

export const CORS_URL = [/https?:\/\/localhost:\d{4}/];
