# Raycast (sin dump de bases locales)

**No** se exportaron bases de datos locales de Raycast (pueden contener tokens y datos sensibles).

## Instalación

```bash
brew install --cask raycast
```

## Sync / export

- Preferí la sincronización oficial de Raycast (cuenta / settings sync) si está disponible.
- Exportá manualmente extensions, hotkeys y snippets desde la UI de Raycast si necesitás un backup explícito.
- No copies carpetas de Application Support con DBs a un repo público.

## Login item

Raycast está configurado como **item de inicio de sesión** en esta Mac (junto con Bitwarden y Cloudflare WARP). Tras reinstalar:

1. Instalá Raycast vía Homebrew cask.
2. Abrilo una vez e iniciá sesión / restaurá sync.
3. Verificá en *System Settings → General → Login Items* que Raycast figure al inicio.
