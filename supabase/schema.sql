-- Pandaman Wellness staff and customer order requests
-- Run in the Supabase SQL Editor for project rilcamphpjcaebajquyo.
-- Never place a service-role key in the browser or in this repository.

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  customer_name text not null check (char_length(customer_name) between 1 and 120),
  customer_contact text check (customer_contact is null or char_length(customer_contact) <= 200),
  details text not null check (char_length(details) between 1 and 5000),
  status text not null default 'new' check (status in ('new', 'in_progress', 'completed', 'cancelled')),
  created_by uuid references auth.users(id) on delete restrict,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Let the unauthenticated customer form create requests, but never read them.
-- Existing installations may have created_by NOT NULL; public requests have no auth user.
alter table public.orders alter column created_by drop not null;

create index if not exists orders_created_at_idx on public.orders (created_at desc);

create or replace function public.set_orders_updated_at()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.updated_at = pg_catalog.now();
  return new;
end;
$$;

drop trigger if exists orders_set_updated_at on public.orders;
create trigger orders_set_updated_at
before update on public.orders
for each row execute function public.set_orders_updated_at();

alter table public.orders enable row level security;
revoke all on table public.orders from anon, authenticated;
grant insert on table public.orders to anon;
grant select, insert, update on table public.orders to authenticated;

drop policy if exists "Public can submit order requests" on public.orders;
create policy "Public can submit order requests"
on public.orders for insert to anon
with check (
  created_by is null
  and status = 'new'
  and char_length(btrim(customer_name)) between 1 and 120
  and customer_contact is not null
  and char_length(btrim(customer_contact)) between 1 and 200
  and char_length(btrim(details)) between 1 and 5000
);

drop policy if exists "Authorized staff can read orders" on public.orders;
create policy "Authorized staff can read orders"
on public.orders for select to authenticated
using (
  (auth.jwt() ->> 'email') = 'jjb@petlover.com'
  and (auth.jwt() ->> 'email_verified') = 'true'
);

drop policy if exists "Authorized staff can create orders" on public.orders;
create policy "Authorized staff can create orders"
on public.orders for insert to authenticated
with check (
  (auth.jwt() ->> 'email') = 'jjb@petlover.com'
  and (auth.jwt() ->> 'email_verified') = 'true'
  and created_by = (select auth.uid())
);

drop policy if exists "Authorized staff can update orders" on public.orders;
create policy "Authorized staff can update orders"
on public.orders for update to authenticated
using (
  (auth.jwt() ->> 'email') = 'jjb@petlover.com'
  and (auth.jwt() ->> 'email_verified') = 'true'
)
with check (
  (auth.jwt() ->> 'email') = 'jjb@petlover.com'
  and (auth.jwt() ->> 'email_verified') = 'true'
);
