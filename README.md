# Pandaman Wellness

A responsive, informational wellness website built with lightweight HTML, CSS, and JavaScript.

## Pages

- `index.html` — homepage and site overview
- `wellness.html` — general wellness guide and a private-on-device daily checklist
- `weather.html` — current conditions, hourly forecast, and five-day outlook via Open-Meteo
- `clock.html` — live local times for six world cities
- `products.html` — shop grid (from `assets/catalog.js`) plus a category guide
- `checkout.html` — cart review and order form (pickup or delivery, pay at handoff)
- `orders.html` — notice explaining that the former staff order workspace has been retired

## Design

Shared styling and small page utilities live in `assets/site.css` and `assets/site.js`. The site uses the Pandaman logo in `assets/pandaman-logo.png`, a dark plum palette, rose accents, responsive layouts, keyboard focus states, and reduced-motion support.

## Run locally

Serve the repository root with any static web server, for example:

```bash
python3 -m http.server 8000
```

Then open <http://localhost:8000>.

## Weather data

The weather page uses the public Open-Meteo geocoding and forecast APIs. City search works without location permission. Browser geolocation requires HTTPS or localhost.

## Selling setup

Edit `assets/catalog.js` to change products, prices (in cents), tax rate, delivery fee, and minimum order. Orders are inserted into the Supabase `orders` table (see `supabase/README.md`); view them in the Supabase table editor. Payment happens in person, so no card data is collected. An age gate (21+) runs on every page via `assets/cart.js`.

You are responsible for holding the required license and following state and local rules for ordering, delivery, age verification, and tax.

## Privacy and scope

The site collects name, phone, optional email, and a delivery address (delivery orders only) to fulfil orders. The cart is stored locally in the visitor's browser. Weather lookups are sent to Open-Meteo.

Wellness content is general education, not medical advice or a substitute for personalized care.
