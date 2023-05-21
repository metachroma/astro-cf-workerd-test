import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import cloudflare from "@astrojs/cloudflare";

// https://astro.build/config
export default defineConfig({
  site: 'https://example.com',
  output: 'server',
  integrations: [mdx()],
  adapter: cloudflare()
});