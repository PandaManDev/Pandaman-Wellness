# Staff orders setup

The staff-only order page is `orders.html`. It uses Supabase Auth email/password sign-in and the browser-safe publishable key. Database access is enforced by row-level security, not by hiding the page or key.

## Configure Supabase

1. In Supabase Authentication, ensure the staff account `jjb@petlover.com` exists and has a verified email. Never put its password in this repository.
2. Open the project's SQL Editor and run [`supabase/schema.sql`](supabase/schema.sql). This creates the `public.orders` table, enables RLS, and permits select/insert/update only for the verified staff email in the policies. There is intentionally no delete policy.
3. Confirm email/password sign-in is enabled and add the published site URL and local URL to Authentication  URL Configuration as appropriate.
4. Open `orders.html` over HTTPS (or localhost), sign in, and test creating and updating a non-sensitive test entry.

The Supabase URL and publishable key in `orders.html` are designed to be public. Never replace the publishable key with a service-role/secret key. The page blocks other account emails for convenience; the SQL RLS policies are the actual access control. If adding more staff, update the SQL allowlist policies and the `STAFF_EMAIL` constant together.

Order records can contain personal information. Collect only what staff need, avoid payment-card or sensitive personal data, and apply your organization’s retention and privacy requirements.
