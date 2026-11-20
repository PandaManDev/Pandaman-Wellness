# Pandaman Wellness

A responsive, accessible single-page menu for Pandaman Wellness.

## Highlights

- Mobile-first layout that adapts from phones to large screens
- Semantic HTML with labeled navigation, headings, articles, and accessible age confirmation
- Keyboard-visible focus states and a skip-to-content link
- Reduced-motion support for visitors who prefer less animation
- Clear call and text ordering actions using `tel:` and `sms:` links
- Lightweight implementation with styles and scripts contained in `index.html`

## Getting started

This is a static website. Open `index.html` in a browser, or serve the project locally with any static web server:

```bash
python3 -m http.server 8000
```

Then visit <http://localhost:8000>.

## Weather dashboard

A standalone weather dashboard is available at `weather.html`. It fetches location and forecast data from the public [Open-Meteo API](https://open-meteo.com/), so no API key is required. Search for a city or optionally allow browser location access to view current conditions, an hourly forecast, and a five-day outlook.

Run the local server above and visit <http://localhost:8000/weather.html>. Browser geolocation requires a secure context (HTTPS or localhost); city search works without granting location permission.

## Customization

- Update menu items and prices in the menu cards in `index.html`.
- Change the phone number in the `tel:` and `sms:` links.
- Adjust the color tokens at the top of each page's stylesheet.
- Replace the emoji mark with a brand image if one becomes available. Add meaningful alternative text if the image conveys information.

## Accessibility and publishing notes

The wellness menu's age-confirmation dialog is a front-end convenience rather than legal or regulatory verification. Confirm business age, licensing, product, and ordering requirements before publishing. The weather dashboard supports keyboard focus, a status region for loading/errors, and responsive layouts. Weather forecasts are informational and may change.

## License

No license has been specified for this project. Add a license before allowing reuse or redistribution.
