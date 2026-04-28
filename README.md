# Psykolog Klaus Bertel - Website

Modern, responsive website for Psykolog Klaus Bertel built with Astro and TailwindCSS.

## 🚀 Quick Start

### Prerequisites

- Node.js 18 or higher
- npm or yarn

### Installation

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

## 📁 Project Structure

```
klausbertel.dk/
├── public/
│   ├── images/          # Image assets
│   └── favicon.svg      # Site favicon
├── src/
│   ├── components/      # Reusable Astro components
│   │   ├── Layout.astro
│   │   ├── Header.astro
│   │   ├── Footer.astro
│   │   ├── Hero.astro
│   │   └── FeatureCard.astro
│   ├── pages/           # File-based routing
│   │   ├── index.astro  # Homepage
│   │   ├── kurser.astro
│   │   ├── cv.astro
│   │   ├── kursusbeviser.astro
│   │   ├── referencer/
│   │   └── kontakt-info/
│   └── styles/
│       └── global.css   # Global styles and Tailwind
├── astro.config.mjs     # Astro configuration
├── tailwind.config.mjs  # Tailwind configuration
└── package.json
```

## 🎨 Design

The site features a modern, calming design with:
- **Hero section** with full-width background image
- **Feature cards** highlighting key services
- **Professional about section** with profile
- **Responsive navigation** with mobile menu
- **Modern footer** with contact information

### Color Scheme

- **Primary Blue**: Used for CTAs and accents
- **Forest Green**: Used for headers and professional elements
- **White/Gray**: Clean, professional backgrounds

## 📝 Content Pages

- **Forside** - Homepage with hero, features, and about section
- **Kurser** - Courses and supervision information
- **CV** - Professional background and experience
- **Kursusbeviser** - Qualifications and certifications
- **Referencer** - Client and business references
  - Det siger - Client testimonials
  - Virksomhedsreferencer - Business references
- **Kontakt info** - Contact information and location
  - Afbudsregler - Cancellation policy
  - Privatlivspolitik - Privacy policy

## 🖼️ Images

Add your images to `public/images/`:

1. **hero-background.jpg** - Hero section background (recommended: 1920x1080px)
   - Should be a calming nature scene (tree, landscape, etc.)
   
2. **klaus-profile.jpg** - Profile photo (recommended: 800x800px)
   - Professional headshot for the about section

## 🌐 Deployment to Cloudflare Pages

### Via GitHub Integration

1. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **Connect to Cloudflare Pages**
   - Go to Cloudflare Dashboard
   - Navigate to Pages
   - Click "Create a project"
   - Connect your GitHub repository

3. **Build Settings**
   - Framework preset: **Astro**
   - Build command: `npm run build`
   - Build output directory: `dist`
   - Root directory: `/`
   - Node version: `18` or higher

4. **Deploy**
   - Click "Save and Deploy"
   - Your site will be live at `your-project.pages.dev`

### Custom Domain

To use `klausbertel.dk`:

1. In Cloudflare Pages, go to your project
2. Click "Custom domains"
3. Add `klausbertel.dk` and `www.klausbertel.dk`
4. Follow DNS configuration instructions

## 🛠️ Development

### Adding New Pages

Create a new `.astro` file in `src/pages/`:

```astro
---
import Layout from '../components/Layout.astro';
---

<Layout title="Page Title">
  <section class="py-16">
    <div class="container-custom">
      <!-- Your content here -->
    </div>
  </section>
</Layout>
```

### Modifying Styles

Global styles are in `src/styles/global.css`. Tailwind utilities can be used directly in components.

Custom colors are defined in `tailwind.config.mjs`:
- `primary.*` - Blue colors
- `forest.*` - Green colors

## 📱 Responsive Design

The site is fully responsive with breakpoints:
- Mobile: < 768px
- Tablet: 768px - 1024px
- Desktop: > 1024px

## 🔒 Privacy & Security

- All contact forms use secure methods
- Privacy policy page included
- GDPR compliant structure
- No tracking or analytics by default

## 📞 Contact Information

Update contact details in:
- `src/components/Footer.astro`
- `src/pages/kontakt-info/index.astro`

Current contact info:
- Email: klaus@arospsyk.dk
- SMS: +45 20 52 19 81
- Address: Telefontorvet 1, 2. SAL, 8000 Århus C

## 📄 License

Copyright © Klaus Bertel All Rights Reserved.

## 🤝 Support

For technical issues or questions about the website, contact the developer.
