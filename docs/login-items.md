# Login items (macOS)

Observados en esta Mac (System Events / Applications) al recolectar configs:

| App | Notas |
|-----|--------|
| **Raycast** | Cask Homebrew: `brew install --cask raycast`. Login item activo. |
| **Bitwarden** | Cask: `brew install --cask bitwarden`. Login item activo. |
| **Cloudflare WARP** | App instalada (`Cloudflare WARP.app`). Login item activo. |

## Cloudflare WARP y el playbook

**WARP no está en los casks del playbook** de setup de esta máquina. Tras una reinstalación hay que instalarlo aparte (descarga de Cloudflare o cask `cloudflare-warp` si lo usás) y volver a marcarlo como login item.

También existe **Warp.app** (terminal) vía cask `warp` — no confundir con Cloudflare WARP.
