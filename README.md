# Tie – GTM Custom Template

## Overview

The **Tie GTM Custom Template** enables sending ecommerce and page event data from Google Tag Manager (GTM) to the **Tie** platform ([meettie.com](https://meettie.com)).

The template listens to standard `dataLayer` events and forwards structured event data to the Tie Events API for analytics and attribution.

---

## Features

Supports standard ecommerce tracking:

* Page View

* View Item

* Add to Cart

* Purchase

* Compatible with GA4-style `dataLayer` implementations

* Automatically maps ecommerce data into a normalized format

* Uses a persistent cookie-based identifier

* Lightweight client-side implementation

---

## How It Works

The template:

* Sets a required API key on the `window` object
* Optionally sets the customer email (trimmed and lowercased) and IP address on the `window` object
* Loads the Tie client script from a secure external endpoint

The client script:

* Listens for supported `dataLayer` events
* Extracts and normalizes event data
* Sends events to the Tie Events API

---

## Configuration

### Required Fields

| Field   | Description                                 |
| ------- | ------------------------------------------- |
| API Key | Your Tie API key (provided by Tie) |

### Optional Fields

| Field      | Description                                                        |
| ---------- | ------------------------------------------------------------------ |
| Email      | A variable holding the customer email, for better identity matching |
| IP address | A variable holding the customer IP address (advanced use only)     |

---

## Supported Events

The template listens for the following `dataLayer` events:

| Event Name    | Description           |
| ------------- | --------------------- |
| `page_view`   | Page load             |
| `view_item`   | Product detail view   |
| `add_to_cart` | Item added to cart    |
| `purchase`    | Completed transaction |

---

## Data Requirements

This template expects **GA4-style ecommerce data**.

### Example

```javascript
window.dataLayer = window.dataLayer || [];
dataLayer.push({
  event: "purchase",
  ecommerce: {
    transaction_id: "T_100001",
    value: 79.99,
    currency: "USD",
    items: [
      {
        item_id: "SKU_12345",
        item_name: "Classic Hoodie",
        price: 79.99,
        quantity: 1,
        item_category: "Apparel",
        item_brand: "Acme"
      }
    ]
  }
});
```

---

## Data Sent

When the tag is triggered, the following data may be sent to the Tie API:

* Event name
* Page URL
* Referrer URL
* Timestamp
* Cookie-based identifier
* Ecommerce data (products, transaction details)
* Optional email (if implemented by the site)

---

## Cookies

This template may read or set the following cookies:

| Name       | Purpose                                        |
| ---------- | ---------------------------------------------- |
| `_ga`      | Used if present for user identification        |
| `_tie_cid` | Generated identifier if `_ga` is not available |

* `_tie_cid` is stored for up to **1 year**
* Uses `SameSite=Lax`

---

## Permissions & External Requests

### External Script

```
https://tie-assets.web.app/v1.js
```

### API Endpoint

```
https://api.revenueroll.com/events
```

*(or staging endpoint depending on configuration)*

### APIs Used

The template itself uses only sandboxed GTM APIs:

* `injectScript` to load the Tie client script
* `setInWindow` to set `tie_api_key`, `tie_email` and `tie_ip_address`
* `logToConsole` (debug mode only)

The loaded client script sends event data to the API endpoint above with `fetch`.

No other external resources are accessed.

---

## Consent & Privacy

This template does **not** manage user consent.

Implementers are responsible for:

* Ensuring appropriate consent is obtained before firing this tag
* Configuring GTM Consent Mode if required
* Complying with applicable privacy laws and regulations

The template does **not** perform fingerprinting or cross-site tracking.

---

## Security Considerations

* No arbitrary code execution
* No DOM manipulation
* No access to form inputs or sensitive page content
* Data sent is limited to event context and provided ecommerce data

---

## Limitations

* Requires a properly initialized `dataLayer`
* Requires API key to be set at runtime
* Depends on implementer-defined triggers
* Does not retry failed requests

---

## Best Practices

Initialize `dataLayer` early:

```javascript
window.dataLayer = window.dataLayer || [];
```

* Fire the tag on relevant ecommerce events
* Avoid sending personally identifiable information unless compliant

---

## Version

**1.0**

---

## Support

Installation guides: [help.meettie.com – Install the Tie Pixel](https://help.meettie.com/en/collections/19703366-install-the-tie-pixel)

For support, contact **Tie** through [help.meettie.com](https://help.meettie.com).

---

## Notes for Reviewers

* Uses only GTM-approved APIs (`injectScript`, `setInWindow`, `logToConsole`)
* No inline JavaScript injection
* No dynamic code evaluation (`eval`, `Function`, etc.)
* No access to restricted browser APIs
* All external requests are explicitly declared above
