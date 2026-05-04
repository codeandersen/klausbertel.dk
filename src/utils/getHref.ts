export function getHref(path: string): string {
  const basePath = import.meta.env.BASE_URL || '/';
  // Don't modify anchor links
  if (path.startsWith('#')) return path;
  if (basePath === '/') return path;
  const cleanBase = basePath.endsWith('/') ? basePath.slice(0, -1) : basePath;
  return cleanBase + path;
}
