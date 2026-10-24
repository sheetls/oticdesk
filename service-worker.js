// ============================================
// SERVICE WORKER — PWA Sistema OTIC
// ============================================
// Estrategia: cache-first para assets estáticos,
// network-first para páginas dinámicas (PHP).
// ============================================

const CACHE_NAME = 'otic-cache-v1';
const CACHE_STATIC = [
    // Assets estáticos que se cachean al instalar
    '/proyecto_otic/css/theme.css',
    '/proyecto_otic/css/header.css',
    '/proyecto_otic/css/login.css',
    '/proyecto_otic/img/logo.png',
    '/proyecto_otic/img/logo-circulo.png',
    '/proyecto_otic/img/icon-192.png',
    '/proyecto_otic/img/icon-512.png',
    'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css',
    'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js',
    'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css'
];

// ============================================
// INSTALL — cachear assets estáticos
// ============================================
self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME)
            .then((cache) => {
                console.log('[SW] Precargando assets estáticos');
                return cache.addAll(CACHE_STATIC);
            })
            .then(() => self.skipWaiting())
            .catch((err) => console.warn('[SW] Error al precargar:', err))
    );
});

// ============================================
// ACTIVATE — limpiar cachés antiguas
// ============================================
self.addEventListener('activate', (event) => {
    event.waitUntil(
        caches.keys().then((nombres) => {
            return Promise.all(
                nombres
                    .filter((nombre) => nombre !== CACHE_NAME)
                    .map((nombre) => {
                        console.log('[SW] Eliminando caché antigua:', nombre);
                        return caches.delete(nombre);
                    })
            );
        }).then(() => self.clients.claim())
    );
});

// ============================================
// FETCH — estrategia de caché
// ============================================
self.addEventListener('fetch', (event) => {
    const request = event.request;
    const url = new URL(request.url);

    // Ignorar requests que no son GET
    if (request.method !== 'GET') return;

    // Ignorar requests a otros dominios (excepto los CDN que están en cache)
    const esEstatico = 
        url.pathname.match(/\.(css|js|png|jpg|jpeg|gif|svg|webp|woff2?|ttf|eot)$/i) ||
        url.hostname === 'cdn.jsdelivr.net' ||
        url.hostname === 'fonts.googleapis.com' ||
        url.hostname === 'fonts.gstatic.com';

    // Estrategia CACHE-FIRST para assets estáticos
    if (esEstatico) {
        event.respondWith(
            caches.match(request).then((respuesta) => {
                if (respuesta) return respuesta;
                
                return fetch(request).then((respuestaRed) => {
                    // Cachear solo respuestas válidas
                    if (respuestaRed && respuestaRed.status === 200 && respuestaRed.type === 'basic') {
                        const copia = respuestaRed.clone();
                        caches.open(CACHE_NAME).then((cache) => cache.put(request, copia));
                    }
                    return respuestaRed;
                }).catch(() => {
                    // Si falla (offline) y es un asset, devolver nada (el navegador mostrará error)
                    return new Response('', { status: 408, statusText: 'Offline' });
                });
            })
        );
        return;
    }

    // Estrategia NETWORK-FIRST para páginas PHP (dinámicas)
    event.respondWith(
        fetch(request).then((respuesta) => {
            // Si la respuesta es válida, devolverla directamente
            return respuesta;
        }).catch(() => {
            // Si falla (offline), intentar con caché (por si estaba guardada)
            return caches.match(request).then((respuesta) => {
                if (respuesta) return respuesta;
                
                // Si no hay caché, devolver página de error offline simple
                return new Response(
                    '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Sin conexión</title>' +
                    '<style>body{font-family:Arial,sans-serif;display:flex;align-items:center;justify-content:center;height:100vh;margin:0;background:#f8f9fa;color:#333;}' +
                    '.box{text-align:center;padding:40px;}' +
                    'h1{font-size:3rem;margin:0;}p{color:#666;}</style></head>' +
                    '<body><div class="box"><h1>📡</h1><h2>Sin conexión a internet</h2>' +
                    '<p>Verifica tu conexión e intenta de nuevo.</p></div></body></html>',
                    { 
                        status: 503, 
                        statusText: 'Offline',
                        headers: { 'Content-Type': 'text/html; charset=utf-8' }
                    }
                );
            });
        })
    );
});