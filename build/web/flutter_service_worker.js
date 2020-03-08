'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/main_web_entrypoint.dart.js.deps": "b2bff404c7fa5d928b4c691c5ac5ab23",
"/index.html": "4b88841647e4616d740bcc49e3622a7d",
"/main.dart.js.deps": "d1a226fb16394c39ccd284eceb3fd699",
"/main.dart.js": "7c07679bd14b37968cfecf59e0b07c62",
"/assets/LICENSE": "f73f49767cde7ef7fb3a03f7f7b603fb",
"/assets/web/assets/fonts/circular-medium.ttf": "3900fcac5a07f0ae740aeaa613be0b60",
"/assets/AssetManifest.json": "240366f8af056a796e05d442451b375e",
"/assets/FontManifest.json": "83e7e26918a35d4bf87ad9659bc929d4",
"/assets/FontManifest-complete.json": "927bf50f630a966ce8e28491cc06725a",
"/assets/fonts/circular-medium.ttf": "3900fcac5a07f0ae740aeaa613be0b60"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
