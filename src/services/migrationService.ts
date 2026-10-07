export const APP_VERSION = '1.0.0'

export async function runMigrations() {
  const currentVersion = localStorage.getItem('pb_app_version')

  if (currentVersion !== APP_VERSION) {
    console.log(`Migrating app state from ${currentVersion} to ${APP_VERSION}...`)

    // Clear old caches or state

    // 1. Clear all local storage keys starting with pb_ or palabrabox_
    const keysToRemove = []
    for (let i = 0; i < localStorage.length; i++) {
      const key = localStorage.key(i)
      if (key && (key.startsWith('pb_') || key.startsWith('palabrabox_'))) {
        // Exclude the version key itself for now to be safe
        if (key !== 'pb_app_version') {
          keysToRemove.push(key)
        }
      }
    }

    keysToRemove.forEach((key) => localStorage.removeItem(key))

    // 2. Unregister service worker and clear Cache API (from workbox/PWA)
    if ('caches' in window) {
      try {
        const cacheNames = await caches.keys()
        await Promise.all(
          cacheNames.map((cacheName) => {
            console.log(`Deleting cache: ${cacheName}`)
            return caches.delete(cacheName)
          }),
        )
      } catch (err) {
        console.error('Failed to clear CacheStorage:', err)
      }
    }

    if ('serviceWorker' in navigator) {
      try {
        const registrations = await navigator.serviceWorker.getRegistrations()
        for (const registration of registrations) {
          await registration.unregister()
          console.log('Unregistered old service worker.')
        }
      } catch (err) {
        console.error('Failed to unregister Service Worker:', err)
      }
    }

    // Set new version
    localStorage.setItem('pb_app_version', APP_VERSION)

    // Optional: reload the page to ensure completely fresh start
    // We'll just return true to indicate a hard reset happened
    return true
  }

  return false
}
