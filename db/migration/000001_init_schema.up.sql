CREATE TABLE "products"
(
    "id"            SERIAL PRIMARY KEY,
    "user_id"       serial,
    "url"           varchar,
    "current_price" decimal,
    "website_id"    serial,
    "last_checked"  timestamp,
    "added_at"      timestamp
);

CREATE TABLE "users"
(
    "id"         SERIAL PRIMARY KEY,
    "username"   varchar,
    "email"      varchar,
    "password"   varchar,
    "created_at" timestamp
);

CREATE TABLE "price_history"
(
    "id"         SERIAL PRIMARY KEY,
    "product_id" serial,
    "price"      decimal,
    "checked_at" timestamp
);

CREATE TABLE "websites"
(
    "id"       SERIAL PRIMARY KEY,
    "name"     varchar,
    "base_url" varchar
);

ALTER TABLE "products"
    ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "products"
    ADD FOREIGN KEY ("website_id") REFERENCES "websites" ("id");

ALTER TABLE "price_history"
    ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");
