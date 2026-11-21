# Pandaman Wellness

A responsive, informational wellness website built with lightweight HTML, CSS, and JavaScript.

## Pages

- `index.html` — homepage and site overview
- `wellness.html` — general wellness guide and a private-on-device daily checklist
- `weather.html` — current conditions, hourly forecast, and five-day outlook via Open-Meteo
- `clock.html` — live local times for six world cities
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

## Privacy and scope

This repository now provides general informational content only. It does not offer product listings, prices, purchases, customer order submissions, or an online sales workflow. The daily checklist is stored locally in the visitor's browser. Weather lookups are sent to Open-Meteo.

Wellness content is general education, not medical advice or a substitute for personalized care.
