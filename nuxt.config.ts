import { env } from 'std-env'

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  ssr: false,
  devtools: { enabled: true },
  app: {
    head: {
      title: 'opinionated nuxt',
      meta: [
        {
          name: 'description',
          content: 'an opinionated nuxt starter template',
        },
      ],
      link: [
        {
          rel: 'icon',
          href: '/oink.svg',
        },
      ],
    },
  },
  build: {
    transpile: ['trpc-nuxt'],
  },
  features: {
    inlineStyles: false,
  },
  modules: [
    '@vueuse/nuxt',
    'notivue/nuxt',
    '@unocss/nuxt',
    '@sidebase/nuxt-auth',
    '@formkit/auto-animate/nuxt',
  ],
  css: [
    '@unocss/reset/tailwind.css',
    'notivue/notifications.css',
    'notivue/animations.css',
    'md-editor-v3/lib/style.css',
  ],
  imports: {
    imports: [
      {
        name: 'nanoid',
        from: 'nanoid',
      },
      {
        name: 'consola',
        from: 'consola',
      },
      {
        name: 'faker',
        as: 'dataPort',
        from: '@faker-js/faker',
      },
    ],
  },
  auth: {
    isEnabled: false,
  },
  notivue: {
    position: 'bottom-right',
  },
  runtimeConfig: {
    public: {
      NETWORK: env.NETWORK,
      NC_ADDRESS: env.NC_ADDRESS,
      OWNER_ADDRESS: env.OWNER_ADDRESS,
      pusherConfig: {
        appId: env.PUSHER_APP_ID,
        key: env.PUSHER_KEY,
        secret: env.PUSHER_SECRET,
        cluster: env.PUSHER_CLUSTER || 'ap2',
        useTLS: true,
      },
    },
  },
})
