export function getHref(path: string): string {
  const basePath = import.meta.env.BASE_URL || '/';
  return basePath === '/' ? path : basePath.replace(/\/$/, '') + path;
}
