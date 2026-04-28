# Quick Start Guide

Get your website up and running in 5 steps!

## Step 1: Install Node.js ⚡

If you don't have Node.js installed:

1. Download from https://nodejs.org/
2. Install version 18 or higher (LTS recommended)
3. Verify installation:
   ```bash
   node --version
   # Should show v18.x.x or higher
   ```

## Step 2: Install Dependencies 📦

Open PowerShell or Command Prompt in the project folder:

```bash
cd c:\Github\klausbertel.dk
npm install
```

This will install Astro, TailwindCSS, and all required packages.

## Step 3: Add Your Images 🖼️

Add two images to `public/images/`:

1. **hero-background.jpg**
   - A calming nature scene (tree, landscape, sunset)
   - Size: 1920x1080px recommended
   - Keep file size under 500KB

2. **klaus-profile.jpg**
   - Professional headshot photo
   - Size: 800x800px recommended
   - Keep file size under 200KB

**Don't have images yet?** The site will still work - it will show a gradient background and hide the profile image.

## Step 4: Test Locally 🧪

Start the development server:

```bash
npm run dev
```

Open your browser to: **http://localhost:4321**

You should see your website! Navigate through all pages to verify everything works.

Press `Ctrl+C` to stop the server.

## Step 5: Deploy to Cloudflare Pages 🚀

### Quick Deploy (Recommended)

1. **Create GitHub Repository**:
   - Go to https://github.com/new
   - Name it `klausbertel.dk`
   - Don't initialize with README

2. **Push Your Code**:
   ```bash
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/YOUR_USERNAME/klausbertel.dk.git
   git push -u origin main
   ```

3. **Deploy on Cloudflare**:
   - Go to https://dash.cloudflare.com/
   - Click "Workers & Pages" → "Create application" → "Pages"
   - Connect your GitHub repository
   - Use these settings:
     - Framework: **Astro**
     - Build command: `npm run build`
     - Build output: `dist`
   - Click "Save and Deploy"

4. **Wait 2-3 minutes** for the build to complete

5. **Your site is live!** at `https://your-project.pages.dev`

### Add Custom Domain

1. In Cloudflare Pages, click "Custom domains"
2. Add `klausbertel.dk`
3. Follow DNS configuration instructions
4. Wait for DNS propagation (5 mins - 48 hours)

## 🎉 That's It!

Your website is now live and ready to use!

## Common Commands

```bash
# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview

# Check for errors
npm run astro check
```

## Need Help?

- **Full documentation**: See `README.md`
- **Deployment details**: See `DEPLOYMENT.md`
- **Project overview**: See `PROJECT_SUMMARY.md`

## Updating Your Site

1. Make changes to files in `src/`
2. Test with `npm run dev`
3. Commit and push:
   ```bash
   git add .
   git commit -m "Updated content"
   git push
   ```
4. Cloudflare automatically rebuilds and deploys!

## Troubleshooting

**"npm not found"**: Install Node.js first  
**Build fails**: Check `package.json` is present  
**Images not showing**: Verify files are in `public/images/`  
**Site not updating**: Clear browser cache or try incognito mode

---

**Questions?** Check the full documentation in the other markdown files!
