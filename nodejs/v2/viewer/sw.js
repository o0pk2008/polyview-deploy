var version = "2.18.1";

const cacheName = `superSplat-v${version}`;
const cacheUrls = [
    './',
    './index.css',
    './index.html',
    './index.js',
    './index.js.map',
    './jszip.js',
    './manifest.json',
    './static/icons/logo-192.png',
    './static/icons/logo-512.png',
    './static/images/screenshot-narrow.jpg',
    './static/images/screenshot-wide.jpg',
    './static/lib/lodepng/lodepng.js',
    './static/lib/lodepng/lodepng.wasm',
    './static/lib/webp/webp.mjs',
    './static/lib/webp/webp.wasm',
    './static/locales/de.json',
    './static/locales/en.json',
    './static/locales/fr.json',
    './static/locales/ja.json',
    './static/locales/ko.json',
    './static/locales/zh-CN.json'
];
self.addEventListener('install', (event) => {
    // console.log(`installing v${appVersion}`);
    // create cache for current version
    event.waitUntil(caches.open(cacheName)
        .then((cache) => {
        cache.addAll(cacheUrls);
    }));
});
self.addEventListener('activate', () => {
    // console.log(`activating v${appVersion}`);
    // delete the old caches once this one is activated
    caches.keys().then((names) => {
        for (const name of names) {
            if (name !== cacheName) {
                caches.delete(name);
            }
        }
    });
});
// self.addEventListener('fetch', (event) => {
//     event.respondWith(
//         caches.match(event.request)
//         .then(response => response ?? fetch(event.request))
//     );
// });
// 添加 “网络优先”的缓存策略
// 优先尝试从网络获取资源；网络成功就更新缓存；网络失败就从缓存中读取。
self.addEventListener('fetch', (event) => {
    event.respondWith(fetch(event.request)
        .then((networkResponse) => {
        // ✅ 更新缓存副本
        return caches.open(cacheName).then((cache) => {
            cache.put(event.request, networkResponse.clone());
            return networkResponse;
        });
    })
        .catch(() => {
        // 🔁 网络失败时用缓存
        return caches.match(event.request);
    }));
});
//# sourceMappingURL=sw.js.map
