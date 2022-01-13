# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "actions", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "resource_id", limit: 24
    t.string "resource_type", limit: 50, null: false
    t.string "actor_id", limit: 24, null: false
    t.string "actor_type", limit: 50, null: false
    t.string "event", limit: 50, null: false
    t.text "context"
    t.datetime "created_at", null: false
  end

  create_table "api_keys", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "type", limit: 50, null: false
    t.string "secret", limit: 191, null: false
    t.string "role_id", limit: 24
    t.string "integration_id", limit: 24
    t.string "user_id", limit: 24
    t.datetime "last_seen_at"
    t.string "last_seen_version", limit: 50
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["secret"], name: "api_keys_secret_unique", unique: true
  end

  create_table "benefits", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.string "slug", limit: 191, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.index ["slug"], name: "benefits_slug_unique", unique: true
  end

  create_table "brute", primary_key: "key", id: { type: :string, limit: 191 }, force: :cascade do |t|
    t.bigint "firstRequest", null: false
    t.bigint "lastRequest", null: false
    t.bigint "lifetime", null: false
    t.integer "count", null: false
  end

  create_table "custom_theme_settings", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "theme", limit: 191, null: false
    t.string "key", limit: 191, null: false
    t.string "type", limit: 50, null: false
    t.text "value"
  end

  create_table "email_batches", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "email_id", limit: 24, null: false
    t.string "provider_id", limit: 255
    t.string "status", limit: 50, default: "pending", null: false
    t.text "member_segment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_recipients", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "email_id", limit: 24, null: false
    t.string "member_id", limit: 24, null: false
    t.string "batch_id", limit: 24, null: false
    t.datetime "processed_at"
    t.datetime "delivered_at"
    t.datetime "opened_at"
    t.datetime "failed_at"
    t.string "member_uuid", limit: 36, null: false
    t.string "member_email", limit: 191, null: false
    t.string "member_name", limit: 191
    t.index ["delivered_at"], name: "email_recipients_delivered_at_index"
    t.index ["email_id", "member_email"], name: "email_recipients_email_id_member_email_index"
    t.index ["failed_at"], name: "email_recipients_failed_at_index"
    t.index ["member_id"], name: "email_recipients_member_id_index"
    t.index ["opened_at"], name: "email_recipients_opened_at_index"
  end

  create_table "emails", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "post_id", limit: 24, null: false
    t.string "uuid", limit: 36, null: false
    t.string "status", limit: 50, default: "pending", null: false
    t.string "recipient_filter", limit: 50, default: "status:-free", null: false
    t.string "error", limit: 2000
    t.text "error_data"
    t.integer "email_count", default: 0, null: false
    t.integer "delivered_count", default: 0, null: false
    t.integer "opened_count", default: 0, null: false
    t.integer "failed_count", default: 0, null: false
    t.string "subject", limit: 300
    t.string "from", limit: 2000
    t.string "reply_to", limit: 2000
    t.text "html"
    t.text "plaintext"
    t.boolean "track_opens", default: false, null: false
    t.datetime "submitted_at", null: false
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["post_id"], name: "emails_post_id_index"
    t.index ["post_id"], name: "emails_post_id_unique", unique: true
  end

  create_table "integrations", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "type", limit: 50, default: "custom", null: false
    t.string "name", limit: 191, null: false
    t.string "slug", limit: 191, null: false
    t.string "icon_image", limit: 2000
    t.string "description", limit: 2000
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["slug"], name: "integrations_slug_unique", unique: true
  end

  create_table "invites", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "role_id", limit: 24, null: false
    t.string "status", limit: 50, default: "pending", null: false
    t.string "token", limit: 191, null: false
    t.string "email", limit: 191, null: false
    t.bigint "expires", null: false
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["email"], name: "invites_email_unique", unique: true
    t.index ["token"], name: "invites_token_unique", unique: true
  end

  create_table "labels", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.string "slug", limit: 191, null: false
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["name"], name: "labels_name_unique", unique: true
    t.index ["slug"], name: "labels_slug_unique", unique: true
  end

  create_table "members", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "uuid", limit: 36
    t.string "email", limit: 191, null: false
    t.string "status", limit: 50, default: "free", null: false
    t.string "name", limit: 191
    t.string "note", limit: 2000
    t.string "geolocation", limit: 2000
    t.boolean "subscribed", default: true
    t.integer "email_count", default: 0, null: false
    t.integer "email_opened_count", default: 0, null: false
    t.integer "email_open_rate"
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["email"], name: "members_email_unique", unique: true
    t.index ["email_open_rate"], name: "members_email_open_rate_index"
    t.index ["uuid"], name: "members_uuid_unique", unique: true
  end

  create_table "members_email_change_events", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "member_id", limit: 24, null: false
    t.string "to_email", limit: 191, null: false
    t.string "from_email", limit: 191, null: false
    t.datetime "created_at", null: false
  end

  create_table "members_labels", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "member_id", limit: 24, null: false
    t.string "label_id", limit: 24, null: false
    t.integer "sort_order", default: 0, null: false
  end

  create_table "members_login_events", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "member_id", limit: 24, null: false
    t.datetime "created_at", null: false
  end

  create_table "members_paid_subscription_events", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "member_id", limit: 24, null: false
    t.string "from_plan", limit: 255
    t.string "to_plan", limit: 255
    t.string "currency", limit: 191, null: false
    t.string "source", limit: 50, null: false
    t.integer "mrr_delta", null: false
    t.datetime "created_at", null: false
  end

  create_table "members_payment_events", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "member_id", limit: 24, null: false
    t.integer "amount", null: false
    t.string "currency", limit: 191, null: false
    t.string "source", limit: 50, null: false
    t.datetime "created_at", null: false
  end

  create_table "members_product_events", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "member_id", limit: 24, null: false
    t.string "product_id", limit: 24, null: false
    t.string "action", limit: 50
    t.datetime "created_at", null: false
  end

  create_table "members_products", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "member_id", limit: 24, null: false
    t.string "product_id", limit: 24, null: false
    t.integer "sort_order", default: 0, null: false
  end

  create_table "members_status_events", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "member_id", limit: 24, null: false
    t.string "from_status", limit: 50
    t.string "to_status", limit: 50
    t.datetime "created_at", null: false
  end

  create_table "members_stripe_customers", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "member_id", limit: 24, null: false
    t.string "customer_id", limit: 255, null: false
    t.string "name", limit: 191
    t.string "email", limit: 191
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["customer_id"], name: "members_stripe_customers_customer_id_unique", unique: true
  end

  create_table "members_stripe_customers_subscriptions", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "customer_id", limit: 255, null: false
    t.string "subscription_id", limit: 255, null: false
    t.string "stripe_price_id", limit: 255, default: "", null: false
    t.string "status", limit: 50, null: false
    t.boolean "cancel_at_period_end", default: false, null: false
    t.string "cancellation_reason", limit: 500
    t.datetime "current_period_end", null: false
    t.datetime "start_date", null: false
    t.string "default_payment_card_last4", limit: 4
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.string "plan_id", limit: 255, null: false
    t.string "plan_nickname", limit: 50, null: false
    t.string "plan_interval", limit: 50, null: false
    t.integer "plan_amount", null: false
    t.string "plan_currency", limit: 191, null: false
    t.index ["stripe_price_id"], name: "members_stripe_customers_subscriptions_stripe_price_id_index"
    t.index ["subscription_id"], name: "members_stripe_customers_subscriptions_subscription_id_unique", unique: true
  end

  create_table "members_subscribe_events", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "member_id", limit: 24, null: false
    t.boolean "subscribed", default: true, null: false
    t.datetime "created_at", null: false
    t.string "source", limit: 50
  end

  create_table "migrations", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "version", limit: 255
    t.string "currentVersion", limit: 255
    t.index ["name", "version"], name: "migrations_name_version_unique", unique: true
  end

  create_table "migrations_lock", primary_key: "lock_key", id: { type: :string, limit: 191 }, force: :cascade do |t|
    t.boolean "locked", default: false
    t.datetime "acquired_at"
    t.datetime "released_at"
  end

  create_table "mobiledoc_revisions", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "post_id", limit: 24, null: false
    t.text "mobiledoc"
    t.bigint "created_at_ts", null: false
    t.datetime "created_at", null: false
    t.index ["post_id"], name: "mobiledoc_revisions_post_id_index"
  end

  create_table "oauth", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "provider", limit: 50, null: false
    t.string "provider_id", limit: 191, null: false
    t.text "access_token"
    t.text "refresh_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.string "user_id", limit: 24, null: false
  end

  create_table "offer_redemptions", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "offer_id", limit: 24, null: false
    t.string "member_id", limit: 24, null: false
    t.string "subscription_id", limit: 24, null: false
    t.datetime "created_at", null: false
  end

  create_table "offers", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.string "name", limit: 191, null: false
    t.string "code", limit: 191, null: false
    t.string "product_id", limit: 24, null: false
    t.string "stripe_coupon_id", limit: 255
    t.string "interval", limit: 50, null: false
    t.string "currency", limit: 50
    t.string "discount_type", limit: 50, null: false
    t.integer "discount_amount", null: false
    t.string "duration", limit: 50, null: false
    t.integer "duration_in_months"
    t.string "portal_title", limit: 191
    t.string "portal_description", limit: 2000
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.index ["code"], name: "offers_code_unique", unique: true
    t.index ["name"], name: "offers_name_unique", unique: true
    t.index ["stripe_coupon_id"], name: "offers_stripe_coupon_id_unique", unique: true
  end

  create_table "permissions", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "object_type", limit: 50, null: false
    t.string "action_type", limit: 50, null: false
    t.string "object_id", limit: 24
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["name"], name: "permissions_name_unique", unique: true
  end

  create_table "permissions_roles", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "role_id", limit: 24, null: false
    t.string "permission_id", limit: 24, null: false
  end

  create_table "permissions_users", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "user_id", limit: 24, null: false
    t.string "permission_id", limit: 24, null: false
  end

  create_table "posts", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.string "title", limit: 2000, null: false
    t.string "slug", limit: 191, null: false
    t.text "mobiledoc"
    t.text "html"
    t.string "comment_id", limit: 50
    t.text "plaintext"
    t.string "feature_image", limit: 2000
    t.boolean "featured", default: false, null: false
    t.string "type", limit: 50, default: "post", null: false
    t.string "status", limit: 50, default: "draft", null: false
    t.string "locale", limit: 6
    t.string "visibility", limit: 50, default: "public", null: false
    t.string "email_recipient_filter", limit: 50, default: "none", null: false
    t.string "author_id", limit: 24, null: false
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.datetime "published_at"
    t.string "published_by", limit: 24
    t.string "custom_excerpt", limit: 2000
    t.text "codeinjection_head"
    t.text "codeinjection_foot"
    t.string "custom_template", limit: 100
    t.text "canonical_url"
    t.index ["slug", "type"], name: "posts_slug_type_unique", unique: true
  end

  create_table "posts_authors", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "post_id", limit: 24, null: false
    t.string "author_id", limit: 24, null: false
    t.integer "sort_order", default: 0, null: false
  end

  create_table "posts_meta", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "post_id", limit: 24, null: false
    t.string "og_image", limit: 2000
    t.string "og_title", limit: 300
    t.string "og_description", limit: 500
    t.string "twitter_image", limit: 2000
    t.string "twitter_title", limit: 300
    t.string "twitter_description", limit: 500
    t.string "meta_title", limit: 2000
    t.string "meta_description", limit: 2000
    t.string "email_subject", limit: 300
    t.text "frontmatter"
    t.string "feature_image_alt", limit: 191
    t.text "feature_image_caption"
    t.boolean "email_only", default: false, null: false
    t.index ["post_id"], name: "posts_meta_post_id_unique", unique: true
  end

  create_table "posts_tags", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "post_id", limit: 24, null: false
    t.string "tag_id", limit: 24, null: false
    t.integer "sort_order", default: 0, null: false
  end

  create_table "products", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.string "slug", limit: 191, null: false
    t.string "monthly_price_id", limit: 24
    t.string "yearly_price_id", limit: 24
    t.string "description", limit: 191
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.index ["slug"], name: "products_slug_unique", unique: true
  end

  create_table "products_benefits", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "product_id", limit: 24, null: false
    t.string "benefit_id", limit: 24, null: false
    t.integer "sort_order", default: 0, null: false
  end

  create_table "roles", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "description", limit: 2000
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["name"], name: "roles_name_unique", unique: true
  end

  create_table "roles_users", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "role_id", limit: 24, null: false
    t.string "user_id", limit: 24, null: false
  end

  create_table "sessions", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "session_id", limit: 32, null: false
    t.string "user_id", limit: 24, null: false
    t.string "session_data", limit: 2000, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.index ["session_id"], name: "sessions_session_id_unique", unique: true
  end

  create_table "settings", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "group", limit: 50, default: "core", null: false
    t.string "key", limit: 50, null: false
    t.text "value"
    t.string "type", limit: 50, null: false
    t.string "flags", limit: 50
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["key"], name: "settings_key_unique", unique: true
  end

  create_table "snippets", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.text "mobiledoc", null: false
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["name"], name: "snippets_name_unique", unique: true
  end

  create_table "stripe_prices", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "stripe_price_id", limit: 255, null: false
    t.string "stripe_product_id", limit: 255, null: false
    t.boolean "active", null: false
    t.string "nickname", limit: 50
    t.string "currency", limit: 191, null: false
    t.integer "amount", null: false
    t.string "type", limit: 50, default: "recurring", null: false
    t.string "interval", limit: 50
    t.string "description", limit: 191
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.index ["stripe_price_id"], name: "stripe_prices_stripe_price_id_unique", unique: true
  end

  create_table "stripe_products", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "product_id", limit: 24, null: false
    t.string "stripe_product_id", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.index ["stripe_product_id"], name: "stripe_products_stripe_product_id_unique", unique: true
  end

  create_table "tags", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.string "slug", limit: 191, null: false
    t.text "description"
    t.string "feature_image", limit: 2000
    t.string "parent_id", limit: 191
    t.string "visibility", limit: 50, default: "public", null: false
    t.string "og_image", limit: 2000
    t.string "og_title", limit: 300
    t.string "og_description", limit: 500
    t.string "twitter_image", limit: 2000
    t.string "twitter_title", limit: 300
    t.string "twitter_description", limit: 500
    t.string "meta_title", limit: 2000
    t.string "meta_description", limit: 2000
    t.text "codeinjection_head"
    t.text "codeinjection_foot"
    t.string "canonical_url", limit: 2000
    t.string "accent_color", limit: 50
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["slug"], name: "tags_slug_unique", unique: true
  end

  create_table "temp_member_analytic_events", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "event_name", limit: 50, null: false
    t.datetime "created_at", null: false
    t.string "member_id", limit: 24, null: false
    t.string "member_status", limit: 50, null: false
    t.string "entry_id", limit: 24
    t.string "source_url", limit: 2000
    t.string "metadata", limit: 191
  end

  create_table "tokens", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "token", limit: 32, null: false
    t.string "data", limit: 2000
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.index ["token"], name: "tokens_token_index"
  end

  create_table "users", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.string "slug", limit: 191, null: false
    t.string "password", limit: 60, null: false
    t.string "email", limit: 191, null: false
    t.string "profile_image", limit: 2000
    t.string "cover_image", limit: 2000
    t.text "bio"
    t.string "website", limit: 2000
    t.text "location"
    t.string "facebook", limit: 2000
    t.string "twitter", limit: 2000
    t.text "accessibility"
    t.string "status", limit: 50, default: "active", null: false
    t.string "locale", limit: 6
    t.string "visibility", limit: 50, default: "public", null: false
    t.string "meta_title", limit: 2000
    t.string "meta_description", limit: 2000
    t.text "tour"
    t.datetime "last_seen"
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
    t.index ["email"], name: "users_email_unique", unique: true
    t.index ["slug"], name: "users_slug_unique", unique: true
  end

  create_table "webhooks", id: { type: :string, limit: 24 }, force: :cascade do |t|
    t.string "event", limit: 50, null: false
    t.string "target_url", limit: 2000, null: false
    t.string "name", limit: 191
    t.string "secret", limit: 191
    t.string "api_version", limit: 50, default: "v2", null: false
    t.string "integration_id", limit: 24, null: false
    t.string "status", limit: 50, default: "available", null: false
    t.datetime "last_triggered_at"
    t.string "last_triggered_status", limit: 50
    t.string "last_triggered_error", limit: 50
    t.datetime "created_at", null: false
    t.string "created_by", limit: 24, null: false
    t.datetime "updated_at"
    t.string "updated_by", limit: 24
  end

  add_foreign_key "email_batches", "emails"
  add_foreign_key "email_recipients", "email_batches", column: "batch_id"
  add_foreign_key "email_recipients", "emails"
  add_foreign_key "members_email_change_events", "members", on_delete: :cascade
  add_foreign_key "members_labels", "labels", on_delete: :cascade
  add_foreign_key "members_labels", "members", on_delete: :cascade
  add_foreign_key "members_login_events", "members", on_delete: :cascade
  add_foreign_key "members_paid_subscription_events", "members", on_delete: :cascade
  add_foreign_key "members_payment_events", "members", on_delete: :cascade
  add_foreign_key "members_product_events", "members", on_delete: :cascade
  add_foreign_key "members_product_events", "products"
  add_foreign_key "members_products", "members", on_delete: :cascade
  add_foreign_key "members_products", "products", on_delete: :cascade
  add_foreign_key "members_status_events", "members", on_delete: :cascade
  add_foreign_key "members_stripe_customers", "members", on_delete: :cascade
  add_foreign_key "members_stripe_customers_subscriptions", "members_stripe_customers", column: "customer_id", primary_key: "customer_id", on_delete: :cascade
  add_foreign_key "members_subscribe_events", "members", on_delete: :cascade
  add_foreign_key "oauth", "users"
  add_foreign_key "offer_redemptions", "members", on_delete: :cascade
  add_foreign_key "offer_redemptions", "members_stripe_customers_subscriptions", column: "subscription_id", on_delete: :cascade
  add_foreign_key "offer_redemptions", "offers", on_delete: :cascade
  add_foreign_key "offers", "products"
  add_foreign_key "posts_authors", "posts"
  add_foreign_key "posts_authors", "users", column: "author_id"
  add_foreign_key "posts_meta", "posts"
  add_foreign_key "posts_tags", "posts"
  add_foreign_key "posts_tags", "tags"
  add_foreign_key "products_benefits", "benefits", on_delete: :cascade
  add_foreign_key "products_benefits", "products", on_delete: :cascade
  add_foreign_key "stripe_prices", "stripe_products", primary_key: "stripe_product_id"
  add_foreign_key "stripe_products", "products"
  add_foreign_key "webhooks", "integrations", on_delete: :cascade
end
