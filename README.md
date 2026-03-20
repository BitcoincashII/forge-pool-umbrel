# Forge Pool - Umbrel App

Self-hosted BCH2 mining pool for Umbrel.

## Quick Start

1. Install Forge Pool from the Umbrel App Store
2. Wait for the BCH2 node to sync (~5 minutes)
3. Open the web UI and set your pool payout address
4. Point your miners to: `stratum+tcp://umbrel.local:3333`
5. Use your BCH2 address as the username

## Miner Configuration

```
URL: stratum+tcp://YOUR_UMBREL_IP:3333
Username: YOUR_BCH2_ADDRESS.WORKER_NAME
Password: x
```

### Worker Name Suffixes

- `.solo` - Solo mining mode (keep 100% of blocks you find)
- No suffix - PPLNS mode (shared rewards)

Example:
- `bitcoincashii:qr08krt838kws3du9xgu0r50jmxpkmna7gnl732fwz.rig1` - PPLNS
- `bitcoincashii:qr08krt838kws3du9xgu0r50jmxpkmna7gnl732fwz.rig1.solo` - Solo

## Default Settings

| Setting | Default | Description |
|---------|---------|-------------|
| Pool Fee | 1% | Fee on PPLNS blocks |
| Solo Fee | 0.5% | Fee on solo blocks |
| Min Payout | 5 BCH2 | Minimum balance for auto-payout |
| Stratum Port | 3333 | Port for miner connections |

## Data Storage

All data is stored in your Umbrel's app data directory:
- `node/` - BCH2 blockchain (pruned, ~100MB)
- `postgres/` - Pool database
- `redis/` - Cache data

## Ports

| Port | Service | Description |
|------|---------|-------------|
| 3080 | Web UI | Pool dashboard |
| 3333 | Stratum | Miner connections |

## Troubleshooting

### Node not syncing
Check the node logs: `docker logs forge-node`

### Miners can't connect
Ensure port 3333 is forwarded on your router.

### Pool shows 0 hashrate
Wait for miners to submit shares. Hashrate updates every 5 minutes.

## Support

- GitHub Issues: https://github.com/bch2/forge-pool/issues
- Website: https://hashforge.bch2.org
