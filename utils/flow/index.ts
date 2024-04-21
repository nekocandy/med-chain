import { config } from '@onflow/fcl'
import flowJSON from '../../flow.json'

const runtimeConfig = useRuntimeConfig().public
const network: 'mainnet' | 'testnet' | 'emulator' = (runtimeConfig.NETWORK as 'mainnet' | 'testnet' | 'emulator') || 'emulator'

const { NC_ADDRESS } = runtimeConfig
const all_address: Record<string, string> = {}

const fclConfigInfo = {
  mainnet: {
    accessNode: 'https://rest-mainnet.onflow.org',
    discoveryWallet: 'https://fcl-discovery.onflow.org/authn',
    discoveryAuthInclude: [],
  },
  testnet: {
    accessNode: 'https://rest-testnet.onflow.org',
    discoveryWallet: 'https://fcl-discovery.onflow.org/testnet/authn',
    discoveryAuthInclude: [],
  },
  emulator: {
    accessNode: 'http://127.0.0.1:8888',
    discoveryWallet: 'http://localhost:8701/fcl/authn',
    discoveryAuthInclude: [],
  },
}

Object.entries(flowJSON.contracts)
  .filter(([_, value]) => typeof value === 'object')
  .map(([key, contract]) => all_address[`0x${key}`] = `0x${(contract as any).aliases[network]}`)

Object.entries(flowJSON.accounts)
  .filter(([_, value]) => typeof value === 'object')
  .map(([key, account]) => all_address[`0x${key}`] = `0x${(account as any).address}`)

consola.info(`[Flow] Network: ${network}`)
consola.info(`[Flow] All Address: ${JSON.stringify(all_address)}`)

config({
  'app.detail.title': 'Something',
  'app.detail.icon': 'https://pycz.dev/favicon.svg',
  'flow.network': network,
  'accessNode.api': fclConfigInfo[network].accessNode,
  'discovery.wallet': fclConfigInfo[network].discoveryWallet,
  'discovery.authn.include': fclConfigInfo[network].discoveryAuthInclude,
  '0xNC': NC_ADDRESS,
  ...all_address,
}).load({ flowJSON })

export { network }
