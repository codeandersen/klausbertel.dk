# Cascade Memory - Klaus Bertel Website

**Last Updated**: 2026-05-03

## Current Project State

### Active Work
- Website design refinement complete
- Certificate/reference links localized to local files
- Danish character handling implemented (æ→ae, ø→oe, å→aa)

### Recent Changes
1. Updated hero section with nature background image
2. Added circular profile photo (256px, object-contain)
3. Removed "Book en tid til samtale" button
4. Removed COVID-19 message
5. Converted all certificate URLs to local paths with shortened filenames
6. Updated "Det siger klienterne" to show only Peter's testimonial

### File Naming Conventions
- **DPF certificates**: `DPF-[name].pdf`
- **Diplomas**: `Diplom-[name].pdf`
- **Course certificates**: `Kursusbevis-[name].pdf/jpg`
- All filenames use ASCII only (no æ, ø, å)

### Known Issues
- Download scripts need to be run to populate certificate files
- Some certificate filenames in download script may still have Danish characters

### Next Steps
- [ ] Verify all certificate links work after re-download
- [ ] Test deployment
- [ ] Review all pages for consistency

## Important Context
- User prefers minimal, direct communication
- Color scheme: Dark green matching "Bruuns Klinik"
- Profile photo must be in color, not grayscale
- All changes should preserve existing content unless explicitly requested

## Technical Stack
- Astro static site generator
- TailwindCSS for styling
- PowerShell scripts for file downloads
- Local development on Windows
