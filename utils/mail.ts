import { Resend } from 'resend'

export async function sendMail(to: string, subject: string, body: string) {
  const { $client } = useNuxtApp()

  const res = await $client.hello.sendMail.mutate({
    to,
    subject,
    body,
  })

  return res
}
