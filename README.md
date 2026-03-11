# Tie Tag Template

Google Tag Manager | Tie Tag Template
# Tie Tag – Google Tag Manager Template

Connect your website to the Tie identity resolution platform via Google Tag Manager.

## 🚀 Features

- Easy GTM integration — no coding required
- Automatically tracks `page_view`, `view_item`, `add_to_cart`, and `purchase` events
- Uses GA4 `_ga` cookie as visitor identifier
- Sends enriched event data to the Tie API for identity resolution

## 📦 Fields

- `apiKey`: Your Tie API key (required).
- `email`: If your site captures a user email, you can pass it here.

## 🛠️ Setup

1. In Google Tag Manager, go to **Templates → Search Gallery**
2. Search for **Tie** and add it to your workspace
3. Create a new **Tag** using the Tie template
4. Enter your **API Key** from your Tie account
5. Set triggers: **All Pages**, **add_to_cart**, **purchase**, **view_item**
6. **Save** and **Publish** your GTM container

## 📡 Events Tracked

| Event | Trigger |
|---|---|
| `page_view` | Every page load |
| `view_item` | When a product is viewed |
| `add_to_cart` | When a product is added to cart |
| `purchase` | When a purchase is completed |

