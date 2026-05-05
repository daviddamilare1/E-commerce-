--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.vendor_vendor DROP CONSTRAINT IF EXISTS vendor_vendor_user_id_424f99f3_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.vendor_payout DROP CONSTRAINT IF EXISTS vendor_payout_vendor_id_9b447cb5_fk_vendor_vendor_id;
ALTER TABLE IF EXISTS ONLY public.vendor_payout DROP CONSTRAINT IF EXISTS vendor_payout_item_id_43a28a21_fk_core_orderitem_id;
ALTER TABLE IF EXISTS ONLY public.vendor_notifications DROP CONSTRAINT IF EXISTS vendor_notifications_user_id_5ba77fdc_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.vendor_notifications DROP CONSTRAINT IF EXISTS vendor_notifications_order_id_5b66e8eb_fk_core_orderitem_id;
ALTER TABLE IF EXISTS ONLY public.vendor_bankaccount DROP CONSTRAINT IF EXISTS vendor_bankaccount_vendor_id_09249edd_fk_vendor_vendor_id;
ALTER TABLE IF EXISTS ONLY public.userauths_user_user_permissions DROP CONSTRAINT IF EXISTS userauths_user_user__user_id_7dc84ca3_fk_userauths;
ALTER TABLE IF EXISTS ONLY public.userauths_user_user_permissions DROP CONSTRAINT IF EXISTS userauths_user_user__permission_id_0e980ebe_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.userauths_user_groups DROP CONSTRAINT IF EXISTS userauths_user_groups_user_id_70ad3415_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.userauths_user_groups DROP CONSTRAINT IF EXISTS userauths_user_groups_group_id_2bd3d457_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.userauths_profile DROP CONSTRAINT IF EXISTS userauths_profile_user_id_bdea9f7e_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.customer_wishlist DROP CONSTRAINT IF EXISTS customer_wishlist_user_id_f93ac5a1_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.customer_wishlist DROP CONSTRAINT IF EXISTS customer_wishlist_product_id_fd71d12a_fk_core_product_id;
ALTER TABLE IF EXISTS ONLY public.customer_notifications DROP CONSTRAINT IF EXISTS customer_notifications_user_id_2fcb37af_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.customer_address DROP CONSTRAINT IF EXISTS customer_address_user_id_a05f8db3_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.core_variantitem DROP CONSTRAINT IF EXISTS core_variantitem_variant_id_4c654dc0_fk_core_variant_id;
ALTER TABLE IF EXISTS ONLY public.core_variant DROP CONSTRAINT IF EXISTS core_variant_product_id_d6e437a8_fk_core_product_id;
ALTER TABLE IF EXISTS ONLY public.core_review DROP CONSTRAINT IF EXISTS core_review_user_id_b6106194_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.core_review DROP CONSTRAINT IF EXISTS core_review_product_id_27ba91fa_fk_core_product_id;
ALTER TABLE IF EXISTS ONLY public.core_product DROP CONSTRAINT IF EXISTS core_product_vendor_id_42113a3f_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.core_product DROP CONSTRAINT IF EXISTS core_product_category_id_b9d8ff9f_fk_core_category_id;
ALTER TABLE IF EXISTS ONLY public.core_orderitem DROP CONSTRAINT IF EXISTS core_orderitem_vendor_id_2de729af_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.core_orderitem DROP CONSTRAINT IF EXISTS core_orderitem_product_id_0c2047cd_fk_core_product_id;
ALTER TABLE IF EXISTS ONLY public.core_orderitem DROP CONSTRAINT IF EXISTS core_orderitem_order_id_30929c10_fk_core_order_id;
ALTER TABLE IF EXISTS ONLY public.core_orderitem_coupon DROP CONSTRAINT IF EXISTS core_orderitem_coupon_coupon_id_7d81e292_fk_core_coupon_id;
ALTER TABLE IF EXISTS ONLY public.core_orderitem_coupon DROP CONSTRAINT IF EXISTS core_orderitem_coupo_orderitem_id_9d18c688_fk_core_orde;
ALTER TABLE IF EXISTS ONLY public.core_order_vendors DROP CONSTRAINT IF EXISTS core_order_vendors_user_id_f0b37024_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.core_order_vendors DROP CONSTRAINT IF EXISTS core_order_vendors_order_id_ce9cc052_fk_core_order_id;
ALTER TABLE IF EXISTS ONLY public.core_order DROP CONSTRAINT IF EXISTS core_order_customer_id_9e4576b7_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.core_order_coupons DROP CONSTRAINT IF EXISTS core_order_coupons_order_id_ccd78002_fk_core_order_id;
ALTER TABLE IF EXISTS ONLY public.core_order_coupons DROP CONSTRAINT IF EXISTS core_order_coupons_coupon_id_d40b2e9c_fk_core_coupon_id;
ALTER TABLE IF EXISTS ONLY public.core_order DROP CONSTRAINT IF EXISTS core_order_address_id_caf8cd86_fk_customer_address_id;
ALTER TABLE IF EXISTS ONLY public.core_gallery DROP CONSTRAINT IF EXISTS core_gallery_product_id_4087242a_fk_core_product_id;
ALTER TABLE IF EXISTS ONLY public.core_coupon DROP CONSTRAINT IF EXISTS core_coupon_vendor_id_9ed91c98_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.core_cart DROP CONSTRAINT IF EXISTS core_cart_user_id_2ebeb843_fk_userauths_user_id;
ALTER TABLE IF EXISTS ONLY public.core_cart DROP CONSTRAINT IF EXISTS core_cart_product_id_8a783d81_fk_core_product_id;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX IF EXISTS public.vendor_vendor_vid_d747cd50_like;
DROP INDEX IF EXISTS public.vendor_vendor_slug_e7b8f5a5_like;
DROP INDEX IF EXISTS public.vendor_payout_vendor_id_9b447cb5;
DROP INDEX IF EXISTS public.vendor_payout_payout_id_d2964b2c_like;
DROP INDEX IF EXISTS public.vendor_payout_item_id_43a28a21;
DROP INDEX IF EXISTS public.vendor_notifications_user_id_5ba77fdc;
DROP INDEX IF EXISTS public.vendor_notifications_order_id_5b66e8eb;
DROP INDEX IF EXISTS public.userauths_user_username_e44feab8_like;
DROP INDEX IF EXISTS public.userauths_user_user_permissions_user_id_7dc84ca3;
DROP INDEX IF EXISTS public.userauths_user_user_permissions_permission_id_0e980ebe;
DROP INDEX IF EXISTS public.userauths_user_groups_user_id_70ad3415;
DROP INDEX IF EXISTS public.userauths_user_groups_group_id_2bd3d457;
DROP INDEX IF EXISTS public.userauths_user_email_5e5b59e6_like;
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.customer_wishlist_user_id_f93ac5a1;
DROP INDEX IF EXISTS public.customer_wishlist_product_id_fd71d12a;
DROP INDEX IF EXISTS public.customer_notifications_user_id_2fcb37af;
DROP INDEX IF EXISTS public.customer_address_user_id_a05f8db3;
DROP INDEX IF EXISTS public.core_variantitem_variant_id_4c654dc0;
DROP INDEX IF EXISTS public.core_variant_product_id_d6e437a8;
DROP INDEX IF EXISTS public.core_review_user_id_b6106194;
DROP INDEX IF EXISTS public.core_review_product_id_27ba91fa;
DROP INDEX IF EXISTS public.core_product_vendor_id_42113a3f;
DROP INDEX IF EXISTS public.core_product_slug_8cf0d080_like;
DROP INDEX IF EXISTS public.core_product_slug_8cf0d080;
DROP INDEX IF EXISTS public.core_product_sku_6168965a_like;
DROP INDEX IF EXISTS public.core_product_category_id_b9d8ff9f;
DROP INDEX IF EXISTS public.core_orderitem_vendor_id_2de729af;
DROP INDEX IF EXISTS public.core_orderitem_product_id_0c2047cd;
DROP INDEX IF EXISTS public.core_orderitem_order_id_30929c10;
DROP INDEX IF EXISTS public.core_orderitem_coupon_orderitem_id_9d18c688;
DROP INDEX IF EXISTS public.core_orderitem_coupon_coupon_id_7d81e292;
DROP INDEX IF EXISTS public.core_order_vendors_user_id_f0b37024;
DROP INDEX IF EXISTS public.core_order_vendors_order_id_ce9cc052;
DROP INDEX IF EXISTS public.core_order_oid_dc5a6b9a_like;
DROP INDEX IF EXISTS public.core_order_customer_id_9e4576b7;
DROP INDEX IF EXISTS public.core_order_coupons_order_id_ccd78002;
DROP INDEX IF EXISTS public.core_order_coupons_coupon_id_d40b2e9c;
DROP INDEX IF EXISTS public.core_order_address_id_caf8cd86;
DROP INDEX IF EXISTS public.core_gallery_product_id_4087242a;
DROP INDEX IF EXISTS public.core_gallery_gid_1e2915ef_like;
DROP INDEX IF EXISTS public.core_coupon_vendor_id_9ed91c98;
DROP INDEX IF EXISTS public.core_category_slug_384eca9c_like;
DROP INDEX IF EXISTS public.core_cart_user_id_2ebeb843;
DROP INDEX IF EXISTS public.core_cart_product_id_8a783d81;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
ALTER TABLE IF EXISTS ONLY public.vendor_vendor DROP CONSTRAINT IF EXISTS vendor_vendor_vid_key;
ALTER TABLE IF EXISTS ONLY public.vendor_vendor DROP CONSTRAINT IF EXISTS vendor_vendor_user_id_key;
ALTER TABLE IF EXISTS ONLY public.vendor_vendor DROP CONSTRAINT IF EXISTS vendor_vendor_slug_e7b8f5a5_uniq;
ALTER TABLE IF EXISTS ONLY public.vendor_vendor DROP CONSTRAINT IF EXISTS vendor_vendor_pkey;
ALTER TABLE IF EXISTS ONLY public.vendor_payout DROP CONSTRAINT IF EXISTS vendor_payout_pkey;
ALTER TABLE IF EXISTS ONLY public.vendor_payout DROP CONSTRAINT IF EXISTS vendor_payout_payout_id_key;
ALTER TABLE IF EXISTS ONLY public.vendor_notifications DROP CONSTRAINT IF EXISTS vendor_notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.vendor_bankaccount DROP CONSTRAINT IF EXISTS vendor_bankaccount_vendor_id_key;
ALTER TABLE IF EXISTS ONLY public.vendor_bankaccount DROP CONSTRAINT IF EXISTS vendor_bankaccount_pkey;
ALTER TABLE IF EXISTS ONLY public.userauths_user DROP CONSTRAINT IF EXISTS userauths_user_username_key;
ALTER TABLE IF EXISTS ONLY public.userauths_user_user_permissions DROP CONSTRAINT IF EXISTS userauths_user_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.userauths_user_user_permissions DROP CONSTRAINT IF EXISTS userauths_user_user_perm_user_id_permission_id_5423ee7a_uniq;
ALTER TABLE IF EXISTS ONLY public.userauths_user DROP CONSTRAINT IF EXISTS userauths_user_pkey;
ALTER TABLE IF EXISTS ONLY public.userauths_user_groups DROP CONSTRAINT IF EXISTS userauths_user_groups_user_id_group_id_e032b670_uniq;
ALTER TABLE IF EXISTS ONLY public.userauths_user_groups DROP CONSTRAINT IF EXISTS userauths_user_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.userauths_user DROP CONSTRAINT IF EXISTS userauths_user_email_key;
ALTER TABLE IF EXISTS ONLY public.userauths_profile DROP CONSTRAINT IF EXISTS userauths_profile_user_id_key;
ALTER TABLE IF EXISTS ONLY public.userauths_profile DROP CONSTRAINT IF EXISTS userauths_profile_pkey;
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_wishlist DROP CONSTRAINT IF EXISTS customer_wishlist_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_notifications DROP CONSTRAINT IF EXISTS customer_notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_address DROP CONSTRAINT IF EXISTS customer_address_pkey;
ALTER TABLE IF EXISTS ONLY public.core_variantitem DROP CONSTRAINT IF EXISTS core_variantitem_pkey;
ALTER TABLE IF EXISTS ONLY public.core_variant DROP CONSTRAINT IF EXISTS core_variant_pkey;
ALTER TABLE IF EXISTS ONLY public.core_review DROP CONSTRAINT IF EXISTS core_review_pkey;
ALTER TABLE IF EXISTS ONLY public.core_product DROP CONSTRAINT IF EXISTS core_product_sku_key;
ALTER TABLE IF EXISTS ONLY public.core_product DROP CONSTRAINT IF EXISTS core_product_pkey;
ALTER TABLE IF EXISTS ONLY public.core_orderitem DROP CONSTRAINT IF EXISTS core_orderitem_pkey;
ALTER TABLE IF EXISTS ONLY public.core_orderitem_coupon DROP CONSTRAINT IF EXISTS core_orderitem_coupon_pkey;
ALTER TABLE IF EXISTS ONLY public.core_orderitem_coupon DROP CONSTRAINT IF EXISTS core_orderitem_coupon_orderitem_id_coupon_id_0080e31f_uniq;
ALTER TABLE IF EXISTS ONLY public.core_order_vendors DROP CONSTRAINT IF EXISTS core_order_vendors_pkey;
ALTER TABLE IF EXISTS ONLY public.core_order_vendors DROP CONSTRAINT IF EXISTS core_order_vendors_order_id_user_id_1af67a1d_uniq;
ALTER TABLE IF EXISTS ONLY public.core_order DROP CONSTRAINT IF EXISTS core_order_pkey;
ALTER TABLE IF EXISTS ONLY public.core_order DROP CONSTRAINT IF EXISTS core_order_oid_key;
ALTER TABLE IF EXISTS ONLY public.core_order_coupons DROP CONSTRAINT IF EXISTS core_order_coupons_pkey;
ALTER TABLE IF EXISTS ONLY public.core_order_coupons DROP CONSTRAINT IF EXISTS core_order_coupons_order_id_coupon_id_2e1bdbae_uniq;
ALTER TABLE IF EXISTS ONLY public.core_gallery DROP CONSTRAINT IF EXISTS core_gallery_pkey;
ALTER TABLE IF EXISTS ONLY public.core_gallery DROP CONSTRAINT IF EXISTS core_gallery_gid_key;
ALTER TABLE IF EXISTS ONLY public.core_coupon DROP CONSTRAINT IF EXISTS core_coupon_pkey;
ALTER TABLE IF EXISTS ONLY public.core_contact DROP CONSTRAINT IF EXISTS core_contact_pkey;
ALTER TABLE IF EXISTS ONLY public.core_category DROP CONSTRAINT IF EXISTS core_category_slug_key;
ALTER TABLE IF EXISTS ONLY public.core_category DROP CONSTRAINT IF EXISTS core_category_pkey;
ALTER TABLE IF EXISTS ONLY public.core_cart DROP CONSTRAINT IF EXISTS core_cart_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
DROP TABLE IF EXISTS public.vendor_vendor;
DROP TABLE IF EXISTS public.vendor_payout;
DROP TABLE IF EXISTS public.vendor_notifications;
DROP TABLE IF EXISTS public.vendor_bankaccount;
DROP TABLE IF EXISTS public.userauths_user_user_permissions;
DROP TABLE IF EXISTS public.userauths_user_groups;
DROP TABLE IF EXISTS public.userauths_user;
DROP TABLE IF EXISTS public.userauths_profile;
DROP TABLE IF EXISTS public.django_session;
DROP TABLE IF EXISTS public.django_migrations;
DROP TABLE IF EXISTS public.django_content_type;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.customer_wishlist;
DROP TABLE IF EXISTS public.customer_notifications;
DROP TABLE IF EXISTS public.customer_address;
DROP TABLE IF EXISTS public.core_variantitem;
DROP TABLE IF EXISTS public.core_variant;
DROP TABLE IF EXISTS public.core_review;
DROP TABLE IF EXISTS public.core_product;
DROP TABLE IF EXISTS public.core_orderitem_coupon;
DROP TABLE IF EXISTS public.core_orderitem;
DROP TABLE IF EXISTS public.core_order_vendors;
DROP TABLE IF EXISTS public.core_order_coupons;
DROP TABLE IF EXISTS public.core_order;
DROP TABLE IF EXISTS public.core_gallery;
DROP TABLE IF EXISTS public.core_coupon;
DROP TABLE IF EXISTS public.core_contact;
DROP TABLE IF EXISTS public.core_category;
DROP TABLE IF EXISTS public.core_cart;
DROP TABLE IF EXISTS public.auth_permission;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP TABLE IF EXISTS public.auth_group;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_cart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_cart (
    id bigint NOT NULL,
    qty integer,
    price numeric(12,2),
    sub_total numeric(12,2),
    shipping numeric(12,2),
    tax numeric(12,2),
    total numeric(12,2),
    size character varying(100),
    color character varying(100),
    cart_id character varying(1000),
    date timestamp with time zone NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint,
    CONSTRAINT core_cart_qty_check CHECK ((qty >= 0))
);


--
-- Name: core_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_category (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    image character varying(100),
    slug character varying(50) NOT NULL
);


--
-- Name: core_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_contact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_contact (
    id bigint NOT NULL,
    full_name character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    subject character varying(255) NOT NULL,
    message text NOT NULL
);


--
-- Name: core_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_contact ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_coupon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_coupon (
    id bigint NOT NULL,
    code character varying(100) NOT NULL,
    discount integer NOT NULL,
    active boolean NOT NULL,
    used boolean NOT NULL,
    vendor_id bigint
);


--
-- Name: core_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_coupon ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_gallery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_gallery (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    gid character varying(20) NOT NULL,
    product_id bigint
);


--
-- Name: core_gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_gallery ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_gallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_order (
    id bigint NOT NULL,
    sub_total numeric(12,2) NOT NULL,
    shipping numeric(12,2) NOT NULL,
    tax numeric(12,2) NOT NULL,
    service_fee numeric(12,2) NOT NULL,
    total numeric(12,2) NOT NULL,
    payment_status character varying(100) NOT NULL,
    payment_method character varying(100),
    order_status character varying(100) NOT NULL,
    initial_total numeric(12,2) NOT NULL,
    saved numeric(12,2),
    oid character varying(20) NOT NULL,
    payment_id character varying(1000),
    date timestamp with time zone NOT NULL,
    customer_id bigint,
    address_id bigint
);


--
-- Name: core_order_coupons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_order_coupons (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    coupon_id bigint NOT NULL
);


--
-- Name: core_order_coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_order_coupons ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_order_coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_order ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_order_vendors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_order_vendors (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: core_order_vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_order_vendors ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_order_vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_orderitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_orderitem (
    id bigint NOT NULL,
    order_status character varying(100) NOT NULL,
    shipping_service character varying(100),
    tracking_id character varying(100),
    qty integer NOT NULL,
    color character varying(100),
    size character varying(100),
    price numeric(12,2) NOT NULL,
    sub_total numeric(12,2) NOT NULL,
    shipping numeric(12,2) NOT NULL,
    tax numeric(12,2) NOT NULL,
    total numeric(12,2) NOT NULL,
    initial_total numeric(12,2) NOT NULL,
    saved numeric(12,2),
    applied_coupon boolean NOT NULL,
    item_id character varying(25) NOT NULL,
    date timestamp with time zone NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    vendor_id bigint
);


--
-- Name: core_orderitem_coupon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_orderitem_coupon (
    id bigint NOT NULL,
    orderitem_id bigint NOT NULL,
    coupon_id bigint NOT NULL
);


--
-- Name: core_orderitem_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_orderitem_coupon ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_orderitem_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_orderitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_product (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    image character varying(100),
    "desc" text NOT NULL,
    price numeric(12,2),
    regular_price numeric(12,2),
    stock integer,
    shipping numeric(12,2),
    status character varying(50) NOT NULL,
    featured boolean NOT NULL,
    sku character varying(20) NOT NULL,
    slug character varying(50),
    date timestamp with time zone NOT NULL,
    category_id bigint,
    vendor_id bigint,
    CONSTRAINT core_product_stock_check CHECK ((stock >= 0))
);


--
-- Name: core_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_review; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_review (
    id bigint NOT NULL,
    review text,
    reply text,
    rating integer NOT NULL,
    active boolean NOT NULL,
    date timestamp with time zone NOT NULL,
    product_id bigint,
    user_id bigint
);


--
-- Name: core_review_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_review ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_variant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_variant (
    id bigint NOT NULL,
    name character varying(255),
    product_id bigint
);


--
-- Name: core_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_variant ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_variant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_variantitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.core_variantitem (
    id bigint NOT NULL,
    title character varying(1000),
    content character varying(1000),
    variant_id bigint NOT NULL
);


--
-- Name: core_variantitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.core_variantitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_variantitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_address (
    id bigint NOT NULL,
    full_name character varying(200),
    mobile character varying(50),
    email character varying(100),
    country character varying(100),
    state character varying(100),
    city character varying(100),
    address character varying(100),
    zip_code character varying(100),
    user_id bigint
);


--
-- Name: customer_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customer_address ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customer_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_notifications (
    id bigint NOT NULL,
    type character varying(100) NOT NULL,
    seen boolean NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id bigint
);


--
-- Name: customer_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customer_notifications ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customer_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_wishlist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_wishlist (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint
);


--
-- Name: customer_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customer_wishlist ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customer_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: userauths_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.userauths_profile (
    id bigint NOT NULL,
    image character varying(100),
    full_name character varying(100),
    phone character varying(100),
    user_type character varying(100),
    user_id bigint NOT NULL
);


--
-- Name: userauths_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.userauths_profile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.userauths_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: userauths_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.userauths_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    username character varying(255),
    email character varying(254) NOT NULL
);


--
-- Name: userauths_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.userauths_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: userauths_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.userauths_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.userauths_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: userauths_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.userauths_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.userauths_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: userauths_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.userauths_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: userauths_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.userauths_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.userauths_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vendor_bankaccount; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendor_bankaccount (
    id bigint NOT NULL,
    account_type character varying(50),
    bank_name character varying(500) NOT NULL,
    account_number character varying(100) NOT NULL,
    account_name character varying(100) NOT NULL,
    bank_code character varying(100),
    stripe_id character varying(100),
    paypal_address character varying(100),
    vendor_id bigint
);


--
-- Name: vendor_bankaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.vendor_bankaccount ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vendor_bankaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vendor_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendor_notifications (
    id bigint NOT NULL,
    type character varying(100) NOT NULL,
    seen boolean NOT NULL,
    date timestamp with time zone NOT NULL,
    order_id bigint,
    user_id bigint
);


--
-- Name: vendor_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.vendor_notifications ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vendor_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vendor_payout; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendor_payout (
    id bigint NOT NULL,
    amount numeric(12,2) NOT NULL,
    payout_id character varying(20) NOT NULL,
    date date NOT NULL,
    item_id bigint,
    vendor_id bigint
);


--
-- Name: vendor_payout_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.vendor_payout ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vendor_payout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vendor_vendor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendor_vendor (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    store_name character varying(100),
    description text,
    country character varying(100),
    vid character varying(20) NOT NULL,
    date timestamp with time zone NOT NULL,
    slug character varying(50),
    user_id bigint
);


--
-- Name: vendor_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.vendor_vendor ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vendor_vendor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add category	6	add_category
22	Can change category	6	change_category
23	Can delete category	6	delete_category
24	Can view category	6	view_category
25	Can add coupon	7	add_coupon
26	Can change coupon	7	change_coupon
27	Can delete coupon	7	delete_coupon
28	Can view coupon	7	view_coupon
29	Can add order	8	add_order
30	Can change order	8	change_order
31	Can delete order	8	delete_order
32	Can view order	8	view_order
33	Can add product	9	add_product
34	Can change product	9	change_product
35	Can delete product	9	delete_product
36	Can view product	9	view_product
37	Can add variant	10	add_variant
38	Can change variant	10	change_variant
39	Can delete variant	10	delete_variant
40	Can view variant	10	view_variant
41	Can add variant item	11	add_variantitem
42	Can change variant item	11	change_variantitem
43	Can delete variant item	11	delete_variantitem
44	Can view variant item	11	view_variantitem
45	Can add review	12	add_review
46	Can change review	12	change_review
47	Can delete review	12	delete_review
48	Can view review	12	view_review
49	Can add order item	13	add_orderitem
50	Can change order item	13	change_orderitem
51	Can delete order item	13	delete_orderitem
52	Can view order item	13	view_orderitem
53	Can add gallery	14	add_gallery
54	Can change gallery	14	change_gallery
55	Can delete gallery	14	delete_gallery
56	Can view gallery	14	view_gallery
57	Can add cart	15	add_cart
58	Can change cart	15	change_cart
59	Can delete cart	15	delete_cart
60	Can view cart	15	view_cart
61	Can add wishlist	16	add_wishlist
62	Can change wishlist	16	change_wishlist
63	Can delete wishlist	16	delete_wishlist
64	Can view wishlist	16	view_wishlist
65	Can add notifications	17	add_notifications
66	Can change notifications	17	change_notifications
67	Can delete notifications	17	delete_notifications
68	Can view notifications	17	view_notifications
69	Can add address	18	add_address
70	Can change address	18	change_address
71	Can delete address	18	delete_address
72	Can view address	18	view_address
73	Can add user	19	add_user
74	Can change user	19	change_user
75	Can delete user	19	delete_user
76	Can view user	19	view_user
77	Can add profile	20	add_profile
78	Can change profile	20	change_profile
79	Can delete profile	20	delete_profile
80	Can view profile	20	view_profile
81	Can add vendor	21	add_vendor
82	Can change vendor	21	change_vendor
83	Can delete vendor	21	delete_vendor
84	Can view vendor	21	view_vendor
85	Can add payout	22	add_payout
86	Can change payout	22	change_payout
87	Can delete payout	22	delete_payout
88	Can view payout	22	view_payout
89	Can add notifications	23	add_notifications
90	Can change notifications	23	change_notifications
91	Can delete notifications	23	delete_notifications
92	Can view notifications	23	view_notifications
93	Can add bank account	24	add_bankaccount
94	Can change bank account	24	change_bankaccount
95	Can delete bank account	24	delete_bankaccount
96	Can view bank account	24	view_bankaccount
97	Can add contact	25	add_contact
98	Can change contact	25	change_contact
99	Can delete contact	25	delete_contact
100	Can view contact	25	view_contact
\.


--
-- Data for Name: core_cart; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_cart (id, qty, price, sub_total, shipping, tax, total, size, color, cart_id, date, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: core_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_category (id, title, image, slug) FROM stdin;
1	Cameras	images/3_e91a9142-8cc8-4ed7-aa91-509a622f11f2_360x.png	cameras
2	Mobiles Devices	images/1200_1200-4_0fde0abd-41b6-4288-ba2f-47d385cd2a3f_360x.png	mobiles-devices
3	AirPods	images/e2.jpg	airpods
4	Headphones	images/beats_by_dre.jpeg	headphones
5	Gaming devices	images/51923-485x485-optimized.webp	gaming-devices
\.


--
-- Data for Name: core_contact; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_contact (id, full_name, email, subject, message) FROM stdin;
1	Tyler Star	davidtherodent@gmail.com	Hello,	testing the contact form
2	Tyler Star	davidtherodent@gmail.com	Hello,	Testing again
3	Clare Brown	timuzoset@mailinator.com	Atque vel laborum E	Qui repellendus Lau
\.


--
-- Data for Name: core_coupon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_coupon (id, code, discount, active, used, vendor_id) FROM stdin;
1	scar1234	10	t	t	1
2	25506	5	t	t	1
4	Code123	15	t	t	1
\.


--
-- Data for Name: core_gallery; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_gallery (id, image, gid, product_id) FROM stdin;
4	images/p_img-3.webp	gid_42gg3	4
8	images/2.jpg	gid_4fcg1	29
9	images/4.jpg	gid_bg43b	29
10	images/5.jpg	gid_2dgg2	29
11	images/1_9_8ehfkrO.jpg	gid_3af55	33
12	images/4_1.jpg	gid_5a2h5	33
13	images/5_1_LJpLR39.jpg	gid_4aeca	33
14	images/4_3.jpg	gid_411cd	34
15	images/1_35_d6hLfXt.jpg	gid_a45gc	59
\.


--
-- Data for Name: core_order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_order (id, sub_total, shipping, tax, service_fee, total, payment_status, payment_method, order_status, initial_total, saved, oid, payment_id, date, customer_id, address_id) FROM stdin;
82	400.00	20.00	8.00	21.40	449.40	Paid	Stripe	Delivered	449.40	0.00	oid_22dbc	\N	2025-08-15 12:44:39.525-11	5	2
83	500.00	50.00	10.00	28.00	588.00	Paid	Stripe	Processing	588.00	0.00	oid_2gme2	\N	2025-08-15 12:45:34.009-11	5	2
84	150.00	20.00	3.00	8.65	181.65	Paid	Paystack	Pending	181.65	0.00	oid_22h22	\N	2025-08-15 12:46:06.196-11	5	2
85	350.00	30.00	7.00	19.35	406.35	Paid	Stripe	Shipped	406.35	0.00	oid_cljeg	\N	2025-08-15 12:46:30.295-11	5	2
89	40.00	5.00	0.00	2.25	47.25	Paid	Paystack	Pending	47.25	0.00	oid_2fg11	\N	2026-04-26 05:40:46.367-11	5	5
96	244.00	20.00	0.00	13.20	277.20	Paid	Paystack	Shipped	277.20	0.00	oid_2j2lo	\N	2026-04-26 06:28:21.065-11	5	5
99	1455.00	60.00	29.10	77.21	1621.31	Paid	Stripe	Pending	1621.31	0.00	oid_2i53d	\N	2026-05-04 02:12:44.30138-11	5	2
100	169.15	20.00	3.98	11.15	204.28	Paid	Stripe	Pending	234.13	29.85	oid_jl2o5	\N	2026-05-04 02:52:12.405466-11	5	2
101	357.00	60.00	0.00	20.85	437.85	Paid	Stripe	Pending	437.85	0.00	oid_fifc5	\N	2026-05-04 04:04:54.669636-11	5	5
103	158.00	18.00	0.00	8.80	184.80	Paid	Paystack	Pending	184.80	0.00	oid_24i4e	\N	2026-05-04 04:16:26.574835-11	5	5
\.


--
-- Data for Name: core_order_coupons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_order_coupons (id, order_id, coupon_id) FROM stdin;
1	100	4
\.


--
-- Data for Name: core_order_vendors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_order_vendors (id, order_id, user_id) FROM stdin;
1	82	1
2	83	1
3	84	1
4	85	1
5	89	1
6	96	1
11	99	1
13	100	1
14	101	1
16	103	1
\.


--
-- Data for Name: core_orderitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_orderitem (id, order_status, shipping_service, tracking_id, qty, color, size, price, sub_total, shipping, tax, total, initial_total, saved, applied_coupon, item_id, date, order_id, product_id, vendor_id) FROM stdin;
132	Pending	\N	\N	1	Green	Not Selected	40.00	40.00	5.00	0.00	45.00	45.00	0.00	f	839931	2026-04-26 05:40:46.374-11	89	5	1
139	Shipped	UPS	254102q9	2	Not selected	Not selected	122.00	244.00	20.00	0.00	264.00	264.00	0.00	f	217766	2026-04-26 06:28:21-11	96	4	1
144	Pending	\N	\N	3	Not selected	Not selected	85.00	255.00	30.00	5.10	285.00	285.00	0.00	f	210711	2026-05-04 02:12:44.311457-11	99	45	1
145	Pending	\N	\N	1	Not selected	Not selected	1200.00	1200.00	30.00	24.00	1230.00	1230.00	0.00	f	238113	2026-05-04 02:12:44.317436-11	99	27	1
146	Pending	\N	\N	1	Not Selected	Not Selected	199.00	169.15	20.00	3.98	219.00	219.00	29.85	f	317185	2026-05-04 02:52:12.418057-11	100	42	1
147	Pending	\N	\N	3	Not selected	Not selected	119.00	357.00	60.00	0.00	417.00	417.00	0.00	f	252500	2026-05-04 04:04:54.675765-11	101	65	1
149	Pending	\N	\N	1	Not Selected	Not Selected	158.00	158.00	18.00	0.00	176.00	176.00	0.00	f	240022	2026-05-04 04:16:26.582412-11	103	10	1
\.


--
-- Data for Name: core_orderitem_coupon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_orderitem_coupon (id, orderitem_id, coupon_id) FROM stdin;
1	146	4
\.


--
-- Data for Name: core_product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_product (id, name, image, "desc", price, regular_price, stock, shipping, status, featured, sku, slug, date, category_id, vendor_id) FROM stdin;
5	Nintendo Switch Pro Controller	images/Nintendo_switch.jpg		40.00	50.00	25	5.00	Published	f	sku_2bdfa	nintendo-switch-pro-controller-2r	2025-08-20 09:03:55-11	5	1
4	Solo Beats 4 Headphones	images/p_img-1_nJFQNBc.jpeg		122.00	125.00	7	10.00	Published	t	sku_b54bh	solo-beats-4-headphones-g8	2025-08-20 08:55:28.663-11	4	1
6	Canon EOS 600D DSLR Camera With 18-55mm Lens	images/1_dmAsIj1.jpg	Camera Action Canon	385.00	390.00	5	20.00	Published	t	sku_cc334	canon-eos-600d-dslr-camera-with-18-55mm-lens-rj	2026-04-27 02:57:29.43876-11	1	1
12	Canon Ink Cart EOS 70D Camera	images/1_3.jpg	<p>The Canon EOS 70D 20.2MP Digital SLR Camera Body plus EF-S 18-135mm IS STM Standard Zoom Lens features an APS-C CMOS sensor and DIGIC 5+ image processor to ensure high-resolution images and excellent low-light sensitivity. Both the sensor and processor work together to produce well-detailed, clear imagery that exhibits natural tonality and color gradations with minimal noise when working in difficult lighting conditions. The processor also provides notable speed throughout the camera system, including the ability to record up to 7 fps in full-resolution, quickened AF speeds, and full HD 1080p video recording. The 3.0-inch Clear View II touchscreen LCD monitor profits greatly from the advent Dual Pixel CMOS AF system and its ability to utilize Touch AF focusing for finely controlled selection of the point of focus. The monitor's vari-angle design also enables more efficient shooting and viewing from both high and low angles and an anti-reflective, smudge-resistant coating allows for clear well-detailed viewing. The included 18-135mm IS STM standard zoom lens features a refined Image Stabilization system that delivers up to four equivalent stops of shake correction throughout the zoom range and offers a maximum magnification of 0.28x at the telephoto end. With a top and rear cover of durable magnesium alloy, the D7000 is ready for the outdoors. Nikon engineers paid meticulous attention to where exterior parts join by employing durable sealing against moisture and dust. The compact body has also undergone severe environmental tests to prove its rugged reliability. With approximately 100% frame coverage in the viewfinder, what you see is exactly what you capture. The specially coated glass pentagonal prism and precision-crafted finder screen offer not only a bright viewfinder image, but also enable you to easily confirm when a subject is in focus. The D7000 features an expansive 3-inch VGA LCD. Its approx. 921k-dot resolution assures clear, detailed display of images, which proves invaluable when confirming focus or assessing image sharpness.</p>	660.00	680.00	3	20.00	Published	t	sku_ce53f	canon-ink-cart-eos-70d-camera-9m	2026-04-27 03:38:45-11	1	1
7	Kodak PIXPRO Astro Zoom	images/Kodak_Pixpro_Az401_16_2_Megapixel_Compact_Camera_Black.jfif	Canon EOS R50 Mirrorless Camera with 18-45mm Lens. A compact and lightweight camera, the black Canon EOS R50 is a highly versatile mirrorless camera with a sophisticated photo and video feature set. Geared towards content creators and vloggers, this camera is slightly smaller and lighter than the EOS M50 Mark II and features an upgraded 24.2MP APS-C CMOS sensor and DIGIC X image processor to deliver high-resolution stills and UHD 4K videos.\r\n\r\n24.2MP APS-C CMOS Sensor and DIGIC X Processing\r\n\r\nPairing a powerful 24.2MP APS-C CMOS sensor and DIGIC X image processor, the R50 delivers high resolution imagery with striking and accurate colors. Designed to work in a variety of lighting condition, this camera offers a flexible ISO 32000 range that is expandable to ISO 51200 for working in difficult lighting conditions. Using the full width of the sensor, 6K oversampled UHD 4K 30p video recording is supported as is Full HD 1080 120p for slow motion playback. Additionally, 1-hour of video recording is now available. Capable of processing high speed bursts and high-resolution 4K video, the DIGIC X image processor also supports up to 15 fps continuous shooting via its silent electronic shutter.\r\n\r\nEnhanced Dual Pixel CMOS AF II\r\n\r\nFeaturing 651 high precision autofocus zones, the advanced Dual Pixel CMOS AF II system provides fast and accurate focusing performance. This phase-detection focusing system offers enhanced subject detection and tracking, with the ability to intelligently recognize people, animals, and vehicles while automatically locking onto these subjects and maintaining sharp focus throughout bursts and video captures.\r\n\r\n2.36m-Dot EVF and Vari-Angle Touchscreen LCD\r\n\r\nProviding high-resolution eye-level viewing, the R50 is designed with a bright and clear 2.36m-dot OLED EVF for a pleasing electronic viewfinder experience. Additionally, a large 3.0″ 1.62m-dot vari-angle touchscreen provides an intuitive interface for controlling focusing points, navigating menus, and reviewing imagery. This screen also features a vari-angle design for ease-of-use when working from high and low angles.\r\n\r\nAdvanced A+ Assist\r\n\r\nExperience the joy of creative photography with an expanded array of auto-compatible scenes. Advanced A+ Assist enables great imagery even in difficult settings such as night views and backlit scenarios. Overexposure is automatically reduced so you can capture dynamic scenes or bright portraits, and multiple continuous shots are taken to create beautiful night images or macro photography with a deeper depth of field.\r\n\r\nSimple and Convenient Vlogging\r\n\r\nWith video recording features such as uncropped UHD 4K movie recording at up to 30 fps, Full-HD High-frame rate movie recording at up to fps, Dual Pixel CMOS AF tracking, and Movie for Close-up Demo Mode, the R50 camera makes vlogging and video content creation simple and convenient. The camera also lets you continuously record video for up to 1 hour, allowing you to set up your video and keep your vlog, podcast, or other video project rolling without worrying about it stopping.\r\n\r\nMovie for Close-Up Demos Mode\r\n\r\nEnsure the correct subject is in focus with Movie for Close-Up Demos Mode on the R50 mirrorless camera. This mode quickly switches focus from the on-camera subject to an object that is presented towards the camera’s lens, ideal for movies where showing a product to the viewers is necessary such as in makeup demos or cooking videos.\r\n\r\nVertical Movie Mode and Aspect Markers\r\n\r\nMovie rotation information can be set during or after movie recording, allowing videos to be played in vertical composition when viewing on a smartphone. The Aspect Markers function displays visual markers for different aspect ratios that may be desired for posting the same file to various social media sites. This display provides consideration for proper composition for the different deliverable files that can be created when editing	900.00	900.00	3	20.00	Published	f	sku_5dhb5	kodak-pixpro-astro-zoom-qr	2026-04-27 03:07:59.805007-11	1	1
18	Apple iPhone 12 Pro Max	images/1_7_g0Za5fY.jpg	Phone 12 Pro smartphone was launched on 13th October 2020. The phone comes with a 6.10-inch touchscreen display with a resolution of 1170x2532 pixels at a pixel density of 460 pixels per inch (ppi). The iPhone 12 Pro supports wireless charging, as well as proprietary fast charging.Apple iPhone 12 Pro has 6.1 inches (15.49 cm) display, 12 MP + 12 MP + 12 MP camera, battery. It has a All‑screen OLED Super Retina XDR Screen with a resolution of 2532 x 1170 Pixels.videos, pictures, docs and more without any space constraints. In addition to this, the smartphone from Apple houses a non-removable battery that supports both wireless and proprietary fast charging.\r\n\r\nSpeaking about the camera specifications, the iPhone 12 on the rear features a 12 MP primary camera with f/1.6 aperture and a 12 MP camera with f/2.4 aperture. Also, the rear setup has autofocus feature. While on the front, the mobile comes with a 12 MP camera with f/2.2 aperture for clicking some awesome selfies.\r\n\r\n \r\n\r\nOn iPhone 12, you get various connectivity options such as Wi-Fi 802.11 a/b/g/n/ac/Yes, Lightning, Bluetooth v5.00, NFC, GPS, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the smartphone include proximity sensor, ambient light sensor, barometer, accelerometer, gyroscope, and compass/ magnetometer. Also, there is face unlock with 3D face recognition for security purpose.\r\n\r\n \r\n\r\nMemory: 256GB ROM, 6GB ROM	499.00	498.00	16	10.00	Published	f	sku_ah153	apple-iphone-12-pro-max-o4	2026-04-27 04:01:41.38625-11	2	1
9	Canon Ink Cart Canon EOS	images/1_46.jpg	The compact and lightweight EOS 6D full-frame digital SLR camera features a 20.2 Megapixel Full-Frame CMOS sensor, a wide ISO range of 100–25600, expandable to L: 50, H1: 51200, and H2: 102400, for incredible image quality even in low light, and a DIGIC 5+ Image Processor. The camera also has a new 11-point AF including a high-precision center cross-type AF point with EV -3 sensitivity, continuous shooting up to 4.5 fps, and Full HD video with manual exposure control, multiple frame rates, and the benefits of a Full-Frame sensor provides stunning performance and creative flexibility. The built-in Wi-Fi transmitter allows you to wirelessly transfer your images to social networking sites through CANON iMAGE GATEWAY, or upload virtually anywhere from your iOS or Android smartphone with the free download of the EOS Remote app.\r\n\r\n	893.00	899.00	2	20.00	Published	f	sku_5gd3d	nikon-coolpix-p1100-cx	2026-04-27 03:27:44.656017-11	1	1
8	Panasonic LUMIX FZ80D	images/Panasonic_Lumix_FZ80D_Digital_Camera_Prosumer_Panasonic_DC-FZ80D_FZ80_D_Kamera_G_NzV9nCy.jfif		387.00	391.00	3	20.00	Published	f	sku_2eeda	panasonic-lumix-fz80d-rn	2026-04-27 03:20:34.677658-11	1	1
13	Canon Ink Cart EOS 7D Camera	images/1_4.jpg	A Whole New Class of EOS. With a host of features designed to enhance every facet of the photographic process, from still images to video, the new EOS 7D represents a whole new class of camera.Made to be the tool of choice for serious photographers and semi-professionals, the EOS 7D features an all-new 18.0 Megapixel APS-C size CMOS sensor and Dual DIGIC 4 Image Processors, capturing tremendous images at up to ISO 12800 and speeds of up to 8 fps. The EOS 7D has a new all cross-type 19-point AF system with improved AI Servo II AF subject tracking and user-selectable AF area selection modes for sharp focus no matter the situation.\r\n\r\nThe EOS 7D s Intelligent Viewfinder, an entirely newly-designed technology, provides approximately 100% coverage and displays user-selected AF modes as well as a spot metering circle and on demand grid lines. New iFCL Metering with 63-zone dual-layer metering system uses both focus and color information to provide accurate exposure even in difficult lighting. The EOS 7D also captures Full HD video at 30p 29.97 fps, 24p 23.976 fps and 25p with an array of manual controls, including manual exposure during movie shooting and ISO speed selection. The EOS 7D features a magnesium alloy body that is dust- and weather-resistant and shutter durability of up to 150,000 cycles. Compatible with over 60 EF and EF-S lenses as well as with EOS System accessories, the creative opportunities - not just with stills but also with video - are beyond amazement.\r\n\r\nThe EOS 7D features a Canon-designed 18.0 Megapixel APS-C size CMOS sensor that captures such a high level of resolution it’s easy to crop images for enlargement without concern of losing detail. A major factor in reducing noise, the CMOS sensor assures that images shot at highest sensitivity will be remarkably smooth. Dual DIGIC 4 Image Processors ensure that images are captured, processed and saved with remarkable speed. The EOS 7D’s ability to capture and process data of images shot at 18.0 Megapixels at 8.0 fps, as well as Face Detection Live Mode, Full HD video recording, Auto Lighting Optimizer and Lens Peripheral optimization are all possible thanks to the Dual DIGIC 4 Image Processors.	499.00	450.00	4	20.00	Published	f	sku_3gbab	canon-ink-cart-eos-7d-camera-j6	2026-04-27 03:40:29.415845-11	1	1
14	Nikon D3300 DSLR Camera	images/1_4_9MI0fdL.jpg	When the action starts, hold down the shutter button to capture every movement, expression and feeling at 5 frames per second—that's 5 beautiful photos for every second of action! You won't believe some of the moments you'll catch thanks to Nikon's new high-speed EXPEED 4 processing engine.\r\n\r\nThe D3300's 11-point Autofocus System locks onto your subjects as soon as they enter the frame and stays with them until you catch the shot you want. Even fast-moving subjects are captured with tack-sharp precision. And when you're recording Full HD video, Full-time Autofocus keeps the focus where you want it.\r\n\r\nThe D3300 doesn't only take great photos, it takes dazzling 1080p Full HD video with sound, too! Record smooth, ultra-sharp HD movies you can play back on your HDTV or upload to video sites. You can even apply those fun special effects for more creativity!\r\n\r\nBrighten shadowy areas\r\nThe D3300's Active D-Lighting preserves the details and tones in both the bright and dark areas of your photos, so shadows are no problem. A new D-Lighting setting in the Retouch menu provides optimal correction for portraits, highlighting your subject against an evenly lit background.\r\n\r\nSucceed in tricky situations\r\nEven if you're new to DSLR photography, getting great results in difficult situations couldn't be easier—just select from 6 common Scene Modes for your situation, or switch to Full Green Auto Mode and let the camera pick for you.\r\n\r\nEasily edit your photos\r\nMake your photos even more impressive with the D3300's Retouch Menu. Easily crop in on your subject, alter the coloring, add special effects and more right in the camera—no additional software needed.\r\n\r\nAdd some style\r\nEasily shoot in Black & White, enhance the intensity of colors, optimize the tones for flattering portraits and more with Picture Controls. Select one of 6 presets or create your own.\r\n\r\nGrow your capabilities\r\nThe D3300 is compatible with Nikon's complete collection of legendary NIKKOR lenses and optimized for AF-S DX-format NIKKOR lenses. Every lens offers a unique view of the world. Have fun growing your own collection.	390.00	390.00	1	20.00	Published	f	sku_3dgda	nikon-d3300-dslr-camera-hm	2026-04-27 03:43:15.722107-11	1	1
17	Sony Alpha A6400 Mirror Less Camera Body	images/1_7.jpg	Sony Alpha a6400 Mirrorless Camera Body Only Stable, fast, versatile, and compact, the Alpha a6400 from Sony is an APS-C-format mirrorless camera that adopts many of the features normally reserved for their full-frame lineup.\r\n\r\nThis includes an autofocus acquisition of 0.02 seconds, Real-time Eye AF and Real-time Tracking capabilities, high-speed shooting up to 11 fps and silent shooting up to 8 fps, both with AF/AE tracking, an upgraded BIONZ X image processing engine, an LCD touchscreen that tilts 180° up and 74° down, UHD 4K movie recording with full pixel readout and no pixel binning, internal recording for time-lapse videos, and more.\r\n\r\nThe Sony Alpha a6400 Mirrorless Camera Body Only is well-suited for both photo and video creators, ranging from professionals to vloggers. Revolving around a 24.2MP Exmor CMOS sensor and BIONZ X image processor, clean image quality is provided with a wide expandable sensitivity range of ISO 100 to 102400, along with accelerated readout speeds for internal 4K24 and Full HD 1080p120 video recording with full pixel readout.\r\n\r\nThe processor further benefits videographers with the inclusion of an S&Q (Slow & Quick) Motion setting that permits capturing Full HD video at a variety of frame rates ranging from 1-120 fps, plus HLG (Hybrid Log-Gamma), which supports HDR workflows, and both S-Log2 and S-Log3 for color grading flexibility. Stills shooters also benefit from the processing speed, which enables continuous shooting at 11 fps for up to 116 JPEGs, 46 raw images, or 44 raw and JPEG frames in a burst, as well as 14-bit raw file output. The sensor and processor combination also avail 4D FOCUS, with a wide-coverage 425-point phase-detection system that covers around 84% of the image area, and a 425-point contrast-detection system, both of which provide quick and precise focusing performance.\r\n\r\nThis focusing system also enables Real-time Eye AF, which delivers improved accuracy, speed, and tracking the performance of Eye AF, so the eyes of your subject are automatically detected. Furthermore, Real-time Tracking uses AI-based object recognition and processes color, subject distance (depth), and pattern (brightness) as spatial information to ensure that all subjects can be captured with accuracy. Increasingly versatile and fully featured in both photo and video realms, the a6400 is a fast and precise imaging tool for multimedia capture.	1089.00	1089.00	5	0.00	Published	f	sku_fg5ac	sony-alpha-a6400-mirror-less-camera-body-jt	2026-04-27 03:58:34.478682-11	1	1
15	Canon Ink Cart The Canon EOS RP	images/1_5.jpg	<p>The Canon EOS RP with an 18-45mm lens is a lightweight, affordable entry into full-frame mirrorless, often bundled as a kit with the compact RF-S 18-45mm f/4.5-6.3 IS STM lens, great for beginners and travel, though the APSC-designed lens (used via adapter) needs image stabilization for full-frame use and offers slower apertures, making it best for general use, vlogging, and showing environment, while the RP itself boasts a 26.2MP sensor and good AF.</p>	800.00	800.00	2	20.00	Published	t	sku_3h221	canon-ink-cart-the-canon-eos-rp-jv	2026-04-27 03:45:13-11	1	1
26	Apple IPhone 16 - 8GB-256GB - 5G - Ultramarine	images/1_16.jpg	BUILT FOR APPLE INTELLIGENCE - Apple Intelligence is the personal intelligence system that helps you write, express yourself, and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data. Coming fall 2024.\r\n\r\nTAKE TOTAL CAMERA CONTROL—Camera Control gives you an easier way to quickly access camera tools, like zoom or depth of field, so you can take the perfect shot in record time.\r\n\r\nGET FURTHER AND CLOSER—The improved Ultra Wide camera with autofocus lets you take incredibly detailed macro photos and videos. Use the 48MP Fusion camera for stunning high-resolution images, and zoom in with the 2x optical-quality Telephoto.\r\n\r\nPHOTOGRAPHIC STYLES—The latest-generation Photographic Styles give you greater creative flexibility, so you can make every photo even more you. And you can reverse any of those styles anytime you want.\r\n\r\nSUPERSMART A18 CHIP—A18 jumps two generations ahead of the A16 Bionic chip in iPhone 15. It enables Apple Intelligence, powers advanced photo and video features, and supports console-level gaming, with exceptional power efficiency.\r\n\r\nLONGER BATTERY LIFE—iPhone 16 works together with the A18 chip to deliver a big boost in battery life with up to 22 hours of video playback. Charge via USB-C or snap on a MagSafe charger for faster wireless charging.\r\n\r\nDESIGNED TO LAST—iPhone 16 has a sturdy, aerospace-grade aluminum design with a 6.1-inch Super Retina XDR display. It’s remarkably durable with the latest-generation Ceramic Shield material that’s 2x tougher than any smartphone glass.\r\n\r\nCUSTOMIZE YOUR IPHONE—With iOS 18 you can tint your Home Screen icons with Different  color. Find your favorite shots faster in the redesigned Photos app. And add playful, animated effects to any word, phrase, or emoji in iMessage.\r\n\r\nSATELLITE CONNECTIVITY—If you don't have cell service or Wi-Fi, iPhone can connect to a satellite so you can send and receive messages and Tapbacks. In a severe car crash, iPhone can connect to emergency services when you can't.\r\n\r\nWhat is Included\r\n\r\niPhone 16\r\n\r\nUSB-C Charge Cable	800.00	800.00	6	20.00	Published	f	sku_515ce	apple-iphone-16-8gb-256gb-5g-ultramarine-le	2026-04-27 04:17:42.963135-11	2	1
24	Samsung Galaxy S20 Ultra - 6.9'' - 12GB RAM 128GB ROM	images/1_2_tpO23Su.jpg	FULL SAMSUNG GALAXY S20 ULTRA 5G MOBILE PHONES SPECIFICATIONSNETWORK  GSM / CDMA / HSPA / EVDO / LTE / 5GLAUNCHAnnounced 2020, February 11Status Available. Released 2020, March 06BODYDimensions 166.9 x 76 x 8.8 mm (6.57 x 2.99 x 0.35 in)Weight 222 g (7.83 oz)Build Glass front (Gorilla Glass 6), glass back (Gorilla Glass 6), aluminum frameSim Single SIM (Nano-SIM and/or eSIM) or Hybrid Single SIM DISPLAYType Dynamic AMOLED 2X, 120Hz, HDR10+, 1400 nits (peak)Size 6.9 inches, 114.0 cm2 (~89.9% screen-to-body ratio)Resolution 1440 x 3200 pixels, 20:9 ratio (~511 ppi density)Protection Corning Gorilla Glass 6 Always-on display120Hz@FHD/60Hz@QHD refresh ratePLATFORMOs Android 10, upgradable to Android 11, One UI 3.0Chipset Exynos 990 (7 nm+) - GlobalQualcomm SM8250 Snapdragon 865 (7 nm+) - USACpu Octa-core (2x2.73 GHz Mongoose M5 & 2x2.50 GHz Cortex-A76 & 4x2.0 GHz Cortex-A55) - GlobalOcta-core (1x2.84 GHz Kryo 585 & 3x2.42 GHz Kryo 585 & 4x1.8 GHz Kryo 585) - USAGpu Mali-G77 MP11 - GlobalAdreno 650 - USAMEMORYCard Slot microSDXC (uses shared SIM slot)Internal 128GB 12GB RAMMAIN CAMERAQuad 108 MP, f/1.8, 26mm (wide), 1/1.33, 0.8u00b5m, PDAF, OIS48 MP, f/3.5, 103mm (periscope telephoto), 1/2.0, 0.8u00b5m, PDAF, OIS, 4x optical zoom, 10x hybrid zoom12 MP, f/2.2, 13mm, 120u02da (ultrawide), 1/2.55 1.4u00b5m, Super Steady video0.3 MP, TOF 3D, f/1.0, (depth)Features LED flash, auto-HDR, panoramaVideo 8K@24fps, 4K@30/60fps, 1080p@30/60/240fps, 720p@960fps, HDR10+, stereo sound rec., gyro-EIS & OISSELFIE CAMERASingle 40 MP, f/2.2, 26mm (wide), 1/2.8, 0.7u00b5m, PDAFFeatures Dual video call, Auto-HDRVideo 4K@30/60fps, 1080p@30fpsSOUNDLoudspeaker Yes, with stereo speakers35mm Jack No 32-bit/384kHz audioTuned by COMMSWlan Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct, hotspotBluetooth 5.0, A2DP, LEGps Yes, with A-GPS, GLONASS, BDS, GALILEONfc YesRadio FM radio (Snapdragon model only; market/operator dependent)Usb USB Type-C 3.2, USB On-The-GoFEATURESSensors Fingerprint (under display, ultrasonic), accelerometer, gyro, proximity, compass, barometer Samsung DeX, Samsung Wireless DeX (desktop experience support)ANT+Bixby natural language commands and dictationSamsung Pay (Visa, MasterCard certified)BATTERYType Li-Ion 5000 mAh, non-removableCharging Fast charging 45WUSB Power Delivery 3.0Fast Qi/PMA wireless charging 15WReverse wireless charging 4.5W\r\n \r\nKEY FEATURESDISPLAY AMOLED 2X, 120Hz, HDR10+, 1400 nits (peak) 6.9 inchesPLATFORM AndroidMEMORY Internal 128GBMAIN CAMERA Triple108 MPSELFIE CAMERA Single 40 MPBATTERY Li-Ion 5000 mAhNetwork: 5G BOX CONTENTS:1* Samsung Galaxy Phone1* USB-C type cable1* Charger Head1* Documentation/User Manual1* Sim Ejector tool\r\n	310.00	310.00	16	9.00	Published	f	sku_43c1b	samsung-galaxy-s20-ultra-69-12gb-ram-128gb-rom-tj	2026-04-27 04:13:19.140063-11	2	1
21	Apple IPhone 11 	images/1_4_TgS0f0r.jpg	Processor Apple A13 Bionic    Rear Camera 12 MP + 12 MP    Front Camera 12 MP    Battery 3110 mAh    Display 6.1 inches \r\n General\r\n     Launch Date September 20, 2019 (Official)    Brand Apple    Model iPhone XI    Operating System iOS v13.0    SIM Slot(s) Dual SIM, GSM+GSM    SIM Size SIM1: Nano    SIM2: eSIM    Network 4G: Available (supports Indian bands)    3G: Available, 2G: Available    Fingerprint Sensor No    Quick Charging yes\r\nDesign\r\n    Height 9 mm Compare Size    Width 7 mm    Thickness 3 mm    Weight 194 grams    Colours Black, Green, Purple, Red, White, Yellow    Waterproof yes Water resistant (up to 30 minutes in a depth of 2 meter), IP68    Ruggedness Dust proof\r\nDisplay\r\n    Screen Size 6.1 inches (15.49 cm)    Screen Resolution 828 x 1792 pixels    Aspect Ratio 5:9    Bezel-less display yes with notch    Pixel Density 324 ppi    Display Type IPS LCD    Screen Protection yes    Touch Screen yes 3D Touch Touchscreen, Multi-touch    Screen to Body Ratio (calculated) 79 %\r\nPerformance\r\n    Chipset Apple A13 Bionic    Processor Hexa Core (2.65 GHz, Dual core, Lightning + 1.8 GHz, Quad core, Thunder)    Architecture 64 bit    Graphics Apple GPU (four-core graphics)    RAM 4 GB\r\n MAIN CAMERA\r\n     Resolution 12 MP + 12 MP Dual Primary Cameras    Sensor Exmor-RS CMOS Sensor    Autofocus yes Phase Detection autofocus    Physical Aperture 8    Optical Image Stabilisation yes    Flash yes Quad LED True Tone Flash    Image Resolution 4000 x 3000 Pixels    Settings Exposure compensation, ISO control    Shooting Modes Continuos Shooting, High Dynamic Range mode (HDR), Burst mode    Camera Features 5 x Digital Zoom, 2 x Optical Zoom, Auto Flash, Face detection, Touch to focus    Video Recording 3840x2160 @ 30 fps, 1920x1080 @ 60 fps\r\n FRONT CAMERA\r\n    Resolution 12 MP Front Camera    Physical Aperture 2    Flash yes Retina Flash    Video Recording 3840x2160 @ 30 fps, 1920x1080 @ 60 fps\r\nBattery\r\n    Capacity 3110 mAh    Type Li-ion    User-Replaceable No    Wireless Charging yes    Quick Charging yes Fast, 50 % in 30 minutes\r\n PACKAGE CONTENTS:\r\n   1* IPhone   1* Charger Head   1* USB Cable   1* User Manual   1* Earpiece	155.00	155.00	39	8.00	Published	f	sku_bf4hb	apple-iphone-11-aq	2026-04-27 04:07:32.104364-11	2	1
20	Apple iPhone 15 Pro Max	images/1_5_aZ1ah0w.jpg	iPhone. Forged in titanium.iPhone 15 Pro Max is the first iPhone to feature an aerospace‑grade titanium design, using the same alloy that spacecraft use for missions to Mars.Titanium has one of the best strength‑to‑weight ratios of any metal, making these our lightest Pro models ever. You’ll notice the difference the moment you pick one up.\r\nA17 Pro chip.A monster win for gaming.It’s here. The biggest redesign in the history of Apple GPUs. A17 Pro is an entirely new class of iPhone that delivers our best graphics performance by far.Mobile games will look and feel so immersive, with incredibly detailed environments and more realistic characters. And with industry-leading speed and efficiency, A17 Pro takes fast and runs with it.\r\n\r\n\r\nA camera that captures your wildest imagination.From dramatic framing flexibility to next-generation portraits, see what you can do with our most powerful iPhone camera system.With iPhone 15 Pro, you have multiple focal lengths to work with. It’s like having seven pro lenses in your pocket, everywhere you go.\r\nGet in on the Action button.The all‑new Action button is a fast track to your favorite feature. Once you set the one you want, just press and hold to launch the action.\r\nGigablast your gigabits.\r\n\r\n \r\n\r\niPhone 15 Pro Max is the first iPhone to support USB 3, for a huge leap in data transfer speeds and faster pro workflows than ever before.\r\nBattery life that’s positively Pro.Even with so many advanced new features, iPhone 15 Pro Max still gives you amazing all‑day battery life.\r\nIn an emergency, iPhone has your back.What matters to you matters to Apple, too. From privacy protections that give you more control over your data. 	799.00	799.00	6	10.00	Published	f	sku_23gdg	apple-iphone-15-pro-max-d8	2026-04-27 04:04:52.151698-11	2	1
19	Apple iPhone 13 Pro 5G	images/1_6_WnZtDsV.jpg	6.7-inch Super Retina XDR display with ProMotion for a faster, more responsive feel.\r\n\r\nCinematic mode adds shallow depth of field and shifts focus automatically in your videos.\r\n\r\nPro camera system with new 12MP Telephoto, Wide, and Ultra Wide cameras; LiDAR Scanner; 6x optical zoom range; macro photography; Photographic. Styles, ProRes video, Smart HDR 4, Night mode, ProRAW, 4K Dolby Vision HDR recording.\r\n\r\n12MP TrueDepth front camera with Night mode, 4K Dolby Vision HDR recording.\r\n\r\nA15 Bionic for lightning-fast performance.\r\n\r\n6GB RAM + 256GB ROM.\r\n\r\n(12MP + 12MP + 12MP).\r\n\r\n5G	599.00	599.00	22	9.00	Published	f	sku_5e4cg	apple-iphone-13-pro-5g-bv	2026-04-27 04:03:27.354466-11	2	1
46	Razer Opus ANC Wireless Headphones	images/1_22.jpg	THX Certified Headphones for High-Fidelity Sound: Tested and optimized by experts in cinematic audio immersion at THX Ltd. , Opus presents a rich, balanced sound stage for all different types of media\r\nAdvanced Active Noise Cancellation (ANC) Technology: Whether you’re watching a movie or rocking out to your favorite track, shut out all distractions with advanced ANC tech which detects and nullifies incoming noise\r\nEngineered for Long Hours of Wear: With plush leatherette memory foam ear cushions, a well-balanced weight and snug clamping force, keep the headphones on throughout long commutes and remain in comfort\r\nStay Aware of Your Surroundings: Press and hold the ANC button to instantly amplify ambient noise for a heightened sense of awareness\r\nAuto Pause/Auto Play: Removing or resting these earphones around your neck pauses the audio; to resume, simply pop your headset back on and get right back into your movie or music\r\nPortable Design with 3. 5mm Jack Option: Able to work with most devices, the foldable headset comes with an airplane adapter and premium carry case	118.00	120.00	20	20.00	Published	f	sku_5agga	razer-opus-anc-wireless-headphones-lm	2026-04-28 10:00:49.63903-11	4	1
27	Apple IPhone 17- 8GB-256GB - Sage -5G	images/1_17.jpg	<p>iPhone 17. More delightful. More durable. 6.3-inch ProMotion display, Ceramic Shield 2, all 48MP rear cameras, Center Stage front camera, A19 chip, and more. DESIGNED TO DELIGHT. BUILT TO LAST.—iPhone 17 comes in five gorgeous colors, with a brighter 6.3-inch display¹, and a Ceramic Shield 2 front that’s 3x more scratch resistant. 6.3-INCH DISPLAY WITH PROMOTION. BRIGHTER. BRILLIANT.—Smooth scrolling with ProMotion up to 120Hz, better outdoor contrast with 3000 nits peak brightness, and 33% fewer reflections. STUNNING SHOTS—Capture super-high-resolution shots by default with the advanced 48MP Dual Fusion camera system, 2x optical-quality zoom, and 48MP Fusion Ultra Wide camera. 18MP CENTER STAGE FRONT CAMERA—Flexible ways to frame your shot. Smarter group selfies, Dual Capture video for simultaneous front and rear recording, and more. A19 CHIP. POWER PLAYER. ENERGY EXPERT.—With a 5-core GPU, the enhanced neural engine helps power everything you do on iPhone—from Apple Intelligence to AAA games. CHARGES FAST. MAKES IT LAST.—All-day battery life with up to 30 hours of video playback. Charge up to 50% in 20 minutes. iOS 26. NEW LOOK. EVEN MORE MAGIC.—A fresh design with Liquid Glass. Beautiful, delightful, and instantly familiar. With a more vibrant Lock Screen, customizable backgrounds, and polls in Messages, Call Screening, and more. BUILT FOR APPLE INTELLIGENCE—Personal, private, powerful. Write, express yourself, and get things done effortlessly. SATELLITE FEATURES—If you don’t have cell service or Wi-Fi, iPhone can connect to a satellite so you can send and receive messages and Tapbacks. In a severe car crash, an iPhone can connect to emergency services when you can’t. STRONGER CONNECTIVITY. SUPERFAST SPEEDS.—Stay connected at faster speeds with secure connections to Wi-Fi 7, 5G networks, and Bluetooth 6, plus eSIM. Physical SIM+eSIM, FLEXIBLE. SECURE. SEAMLESS.— With Physical SIM+eSIM, you enjoy greater flexibility, enhanced convenience, increased security, and seamless connectivity, especially when traveling internationally. PRIVACY—A whole new level of privacy and security. Built in. What's Included iPhone 17, USB-C Charge Cable</p>	1200.00	1200.00	7	30.00	Published	t	sku_22f3d	apple-iphone-17-8gb-256gb-sage-5g-yc	2026-04-27 04:19:23-11	2	1
25	Apple IPhone 17 Pro - 12GB- 256GB - Cosmic Orange	images/1_15.jpg	<p>iPhone 17 Pro . The most powerful iPhone ever. Brilliant 6.3-inch display, aluminum unibody design, A19 Pro chip, all 48MP rear cameras, and best-ever battery life. UNIBODY DESIGN. FOR EXCEPTIONAL POWER.—Heat-forged aluminum unibody design for the most powerful iPhone ever made. DURABLE CERAMIC SHIELD. FRONT AND BACK.—Ceramic Shield protects the back of iPhone 17 Pro Max, making it 4x more resistant to cracks. And the new Ceramic Shield 2 on the front has 3x better scratch resistance. THE ULTIMATE PRO CAMERA SYSTEM—With all 48MP rear cameras and 8x optical-quality zoom—the widest zoom range ever in an iPhone. It’s the equivalent of 8 pro lenses in your pocket. 18MP CENTER STAGE FRONT CAMERA— Flexible ways to frame your shot. Smarter group selfies, Dual Capture video for simultaneous front and rear recording, and more. A19 PRO CHIP. VAPOR COOLED. LIGHTNING FAST.—A19 Pro is the most powerful iPhone chip yet, delivering up to 40 percent better sustained performance. BEST BATTERY LIFE IN AN IPHONE EVER—The unibody design creates massive additional battery capacity, for up to 39 hours of video playback; Charge up to 50% in 20 minutes. iOS 26. NEW LOOK. EVEN MORE MAGIC.—A fresh design with Liquid Glass. Beautiful, delightful, and instantly familiar. With a more vibrant Lock Screen, customizable backgrounds, and polls in Messages, Call Screening, and more. BUILT FOR APPLE INTELLIGENCE—Personal, private, powerful. Write, express yourself, and get things done effortlessly. SATELLITE FEATURES—If you don’t have cell service or Wi-Fi, iPhone can connect to a satellite so you can send and receive messages and Tapbacks. In a severe car crash, an iPhone can connect to emergency services when you can’t. STRONGER CONNECTIVITY. SUPERFAST SPEEDS.—Stay connected at faster speeds with secure connections to Wi-Fi 7, 5G networks, and Bluetooth 6, plus eSIM. Physical SIM+eSIM, FLEXIBLE. SECURE. SEAMLESS.—iPhone 17 Pro Max activates with both a Physical SIM and eSIM. With Physical SIM and eSIM, you enjoy greater flexibility, enhanced convenience, increased security, and seamless connectivity, especially when traveling internationally. PRIVACY— A whole new level of privacy and security. Built in. What's Included iPhone 17 Pro Max, USB-C Charge Cable</p>	1099.00	1100.00	3	35.00	Published	t	sku_5g24g	apple-iphone-17-pro-12gb-256gb-cosmic-orange-nf	2026-04-27 04:14:59-11	2	1
29	Google Pixel Pixel 9 Pro 	images/1_1_QgWsn9G.jpg	The Google Pixel 9 Pro delivers a premium smartphone experience powered by the advanced Google Tensor G4 chip, built to handle powerful AI features like Gemini. With your built-in AI assistant, you can easily write, plan, learn, and get things done faster, all from your phone.\r\n\r\nEnjoy fast and smooth performance with 16GB RAM, making multitasking, gaming, and everyday use effortless. The 6.3-inch Super Actua OLED display is bright and immersive, showing true-to-life colours even in sunlight, with a 120Hz refresh rate for ultra-smooth scrolling.\r\n\r\nCapture professional-quality photos and videos with the powerful triple rear camera system. With up to 30x Super Res Zoom and advanced Night Sight Video, you can take sharp, detailed shots and videos even in low light or from far distances. Pro camera controls also give you the freedom to adjust settings like a professional.\r\n\r\nThe Pixel 9 Pro also introduces enhanced video zoom, allowing smooth, high-quality video recording up to 20x zoom. Its long-lasting battery provides over 24 hours of use, and up to 100 hours with Extreme Battery Saver, plus fast charging to keep you going.\r\n\r\nBuilt for durability, the device is resistant to everyday drops, spills, and dust, with a tough display made from Corning Gorilla Glass Victus.\r\n\r\nAdditional smart features like Call Screen help filter out spam calls, while regular Pixel updates (Pixel Drops) bring new features and improvements over time—so your phone keeps getting better.	600.00	600.00	7	29.00	Published	f	sku_2gdhg	google-pixel-pixel-9-pro-fold-5g-pp	2026-04-27 04:23:49.544459-11	2	1
33	Dango Buds Bluetooth TW991 EAR BUDS	images/1_9_PsvTEVB.jpg	Features:\r\n\r\nMini in-ear wireless invisible design;\r\n\r\nSuper Mini Size and hidden in the ear, no wearing burden;\r\n\r\nErgonomic earphone design, stable in the ear, good for driving, sports, business, or leisure;\r\n\r\nBluetooth Connection\r\n\r\nDeep DPS noise-reduction microphone ensures clear call quality;\r\n\r\nBest quality\r\n\r\nVoice prompt for pairing, calling, turn on/off;\r\n\r\nOne function button for on/off, song switch, language change, receive call.\r\n\r\nPACKAGE\r\n\r\n2x Mini Earphones (Left and Right Ear-buds)                            \r\n1x Charging box                            \r\n1x User Manual                            \r\n1*Micro-USB Cable	68.00	75.00	44	10.00	Published	f	sku_abee2	dango-buds-bluetooth-tw991-ear-buds-nd	2026-04-28 06:02:53.181717-11	3	1
32	AirPods Pro (2nd Generation) Wireless Ear Buds	images/1_8_5vrVWJ2.jpg	RICHER AUDIO EXPERIENCE — The Apple-designed H2 chip helps to create more intelligent noise cancellation and deeply immersive sound. The low-distortion, custom-built driver delivers crisp, clear high notes and full, rich bass in stunning definition.\r\nNEXT-LEVEL ACTIVE NOISE CANCELLATION — Up to 2x more Active Noise Cancellation for dramatically less noise when you want to focus. Transparency mode lets you hear the world around you, and Adaptive Audio seamlessly blends Active Noise Cancellation and Transparency mode for the best listening experience in any environment.\r\nCUSTOMIZABLE FIT — Includes four pairs of silicone tips (XS, S, M, L) to fit a wide range of ears and provide all-day comfort. The tips create an acoustic seal to help keep out noise and secure AirPods Pro in place.	245.00	255.00	18	60.00	Published	f	sku_4f4b3	airpods-pro-2nd-generation-wireless-ear-buds-eh	2026-04-28 05:58:57.320458-11	3	1
36	Oraimo FREEPODS Wireless Headphones 	images/1_12_zIS4gBr.jpg	Note:\r\nThe products are corresponding to the prices. The store focuses on entry-level digital products with high cost performance, and the product quality will not shortchange any customer.\r\nAfter taking the live products, please charge the batteries for more than 30 minutes at the first time to activate the batteries. In order to ensure transportation safety, the products in the store will be discharged before being shipped out.\r\nFor TWS Bluetooth headset products, please remove the protective film of charging point on the Earbuds before use, otherwise it cannot be charged.\r\nIn case of failure to charge, please first check whether the charging point is blocked by foreign matter or rusted.\r\nPlease contact customer service for any questions.\r\nMore models and color matching are available in the store\r\nFeature:\r\nBluetooth version: V5.0\r\nMaterial: ABS+PCABS+ electroplating + food silicone ear cap\r\nEffective straight line distance: over 10 m\r\nHorn: copper ring 8mm\r\nBattery: Headset 55mah, charging pod 300AM\r\nPlayback time: 3-4h\r\nStandby time: 120H\r\nFull charge time: about 0.5 hour	15.00	15.00	72	5.00	Published	f	sku_343ab	oraimo-freepods-wireless-headphones-ke	2026-04-28 06:17:23.350654-11	3	1
37	HomeCove Wireless Earbuds	images/1_13_CsHhMjS.jpg	• 13mm Large Driver – Enjoy immersive, concert-hall-grade sound\r\n\r\n \r\n\r\n• Low-Latency Gaming Mode – Upgraded performance with no lag\r\n\r\n \r\n\r\n• Ergonomic Fit – Open-ear style with extended design to reduce sound leakage\r\n\r\n \r\n\r\n• Lightweight Design – Invisible comfort for all-day wear\r\n\r\n \r\n\r\n• Long Battery Life – 5 hours on a single charge, 35 hours with case\r\n\r\n \r\n\r\n• Universal Compatibility – Works seamlessly with Android & iOS	29.00	30.00	16	2.00	Published	f	sku_eaa3a	homecove-wireless-earbuds-gm	2026-04-28 06:21:12.028713-11	3	1
34	Realme HAVIT OWS928 Bluetooth Earbuds	images/1_11_d3fKh2T.jpg	Product details:\r\ntyle:In-ear\r\nCertification:Ce\r\nVocalism Principle:Balanced Armature\r\nOrigin:Cn(origin)\r\nControl Button:Yes\r\nActive Noise-cancellation:Yes\r\nCommunication:Wireless\r\nVolume Control:Yes\r\nWireless Type:Bluetooth\r\nIs Wireless:Yes\r\nFunction:For Video Game\r\nFunction:Hifi Headphone\r\nSupport Memory Card:No\r\nCharging Method:Cable\r\nBluetooth Version::V5.2\r\nSupport:Dropship/wholesale\r\nCommunication Distance:10m\r\nSingle Ear Capacity:50mah\r\nMusic Time:About 35h (with Charging Cabin)\r\nStandby Time:About 55h (used With Charging Cabin)\r\nEarphone Size:22 * 15mm (manual Measurement Error, For Reference Only)	43.00	48.00	28	10.00	Published	t	sku_24b42	new-airpods-pro-3-anc-7p	2026-04-28 06:06:34.663861-11	3	1
39	Samsung Galaxy Buds 4 Pro	images/1_14_hAHbXLc.jpg	EXCEPTIONAL AUDIO: Catch details like never before. Designed with a High-Res Audio¹ 24-bit hi-fi codec, the latest Galaxy earbuds maintain the integrity of your favorite audio over Bluetooth.\r\nTWO-WAY SPEAKER: Enjoy every audio experience to the fullest with two speakers in both Buds, including a tweeter for rich highs and a woofer for deep, full lows.\r\nHD VOICE: Enjoy clear phone calls with Galaxy Buds4 Pro and Galaxy S26 Series² —they work together to deliver crisp and clear conversations.\r\nANC 2.0: Wherever you go, Adaptive Active Noise Cancellation 2.0³ intelligently adapts in real time to provide stronger, smoother noise cancellation wherever you go.\r\nOPTIMIZED COMFORT: Enjoy that just-right fit, with an improved, ear-hugging design and changeable ear tips.\r\nAI ASSISTANT IN YOUR EAR: Galaxy Buds4 Pro work seamlessly with Galaxy S26 Series to give you AI⁴ help, completely hands-free. Get quick answers and real-time translations delivered straight to your ears —all you have to do is ask.\r\nMADE FOR EVERY MOMENT, RAIN OR SHINE: Peace of mind comes standard with Samsung wireless Galaxy Buds4 Pro, thanks to a water-and dust-resistant design⁵ and an IP57 rating that’s built for life on the go.\r\nLIVE TRANSLATION: Break language barriers wherever you happen to roam with Live Translate¹ on Galaxy Buds4 Pro.⁴\r\nINTUITIVE TOUCH CONTROL: Effortlessly control your Galaxy Buds4 Pro with Intuitive Touch Control. Answer calls, adjust volume, access other features and more on your Buds with simple gestures like a pinch or swipe.	209.00	211.00	7	30.00	Published	f	sku_5cbff	samsung-galaxy-buds-4-pro-8a	2026-04-28 09:46:00.835503-11	3	1
40	Anker SoundCore Space A40	images/1_16_EmLnUW9.jpg	Reduce Noise By Up to 98%: Space A40 has an upgraded noise cancelling system to block out a wider range of distracting noises. So wherever you go, you'll always have the space you need to focus.\r\n\r\nAutomatically Tailored Noise Cancelling: Space A40 detects external noises and automatically selects a suitable level of noise cancelling for your surroundings. Enjoy your personal space whether you're indoors, outdoors, commuting, or on a flight.\r\n\r\n50 Hours of Personal Space: That's enough playtime to enjoy up to 1,000 songs or 25 movies. The earbuds have a 10-hour single charge playtime, and fast charging gives you 4 hours of listening from a quick 10-minute charge.\r\n\r\nHighly Detailed Sound: Thanks to soundcore's pioneering double-layer diaphragm drivers, Space A40 noise cancelling earbuds produce sound with strong bass, clear mids, and bright treble. You can also listen using LDAC mode for Hi-Res Audio Wireless sound.\r\n\r\nComfortable, No Matter How Long You Listen: Space A40 noise cancelling wireless earbuds are smaller than all other soundcore ANC earbuds, are as light as a sheet of paper, and have an ergonomic shape so they fit comfortably in your ears.	118.00	120.00	10	20.00	Published	f	sku_4ca1d	anker-soundcore-space-a40-ep	2026-04-28 09:47:40.065756-11	3	1
41	Anker Soundcore Liberty 4	images/1_17_eBrVnjd.jpg	Crisp, clear sound via ACAA™️ 3.0 Coaxial Acoustic System360° immersive spatial audio with music and movie modesCloudComfort™️ ear tips for long-lasting comfortAll-new heart rate sensor with soundcore appHearID personalized active noise cancelling9/28 hours of playtime for all-day listening	112.00	112.00	5	20.00	Published	f	sku_baedb	anker-soundcore-liberty-4-bz	2026-04-28 09:48:51.223197-11	3	1
42	Beats By Dre Fit Pro	images/1_18_sa2DvIE.jpg	Flexible, secure-fit wingtips for all-day comfort and stability\r\nCustom acoustic platform delivers powerful, balanced sound\r\nSpatial Audio with dynamic head tracking for immersive music, movies, and games\r\nTwo distinct listening modes: Active Noise Cancelling and Transparency Mode\r\nEnhanced by the Apple H1 chip for Automatic Switching, Audio Sharing (with another pair of Beats headphones or Apple AirPods), and “Hey Siri”\r\nSweat and water resistant (IPX4-rated) earbuds\r\nUp to 6 hours of listening time (up to 24 hours combined with pocket-sized charging case)\r\nHigh-quality call performance and voice assistant interaction via built-in microphones\r\nIndustry-leading Class 1 Bluetooth for extended range and fewer dropouts	199.00	199.00	16	20.00	Published	f	sku_4dcg3	beats-by-dre-fit-pro-et	2026-04-28 09:51:18.810846-11	3	1
44	Beats By Dre Powerbeats Pro 2(Black)	images/1_20.jpg	Powerbeats Pro 2 features incredibly big sound and is packed into the tiniest case we’ve ever made. Designed for music first, their cleanly balanced tuning gives you the full range and emotion of all your favorite music, with richly detailed clarity and power plus accurate bass reproduction. These tiny buds have all-day battery life with up to 18 hours of playback. They can charge directly from your phone, tablet or laptop for extra power on the go. They are ready to pair with your Apple or Android device right out of the box for seamless one-touch pairing, automatic pre-pairing across your devices, and Find My or Find My Device for everybody.\r\n\r\nPowerbeats Pro 2 has secure-fit earhooks that stay locked in as you train. With over 1,500 hours of athlete testing to help ensure a secure, comfortable fit for any ear shape and intensity level.\r\n\r\nFor absolute workout focus, we added high-performing Active Noise Cancelling (ANC), plus Transparency mode to let you hear the world around you, ensuring a great listening experience wherever you train. \r\n\r\nHeart Rate Monitoring sensors pulse over 100 times per second to measure your pulse in real time.  And Powerbeats Pro 2 is sweat and water resistant with an IPX4 rating, so they’re tough enough to handle training in rain, snow and heat. \r\n\r\nPowered by the Apple H2 chip for extraordinary efficiency, Powerbeats Pro 2 delivers up to 45 hours of battery life with the charging case.  The case is 33% smaller than its predecessor and is our first ever to feature wireless Qi charging.\r\n\r\nCompatible with Apple (one-touch pairing, automatic switching, Audio Sharing, hands-free Siri, Find My) and Android (the Beats App unlocks one-touch pairing, Heart Rate Monitoring, customizable controls, battery status widgets, and Locate My Beats).\r\n\r\nAdaptive EQ uses advanced microphones to measure what you’re hearing, then adjusts the frequencies of your music to you. Personalized Spatial Audio with dynamic head tracking delivers immersive sound with clear highs, rich mid-range tones, and powerful bass.\r\n\r\nTake calls, FaceTime with Spatial Audio, and activate Siri with Class 1 Bluetooth® connectivity. Each earbud has advanced microphones that have been updated to ensure exceptional call quality.\r\n\r\nThe earbuds' on-ear buttons, tactile volume rockers, and voice-activated controls make it easier to focus on training without disrupting your flow.\r\n\r\nThe earhook has been reinforced with a nickel titanium alloy for phenomenal flexibility, grip, and comfort, making the next-generation Powerbeats Pro 2 20% lighter than its predecessor. Five ear tip sizes are included for personalized comfort.\r\n\r\nWhat's Included\r\n\r\nPowerbeats Pro 2 true wireless earbuds\r\n\r\nCharging case\r\n\r\nQuick Start Guide\r\n\r\nWarranty card	309.00	309.00	2	20.00	Published	f	sku_c353f	beats-by-dre-powerbeats-pro-2black-dg	2026-04-28 09:54:51.882347-11	3	1
43	Beats By Dre Powerbeats Pro 2	images/1_19_3m94yXd.jpg		309.00	309.00	6	20.00	Published	t	sku_4e2h5	beats-by-dre-powerbeats-pro-2-cy	2026-04-28 09:53:40-11	3	1
45	Jbl Live 670NC Wireless On-Ear Headphones	images/1_21.jpg	JBL Signature and Surround Sound\r\nJBL Live 670NC headphones deliver powerful JBL Signature Sound in a comfortable on-ear headband style.\r\n\r\nTrue Adaptive Noise Cancelling with Smart Ambient technology keeps you free from distractions. You’ll enjoy 65 hours (50 hours with BT+ANC on) of music streaming. A 5-minute speed charge gets you another four hours. The JBL Live 670NC can connect with two Bluetooth devices simultaneously, so you’ll never have to miss a call, even if you’re watching a movie on your tablet.	85.00	89.00	10	10.00	Published	t	sku_c5352	jbl-live-670nc-wireless-on-ear-headphones-kv	2026-04-28 09:58:37.810907-11	4	1
47	Logitech G435 LIGHTSPEED Gaming Headset	images/1_24.jpg	Versatile: Logitech G435 is the first headset with LIGHTSPEED wireless and low latency Bluetooth connectivity, providing more freedom of play on PC, Mac, smartphones, PlayStation and Nintendo Switch gaming devices\r\nLightweight: With a lightweight construction, this wireless gaming headset weighs only 5.8 oz (165 g), making it comfortable to wear all day long\r\nSuperior voice quality: Be heard loud and clear thanks to the built-in dual beamforming microphones that eliminate the need for a mic arm and reduce background noise\r\nImmersive sound: This cool and colorful headset delivers carefully balanced, high-fidelity audio with 40 mm drivers; compatibility with Dolby Atmos, Tempest 3D AudioTech and Windows Sonic for a true surround sound experience\r\nLong battery life: No need to stop the game to recharge thanks to G435's 18 hours of battery life, allowing you to keep playing, talking to friends, and listening to music all day\r\nTotal comfort: G435 small gaming headset fits a wide range of people but is designed for younger players with memory foam ear cushions and sizing for smaller head sizes\r\nPlastic parts in G435 include 22% certified post consumer recycled plastic*. Uses FSC-certified paper for responsible packaging.\r\nSafer: An optional max volume limiter at less than 85 decibel can be activated to protect eardrums during extended use	99.00	99.00	25	20.00	Published	f	sku_5dff2	logitech-g435-lightspeed-gaming-headset-tp	2026-04-28 10:03:08.680596-11	4	1
48	Jbl Tune 530BT Wireless On-Ear Headphones	images/1_25.jpg	Pairing on Android or Windows 10/11 couldn’t be easier. Just power on your JBL Tune 530BT headphones and follow the prompt. No menus, no delays—just seamless listening.\r\n\r\n.\r\nUp to 76 hours of battery life\r\nWith up to 76 hours of battery life, your JBL Tune 530BT headphones will outlast your longest playlist. Need a boost? A 5-minute speed charge gives you another 5 hours of playtime. And when it’s time for a full recharge, you’ll be back to 100% in about two hours\r\n\r\n.\r\nJBL Pure Bass Sound\r\nJBL Pure Bass Sound adds depth, power, and punch to everything you hear. Custom 33mm drivers deliver rich, dynamic audio— whether you’re gearing up for the day, kicking back, or getting lost in the music.\r\n\r\n.\r\nMulti-point connection with Bluetooth 6.0\r\nPair your headphones with two Bluetooth devices and then switch effortlessly from one to the other. Stream a movie from your tablet in the airport lounge and still hear boarding updates from your phone. Thanks to Bluetooth 6.0 enjoy high-quality streaming with lower power use and reduced latency\r\n\r\n2 beamforming mics for perfect calls\r\nTwo beamforming mics on each earcup precisely capture your speech and reduce background noise. So whether you’re on a teleconference in a busy café or catching up with a friend during your commute, your voice comes through loud and clear.\r\n\r\n.\r\nPure bass, wireless.\r\n.\r\nCustomize your sound with the JBL Headphones App\r\nMake the sound your own with EQ presets. Default for balanced listening, Bass for extra low-end punch, or Vocal to bring voices to the front. Built-in voice prompts confirm your selections, so you always know exactly what mode you’re in.\r\n\r\n.\r\nLightweight, comfortable, and foldable\r\nLightweight, comfortable, and foldable Stay comfortable no matter how long you listen, thanks to the soft on-ear cups and lightweight padded headband. And when it’s time to move on, your JBL Tune 530BT fold flat, so they fit effortlessly into your everyday carry	128.00	130.00	6	20.00	Published	f	sku_42b1h	jbl-tune-530bt-wireless-on-ear-headphones-gi	2026-04-28 10:07:01.315071-11	4	1
49	Sony WH-CH520 Wireless Headphones 	images/1_26.jpg	LONG BATTERY LIFE: With up to 50-hour battery life and quick charging, you’ll have enough power for multi-day road trips and long festival weekends. (USB Type-C Cable included)\r\nHIGH QUALITY SOUND: Great sound quality customizable to your music preference with EQ Custom on the Sony - Headphones Connect App.\r\nLIGHT & COMFORTABLE: The lightweight build and swivel earcups gently slip on and off, while the adjustable headband, cushion and soft ear pads give you all-day comfort.\r\nCRYSTAL CLEAR CALLS: A built-in microphone provides you with hands-free calling. No need to even take your phone from your pocket.\r\nMULTIPOINT CONNECTION: Quickly switch between two devices at once.\r\nAVAILABLE IN FOUR COLORS: With Black, Blue, White, and Cappuccino to choose from, find the color that suits you best.\r\nGIVE YOUR MUSIC A BOOST: Boost the quality of compressed music files and enjoy streaming music with high quality sound through DSEE.\r\nFIND YOUR HEADPHONES WITH FAST PAIR: Easily find your missing headphones by sound or check their last known location in Google’s Find My Device app on your smartphone.\r\nEASY CONNECTION TO YOUR PC: Swift Pair makes it quick and easy to pair your headphones with your Windows 10 computer via Bluetooth.	150.00	155.00	20	20.00	Published	f	sku_g4e41	sony-wh-ch520-wireless-headphones-jh	2026-04-28 10:10:51.741592-11	4	1
50	Sony WH-CH520 Wireless Headphones(Blue)	images/1_27.jpg	Stay powered up for days\r\n\r\nA listening experience just for you\r\n\r\nCrystal clear calls\r\n\r\nDesigned for all-day comfort\r\n\r\nWith up to 50 hours of battery life, you can listen to your favorite music without worrying about running out of charge. And, if your headphones battery is running low, a 3-minute quick-charge can give you 1.5 hours of listening time.\r\n\r\nDigital Sound Enhancement Engine (DSEE) restores the harmonics and liveliness lost during typical music compression, for a more authentic performance. You can even tailor music to your own taste with EQ settings on the Sony - Headphones Connect app, for a personalized listening experience.\r\n\r\nA built-in microphone provides you with hands-free calling, and it also works just as well for joining an online class or work meeting.1\r\n\r\nNot only is the design stylish, but it’s also crafted with ease-of-use in mind. The lightweight build and swivel earcups gently slip on and off, while the adjustable headband, cushion and soft ear pads give you all-day comfort.	150.00	155.00	10	20.00	Published	f	sku_5ff35	sony-wh-ch520-wireless-headphonesblue-ey	2026-04-28 10:13:47.191798-11	4	1
51	Sony WH-CH520 WIRELESS HEADPHONE (White)	images/1_28.jpg	Stay powered up for days\r\n\r\nA listening experience just for you\r\n\r\nCrystal clear calls\r\n\r\nDesigned for all-day comfort\r\n\r\nWith up to 50 hours of battery life, you can listen to your favorite music without worrying about running out of charge. And, if your headphones battery is running low, a 3-minute quick-charge can give you 1.5 hours of listening time.\r\n\r\nDigital Sound Enhancement Engine (DSEE) restores the harmonics and liveliness lost during typical music compression, for a more authentic performance. You can even tailor music to your own taste with EQ settings on the Sony - Headphones Connect app, for a personalized listening experience.\r\n\r\nA built-in microphone provides you with hands-free calling, and it also works just as well for joining an online class or work meeting.1\r\n\r\nNot only is the design stylish, but it’s also crafted with ease-of-use in mind. The lightweight build and swivel earcups gently slip on and off, while the adjustable headband, cushion and soft ear pads give you all-day comfort.	150.00	159.00	10	20.00	Published	f	sku_abbd4	sony-wh-ch520-wireless-headphone-white-cu	2026-04-28 10:15:04.721871-11	4	1
62	SP GHOST OF YOTEI PLAYSTATION 5	images/1_39.jpg	<p>Embark on a journey at the edge of Japan. Discover a bold, new story of a warrior in Japan who is on a mission of vengeance all her own. Set 300 years after the critically acclaimed Ghost of Tsushima, Ghost of Yōtei is a standalone experience set in 1600s rural Japan. The story follows a haunted, lone mercenary named Atsu. Thirsty for revenge, she travels through the beautiful, rugged landscapes of northern Japan, hunting those who killed her family many years earlier. Sixteen years after her family’s death, Atsu's quest across Ezo brings her to unexplored lands in search of a gang of six outlaws, but she finds much more than vengeance. Throughout her journey, Atsu will discover unlikely allies, and greater bonds than she could have imagined.</p>	60.00	60.00	20	10.00	Published	t	sku_gdc21	sp-ghost-of-yotei-playstation-5-an	2026-04-28 10:51:49-11	5	1
52	Sony WH 1000XM5 Wireless Headsets	images/2_1_I8itNZA.jpg	Sony WH-1000XM5 Wireless White Industry Leading Noise Canceling Headphones with Auto Noise Canceling Optimizer, Crystal Clear Hands-Free Calling, and Voice Control. The WH-1000XM5 headphones rewrite the rules for distraction-free listening. Two processors control 8 microphones for unprecedented noise canceling and exceptional call quality.\r\nEnjoy your music without any noise disturbance with these Sony WH-1000XM5 wireless noise cancelling headphones in silver. These headphones have a built-in microphone and use Bluetooth technology for easy connectivity. The ear-cup design provides comfort for long listening sessions, and the ambient sound mode allows you to customize your listening experience.\r\nWith double earpieces, these headphones have a form factor of a headband and are perfect for those who prefer over-the-ear headphones. The Sony WH-1000XM5 model has noise cancellation features, making it perfect for commuters and travelers alike. These headphones are perfect for anyone who loves to listen to music or take calls on the go.\r\nKey Features:30mm Dynamic Drivers8-Microphone Active Noise Cancellation4 x Beamforming Mics for Clear CallsUp to 30 Hours of Playback with ANC OnLDAC Support for Hi-Res Audio Leave Them On & Talk with Speak-to-ChatWear Detection for Instant Pause & PlayMultipoint Seamless Device Switching Lightweight & Comfortable Design Swift Pair & Google Fast Pair	200.00	210.00	2	10.00	Published	f	sku_3egd2	sony-wh-1000xm5-wireless-headsets-27	2026-04-28 10:17:42.802052-11	4	1
28	Google Pixel Pixel 10 Pro XL 5G	images/1_18_iJfY8lD.jpg	Meet Pixel 10 Pro XL, the new standard for pro phones. Advanced AI with Gemini, unbelievable camera quality, impeccable design, and the next-gen Google Tensor G5 chip The Google Pixel 10 Pro XL is a smartphone with an octa-core processor, 6.3-inch screen, and 16GB RAM and 256GB storage capacity with Two Esims Only (No Physical Sim). It runs on the Android operating system and features a Google Tensor G5 chipset for enhanced performance. With a sleek color and 50MP camera resolution, this device offers a range of connectivity options including USB Type-C, Bluetooth, Wi-Fi, NFC, and GPS. The Google Pixel 10 is a top-of-the-line smartphone designed for high-speed performance and exceptional photography capabilities. The Google Pixel 10 Pro XL has Pixel’s most powerful chip, an incredible camera, and Gemini built in to supercharge your productivity and creativity.\r\n\r\n	999.00	999.00	2	9.00	Published	f	sku_5e3a2	google-pixel-pixel-10-pro-xl-5g-yy	2026-04-27 04:21:46.954447-11	2	1
53	Bose QuietComfort Headphones	images/1_29_w8EPvNQ.jpg	Get next-level sound with the QuietComfort Ultra wireless headphones. Featuring innovative spatial audio, these headphones take what you are hearing inside your head and place it in front of you for more natural, real sounding music.\r\n\r\n\r\n \r\n\r\nUp to 24 hours of battery life will keep your music playing through even the longest listening sessions (or up to 18 hours with Immersive Audio). Plus, a quick 15 minute charge gets you up to 2.5 hours of play time (up to 2 hours with Immersive Audio)\r\n\r\n\r\n \r\n\r\nDo what you do uninterrupted, with Quiet Mode you get full noise cancellation to focus, while Aware Mode allows you to hear your surroundings. Immersion Mode combines full noise cancellation and Immersive Audio.\r\n\r\n\r\n \r\n\r\nGet a strong, continuous connection within 30 feet of your device with wireless Bluetooth headphones. Choose single or multi point to keep your phone, tablet, and work or school computer paired or just focus on one.\r\n\r\n\r\n \r\n\r\nWith CustomTune technology, the QuietComfort Ultra Headphones adapt the sound performance to your ears by analyzing their unique shape. You get sound that fits you, doesnt that sound better.\r\n\r\n\r\n \r\n\r\nModern, sleek, sophisticated. The cushions wrap your ears in a soft hug. The headband spreads pressure evenly. And sleek metal arms add a statement of sophisticated design.	299.00	299.00	10	20.00	Published	f	sku_ca35f	bose-quietcomfort-headphones-la	2026-04-28 10:31:26.219996-11	4	1
54	Bose QuietComfort Headphones(Pink)	images/1_30.jpg	Get next-level sound with the QuietComfort Ultra wireless headphones. Featuring innovative spatial audio, these headphones take what you are hearing inside your head and place it in front of you for more natural, real sounding music.\r\n\r\n\r\n \r\n\r\nUp to 24 hours of battery life will keep your music playing through even the longest listening sessions (or up to 18 hours with Immersive Audio). Plus, a quick 15 minute charge gets you up to 2.5 hours of play time (up to 2 hours with Immersive Audio)\r\n\r\n\r\n \r\n\r\nDo what you do uninterrupted, with Quiet Mode you get full noise cancellation to focus, while Aware Mode allows you to hear your surroundings. Immersion Mode combines full noise cancellation and Immersive Audio.\r\n\r\n\r\n \r\n\r\nGet a strong, continuous connection within 30 feet of your device with wireless Bluetooth headphones. Choose single or multi point to keep your phone, tablet, and work or school computer paired or just focus on one.\r\n\r\n\r\n \r\n\r\nWith CustomTune technology, the QuietComfort Ultra Headphones adapt the sound performance to your ears by analyzing their unique shape. You get sound that fits you, doesnt that sound better.\r\n\r\n\r\n \r\n\r\nModern, sleek, sophisticated. The cushions wrap your ears in a soft hug. The headband spreads pressure evenly. And sleek metal arms add a statement of sophisticated design.	299.00	299.00	20	20.00	Published	f	sku_22f22	bose-quietcomfort-headphonespink-d7	2026-04-28 10:32:34.394718-11	4	1
55	Redragon H730W Usb Wired Gaming Headset	images/1_31.jpg	Immersive 360° Spatial Sound - Experience gaming like never before with the Redragon H730 Gaming Headset. Equipped with powerful 53mm drivers, this computer headset delivers rich, immersive sound quality, allowing you to pinpoint enemy movements and environmental cues with precision. Elevate your gameplay with unparalleled audio clarity and a fully immersive 360° spatial sound experience.\r\nCustomizable Comfort with Magnetic Ear Cushions - The Redragon H730 Gaming Headset features innovative magnetic detachable ear cushions, offering you the choice between two different materials for personalized comfort. Whether you prefer the plush feel of soft fabric or the sleek finish of leather, you can easily switch to suit your gaming marathon sessions. Enjoy extended hours of comfortable gameplay without compromise.\r\nDetachable Noise-Canceling Microphone - Stay connected with your teammates using the H730's detachable noise-canceling microphone. This computer headset ensures crystal-clear voice transmission, filtering out background noise for uninterrupted communication. Whether you're strategizing in-game or chatting during a livestream, your voice will always be heard loud and clear.\r\nConvenient In-Line Controls - Take control of your audio settings effortlessly with the built-in in-line controls on the Redragon H730 Gaming Headset. Adjust volume levels, mute your microphone, and manage audio playback without taking your focus off the game. This user-friendly feature enhances your gaming experience, making it seamless and enjoyable.\r\nDurable Wired Design with USB Connectivity - Enjoy the reliability of a wired connection with the Redragon H730 Gaming Headset. Featuring a sturdy USB interface, this headset ensures a stable, lag-free audio experience, perfect for competitive gaming. Say goodbye to battery worries and hello to uninterrupted gaming sessions with this durable and dependable headset.	109.00	109.00	10	20.00	Published	f	sku_5fb3e	redragon-h730w-usb-wired-gaming-headset-3w	2026-04-28 10:34:52.434391-11	5	1
56	Bose QuietComfort Headphones(Blue)	images/1_32.jpg	Get next-level sound with the QuietComfort Ultra wireless headphones. Featuring innovative spatial audio, these headphones take what you are hearing inside your head and place it in front of you for more natural, real sounding music.\r\n\r\n\r\n \r\n\r\nUp to 24 hours of battery life will keep your music playing through even the longest listening sessions (or up to 18 hours with Immersive Audio). Plus, a quick 15 minute charge gets you up to 2.5 hours of play time (up to 2 hours with Immersive Audio)\r\n\r\n\r\n \r\n\r\nDo what you do uninterrupted, with Quiet Mode you get full noise cancellation to focus, while Aware Mode allows you to hear your surroundings. Immersion Mode combines full noise cancellation and Immersive Audio.\r\n\r\n\r\n \r\n\r\nGet a strong, continuous connection within 30 feet of your device with wireless Bluetooth headphones. Choose single or multi point to keep your phone, tablet, and work or school computer paired or just focus on one.\r\n\r\n\r\n \r\n\r\nWith CustomTune technology, the QuietComfort Ultra Headphones adapt the sound performance to your ears by analyzing their unique shape. You get sound that fits you, doesnt that sound better.\r\n\r\n\r\n \r\n\r\nModern, sleek, sophisticated. The cushions wrap your ears in a soft hug. The headband spreads pressure evenly. And sleek metal arms add a statement of sophisticated design.	299.00	299.00	10	20.00	Published	f	sku_be3dd	bose-quietcomfort-headphonesblue-b5	2026-04-28 10:36:19.735476-11	4	1
58	EA Sports PS5 FC26 - PlayStation 5	images/1_34.jpg	EA SPORTS FC 26 Standard Edition for PlayStation 5. The Club is Yours in EA SPORTS FC 26. Play your way with an overhauled gameplay experience powered by community feedback, Manager Live Challenges that bring fresh storylines to the new season, and Archetypes inspired by greats of the game\r\n\r\n \r\nEA SPORTS FC 26 is a football video game featuring the best footballers from the biggest clubs and competitions from across The World’s Game\r\nEA SPORTS FC 26 Standard Edition (disc) for PS5 contains the full game and the pre-order bonus\r\nPre-order EA SPORTS FC 26 Standard Edition now to receive an Archetype Unlock Consumable, 2 Double AXP for 10 Matches Consumables, 3 ICON Career Players, 5-Star Coach & 5-Star Youth Scout in Manager Career, and Manager Live Challenge Content\r\nPlay together with friends on different platforms. For EA SPORTS FC 26, cross-play* is available across PC, PlayStation, and Xbox, grouping by platform generation.*Cross-play enabled in certain modes on same-generation platforms\r\nOverhauled gameplay, powered by community feedback. The Authentic Gameplay preset delivers the most true-to-football experience ever in Career, while the Competitive Gameplay preset is tailor-made for play in Football Ultimate Team and Clubs\r\nExperience Manager Career like never before with all-new Manager Live Challenges. Earn rewards throughout the new season by taking on a variety of real-world scenarios and alternative storylines – ranging from a few minutes to multiple seasons\r\nArchetypes inspired by greats of the game introduce 13 unique classes to Clubs and Player Career, bringing more individuality to your player; Develop your abilities by upgrading attributes and unlock Archetype Perks for a distinct feel on the pitch\r\nCompete in themed Live Events, including knockout Tournaments, while new Bounties allow you to earn additional rewards; Plus, Football Ultimate Team in FC 26 launches Challengers, a new second-tier weekend competition for lower Division players\r\nEA SPORTS FC 26 has the best footballers from the biggest clubs and competitions from across The World’s Game, featuring over 20,000 players, 750+ clubs and national teams, over 120 stadiums, and 35+ leagues	49.00	49.00	60	10.00	Published	f	sku_4h3hg	ea-sports-ps5-fc26-playstation-5-8u	2026-04-28 10:40:27.665051-11	5	1
60	Sony PS5 Controller(Black)	images/1_36.jpg	Experience a deep sense of immersion with the Sony DualSense Wireless Controller, which is specially designed for the PlayStation 5 gaming console. In addition to having responsive game buttons, dual analog sticks, a D-pad, and a clickable 2-point capacitive touch pad, the DualSense enhances supported gaming experiences with vibrational haptic feedback that allow you to feel various effects, bumps, and surface textures. The adaptive triggers feature dynamic resistance levels that are designed to accurately simulate the impacts and pressures of in-game objects and activities such as pulling back a bow and feeling the trigger differences when switching . Additionally, the six-axis motion sensing system can control supported games by simply moving the wireless controller in different directions. Keep in close communication with teammates and friends using the controller's integrated microphone array and mono speaker. Alternatively, you can connect a headset to the audio jack for better clarity. The DualSense Wireless Controller connects to your PlayStation 5 via Bluetooth 5.1 or through a USB Type-C cable, which charges its built-in 1560mAh lithium-ion battery.\r\n	106.00	110.00	20	20.00	Published	f	sku_cbhcf	sony-ps5-controllerblack-cf	2026-04-28 10:44:03.444638-11	5	1
57	Logitech G602 Wireless Gaming Mouse	images/1_33.jpg	<p>The Logitech G602 Wireless Gaming Mouse has a 2500 DPI gaming-grade laser sensor, that records all your movements for extreme precision. The mouse has various DPI setting you can configure and switch yourself, at the push of a button. This way, you're always precise or fast, whatever the situation demands. The mouse has 11 programmable buttons, and multiple profiles you can use for your favorite games. The included batteries last up to 250 hours.</p>	75.00	80.00	5	20.00	Published	t	sku_gfbh2	logitech-g602-wireless-gaming-mouse-hw	2026-04-28 10:38:47-11	5	1
59	Sony PlayStation 5 Slim (PS5 Slim) Console 1TB	images/1_37.jpg	Explore uncharted virtual territories and slay dragons with this sleek Sony PlayStation 5 gaming console. The 825GB SSD allows ultra-fast load times, while 3-D audio output produces crisp acoustics. This Sony PlayStation 5 gaming console supports haptic feedback for effortless communication in multiplayer setups, and adaptive triggers allow immersive gameplay. Integrated I/O The custom integration of the PS5 console's systems lets creators pull data from the SSD so quickly that they can design games in ways never before possible. Stunning games Marvel at incredible graphics and experience new PS5 features. Ultra-high speed SSD Maximize your play sessions with near-instant load times for installed PS5 games. HDR technology With an HDR TV, supported PS5 games display an unbelievably vibrant and lifelike range of colors. 8K output PS5 consoles support an 8K output, so you can play games on your 4320p resolution display. 4K TV gaming Play your favorite PS5 games on your stunning 4K TV. Up to 120 fps with 120Hz output Enjoy smooth and fluid high frame rate gameplay at up to 120 fps for compatible games, with support for 120Hz output on 4K displays. Tempest 3D AudioTech Immerse yourself in soundscapes where it feels as if the sound comes from every direction. Through your headphones or TV speakers, your surroundings truly come alive with Tempest 3D AudioTech in supported games. Haptic feedback Experience a haptic feedback via the DualSense wireless controller in select PS5 titles, and feel the effects and impact of your in-game actions through the dynamic sensory feedback. Adaptive triggers Get to grips with immersive adaptive triggers, featuring dynamic resistance levels which simulate the physical impact of in-game activities in select PS5 games.\r\n\r\n	500.00	500.00	10	60.00	Published	f	sku_c4hf4	sony-playstation-5-slim-ps5-slim-console-1tb-di	2026-04-28 10:42:24.299978-11	5	1
63	Hp OMEN Gaming Laptop 	images/1_40.jpg	16-am0017dx Intel Core i7 32GB RAM 1TB SSD NVIDIA GeForce RTX 5060 (8GB DEDICATED) 16" RGB BACKLIGHT KEYBOARD SHADOW BLACK (League of Legends Limited Edition Design) Windows 11 Home	1099.00	1099.00	2	50.00	Published	f	sku_3g1dd	hp-omen-gaming-laptop-s2	2026-04-28 10:56:24.145381-11	5	1
66	Nintendo switch 2 Consoles 256gb	images/1_43.jpg	Bring games to life with a larger 1080p screen—or connect to a TV and play in up to 4K resolution. Support for HDR and frame rates up to 120 fps let you enjoy vivid color, clarity, and smooth gameplay.\r\nSnap the new Joy-Con 2 controllers into place with magnetic connectors. Each controller can even be used as a mouse in compatible games.\r\nExperience new, exclusive games like Mario Kart World only on Nintendo Switch 2. Plus, you can enjoy compatible games from your Nintendo Switch library.	530.00	550.00	10	40.00	Published	f	sku_b2fcc	nintendo-switch-2-consoles-256gb-98	2026-04-28 11:04:41.210032-11	5	1
67	Nikon Dslr DSLR Camera D5000	images/1_44.jpg	The Nikon DSLR Camera features a 2.7-inch 230,000-dot resolution tilt-and-swivel LCD monitor (D90 is 3.0-inch (76 mm), 920,000 pixel, without swivel or tilt), live view, ISO 200–3200 (100–6400 with Boost), 3D tracking Multi-CAM1000 11-point AF system, active D-Lighting system and automatic correction of lateral chromatic aberration\r\n\r\n	210.00	210.00	1	20.00	Published	f	sku_5cf2d	nikon-dslr-dslr-camera-d5000-kt	2026-04-28 11:06:47.187306-11	1	1
64	Hp VICTUS GAMING LAPTOP 13TH GEN	images/1_41.jpg	<p>Product Name : Victus Gaming laptop 15-fa Processor : Intel Core i5 Memory : 16GB DDR5 Storage : 512GBSSD, Display : 15.6"FHD Graphics : 6GB NVIDIA RTX 4050 Operating System : Windows11Home Colour : Grey Weight : 2.29kg</p>	1100.00	1100.00	2	20.00	Published	t	sku_aae1f	hp-victus-gaming-laptop-13th-gen-jy	2026-04-28 10:57:58-11	5	1
68	Canon Ink Cart EOS 60D DSLR Camera	images/1_45.jpg	The Canon EOS 60D DSLR Camera is a versatile mid-range DSLR featuring an 18-megapixel APS-C sensor, full HD video recording, and a flip-out 3-inch LCD screen. It offers fast performance with up to 5.3 frames per second shooting, solid image quality, and compatibility with a wide range of Canon EF and EF-S lenses, making it a great choice for enthusiasts and beginner photographers.	550.00	600.00	2	20.00	Published	f	sku_bg45b	canon-ink-cart-eos-60d-dslr-camera-78	2026-04-28 11:07:41.685704-11	1	1
61	Captain 780 2.4GHz Wireless Gaming Headsets	images/1_38.jpg	 Captain 780 Wireless Gaming Headset is designed to provide an immersive audio experience for gamers across multiple platforms. Featuring 2.4GHz wireless connectivity, Bluetooth 5.3, and wired options, this headset offers versatile compatibility with PS5, PS4, PC, and Nintendo Switch. Enjoy crystal-clear communication with the noise-canceling microphone and extended gaming sessions thanks to its long-lasting battery life and comfortable design.\r\n\r\n	179.00	190.00	10	20.00	Published	t	sku_5c25a	captain-780-24ghz-wireless-gaming-headsets-kf	2026-04-28 10:49:23.888842-11	5	1
65	Sony PlayStation 5 controller	images/1_42_BiUXDcF.jpg	<p>Sony PS5 Dualsense Wireless Controller - Fortnite Edition Enjoy smooth and responsive gameplay with the Sony PS5 Dualsense wireless controller. This Fortnite limited edition controller features a unique design inspired by the popular Fortnite game. It offers comfortable grip, wireless connectivity ,and precise controls for an enhanced gaming experience. This controller connects wirelessly to playstation 5 Perfect for playstation 5 gamers and Fornite fans.</p>	119.00	119.00	7	20.00	Published	t	sku_5gc5a	sony-playstation-5-controller-6s	2026-04-28 11:01:03-11	5	1
23	Samsung Galaxy S21 Ultra 5G-6.8" (128GB, 12GB RAM)	images/1_3_JfKKgqN.jpg	<p>GALAXY S21 ULTRA 6.8" SINGLE SIM 5G 108+10MP 128/12GB 5000mAhSamsung Galaxy S21 Ultra 5G is officially announced on January 14, 2021The smartphone is pack with 12 GB and with 128 GB internal storage options. The device is built with a Glass front (Gorilla Glass Victus), a glass back (Gorilla Glass), and an aluminum frame.Samsung Galaxy S21 Ultra 5G is fueled with a non-removable Li-Po 5000 mAh battery + Fast charging 25W + USB Power Delivery 3.0 + Fast Qi/PMA wireless charging 15W + Reverse wireless charging 4.5W.The smartphone features a 6.8 inches Dynamic AMOLED 2X display that has a 1440 x 3200 pixels resolution. The device comes in Phantom Black, Phantom Silver, Phantom Titanium, Phantom Navy, and Phantom Brown.The smartphone consists of a quad-camera: 108 MP (wide) + 10 MP (periscope telephoto) + 10 MP (telephoto) + 12 MP (ultrawide) while on the front there is a 40 MP (wide). The sensors include Fingerprint (under display, ultrasonic), accelerometer, gyro, proximity, compass, and barometer.The smartphone runs on Android 11 + One UI 3.1 operating system. KEY FEATURES Screen: 6.8 "Dynamic Amoled Resolution: 3200 x 1440 pixels Storage: 128GB Android operating system MAIN CAMERA Quad 108 MP, f/1.8, 24mm (wide), 1/1.33", 0.8µm, PDAF, Laser AF, OIS SELFIE CAMERA Single 40 MP, f/2.2, 26mm (wide), 1/2.8", 0.7µm, PDAF BOX CONTENTS: 1* Samsung Galaxy Phone 1* USB-C type cable 1* Charger Head 1* Documentation/User Manual 1* Sim Ejector tool 1*Warranty Card Pouch &amp; Screen Protector</p>	295.00	295.00	8	10.00	Published	t	sku_2bcbb	samsung-galaxy-s21-ultra-5g-68-128gb-12gb-ram-uc	2026-04-27 04:11:35-11	2	1
38	VANIR TWS Bluetooth 5.4 Wireless Earbuds	images/1_15_StSTO6Q.jpg	<p>Kindly ensure you provide a correct phone number. If possible, include a backup number along with a detailed delivery address to help the courier reach you smoothly. For example: street name + house number (e.g., Adeola Odeku Street, No. 12), or a clear permanent landmark (e.g., beside Ecobank / 50 meters behind the station). Please avoid vague descriptions such as “opposite,” “nearby,” or only the community name. If you choose a pickup station, consider selecting the nearest one and keep your phone available for calls or SMS notifications to ensure timely collection. Thank you for your understanding and support. Hi-Fi Sound Quality Equipped with a 14.2 mm dynamic driver and four-magnet structure, delivering deep bass, balanced mids, and clear highs for an immersive, concert-like listening experience. ENC Noise Cancellation for Calls ENC technology reduces background noise during calls, keeping your voice clear and natural even in busy streets, public transport, or crowded indoor environments. All-Day Battery Life Up to 8 hours of playback on a single charge, and up to 40 hours total with the 500 mAh charging case, ideal for work, travel, and daily use. Fast USB-C Charging Just 15 minutes of USB-C fast charging delivers up to 90 minutes of use, perfect for quick top-ups when you’re short on time. Sweat &amp; Splash Resistant Designed for active lifestyles, these earbuds resist sweat and light splashes, making them suitable for workouts, commuting, and outdoor activities.</p>	15.00	17.00	22	4.00	Published	t	sku_a1f2e	vanir-tws-bluetooth-54-wireless-earbuds-2j	2026-04-28 09:43:10-11	3	1
10	8K Digital Camera with 32G TF Card	images/1_1.jpg	1. Stunning 8K Video & 88MP Photo Resolution Capture ultra - detailed 8K videos and crystal - 88MP photos. Whether you’re shooting landscapes, portraits, or vlogs, this camera delivers professional - clarity and sharpness, ensuring every detail is vividly preserved.\r\n2. 16X Optical Zoom for Versatile Framing With 16X optical zoom, you can easily get close to distant subjects or capture wide - angle scenes. From sweeping landscapes to intimate close - ups, this zoom range offers endless creative possibilities for photography and vlogging.\r\n3. WiFi Connectivity for Seamless Sharing Built - in WiFi allows you to instantly transfer photos and videos to your smartphone or tablet. You can also remotely control the camera via a mobile app, making it convenient to share your work social media or edit the go.\r\n4. Intuitive Touch Screen Operation The responsive touch screen makes navigating settings, reviewing shots, and adjusting focus a breeze. Even beginners can quickly master the camera’s functions, ensuring a smooth and enjoyable shooting experience.\r\n5. Ideal for Vlogging & Content Creation Designed with vloggers in mind, this camera combines - video, zoom capability, and user - friendly features. It’s perfect for creating YouTube videos, TikTok content, or any form of digital storytelling, helping you stand out with professional - looking footage.	158.00	160.00	5	18.00	Published	f	sku_hefa5	8k-digital-camera-with-32g-tf-card-gm	2026-04-27 03:32:30.244366-11	1	1
\.


--
-- Data for Name: core_review; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_review (id, review, reply, rating, active, date, product_id, user_id) FROM stdin;
1	Good device	Glad you liked it	3	t	2025-07-13 03:07:32.972-11	\N	1
2	Great device	Thank you	4	t	2025-08-19 12:53:17.951-11	\N	6
3	Nice		4	t	2026-05-04 01:38:21.70931-11	66	5
4	clean stuff		5	t	2026-05-04 01:39:00.702446-11	25	6
\.


--
-- Data for Name: core_variant; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_variant (id, name, product_id) FROM stdin;
12	Color	5
13	Color	34
\.


--
-- Data for Name: core_variantitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.core_variantitem (id, title, content, variant_id) FROM stdin;
25	Red		12
26	Black		12
27	Green		12
28	Black		13
29	Beige		13
30	Purple		13
\.


--
-- Data for Name: customer_address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_address (id, full_name, mobile, email, country, state, city, address, zip_code, user_id) FROM stdin;
1	David Damilare	07039020348	daviddamilare776@gmail.com	Nigeria	Kwara State	Ilorin	Adewole, Mina Road	240001	1
2	Tyler Star	07039020348	davidtherodent@gmail.com	Nigeria	Kwara State	Ilorin	opposite Enterprise Grooming Instute (EGI, Fate Rd, Ilorin 234001, Kwara	240001	5
5	Fatima Bentley	Repudiandae incidunt	sexym@mailinator.com	Culpa nemo ullamco i	Eaque dignissimos ni	Deserunt omnis aut r	Assumenda eum deseru	90944	5
7	Eliana Tyson	Assumenda quia ea do	gynalefu@mailinator.com	Cupiditate deserunt 	Officia ullamco culp	Delectus quo expedi	\N	62667	6
\.


--
-- Data for Name: customer_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_notifications (id, type, seen, date, user_id) FROM stdin;
11	New Order	f	2025-08-15 11:48:03.92-11	5
12	New Order	f	2025-08-15 11:51:24.912-11	5
13	New Order	f	2025-08-15 11:56:46.21-11	5
14	New Order	f	2025-08-15 12:45:08.404-11	5
15	New Order	f	2025-08-15 12:45:51.549-11	5
16	New Order	f	2025-08-15 12:46:17.657-11	5
17	New Order	f	2025-08-15 12:47:02.051-11	5
18	New Order	f	2026-04-26 05:41:07.312-11	5
19	New Order	t	2026-04-26 05:55:02.795-11	5
20	New Order	t	2026-04-26 06:14:25.015-11	5
21	New Order	t	2026-04-26 06:16:13.999-11	5
22	New Order	t	2026-04-26 06:18:14.098-11	5
23	New Order	t	2026-04-26 06:21:58.894-11	5
24	New Order	t	2026-04-26 06:23:39.489-11	5
25	New Order	f	2026-04-26 06:28:31.924-11	5
26	New Order	f	2026-05-04 02:13:28.204275-11	5
27	New Order	f	2026-05-04 02:53:01.926198-11	5
28	New Order	f	2026-05-04 04:05:15.460724-11	5
29	New Order	f	2026-05-04 04:16:36.066213-11	5
\.


--
-- Data for Name: customer_wishlist; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_wishlist (id, product_id, user_id) FROM stdin;
45	68	8
50	62	5
51	27	5
52	19	5
53	6	5
56	43	5
57	7	5
58	38	5
65	65	5
68	47	5
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2026-04-28 11:33:06.784269-11	43	Beats By Dre Powerbeats Pro 2	2	[{"changed": {"fields": ["Name", "Text", "Marketplace Featured"]}}]	9	1
2	2026-04-28 11:33:21.828566-11	65	Sony PlayStation 5 controller	2	[{"changed": {"fields": ["Text", "Marketplace Featured"]}}]	9	1
3	2026-04-28 11:34:34.674806-11	62	SP GHOST OF YOTEI PLAYSTATION 5	2	[{"changed": {"fields": ["Text", "Marketplace Featured"]}}]	9	1
4	2026-04-28 11:35:59.301538-11	27	Apple IPhone 17- 8GB-256GB - Sage -5G	2	[{"changed": {"fields": ["Text", "Marketplace Featured"]}}]	9	1
5	2026-04-28 11:36:14.243603-11	57	Logitech G602 Wireless Gaming Mouse	2	[{"changed": {"fields": ["Text", "Marketplace Featured"]}}]	9	1
6	2026-04-28 11:36:25.612609-11	64	Hp VICTUS GAMING LAPTOP 13TH GEN	2	[{"changed": {"fields": ["Text", "Marketplace Featured"]}}]	9	1
7	2026-04-28 11:36:45.693923-11	23	Samsung Galaxy S21 Ultra 5G-6.8" (128GB, 12GB RAM)	2	[{"changed": {"fields": ["Text", "Marketplace Featured"]}}]	9	1
8	2026-04-28 11:38:23.261443-11	38	VANIR TWS Bluetooth 5.4 Wireless Earbuds	2	[{"changed": {"fields": ["Text", "Marketplace Featured"]}}]	9	1
9	2026-04-28 11:39:17.830118-11	12	Canon Ink Cart EOS 70D Camera	2	[{"changed": {"fields": ["Name", "Text", "Marketplace Featured"]}}]	9	1
10	2026-04-28 11:39:36.944611-11	15	Canon Ink Cart The Canon EOS RP	2	[{"changed": {"fields": ["Name", "Text", "Marketplace Featured"]}}]	9	1
11	2026-04-28 11:39:51.896596-11	25	Apple IPhone 17 Pro - 12GB- 256GB - Cosmic Orange	2	[{"changed": {"fields": ["Text", "Marketplace Featured"]}}]	9	1
12	2026-05-04 01:38:21.718094-11	3	davidtherodent review on Nintendo switch 2 Consoles 256gb	1	[{"added": {}}]	12	1
13	2026-05-04 01:39:00.707444-11	4	johnpauladebayo588 review on Apple IPhone 17 Pro - 12GB- 256GB - Cosmic Orange	1	[{"added": {}}]	12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	core	category
7	core	coupon
8	core	order
9	core	product
10	core	variant
11	core	variantitem
12	core	review
13	core	orderitem
14	core	gallery
15	core	cart
16	customer	wishlist
17	customer	notifications
18	customer	address
19	userauths	user
20	userauths	profile
21	vendor	vendor
22	vendor	payout
23	vendor	notifications
24	vendor	bankaccount
25	core	contact
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-04-26 09:52:00.548163-11
2	contenttypes	0002_remove_content_type_name	2026-04-26 09:52:00.555271-11
3	auth	0001_initial	2026-04-26 09:52:00.643449-11
4	auth	0002_alter_permission_name_max_length	2026-04-26 09:52:00.649433-11
5	auth	0003_alter_user_email_max_length	2026-04-26 09:52:00.655547-11
6	auth	0004_alter_user_username_opts	2026-04-26 09:52:00.655547-11
7	auth	0005_alter_user_last_login_null	2026-04-26 09:52:00.655547-11
8	auth	0006_require_contenttypes_0002	2026-04-26 09:52:00.672319-11
9	auth	0007_alter_validators_add_error_messages	2026-04-26 09:52:00.680556-11
10	auth	0008_alter_user_username_max_length	2026-04-26 09:52:00.687123-11
11	auth	0009_alter_user_last_name_max_length	2026-04-26 09:52:00.694109-11
12	auth	0010_alter_group_name_max_length	2026-04-26 09:52:00.703784-11
13	auth	0011_update_proxy_permissions	2026-04-26 09:52:00.711624-11
14	auth	0012_alter_user_first_name_max_length	2026-04-26 09:52:00.717606-11
15	userauths	0001_initial	2026-04-26 09:52:00.834311-11
16	admin	0001_initial	2026-04-26 09:52:00.882177-11
17	admin	0002_logentry_remove_auto_add	2026-04-26 09:52:00.898117-11
18	admin	0003_logentry_add_action_flag_choices	2026-04-26 09:52:00.911351-11
19	core	0001_initial	2026-04-26 09:52:01.396537-11
20	core	0002_alter_gallery_options	2026-04-26 09:52:01.416575-11
21	core	0003_alter_category_image_alter_product_image	2026-04-26 09:52:01.445517-11
22	customer	0001_initial	2026-04-26 09:52:01.555522-11
23	core	0004_order_address	2026-04-26 09:52:01.594367-11
24	core	0005_alter_order_order_status_and_more	2026-04-26 09:52:01.638783-11
25	core	0006_alter_product_category	2026-04-26 09:52:01.654912-11
26	core	0007_alter_variant_product	2026-04-26 09:52:01.688404-11
27	sessions	0001_initial	2026-04-26 09:52:01.712559-11
28	vendor	0001_initial	2026-04-26 09:52:01.955394-11
29	vendor	0002_alter_vendor_slug	2026-04-26 09:52:02.041897-11
30	vendor	0003_alter_notifications_type	2026-04-26 09:52:02.082859-11
31	core	0008_contact	2026-05-04 02:27:48.089377-11
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1j5z1ezp2qnf48l1hw7darmeo2xhy22z	eyJjYXJ0X2lkIjoiNjMwNDc1MjIzMCJ9:1umDFJ:YGee3SNAE6Iw5-6ftp-3hmo14aRmL6lJKg-dAQTWKb4	2025-08-27 04:18:33.292-11
2gvzdrfcqqhowiathv266jtkrjh35014	.eJxVjksOwjAMRO-SNYqcOIlTluw5Q-XGLi2gVupnhbg7regCtjNvnuZlal6Xrl5nnepezNk4c_rNGi4PHfZC7jzcRlvGYZn6xu6IPdrZXkfR5-Vg_wQdz922Rg2BMzFQdlEracEFLtljieKrrNFJiuh9QgolAUELWoikjQ3sm01aeFq-HzNBThUmRPP-APxrPLs:1uopHI:KB3_ioHVDRxG5dyDkZS6kU2UcNh71u1WrGCYo_2hx2Y	2025-09-03 09:19:24.664-11
3s7l369utxn5oufx3ut1ohpkc8xkz1w8	eyJjYXJ0X2lkIjoiNDEwMzI2MDMxNyJ9:1uoWB0:1m-tWaSFwfulk35QjtdzsGmzDSfCnLmbJZgMci1tDv4	2025-09-02 12:55:38.545-11
689fnjl2zpvxmquot8rge9f672bqdlph	eyJjYXJ0X2lkIjoiMzgyNTYxOTQxNSJ9:1ucaWW:dZF30TTnAuzqtvkWWf9kzpVgKWfOZW29rDl0LGbpA2U	2025-07-31 15:08:32.968-11
7amaftxacysmxr2xrey0kieer1xkjxd6	.eJxVjsEOgjAQRP-lZ9PYbrstHr3zDWS73QpqIKFwMv67EDnodd7My7xUR-vSd2uVuRuyuiijTr9ZIn7IuIN8p_E2aZ7GZR6S3iv6oFW3U5bn9ej-CXqq_bYWh95ZliDkopgGQwHD1mDypQh5F7yTaABtsRilEGHDXFLODD4wbVKmefl-dBEQzuAR1PsDR0U-cA:1ucaO5:yzVmw3taW2tW5iyOSH91kud_FClpcdW_YsDCMIneGoQ	2025-07-31 14:59:49.882-11
7dqujvtxkc413g4eb7cw37e7af4dtvlu	.eJxVjjsOwjAQRO_iGln-r0NJzxmi9e6aBFAi5VMh7k4iUkA78-ZpXqrFdenadZap7VmdlVWn36wgPWTYC77jcBs1jcMy9UXviD7aWV9HluflYP8EHc7dtvYSAmZAA9lGabgaG5Cy8xTZNVmi5RS9c8lDoGTAVCMEwDUWs282KeG0fD82LjoIAXJS7w_8STy8:1wECBB:UNgYvlrdbBrRsRCauirJ_MeanBF-2224rLISofqi3zM	2026-05-02 09:22:13.553-11
aesu211hlbifxf3sns19on3w78s8evuw	eyJjYXJ0X2lkIjoiNDU0NzIzMTk5OCJ9:1wECMb:4GOPr4VSJc76RKMYGqJy6O_sZ_CNutU3Su2E0LHjZhA	2026-05-02 09:34:01.169-11
b7keqxzkiim684lkaan41d1he2r83n4y	.eJxVjsEOgjAQRP-lZ9PYbrstHr3zDWS73QpqIKFwMv67EDnodd7My7xUR-vSd2uVuRuyuiijTr9ZIn7IuIN8p_E2aZ7GZR6S3iv6oFW3U5bn9ej-CXqq_bYWh95ZliDkopgGQwHD1mDypQh5F7yTaABtsRilEGHDXFLODD4wbVKmefl-dBEQzuAR1PsDR0U-cA:1ubp1I:AJLLqoVFUgXBdypyXOzWkrXBb5q2adkoBDm0eWsfHsY	2025-07-29 12:25:08.152-11
fkbqvtp38ugcmxvoaoraypobr6j1qzwu	.eJxVjDsOwjAQBe_iGln-xg4lPWeINrsbEohsyY4rxN0hKE3aeTPvLRDKNiwkrqmt60UM0LZ5aJXLHwotTmwEfHHaB3pCemSJOW1lGeWuyGOt8p6J19vhng5mqPOvtuwcxAAqRO25p0lpBxiNRU-mj-w1dd4a09ngsFNBTYoxBJr8qPZGfL5vhjwd:1uoXvX:u36wc5sFlOKtZPOGMoeEsTCiU_s6pJqx_PELhMypRZQ	2025-09-02 14:47:47.643-11
h9hwamt7edd6v1qq8d2mi4reti5f5e6m	.eJxVjMsOwiAQRf-FtSHhNVCX7v0GMgyDVA0kpV0Z_12bdKHbe865LxFxW2vcBi9xzuIslDj9bgnpwW0H-Y7t1iX1ti5zkrsiDzrktWd-Xg7376DiqN-aLTiriT2jDawm8MUo0gqSK4XRWe8sB2VAFw2BCyJMRCXlTMZ5QvH-AOf5OKM:1ujLYm:_ZitBkCdmsXrADCCEmcNyT240pneE36Pjg7JvsB17pA	2025-08-19 06:34:48.631-11
j0a8xcaq6hr6apgxjbxinnrgcvf77gtz	.eJxVjMsOwiAQRf-FtSHCwEBduvcbmmEYpGpo0sfK-O_a2E2395xz34ppWvohq4tyERDO4BHUSfW0LrVfZ5n-0By3RPyUtoH8oHYfNY9tmYakN0XvdNa3McvruruHg0pz_dXi0DvLEoRcFNNhKGDYGky-FCHvgncSDaAtFqMUIuyYS8qZwQcm9fkCHR4-cA:1ucZwW:0uQ85goHuHHyDP0pLiNNkk1EXdejTnxnTGEDqKz5IKs	2025-07-31 14:31:20.067-11
jslicf9b5sgyuwi8ypt2oqd9nqlwocih	.eJxVjEEOgjAQRe_StWlo7bRTl-49A5nODIIaSCisjHdXIhu2_73334ZpXtpBzMVAkwAchozmZFpal75dq85_GI9bIX7quAF50HifLE_jMg_FbordabW3SfR13d3DQU-1_9WK4BsOgQmi84g5N6wONWcRLxCTY40lQDqrL-pKl6IkyoxaqCsE5vMFGNw-Uw:1umxFb:ii58OoL36XQcolkqR20K6zKFBiUPcceTS0sBRUqU7Hc	2025-08-29 05:25:55.965-11
jsn7c2h8vx18i0kw9oojfh5dt6rftj66	.eJxVjMsOwiAQRf-FtSHhNVCX7v0GMgyDVA0kpV0Z_12bdKHbe865LxFxW2vcBi9xzuIslDj9bgnpwW0H-Y7t1iX1ti5zkrsiDzrktWd-Xg7376DiqN-aLTiriT2jDawm8MUo0gqSK4XRWe8sB2VAFw2BCyJMRCXlTMZ5QvH-AOf5OKM:1ua51B:08BfNOYymejodGBGANJCFC2sl6Z6veZ_wWTbIEbtNDY	2025-07-24 17:05:49.721-11
klpo7x4gb8tt7x0dsg6nby280l87wh8q	e30:1ulUMv:jsl0mPyNpJBxcDlAiH6R5VRtgBuCEIMhmiabUU1Oq_8	2025-08-25 04:23:25.267-11
noh15rt29h2lqid6ku55o5de2rvcf7qw	.eJxVjsEOgjAQRP-lZ9PYbrstHr3zDWS73QpqIKFwMv67EDnodd7My7xUR-vSd2uVuRuyuiijTr9ZIn7IuIN8p_E2aZ7GZR6S3iv6oFW3U5bn9ej-CXqq_bYWh95ZliDkopgGQwHD1mDypQh5F7yTaABtsRilEGHDXFLODD4wbVKmefl-dBEQzuAR1PsDR0U-cA:1ucD1c:EuA8e4MKI4hqqSwK1EfhUOLTqd3dan9x1a0t7iWxGp0	2025-07-30 14:03:04.146-11
ofole2ppx527vtecj3x5s0rq7qjnz76q	eyJjYXJ0X2lkIjpudWxsfQ:1umDmn:I-tYbewabBs-DJjH1KEONlnwEurCgO0TU-pQFizpyFA	2025-08-27 04:53:09.576-11
ogs6n2wgkip9f2tl2yb9pxi9evvbzhj5	.eJxVjsEOgjAQRP-lZ9PYbrstHr3zDWS73QpqIKFwMv67EDnodd7My7xUR-vSd2uVuRuyuiijTr9ZIn7IuIN8p_E2aZ7GZR6S3iv6oFW3U5bn9ej-CXqq_bYWh95ZliDkopgGQwHD1mDypQh5F7yTaABtsRilEGHDXFLODD4wbVKmefl-dBEQzuAR1PsDR0U-cA:1ugUTl:n0pYSMcVDfeuCMxnaW-GgP4Byuvuqfq7ELbtP6Zm26Q	2025-08-11 09:29:49.44-11
pty7p7s2z66327khbk6j3nnl7162ypfj	.eJxVjMsOwiAQRf-FtSHhNVCX7v0GMgyDVA0kpV0Z_12bdKHbe865LxFxW2vcBi9xzuIslDj9bgnpwW0H-Y7t1iX1ti5zkrsiDzrktWd-Xg7376DiqN-aLTiriT2jDawm8MUo0gqSK4XRWe8sB2VAFw2BCyJMRCXlTMZ5QvH-AOf5OKM:1ucCwU:96i8TSc6biWkaZ45k545eBCkH2h7sikP7pUdoPMTxgM	2025-07-30 13:57:46.433-11
q12arpvxxx1pn1w3kxy7uta0hh56g88l	.eJxVjrFuxCAQRP-FOoIFgxe7TJ9vQHjBgdzJnDCkifLvwcoViaabNzOaL-Z8b8n1M1aXA1uZZC9_vc3TLR4XCB_-eC-cytFq3vgV4U968rcS4v31mf03kPyZRnuKWnuLHtBKE5ewg9SerJrIBLXYaGSYzaTUPKGmGRB2iIQYdrPB1Rmj5Gv7_bgoo1BrtPOwHzV-5tJP1-t9sNTaYxVCKuQwJFcLAIJSpFvpTZQcXCZTsmDfPySpTz8:1vE3h1:V_GS-xc3VJUJUV6tqU9Bo0Ef7ukiDs7kcQxGOtUf7hU	2025-11-11 23:46:15.824-11
r4hlihsrca3ejrfe0foin0zdcc3qn1h2	.eJxVjsEOgjAQRP-lZ9PYbrstHr3zDWS73QpqIKFwMv67EDnodd7My7xUR-vSd2uVuRuyuiijTr9ZIn7IuIN8p_E2aZ7GZR6S3iv6oFW3U5bn9ej-CXqq_bYWh95ZliDkopgGQwHD1mDypQh5F7yTaABtsRilEGHDXFLODD4wbVKmefl-dBEQzuAR1PsDR0U-cA:1ubp43:s4sAoN1NtiYwyjutTbJNmfKJ0Q-H8AMe4nftFyNkyTo	2025-07-29 12:27:59.072-11
ruf4dz8kyx07iyofdpphimcysqsdmjpb	.eJxVjDsOgzAQBe-ydWT5i03K9JzBWu8ugSQCCUMV5e4JCg3tm5n3BsJlzSPDFbCQsQ4ukHFbh7xVWf7AnLeC9JRpB_zA6T4rmqd1GYvaFXXQqrqZ5XU73NPBgHX41U68xxRRx2SCtNxr45GSdRTYtkmC4SY4axsXPTU66l4Lxch9KHpv4PMFslY8Yg:1v9WNz:lFarbqkp5mn7ijdRpO93ZugXkmOWgm4NG5pQI6r9BkU	2025-10-30 11:23:51.486-11
ry2thq8wwdptulrizujvpuwoil21glsk	eyJjYXJ0X2lkIjoiMjQ5MDEwMDkxNCJ9:1umBdv:RJJxLuz40zlwqvPk6fXu8kr8rW9BBAYBd-UkqbBZwNM	2025-08-27 02:35:51.129-11
u1z7pjs07tkgds5wys3zqp8ephhvpq81	.eJxVjDsOwjAQBe_iGlmJHa8dSvqcIXr2LjiAbCmfCnF3iJQC2jcz76VGbGset0XmcWJ1Vk6dfreI9JCyA76j3KpOtazzFPWu6IMueqgsz8vh_h1kLPlbe9eBPYlF6omJTArJgZrYQqRlYmthTWiYTMSVvKU-eG_AcGIodur9Ae5zOAU:1wH3HT:i0gnUFpqLGtFrf5S8K4VhWmNGStOwnU-Cts0EwKuhjs	2026-05-10 06:28:31.949-11
u5cc2yrw0p5ekr0kb9580s88d2qyhkou	.eJxVjDsOwjAQBe_iGlmJHa8dSvqcIXr2LjiAbCmfCnF3iJQC2jcz76VGbGset0XmcWJ1Vk6dfreI9JCyA76j3KpOtazzFPWu6IMueqgsz8vh_h1kLPlbe9eBPYlF6omJTArJgZrYQqRlYmthTWiYTMSVvKU-eG_AcGIodur9Ae5zOAU:1umEbq:3HyabhDopgmk3OZ8L-mMgp65c6ZR0ZjO2KCJYNRDJZg	2025-08-27 05:45:54.804-11
uytymuvfu00svleehufuk538pgmbbsdz	.eJxVjs0OgjAQhN-lZ9PAtt2CR-88A5l2V0ENJPycjO8uRA56nW_my7xMi3Xp2nXWqe3FnE0wp98sIT902IHcMdxGm8dhmfpk94o96GybUfR5Obp_gg5zt61j8JDI6pBrFmbKVQ7gIpVQLYXFOTiqCmFKuHJ0XFcxEgRBiZPfpBnT8v3oXckcAlFt3h8_fD3U:1umDSf:fXxPyiAL5hlE-Gj3W3pGpWVikmwJPfUlbgeFw5cgB8g	2025-08-27 04:32:21.5-11
v5l08qulj8hvxkzef8eo55i4zh44vcng	e30:1ulUH5:OLo0eRKNI4TiwN5D5Z-r8r1ovUl_ZAQpRdLMthrEOj0	2025-08-25 04:17:23.656-11
w7aglosafp71uy3mumgt2x5zjs18vej2	.eJxVjsEOgjAQRP-lZ9PYbrstHr3zDWS73QpqIKFwMv67EDnodd7My7xUR-vSd2uVuRuyuiijTr9ZIn7IuIN8p_E2aZ7GZR6S3iv6oFW3U5bn9ej-CXqq_bYWh95ZliDkopgGQwHD1mDypQh5F7yTaABtsRilEGHDXFLODD4wbVKmefl-dBEQzuAR1PsDR0U-cA:1ucCob:xAvWoDwlnXsIHbrh9KZjQhWkZjRhQsgb4Y2__LMvkc8	2025-07-30 13:49:37.094-11
x5eg3bccrwjdz3tsnzi50yq724yuo2lv	eyJjYXJ0X2lkIjoiNzYzNjg2Nzk2OCJ9:1uop6X:ZrLYdLSQmL9iQhx_B3d3ErOwHJmvAcjVvlQxwmrUl9I	2025-09-03 09:08:17.3-11
xm4ueg1qi5zgo70b3gavulgf2a8903pq	eyJjYXJ0X2lkIjpudWxsfQ:1v9W4H:Onrj7gqyxXVIciIp4zQ4F92qteR1hYu4tz8nu1YjOoE	2025-10-30 11:03:29.335-11
b2e7bsynslo4crj1vbxxizz3v5vn3i7i	.eJxVjDsOwjAQBe_iGlmJHa8dSvqcIXr2LjiAbCmfCnF3iJQC2jcz76VGbGset0XmcWJ1Vk6dfreI9JCyA76j3KpOtazzFPWu6IMueqgsz8vh_h1kLPlbe9eBPYlF6omJTArJgZrYQqRlYmthTWiYTMSVvKU-eG_AcGIodur9Ae5zOAU:1wJv2C:mXmYBz0frebOQqfYyxqigGxVuGcBHm169AfGE_2MQDE	2026-05-18 04:16:36.082423-11
kwbnun4thbkkq6xmrjvoyycyo1bfwlhh	.eJxVjEsOgzAMRO-SdRURJwGny-57BuTYTqGtQOKzqnr3gsqG5cx7Mx_DNC1tL-ZqAkYXk_NVZS6mpXXp2nXW6Q_x3GXilw47kCcNj9HyOCxTn-2u2IPO9j6Kvm-HezroaO62NWAtogq-1DVoSYmiR2AOpUHPGUolKr4B4i0G56IHRiRNxWVWL-b7AyzRPms:1wH772:-qoOw3lR13YTNbd_vrwrXDxUxJEOtoyjSmryI8HDFCA	2026-05-10 10:34:00.362404-11
iwlre7isqaun6vpg0qhlxlbu0nxry6mt	eyJjYXJ0X2lkIjoiNjMzNzg1NzgwOSJ9:1wH7X7:5W1Sn0Zm2dgehazdxLrzFHCqtyxVAetSWdRzxld5t9o	2026-05-10 11:00:57.656021-11
7b6f6lbw8mxumbvdi7554m4ioaxo98c0	.eJxVjMsOwiAQRf-FtSG8oS7d-w1kYAapGpqUdmX8dyXpQrf3nHNfLMK-1bh3WuOM7MwkO_1uCfKD2gB4h3ZbeF7ats6JD4UftPPrgvS8HO7fQYVev7UmYyB4ED5ISxMWIQ3koHS2qKZAVqKzWimnvclOeFEEZe-x2CRGw94fxRw24g:1wHMAe:-QjdPgpZ2fSa7NC3xUbHhRndiWoxWAw0VIXAC0_Nrb0	2026-05-11 02:38:44.577127-11
9f0q16559seaiz5wakq60t80wlidl11u	.eJxVjDEOgzAQBP_iOrLAxmeTMj1vQGvfJZAgIxmoovw9IaKhnZndt0ooaz-yuuZtmi6qx7YO_bZI-UPl1IlFpJfkXfAT-THrNOe1jFHviT7soruZZbod7elgwDL81t41YE9ikVpiIpNCcqAq1hCpmdhaWBMqJhNxJ2-pDd4bMJwYio36fAGY3T1A:1wHMGR:599S7a2jzsdbqP36qBxGSFqDfmX5CaqGEC6Bg5seNP0	2026-05-11 02:44:43.923728-11
95d19f50v49pjrt0njyi49akzw3oq75m	.eJxVjMsOwiAQRf-FtSG8oS7d-w1kYAapGpqUdmX8dyXpQrf3nHNfLMK-1bh3WuOM7MwkO_1uCfKD2gB4h3ZbeF7ats6JD4UftPPrgvS8HO7fQYVev7UmYyB4ED5ISxMWIQ3koHS2qKZAVqKzWimnvclOeFEEZe-x2CRGw94fxRw24g:1wHl7k:TLwNvsQffdhUzdyGwpgH0BmIFZAym1Wo1vrYYFp6chA	2026-05-12 05:17:24.75478-11
33jvlntd5rd7h4lrdbo61wswsppyhjf6	.eJxVjMEOwiAQRP-FsyGytBQ8evcbyLK7SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6KK9Ov11CekrdAT-w3idNU13mMeld0Qdt-jaxvK6H-3dQsJVtDd4xi4DNzoHkELC3Hoi6PHhLCfKZhe0ASFvsjOktkPcoIZtEYll9vvr_OKM:1wHqor:ir8QgaD9vFu_xwEbOkxw9mq-BIqW_Jz9vJBIrV3UVfI	2026-05-12 11:22:17.005321-11
tlmd88x35hqrzb92hkc98l57uyn2l9za	.eJxVjDsOgzAQRO_iOrL8X5Myfc6Alt0lkEQgYaii3D1YoUGaat6b-SjCZW1HVlcFPtoc9jTqolrc1qHdiix_aM9dh_SSqQJ-4vSYNc3Tuoydroo-aNH3meV9O9zTwYBl2NdeQsAMaCDbKA33xgak7DxFdk2WaDlF71zyECgZML0RAuA-dqZu1PcHAGA8uA:1wIpEE:ygFaJYu7nOT60LXOxhkj4gZYEadMFH72VhIN6vw7vWE	2026-05-15 03:52:30.588736-11
\.


--
-- Data for Name: userauths_profile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.userauths_profile (id, image, full_name, phone, user_type, user_id) FROM stdin;
1	images/post-portrait-8_K9A2iwh.jpg	David Damilare	07039020348	Vendor	1
3	images/black-2.png	Tyler Star	07039020348	Customer	5
4	images/chefs-3.jpg	John Paul	09037931855	\N	6
5	default.jpg	Belle Randall	123	Customer	7
6	default.jpg	Ijagbemi David	07039020348	Customer	8
\.


--
-- Data for Name: userauths_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.userauths_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email) FROM stdin;
6	pbkdf2_sha256$600000$zbN5Pf56nuOaiorsufW0sj$sab/E3nBQB66t/oVmIV8OAnV/qz72fQBKiUg6yj/aQA=	2025-08-15 09:30:12.163-11	f			f	t	2025-08-13 17:24:00.813-11	johnpauladebayo588	johnpauladebayo588@gmail.com
7	pbkdf2_sha256$600000$1rw4tOLxTVAZ0k4DqFdu1S$V4d6gAygT5KT0mQOL/hf2jY4tHYEVFCvrn2DTjW/zjE=	2025-08-15 08:09:18.754-11	f			f	t	2025-08-15 08:09:16.538-11	suceli	suceli@mailinator.com
8	pbkdf2_sha256$600000$hS2g08r1hgApv0lGLVu50F$Z6iM3UyAKeKCR1bZFMcXbxJB5vppZJONcrcNuFVrx4k=	2026-04-28 11:22:16.99474-11	f			f	t	2026-04-26 10:31:15.62717-11	i.david3105	i.david3105@miva.edu.ng
1	pbkdf2_sha256$600000$CYHnF04s9C76hffvpQ0xpz$SJcyYPuR5gv32mB3WqeOXtt0jBBnHEO3goOU1R8wUd0=	2026-05-01 03:52:30.584506-11	t			t	t	2025-07-09 12:19:12.836-11	david	daviddamilare776@gmail.com
5	pbkdf2_sha256$600000$1wGCrUD2dphqLrxFjJe7ij$kca46+T2KvpbNFeqAXS5CiAb13rznUkyglYNb585E6g=	2026-05-04 03:54:32.165591-11	f			f	t	2025-08-11 05:31:12.025-11	davidtherodent	davidtherodent@gmail.com
\.


--
-- Data for Name: userauths_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.userauths_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: userauths_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.userauths_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: vendor_bankaccount; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vendor_bankaccount (id, account_type, bank_name, account_number, account_name, bank_code, stripe_id, paypal_address, vendor_id) FROM stdin;
\.


--
-- Data for Name: vendor_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vendor_notifications (id, type, seen, date, order_id, user_id) FROM stdin;
24	New Order	f	2026-04-26 05:41:07.327-11	132	1
31	New Order	f	2026-04-26 06:28:31.938-11	139	1
32	New Order	f	2026-05-04 02:13:28.215248-11	145	1
33	New Order	f	2026-05-04 02:13:28.220612-11	144	1
34	New Order	f	2026-05-04 02:53:01.941158-11	146	1
35	New Order	f	2026-05-04 04:05:15.489653-11	147	1
36	New Order	f	2026-05-04 04:16:36.071244-11	149	1
\.


--
-- Data for Name: vendor_payout; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vendor_payout (id, amount, payout_id, date, item_id, vendor_id) FROM stdin;
\.


--
-- Data for Name: vendor_vendor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vendor_vendor (id, image, store_name, description, country, vid, date, slug, user_id) FROM stdin;
1	images/music_listing_01.jpg	Ryka's Store	Ryka�s Store � Your One-Stop Gadget Destination\r\n\r\nRyka�s Store is the ultimate hub for tech lovers and gadget enthusiasts. Known for its wide range of high-quality electronics, the store offers everything from smartphones, laptops, and smartwatches to gaming consoles, accessories, and the latest tech innovations. Whether you�re a professional looking for reliable work tools, a gamer seeking the newest gear, or a casual buyer in need of everyday gadgets, Ryka�s Store has something for you.\r\n\r\nThe store prides itself on competitive prices, authentic products, and excellent customer service. Every item is carefully sourced to ensure durability and performance, and the knowledgeable staff is always ready to guide customers in choosing the perfect gadget for their needs.\r\n\r\nWith both in-store and online shopping options, Ryka�s Store blends convenience with quality, making it a trusted destination for tech shopping. From trendy releases to timeless classics, Ryka�s Store is where technology meets affordability.	United States	vid_e55kai6	2025-08-11 13:55:06-11	rykas-store	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);


--
-- Name: core_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_cart_id_seq', 290, true);


--
-- Name: core_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_category_id_seq', 5, true);


--
-- Name: core_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_contact_id_seq', 3, true);


--
-- Name: core_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_coupon_id_seq', 4, true);


--
-- Name: core_gallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_gallery_id_seq', 15, true);


--
-- Name: core_order_coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_order_coupons_id_seq', 1, true);


--
-- Name: core_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_order_id_seq', 103, true);


--
-- Name: core_order_vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_order_vendors_id_seq', 16, true);


--
-- Name: core_orderitem_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_orderitem_coupon_id_seq', 1, true);


--
-- Name: core_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_orderitem_id_seq', 149, true);


--
-- Name: core_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_product_id_seq', 68, true);


--
-- Name: core_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_review_id_seq', 4, true);


--
-- Name: core_variant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_variant_id_seq', 13, true);


--
-- Name: core_variantitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.core_variantitem_id_seq', 30, true);


--
-- Name: customer_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_address_id_seq', 7, true);


--
-- Name: customer_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_notifications_id_seq', 29, true);


--
-- Name: customer_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_wishlist_id_seq', 75, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 13, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);


--
-- Name: userauths_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.userauths_profile_id_seq', 6, true);


--
-- Name: userauths_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.userauths_user_groups_id_seq', 1, false);


--
-- Name: userauths_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.userauths_user_id_seq', 8, true);


--
-- Name: userauths_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.userauths_user_user_permissions_id_seq', 1, false);


--
-- Name: vendor_bankaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vendor_bankaccount_id_seq', 1, false);


--
-- Name: vendor_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vendor_notifications_id_seq', 36, true);


--
-- Name: vendor_payout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vendor_payout_id_seq', 1, false);


--
-- Name: vendor_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vendor_vendor_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: core_cart core_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_cart
    ADD CONSTRAINT core_cart_pkey PRIMARY KEY (id);


--
-- Name: core_category core_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_category
    ADD CONSTRAINT core_category_pkey PRIMARY KEY (id);


--
-- Name: core_category core_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_category
    ADD CONSTRAINT core_category_slug_key UNIQUE (slug);


--
-- Name: core_contact core_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_contact
    ADD CONSTRAINT core_contact_pkey PRIMARY KEY (id);


--
-- Name: core_coupon core_coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_coupon
    ADD CONSTRAINT core_coupon_pkey PRIMARY KEY (id);


--
-- Name: core_gallery core_gallery_gid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_gallery
    ADD CONSTRAINT core_gallery_gid_key UNIQUE (gid);


--
-- Name: core_gallery core_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_gallery
    ADD CONSTRAINT core_gallery_pkey PRIMARY KEY (id);


--
-- Name: core_order_coupons core_order_coupons_order_id_coupon_id_2e1bdbae_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order_coupons
    ADD CONSTRAINT core_order_coupons_order_id_coupon_id_2e1bdbae_uniq UNIQUE (order_id, coupon_id);


--
-- Name: core_order_coupons core_order_coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order_coupons
    ADD CONSTRAINT core_order_coupons_pkey PRIMARY KEY (id);


--
-- Name: core_order core_order_oid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_oid_key UNIQUE (oid);


--
-- Name: core_order core_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_pkey PRIMARY KEY (id);


--
-- Name: core_order_vendors core_order_vendors_order_id_user_id_1af67a1d_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order_vendors
    ADD CONSTRAINT core_order_vendors_order_id_user_id_1af67a1d_uniq UNIQUE (order_id, user_id);


--
-- Name: core_order_vendors core_order_vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order_vendors
    ADD CONSTRAINT core_order_vendors_pkey PRIMARY KEY (id);


--
-- Name: core_orderitem_coupon core_orderitem_coupon_orderitem_id_coupon_id_0080e31f_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_orderitem_coupon
    ADD CONSTRAINT core_orderitem_coupon_orderitem_id_coupon_id_0080e31f_uniq UNIQUE (orderitem_id, coupon_id);


--
-- Name: core_orderitem_coupon core_orderitem_coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_orderitem_coupon
    ADD CONSTRAINT core_orderitem_coupon_pkey PRIMARY KEY (id);


--
-- Name: core_orderitem core_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_pkey PRIMARY KEY (id);


--
-- Name: core_product core_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_product
    ADD CONSTRAINT core_product_pkey PRIMARY KEY (id);


--
-- Name: core_product core_product_sku_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_product
    ADD CONSTRAINT core_product_sku_key UNIQUE (sku);


--
-- Name: core_review core_review_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_review
    ADD CONSTRAINT core_review_pkey PRIMARY KEY (id);


--
-- Name: core_variant core_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_variant
    ADD CONSTRAINT core_variant_pkey PRIMARY KEY (id);


--
-- Name: core_variantitem core_variantitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_variantitem
    ADD CONSTRAINT core_variantitem_pkey PRIMARY KEY (id);


--
-- Name: customer_address customer_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_pkey PRIMARY KEY (id);


--
-- Name: customer_notifications customer_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_notifications
    ADD CONSTRAINT customer_notifications_pkey PRIMARY KEY (id);


--
-- Name: customer_wishlist customer_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_wishlist
    ADD CONSTRAINT customer_wishlist_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: userauths_profile userauths_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_profile
    ADD CONSTRAINT userauths_profile_pkey PRIMARY KEY (id);


--
-- Name: userauths_profile userauths_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_profile
    ADD CONSTRAINT userauths_profile_user_id_key UNIQUE (user_id);


--
-- Name: userauths_user userauths_user_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user
    ADD CONSTRAINT userauths_user_email_key UNIQUE (email);


--
-- Name: userauths_user_groups userauths_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user_groups
    ADD CONSTRAINT userauths_user_groups_pkey PRIMARY KEY (id);


--
-- Name: userauths_user_groups userauths_user_groups_user_id_group_id_e032b670_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user_groups
    ADD CONSTRAINT userauths_user_groups_user_id_group_id_e032b670_uniq UNIQUE (user_id, group_id);


--
-- Name: userauths_user userauths_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user
    ADD CONSTRAINT userauths_user_pkey PRIMARY KEY (id);


--
-- Name: userauths_user_user_permissions userauths_user_user_perm_user_id_permission_id_5423ee7a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user_user_permissions
    ADD CONSTRAINT userauths_user_user_perm_user_id_permission_id_5423ee7a_uniq UNIQUE (user_id, permission_id);


--
-- Name: userauths_user_user_permissions userauths_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user_user_permissions
    ADD CONSTRAINT userauths_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: userauths_user userauths_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user
    ADD CONSTRAINT userauths_user_username_key UNIQUE (username);


--
-- Name: vendor_bankaccount vendor_bankaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_bankaccount
    ADD CONSTRAINT vendor_bankaccount_pkey PRIMARY KEY (id);


--
-- Name: vendor_bankaccount vendor_bankaccount_vendor_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_bankaccount
    ADD CONSTRAINT vendor_bankaccount_vendor_id_key UNIQUE (vendor_id);


--
-- Name: vendor_notifications vendor_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_notifications
    ADD CONSTRAINT vendor_notifications_pkey PRIMARY KEY (id);


--
-- Name: vendor_payout vendor_payout_payout_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_payout
    ADD CONSTRAINT vendor_payout_payout_id_key UNIQUE (payout_id);


--
-- Name: vendor_payout vendor_payout_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_payout
    ADD CONSTRAINT vendor_payout_pkey PRIMARY KEY (id);


--
-- Name: vendor_vendor vendor_vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_vendor
    ADD CONSTRAINT vendor_vendor_pkey PRIMARY KEY (id);


--
-- Name: vendor_vendor vendor_vendor_slug_e7b8f5a5_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_vendor
    ADD CONSTRAINT vendor_vendor_slug_e7b8f5a5_uniq UNIQUE (slug);


--
-- Name: vendor_vendor vendor_vendor_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_vendor
    ADD CONSTRAINT vendor_vendor_user_id_key UNIQUE (user_id);


--
-- Name: vendor_vendor vendor_vendor_vid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_vendor
    ADD CONSTRAINT vendor_vendor_vid_key UNIQUE (vid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: core_cart_product_id_8a783d81; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_cart_product_id_8a783d81 ON public.core_cart USING btree (product_id);


--
-- Name: core_cart_user_id_2ebeb843; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_cart_user_id_2ebeb843 ON public.core_cart USING btree (user_id);


--
-- Name: core_category_slug_384eca9c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_category_slug_384eca9c_like ON public.core_category USING btree (slug varchar_pattern_ops);


--
-- Name: core_coupon_vendor_id_9ed91c98; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_coupon_vendor_id_9ed91c98 ON public.core_coupon USING btree (vendor_id);


--
-- Name: core_gallery_gid_1e2915ef_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_gallery_gid_1e2915ef_like ON public.core_gallery USING btree (gid varchar_pattern_ops);


--
-- Name: core_gallery_product_id_4087242a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_gallery_product_id_4087242a ON public.core_gallery USING btree (product_id);


--
-- Name: core_order_address_id_caf8cd86; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_order_address_id_caf8cd86 ON public.core_order USING btree (address_id);


--
-- Name: core_order_coupons_coupon_id_d40b2e9c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_order_coupons_coupon_id_d40b2e9c ON public.core_order_coupons USING btree (coupon_id);


--
-- Name: core_order_coupons_order_id_ccd78002; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_order_coupons_order_id_ccd78002 ON public.core_order_coupons USING btree (order_id);


--
-- Name: core_order_customer_id_9e4576b7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_order_customer_id_9e4576b7 ON public.core_order USING btree (customer_id);


--
-- Name: core_order_oid_dc5a6b9a_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_order_oid_dc5a6b9a_like ON public.core_order USING btree (oid varchar_pattern_ops);


--
-- Name: core_order_vendors_order_id_ce9cc052; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_order_vendors_order_id_ce9cc052 ON public.core_order_vendors USING btree (order_id);


--
-- Name: core_order_vendors_user_id_f0b37024; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_order_vendors_user_id_f0b37024 ON public.core_order_vendors USING btree (user_id);


--
-- Name: core_orderitem_coupon_coupon_id_7d81e292; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_orderitem_coupon_coupon_id_7d81e292 ON public.core_orderitem_coupon USING btree (coupon_id);


--
-- Name: core_orderitem_coupon_orderitem_id_9d18c688; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_orderitem_coupon_orderitem_id_9d18c688 ON public.core_orderitem_coupon USING btree (orderitem_id);


--
-- Name: core_orderitem_order_id_30929c10; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_orderitem_order_id_30929c10 ON public.core_orderitem USING btree (order_id);


--
-- Name: core_orderitem_product_id_0c2047cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_orderitem_product_id_0c2047cd ON public.core_orderitem USING btree (product_id);


--
-- Name: core_orderitem_vendor_id_2de729af; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_orderitem_vendor_id_2de729af ON public.core_orderitem USING btree (vendor_id);


--
-- Name: core_product_category_id_b9d8ff9f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_product_category_id_b9d8ff9f ON public.core_product USING btree (category_id);


--
-- Name: core_product_sku_6168965a_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_product_sku_6168965a_like ON public.core_product USING btree (sku varchar_pattern_ops);


--
-- Name: core_product_slug_8cf0d080; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_product_slug_8cf0d080 ON public.core_product USING btree (slug);


--
-- Name: core_product_slug_8cf0d080_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_product_slug_8cf0d080_like ON public.core_product USING btree (slug varchar_pattern_ops);


--
-- Name: core_product_vendor_id_42113a3f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_product_vendor_id_42113a3f ON public.core_product USING btree (vendor_id);


--
-- Name: core_review_product_id_27ba91fa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_review_product_id_27ba91fa ON public.core_review USING btree (product_id);


--
-- Name: core_review_user_id_b6106194; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_review_user_id_b6106194 ON public.core_review USING btree (user_id);


--
-- Name: core_variant_product_id_d6e437a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_variant_product_id_d6e437a8 ON public.core_variant USING btree (product_id);


--
-- Name: core_variantitem_variant_id_4c654dc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_variantitem_variant_id_4c654dc0 ON public.core_variantitem USING btree (variant_id);


--
-- Name: customer_address_user_id_a05f8db3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customer_address_user_id_a05f8db3 ON public.customer_address USING btree (user_id);


--
-- Name: customer_notifications_user_id_2fcb37af; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customer_notifications_user_id_2fcb37af ON public.customer_notifications USING btree (user_id);


--
-- Name: customer_wishlist_product_id_fd71d12a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customer_wishlist_product_id_fd71d12a ON public.customer_wishlist USING btree (product_id);


--
-- Name: customer_wishlist_user_id_f93ac5a1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customer_wishlist_user_id_f93ac5a1 ON public.customer_wishlist USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: userauths_user_email_5e5b59e6_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX userauths_user_email_5e5b59e6_like ON public.userauths_user USING btree (email varchar_pattern_ops);


--
-- Name: userauths_user_groups_group_id_2bd3d457; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX userauths_user_groups_group_id_2bd3d457 ON public.userauths_user_groups USING btree (group_id);


--
-- Name: userauths_user_groups_user_id_70ad3415; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX userauths_user_groups_user_id_70ad3415 ON public.userauths_user_groups USING btree (user_id);


--
-- Name: userauths_user_user_permissions_permission_id_0e980ebe; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX userauths_user_user_permissions_permission_id_0e980ebe ON public.userauths_user_user_permissions USING btree (permission_id);


--
-- Name: userauths_user_user_permissions_user_id_7dc84ca3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX userauths_user_user_permissions_user_id_7dc84ca3 ON public.userauths_user_user_permissions USING btree (user_id);


--
-- Name: userauths_user_username_e44feab8_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX userauths_user_username_e44feab8_like ON public.userauths_user USING btree (username varchar_pattern_ops);


--
-- Name: vendor_notifications_order_id_5b66e8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vendor_notifications_order_id_5b66e8eb ON public.vendor_notifications USING btree (order_id);


--
-- Name: vendor_notifications_user_id_5ba77fdc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vendor_notifications_user_id_5ba77fdc ON public.vendor_notifications USING btree (user_id);


--
-- Name: vendor_payout_item_id_43a28a21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vendor_payout_item_id_43a28a21 ON public.vendor_payout USING btree (item_id);


--
-- Name: vendor_payout_payout_id_d2964b2c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vendor_payout_payout_id_d2964b2c_like ON public.vendor_payout USING btree (payout_id varchar_pattern_ops);


--
-- Name: vendor_payout_vendor_id_9b447cb5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vendor_payout_vendor_id_9b447cb5 ON public.vendor_payout USING btree (vendor_id);


--
-- Name: vendor_vendor_slug_e7b8f5a5_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vendor_vendor_slug_e7b8f5a5_like ON public.vendor_vendor USING btree (slug varchar_pattern_ops);


--
-- Name: vendor_vendor_vid_d747cd50_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX vendor_vendor_vid_d747cd50_like ON public.vendor_vendor USING btree (vid varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_cart core_cart_product_id_8a783d81_fk_core_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_cart
    ADD CONSTRAINT core_cart_product_id_8a783d81_fk_core_product_id FOREIGN KEY (product_id) REFERENCES public.core_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_cart core_cart_user_id_2ebeb843_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_cart
    ADD CONSTRAINT core_cart_user_id_2ebeb843_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_coupon core_coupon_vendor_id_9ed91c98_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_coupon
    ADD CONSTRAINT core_coupon_vendor_id_9ed91c98_fk_userauths_user_id FOREIGN KEY (vendor_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_gallery core_gallery_product_id_4087242a_fk_core_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_gallery
    ADD CONSTRAINT core_gallery_product_id_4087242a_fk_core_product_id FOREIGN KEY (product_id) REFERENCES public.core_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order core_order_address_id_caf8cd86_fk_customer_address_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_address_id_caf8cd86_fk_customer_address_id FOREIGN KEY (address_id) REFERENCES public.customer_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order_coupons core_order_coupons_coupon_id_d40b2e9c_fk_core_coupon_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order_coupons
    ADD CONSTRAINT core_order_coupons_coupon_id_d40b2e9c_fk_core_coupon_id FOREIGN KEY (coupon_id) REFERENCES public.core_coupon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order_coupons core_order_coupons_order_id_ccd78002_fk_core_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order_coupons
    ADD CONSTRAINT core_order_coupons_order_id_ccd78002_fk_core_order_id FOREIGN KEY (order_id) REFERENCES public.core_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order core_order_customer_id_9e4576b7_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_customer_id_9e4576b7_fk_userauths_user_id FOREIGN KEY (customer_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order_vendors core_order_vendors_order_id_ce9cc052_fk_core_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order_vendors
    ADD CONSTRAINT core_order_vendors_order_id_ce9cc052_fk_core_order_id FOREIGN KEY (order_id) REFERENCES public.core_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order_vendors core_order_vendors_user_id_f0b37024_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_order_vendors
    ADD CONSTRAINT core_order_vendors_user_id_f0b37024_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem_coupon core_orderitem_coupo_orderitem_id_9d18c688_fk_core_orde; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_orderitem_coupon
    ADD CONSTRAINT core_orderitem_coupo_orderitem_id_9d18c688_fk_core_orde FOREIGN KEY (orderitem_id) REFERENCES public.core_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem_coupon core_orderitem_coupon_coupon_id_7d81e292_fk_core_coupon_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_orderitem_coupon
    ADD CONSTRAINT core_orderitem_coupon_coupon_id_7d81e292_fk_core_coupon_id FOREIGN KEY (coupon_id) REFERENCES public.core_coupon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem core_orderitem_order_id_30929c10_fk_core_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_order_id_30929c10_fk_core_order_id FOREIGN KEY (order_id) REFERENCES public.core_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem core_orderitem_product_id_0c2047cd_fk_core_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_product_id_0c2047cd_fk_core_product_id FOREIGN KEY (product_id) REFERENCES public.core_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem core_orderitem_vendor_id_2de729af_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_vendor_id_2de729af_fk_userauths_user_id FOREIGN KEY (vendor_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_product core_product_category_id_b9d8ff9f_fk_core_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_product
    ADD CONSTRAINT core_product_category_id_b9d8ff9f_fk_core_category_id FOREIGN KEY (category_id) REFERENCES public.core_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_product core_product_vendor_id_42113a3f_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_product
    ADD CONSTRAINT core_product_vendor_id_42113a3f_fk_userauths_user_id FOREIGN KEY (vendor_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_review core_review_product_id_27ba91fa_fk_core_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_review
    ADD CONSTRAINT core_review_product_id_27ba91fa_fk_core_product_id FOREIGN KEY (product_id) REFERENCES public.core_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_review core_review_user_id_b6106194_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_review
    ADD CONSTRAINT core_review_user_id_b6106194_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_variant core_variant_product_id_d6e437a8_fk_core_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_variant
    ADD CONSTRAINT core_variant_product_id_d6e437a8_fk_core_product_id FOREIGN KEY (product_id) REFERENCES public.core_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_variantitem core_variantitem_variant_id_4c654dc0_fk_core_variant_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.core_variantitem
    ADD CONSTRAINT core_variantitem_variant_id_4c654dc0_fk_core_variant_id FOREIGN KEY (variant_id) REFERENCES public.core_variant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_address customer_address_user_id_a05f8db3_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_user_id_a05f8db3_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_notifications customer_notifications_user_id_2fcb37af_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_notifications
    ADD CONSTRAINT customer_notifications_user_id_2fcb37af_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_wishlist customer_wishlist_product_id_fd71d12a_fk_core_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_wishlist
    ADD CONSTRAINT customer_wishlist_product_id_fd71d12a_fk_core_product_id FOREIGN KEY (product_id) REFERENCES public.core_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_wishlist customer_wishlist_user_id_f93ac5a1_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_wishlist
    ADD CONSTRAINT customer_wishlist_user_id_f93ac5a1_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userauths_profile userauths_profile_user_id_bdea9f7e_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_profile
    ADD CONSTRAINT userauths_profile_user_id_bdea9f7e_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userauths_user_groups userauths_user_groups_group_id_2bd3d457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user_groups
    ADD CONSTRAINT userauths_user_groups_group_id_2bd3d457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userauths_user_groups userauths_user_groups_user_id_70ad3415_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user_groups
    ADD CONSTRAINT userauths_user_groups_user_id_70ad3415_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userauths_user_user_permissions userauths_user_user__permission_id_0e980ebe_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user_user_permissions
    ADD CONSTRAINT userauths_user_user__permission_id_0e980ebe_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userauths_user_user_permissions userauths_user_user__user_id_7dc84ca3_fk_userauths; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userauths_user_user_permissions
    ADD CONSTRAINT userauths_user_user__user_id_7dc84ca3_fk_userauths FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendor_bankaccount vendor_bankaccount_vendor_id_09249edd_fk_vendor_vendor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_bankaccount
    ADD CONSTRAINT vendor_bankaccount_vendor_id_09249edd_fk_vendor_vendor_id FOREIGN KEY (vendor_id) REFERENCES public.vendor_vendor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendor_notifications vendor_notifications_order_id_5b66e8eb_fk_core_orderitem_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_notifications
    ADD CONSTRAINT vendor_notifications_order_id_5b66e8eb_fk_core_orderitem_id FOREIGN KEY (order_id) REFERENCES public.core_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendor_notifications vendor_notifications_user_id_5ba77fdc_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_notifications
    ADD CONSTRAINT vendor_notifications_user_id_5ba77fdc_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendor_payout vendor_payout_item_id_43a28a21_fk_core_orderitem_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_payout
    ADD CONSTRAINT vendor_payout_item_id_43a28a21_fk_core_orderitem_id FOREIGN KEY (item_id) REFERENCES public.core_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendor_payout vendor_payout_vendor_id_9b447cb5_fk_vendor_vendor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_payout
    ADD CONSTRAINT vendor_payout_vendor_id_9b447cb5_fk_vendor_vendor_id FOREIGN KEY (vendor_id) REFERENCES public.vendor_vendor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendor_vendor vendor_vendor_user_id_424f99f3_fk_userauths_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_vendor
    ADD CONSTRAINT vendor_vendor_user_id_424f99f3_fk_userauths_user_id FOREIGN KEY (user_id) REFERENCES public.userauths_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

