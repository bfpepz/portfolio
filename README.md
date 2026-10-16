# brendanpeppler.com — static site

A plain HTML/CSS rebuild of the Squarespace site. No build step, no framework:
any static host can serve this folder as-is.

```
index.html          about page
resume.html         resume
portfolio.html      project grid (placeholder until projects are added)
projects/           one HTML page per project (_template.html to copy)
styles.css          all styling; colors/fonts are variables at the top
images/             headshot, social preview image, project images
get-images.sh       pulls your images off Squarespace's CDN into images/
```

## 1. Grab your images (do this before cancelling Squarespace)

```
sh get-images.sh
```

The pages expect `images/headshot.jpg` and `images/og.jpg`. Once Squarespace
is gone, its CDN links will stop working, so run this first.

## 2. Preview locally

Open `index.html` in a browser, or run `python3 -m http.server` in this folder
and visit http://localhost:8000.

## 3. Host it

Any of these are free for a site this size; drag-and-drop the folder or
connect a GitHub repo:

- **Netlify** — drag the folder onto app.netlify.com/drop
- **Cloudflare Pages** — connect a repo or upload directly
- **GitHub Pages** — push to a repo, enable Pages in settings

Then point `brendanpeppler.com` at the new host (DNS settings at your domain
registrar; if the domain was bought through Squarespace, transfer it or
update its DNS records there).

## Password-protecting the portfolio

A static site can't securely password-protect a page by itself — a password
check written in JavaScript can be bypassed by anyone who views the source.
Real options:

- **Cloudflare Pages + Cloudflare Access** (free tier): protect `/portfolio*`
  and `/projects/*`; visitors verify by email or a one-time code.
- **Netlify** — site-wide or per-path password protection on paid plans.
- **Vercel** — password protection on paid plans.
- **No password** — keep project pages unlisted (`noindex` is already set) and
  share links directly.

## Adding a project

1. Copy `projects/_template.html` to `projects/your-project.html` and fill it in.
2. Add a matching `<article class="project">` card in `portfolio.html`.
3. Put images in `images/` and reference them as `../images/...` from project pages.
