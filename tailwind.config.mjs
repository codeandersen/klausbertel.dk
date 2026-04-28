/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#f0fdf4',
          100: '#dcfce7',
          200: '#bbf7d0',
          300: '#86efac',
          400: '#4ade80',
          500: '#22c55e',
          600: '#16a34a',
          700: '#15803d',
          800: '#166534',
          900: '#14532d',
        },
        forest: {
          50: '#f7f9f7',
          100: '#e8ede8',
          200: '#d1dbd1',
          300: '#a8b8a8',
          400: '#7a927a',
          500: '#5a735a',
          600: '#3d5a3d',
          700: '#2d4a2d',
          800: '#1e3a1e',
          900: '#0f2a0f',
        },
      },
    },
  },
  plugins: [],
}
