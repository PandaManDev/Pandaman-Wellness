# Pandaman Wellness

A responsive, accessible single-page menu for Pandaman Wellness.

## Highlights

- Mobile-first layout that adapts from phones to large screens
- Semantic HTML with labeled navigation, headings, articles, and accessible age confirmation
- Keyboard-visible focus states and a skip-to-content link
- Reduced-motion support for visitors who prefer less animation
- Clear call and text ordering actions using `tel:` and `sms:` links
- Lightweight, dependency-free implementation with styles and scripts contained in `index.html`

## Getting started

This is a static website. Open `index.html` in a browser, or serve the project locally with any static web server:

```bash
python3 -m http.server 8000
```

Then visit <http://localhost:8000>.

## Customization

- Update menu items and prices in the menu cards in `index.html`.
- Change the phone number in the `tel:` and `sms:` links.
- Adjust the color tokens at the top of the stylesheet in `:root`.
- Replace the emoji mark with a brand image if one becomes available. Add meaningful alternative text if the image conveys information.

## Accessibility notes

The page includes an age-confirmation dialog, but this is a front-end convenience rather than legal or regulatory verification. Confirm that the business's age, licensing, product, and ordering requirements are satisfied before publishing. Menu availability and prices should be verified before each order.

## License

No license has been specified for this project. Add a license before allowing reuse or redistribution.
