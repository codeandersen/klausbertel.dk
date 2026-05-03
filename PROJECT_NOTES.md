# Klaus Bertel Website - Project Notes

## Project Overview
Astro-based website for Psykolog Klaus Bertel, migrated from WordPress.

## Key Design Decisions
- **Color Scheme**: Dark, rich green theme matching "Bruuns Klinik" aesthetic
- **Hero Image**: Nature background (`/images/background.png`)
- **Profile Photo**: Circular, color photo using `object-contain` (`/images/profile.jpg`)

## Important File Locations
- **Certificates**: `public/certificates/` (downloaded via `download-certificates.ps1`)
- **References**: `public/references/` (downloaded via `download-references.ps1`)
- **Images**: `public/images/`

## Danish Character Handling
All filenames use ASCII-only characters to avoid Windows compatibility issues:
- `æ` → `ae`
- `ø` → `oe`
- `å` → `aa`

## Certificate Naming Convention
- DPF files: `DPF-[shortened-name].pdf`
- Diplomas: `Diplom-[shortened-name].pdf`
- Course certificates: `Kursusbevis-[shortened-name].pdf/jpg`

## Download Scripts
Run these to populate certificate/reference files:
```powershell
.\download-certificates.ps1
.\download-references.ps1
```

## Content Updates Made
- Removed "Book en tid til samtale" button from homepage
- Removed COVID-19 message from hero section
- Updated "Det siger klienterne" to show only Peter's testimonial
- All certificate/reference links converted to local paths

## Development
```bash
npm run dev          # Start dev server on localhost:4321
npm run build        # Build for production
```

## Notes
- Profile photo: 256px (w-64 h-64), object-contain to prevent cropping
- All external klausbertel.dk links converted to local file paths
- Tailwind config updated with custom green color palette
