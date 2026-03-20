# Forge Pool for Umbrel

Self-hosted BCH2 mining pool for Umbrel.

## Installation

### Option 1: Community App Store (Recommended)

```bash
# SSH into your Umbrel
ssh umbrel@umbrel.local

# Add the BCH2 community app store
sudo ~/umbrel/scripts/repo add https://github.com/BitcoincashII/umbrel-app-store

# Install Forge Pool
sudo ~/umbrel/scripts/app install forge-pool
```

### Option 2: Direct Install from GitHub

```bash
# SSH into your Umbrel
ssh umbrel@umbrel.local

# Clone directly into Umbrel's app directory
cd ~/umbrel/app-data
git clone https://github.com/BitcoincashII/forge-pool-umbrel.git forge-pool

# Install
sudo ~/umbrel/scripts/app install forge-pool
```

### Option 3: Manual Docker Compose

```bash
# Clone the repo
git clone https://github.com/BitcoincashII/forge-pool-umbrel.git
cd forge-pool-umbrel

# Copy and configure environment
cp .env.example .env
nano .env  # Set your POOL_ADDRESS

# Start all services
docker-compose up -d
```

## Quick Start

1. Install Forge Pool using one of the methods above
2. Wait for the BCH2 node to sync (~5 minutes)
3. Open the web UI at `http://umbrel.local:3080`
4. Point your miners to `stratum+tcp://umbrel.local:3333`

## Miner Configuration

```
URL: stratum+tcp://YOUR_UMBREL_IP:3333
Username: YOUR_BCH2_ADDRESS.WORKER_NAME
Password: x
```

### Mining Modes

| Worker Suffix | Mode | Description |
|---------------|------|-------------|
| `.solo` | Solo | Keep 100% of blocks you find |
| (none) | PPLNS | Shared rewards with other miners |

**Examples:**
```
bitcoincashii:qr08krt...7gnl732fwz.rig1       → PPLNS
bitcoincashii:qr08krt...7gnl732fwz.rig1.solo  → Solo
```

## Configuration

| Setting | Default | Description |
|---------|---------|-------------|
| `POOL_ADDRESS` | (required) | Your BCH2 address for fees/rewards |
| `POOL_NAME` | My Forge Pool | Pool name shown in UI |
| `POOL_FEE` | 1.0 | PPLNS fee percentage |
| `SOLO_FEE` | 0.5 | Solo mining fee percentage |
| `MIN_PAYOUT` | 5 | Minimum BCH2 for auto-payout |
| `STRATUM_PORT` | 3333 | Stratum port for miners |
| `APP_PORT` | 3080 | Web UI port |

## Ports

| Port | Service | Description |
|------|---------|-------------|
| 3080 | Web UI | Pool dashboard |
| 3333 | Stratum | Miner connections (forward this on your router) |

## Data Storage

All data stored in Umbrel's app data directory:
- `node/` - BCH2 blockchain (pruned, ~100MB)
- `postgres/` - Pool database
- `redis/` - Cache

## Updating

```bash
cd ~/umbrel/app-data/forge-pool
git pull
sudo ~/umbrel/scripts/app restart forge-pool
```

## Troubleshooting

**Node not syncing?**
```bash
docker logs forge-node
```

**Miners can't connect?**
- Ensure port 3333 is forwarded on your router
- Check firewall: `sudo ufw allow 3333`

**Pool shows 0 hashrate?**
- Hashrate updates every 5 minutes after shares are submitted

## Releases

Pre-built Docker images are available at:
- `ghcr.io/bitcoincashii/forge-pool-node`
- `ghcr.io/bitcoincashii/forge-pool-api`
- `ghcr.io/bitcoincashii/forge-pool-stratum`
- `ghcr.io/bitcoincashii/forge-pool-web`

## Support

- Issues: https://github.com/BitcoincashII/forge-pool-umbrel/issues
- Website: https://hashforge.bch2.org
