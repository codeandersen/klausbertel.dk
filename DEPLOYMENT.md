# Deployment Guide - Cloudflare Pages

This guide will help you deploy the klausbertel.dk website to Cloudflare Pages.

## Prerequisites

- GitHub account
- Cloudflare account
- Node.js 18+ installed locally (for testing)

## Step 1: Prepare Your Repository

1. **Initialize Git** (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Psykolog Klaus Bertel website"
   ```

2. **Create GitHub Repository**:
   - Go to https://github.com/new
   - Name: `klausbertel.dk`
   - Make it private or public (your choice)
   - Don't initialize with README (we already have one)

3. **Push to GitHub**:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/klausbertel.dk.git
   git branch -M main
   git push -u origin main
   ```

## Step 2: Add Images

Before deploying, add your images to `public/images/`:

1. **hero-background.jpg** - A calming nature scene (tree, landscape)
   - Recommended size: 1920x1080px
   - Optimize for web (< 500KB)

2. **klaus-profile.jpg** - Professional headshot
   - Recommended size: 800x800px
   - Optimize for web (< 200KB)

If you don't have images yet, the site will still work - the hero will show a gradient background and the profile image will be hidden.

## Step 3: Deploy to Cloudflare Pages

### Option A: Via Cloudflare Dashboard (Recommended)

1. **Log in to Cloudflare**:
   - Go to https://dash.cloudflare.com/
   - Navigate to "Workers & Pages"

2. **Create New Project**:
   - Click "Create application"
   - Select "Pages" tab
   - Click "Connect to Git"

3. **Connect GitHub**:
   - Authorize Cloudflare to access your GitHub
   - Select the `klausbertel.dk` repository

4. **Configure Build Settings**:
   ```
   Framework preset: Astro
   Build command: npm run build
   Build output directory: dist
   Root directory: /
   Environment variables: (none needed)
   ```

5. **Deploy**:
   - Click "Save and Deploy"
   - Wait for the build to complete (2-3 minutes)
   - Your site will be live at `klausbertel-dk.pages.dev`

### Option B: Via GitHub Actions (Automated)

1. **Get Cloudflare Credentials**:
   - API Token: Go to Cloudflare Dashboard → My Profile → API Tokens → Create Token
   - Account ID: Found in Cloudflare Dashboard → Workers & Pages

2. **Add GitHub Secrets**:
   - Go to your GitHub repository
   - Settings → Secrets and variables → Actions
   - Add secrets:
     - `CLOUDFLARE_API_TOKEN`
     - `CLOUDFLARE_ACCOUNT_ID`

3. **Push Changes**:
   ```bash
   git push
   ```
   - GitHub Actions will automatically build and deploy

## Step 4: Configure Custom Domain

1. **Add Custom Domain in Cloudflare Pages**:
   - Go to your Pages project
   - Click "Custom domains"
   - Click "Set up a custom domain"
   - Enter `klausbertel.dk`

2. **Configure DNS**:
   
   If your domain is already on Cloudflare:
   - Cloudflare will automatically configure DNS
   - Just click "Activate domain"

   If your domain is elsewhere:
   - Add a CNAME record:
     ```
     Name: @
     Target: klausbertel-dk.pages.dev
     ```
   - Add a CNAME record for www:
     ```
     Name: www
     Target: klausbertel-dk.pages.dev
     ```

3. **Wait for DNS Propagation**:
   - Can take 5 minutes to 48 hours
   - Usually completes within 1 hour

## Step 5: Enable HTTPS

Cloudflare automatically provides SSL/TLS certificates:

1. In Cloudflare Pages, go to your project
2. SSL/TLS should be automatically configured
3. Verify by visiting `https://klausbertel.dk`

## Testing Before Deployment

Test the site locally before deploying:

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Visit http://localhost:4321
```

Build and preview production version:

```bash
# Build for production
npm run build

# Preview production build
npm run preview

# Visit http://localhost:4321
```

## Updating the Site

After initial deployment, updates are easy:

1. Make your changes locally
2. Test with `npm run dev`
3. Commit and push:
   ```bash
   git add .
   git commit -m "Description of changes"
   git push
   ```
4. Cloudflare Pages will automatically rebuild and deploy

## Rollback

If something goes wrong:

1. Go to Cloudflare Pages → Your project
2. Click "Deployments"
3. Find a previous successful deployment
4. Click "..." → "Rollback to this deployment"

## Performance Optimization

Cloudflare Pages automatically provides:
- ✅ Global CDN
- ✅ HTTP/2 and HTTP/3
- ✅ Automatic image optimization
- ✅ Brotli compression
- ✅ DDoS protection

## Monitoring

Monitor your site:
- Cloudflare Analytics: Dashboard → Analytics & Logs
- Deployment logs: Pages → Your project → Deployments
- Build logs: Click on any deployment

## Troubleshooting

### Build Fails

Check the build log in Cloudflare Pages. Common issues:
- Missing dependencies: Ensure `package.json` is correct
- Node version: Ensure Node 18+ is specified
- Build command: Should be `npm run build`

### Images Not Loading

- Ensure images are in `public/images/`
- Check file names match exactly (case-sensitive)
- Verify images are committed to Git

### Custom Domain Not Working

- Check DNS settings in Cloudflare
- Wait for DNS propagation (up to 48 hours)
- Clear browser cache
- Try incognito/private browsing

## Support

For Cloudflare Pages support:
- Documentation: https://developers.cloudflare.com/pages/
- Community: https://community.cloudflare.com/
- Status: https://www.cloudflarestatus.com/

## Next Steps

After deployment:
1. ✅ Test all pages and links
2. ✅ Verify contact information is correct
3. ✅ Add real images
4. ✅ Test on mobile devices
5. ✅ Share the site!

Your site will be live at:
- Production: `https://klausbertel.dk`
- Preview: `https://klausbertel-dk.pages.dev`
