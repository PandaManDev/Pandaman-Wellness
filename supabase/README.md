# Staff orders and customer requests

The public customer request form is `order.html`. It sends submissions to the `public.orders` table, where they appear in the staff-only `orders.html` dashboard after the database setup below is applied.

## Configure Supabase

1. In Supabase Authentication, ensure the staff account `jjb@petlover.com` exists and has a verified email. Never put its password in this repository.
2. Open the project's SQL Editor and run [`supabase/schema.sql`](schema.sql). It creates the `public.orders` table, enables RLS, and permits anonymous customers to submit new requests without granting them permission to read orders. The verified staff email can read/update requests. There is intentionally no delete policy.
3. Confirm email/password sign-in is enabled and add the published site URL and local URL to Authentication URL Configuration as appropriate.
4. Open `order.html` over HTTPS (or localhost) and submit a non-sensitive test request. Sign into `orders.html` to verify it appears.

The Supabase URL and publishable key in the HTML pages are designed to be public. Never replace the publishable key with a service-role/secret key. The public form has basic client-side validation and a honeypot, but direct anonymous database inserts can still be abused; for a production launch, add server-side rate limiting and CAPTCHA through an Edge Function. RLS is the actual access control: anonymous users can insert only new requests and cannot view or update records.

Collect only information needed to respond, avoid payment-card or sensitive personal data, and apply your organization’s privacy and retention requirements. Submitting a request does not confirm availability or an order.
