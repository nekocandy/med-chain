import Pusher from 'pusher'

const pusherConfig = useRuntimeConfig().public.pusherConfig

export const pusher = new Pusher(pusherConfig)
