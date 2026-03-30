'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';

// This is a minimal Flutter service worker for web deployments
self.addEventListener('install', function(event) {
  self.skipWaiting();
});

self.addEventListener('activate', function(event) {
  event.waitUntil(clients.claim());
});

self.addEventListener('fetch', function(event) {
  // Pass through all fetch requests (no caching for simplicity)
  event.respondWith(fetch(event.request));
});
