import { z } from 'zod'
import consola from 'consola'
import { Resend } from 'resend'
import { publicProcedure, router } from '../trpc'

export const helloRouter = router({
  hi: publicProcedure
    .query(() => {
      return 'Hello World!'
    }),

  sendMail: publicProcedure
    .input(z.object({
      to: z.string(),
      subject: z.string(),
      body: z.string(),
    }))
    .mutation(async ({ input }) => {
      const { to, subject, body } = input

      const { MAIL_KEY } = useRuntimeConfig().public
      const resend = new Resend(MAIL_KEY)

      try {
        await resend.emails.send({
          from: 'Medi Demo <demo+medi@piyush.party>',
          to,
          subject,
          html: body,
        })
      }
      catch (error) {
        consola.withTag('[MAIL]').error('Failed to send email:', error)
      }
    }),
})
