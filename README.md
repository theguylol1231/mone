# GT4 Reimagined (Netlify Format)

This repository is a Netlify-ready static wrapper for the original project:

- Source: https://github.com/GT-Reimagined/GT4-Reimagined
- Releases: https://github.com/GT-Reimagined/GT4-Reimagined/releases

## Deploy steps

1. Push this repository to your Git provider.
2. In Netlify, import the repository.
3. Use default settings (the included `netlify.toml` handles publish + SPA fallback).

## Create ZIP (all repository files)

Run:

```bash
./create_transfer_zip.sh
```

This creates:

- `dist/mone-all-files.zip`

The ZIP contains all tracked repository files (for example: `.gitignore`, `.gitkeep`, `README.md`, `create_transfer_zip.sh`, `index.html`, `netlify.toml`, `styles.css`).

## Generate a direct download link

After creating the ZIP, run:

```bash
./upload_for_download.sh
```

This uploads `dist/mone-all-files.zip` and prints a direct HTTPS download link.
