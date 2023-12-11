--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-05-29 21:55:37

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16443)
-- Name: basket_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_products (
    quantity integer DEFAULT 1,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    basket_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.basket_products OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16412)
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16411)
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets_id_seq OWNER TO postgres;

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 216
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- TOC entry 219 (class 1259 OID 16419)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16418)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 228 (class 1259 OID 16489)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    order_id integer
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16488)
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- TOC entry 226 (class 1259 OID 16474)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    amount integer NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    comment character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16473)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 225
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 224 (class 1259 OID 16460)
-- Name: product_props; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_props (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer
);


ALTER TABLE public.product_props OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16459)
-- Name: product_props_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_props_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_props_id_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_props_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_props_id_seq OWNED BY public.product_props.id;


--
-- TOC entry 221 (class 1259 OID 16428)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    calories integer NOT NULL,
    image character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16427)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 220
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3209 (class 2604 OID 16415)
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 16422)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 16492)
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 16477)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 16463)
-- Name: product_props id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props ALTER COLUMN id SET DEFAULT nextval('public.product_props_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 16431)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3207 (class 2604 OID 16403)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3395 (class 0 OID 16443)
-- Dependencies: 222
-- Data for Name: basket_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3390 (class 0 OID 16412)
-- Dependencies: 217
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.baskets (id, created_at, updated_at) VALUES (1, '2023-05-27 20:33:12.973+03', '2023-05-27 20:33:12.973+03');


--
-- TOC entry 3392 (class 0 OID 16419)
-- Dependencies: 219
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, name, created_at, updated_at) VALUES (1, 'Первое', '2023-05-27 20:43:34.115+03', '2023-05-27 20:43:34.115+03');
INSERT INTO public.categories (id, name, created_at, updated_at) VALUES (2, 'Второе', '2023-05-27 20:43:43.088+03', '2023-05-27 20:43:43.088+03');
INSERT INTO public.categories (id, name, created_at, updated_at) VALUES (3, 'Салаты', '2023-05-27 20:43:52.889+03', '2023-05-27 20:43:52.889+03');
INSERT INTO public.categories (id, name, created_at, updated_at) VALUES (4, 'Десерты', '2023-05-27 20:43:59.489+03', '2023-05-27 20:43:59.489+03');
INSERT INTO public.categories (id, name, created_at, updated_at) VALUES (5, 'Выпечка', '2023-05-27 20:44:05.161+03', '2023-05-27 20:44:05.161+03');


--
-- TOC entry 3401 (class 0 OID 16489)
-- Dependencies: 228
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (1, '"Анна Павлова" 120 гр.', 108, 1, '2023-05-27 23:32:31.312+03', '2023-05-27 23:32:31.312+03', 1);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (2, 'Солянка мясная 300гр', 124, 1, '2023-05-27 23:32:31.314+03', '2023-05-27 23:32:31.314+03', 1);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (3, 'Тилапия с помид. 130гр', 169, 1, '2023-05-27 23:32:31.315+03', '2023-05-27 23:32:31.315+03', 1);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (4, 'Форель с овощами 250гр', 295, 1, '2023-05-27 23:34:52.279+03', '2023-05-27 23:34:52.279+03', 2);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (5, 'Десерт "Экзотика" 125гр', 104, 1, '2023-05-27 23:34:52.283+03', '2023-05-27 23:34:52.283+03', 2);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (6, 'Лагман 250гр', 104, 1, '2023-05-27 23:34:52.284+03', '2023-05-27 23:34:52.284+03', 2);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (7, 'Голубцы из курицы 140гр', 106, 1, '2023-05-27 23:34:52.285+03', '2023-05-27 23:34:52.285+03', 2);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (8, 'Ассорти грибное 100гр.', 108, 1, '2023-05-29 21:16:50.083+03', '2023-05-29 21:16:50.083+03', 3);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (9, 'Буженина 100гр', 135, 1, '2023-05-29 21:16:50.085+03', '2023-05-29 21:16:50.085+03', 3);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (10, '"Анна Павлова" 120 гр.', 108, 1, '2023-05-29 21:16:50.086+03', '2023-05-29 21:16:50.086+03', 3);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (11, 'Голубцы из курицы 140гр', 106, 1, '2023-05-29 21:16:50.087+03', '2023-05-29 21:16:50.087+03', 3);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (12, 'Круассан с сёмгой 150гр', 149, 1, '2023-05-29 21:17:49.951+03', '2023-05-29 21:17:49.951+03', 4);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (13, 'Лапша куриная 200гр', 76, 1, '2023-05-29 21:17:49.952+03', '2023-05-29 21:17:49.952+03', 4);
INSERT INTO public.order_items (id, name, price, quantity, created_at, updated_at, order_id) VALUES (14, 'Блинчики 2 шт.', 48, 1, '2023-05-29 21:17:49.953+03', '2023-05-29 21:17:49.953+03', 4);


--
-- TOC entry 3399 (class 0 OID 16474)
-- Dependencies: 226
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, name, email, phone, address, amount, status, comment, created_at, updated_at, user_id) VALUES (1, 'Виктория Оганесян', 'oganesyan.vika@inbox.ru', '89287684729', 'г. Ростов-на-Дону, просп. Мира, 9', 401, 0, 'Пожалуйста, доставьте заказ быстро и горячим!', '2023-05-27 23:32:31.306+03', '2023-05-27 23:32:31.306+03', NULL);
INSERT INTO public.orders (id, name, email, phone, address, amount, status, comment, created_at, updated_at, user_id) VALUES (2, 'Виктория Оганесян', 'oganesyan.vika@inbox.ru', '89287684729', 'г. Ростов-на-Дону, просп. Мира, 9', 609, 2, 'Спасибо!', '2023-05-27 23:34:52.269+03', '2023-05-27 23:34:52.269+03', NULL);
INSERT INTO public.orders (id, name, email, phone, address, amount, status, comment, created_at, updated_at, user_id) VALUES (3, 'Виктория Оганесян', 'oganesyan.vika@inbox.ru', '89287684729', 'г. Ростов-на-Дону, просп. Мира, 9', 457, 1, 'Спасибо!', '2023-05-29 21:16:50.078+03', '2023-05-29 21:16:50.078+03', 4);
INSERT INTO public.orders (id, name, email, phone, address, amount, status, comment, created_at, updated_at, user_id) VALUES (4, 'Виктория Оганесян', 'oganesyan.vika@inbox.ru', '89287684729', 'г. Ростов-на-Дону, просп. Мира, 9', 273, 2, 'Пожалуйста, доставьте заказ быстро и горячим!', '2023-05-29 21:17:49.949+03', '2023-05-29 21:17:49.949+03', 4);


--
-- TOC entry 3397 (class 0 OID 16460)
-- Dependencies: 224
-- Data for Name: product_props; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (1, 'Состав', 'грибы маринованные, масло растительное, лук репчатый, специи', '2023-05-27 20:49:18.569+03', '2023-05-27 20:49:18.569+03', 1);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (2, 'Вес', '100 гр.', '2023-05-27 20:49:18.571+03', '2023-05-27 20:49:18.571+03', 1);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (3, 'Калорийность', '288 ккал.', '2023-05-27 20:49:18.571+03', '2023-05-27 20:49:18.571+03', 1);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (4, 'Состав', 'водоросли вакамэ (чука), кунжут, соевый соус, вода питьевая, кунжутное масло, крахмал, лимонный сок, арахис, сахар, горчица', '2023-05-27 20:53:36.513+03', '2023-05-27 20:53:36.513+03', 2);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (5, 'Вес', '120 гр.', '2023-05-27 20:53:36.514+03', '2023-05-27 20:53:36.514+03', 2);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (6, 'Калорийность', '194 ккал.', '2023-05-27 20:53:36.516+03', '2023-05-27 20:53:36.516+03', 2);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (7, 'Состав', 'форель, специи, помидоры, баклажаны, перец болгарский, лимон', '2023-05-27 20:56:18.55+03', '2023-05-27 20:56:18.55+03', 3);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (8, 'Вес', '250 гр.', '2023-05-27 20:56:18.551+03', '2023-05-27 20:56:18.551+03', 3);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (9, 'Калорийность', '239 ккал.', '2023-05-27 20:56:18.552+03', '2023-05-27 20:56:18.552+03', 3);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (10, 'Состав', 'мясо индейки, специи, фирменный соус', '2023-05-27 20:59:35.947+03', '2023-05-27 20:59:35.947+03', 4);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (11, 'Вес', '95 гр.', '2023-05-27 20:59:35.948+03', '2023-05-27 20:59:35.948+03', 4);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (12, 'Калорийность', '230 ккал.', '2023-05-27 20:59:35.949+03', '2023-05-27 20:59:35.949+03', 4);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (13, 'Состав', 'яйцо куриное, желатин, сливки, сахарная пудра, ананас консервированный', '2023-05-27 21:01:59.684+03', '2023-05-27 21:01:59.684+03', 5);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (14, 'Вес', '125 гр.', '2023-05-27 21:01:59.685+03', '2023-05-27 21:01:59.685+03', 5);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (15, 'Калорийность', '234 ккал.', '2023-05-27 21:01:59.685+03', '2023-05-27 21:01:59.685+03', 5);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (16, 'Состав', 'мука, масло сливочное, масло растительное, соль, вода питьевая, сёмга слабосолёная, огурец, зелень', '2023-05-27 21:10:05.976+03', '2023-05-27 21:10:05.976+03', 6);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (17, 'Вес', '150 гр.', '2023-05-27 21:10:05.977+03', '2023-05-27 21:10:05.977+03', 6);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (18, 'Калорийность', '237 ккал.', '2023-05-27 21:10:05.978+03', '2023-05-27 21:10:05.978+03', 6);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (19, 'Состав', 'мука, масло сливочное, яйцо куриное, соль, вода питьевая, малина, сахар, сахарная пудра', '2023-05-27 21:14:50.114+03', '2023-05-27 21:14:50.114+03', 7);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (20, 'Вес', '90 гр.', '2023-05-27 21:14:50.115+03', '2023-05-27 21:14:50.115+03', 7);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (21, 'Калорийность', '201 ккал.', '2023-05-27 21:14:50.116+03', '2023-05-27 21:14:50.116+03', 7);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (22, 'Состав', 'свинина, соль, специи', '2023-05-27 22:03:45.83+03', '2023-05-27 22:03:45.83+03', 8);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (23, 'Вес', '100 гр.', '2023-05-27 22:03:45.831+03', '2023-05-27 22:03:45.831+03', 8);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (24, 'Калорийность', '237 ккал.', '2023-05-27 22:03:45.832+03', '2023-05-27 22:03:45.832+03', 8);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (25, 'Состав', 'яйцо куриное (белки), сахарная пудра, кукурузный крахмал, лимонный сок, ягоды', '2023-05-27 22:05:55.388+03', '2023-05-27 22:05:55.388+03', 9);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (26, 'Вес', '120 гр.', '2023-05-27 22:05:55.389+03', '2023-05-27 22:05:55.389+03', 9);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (27, 'Калорийность', '164 ккал.', '2023-05-27 22:05:55.39+03', '2023-05-27 22:05:55.39+03', 9);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (28, 'Состав', 'вода питьевая, лук репчатый, морковь, перец болгарский, масло растительное, баранина, помидоры, картофель, зелень, макаронные изделия, специи, соль, сахар', '2023-05-27 22:10:18.088+03', '2023-05-27 22:10:18.088+03', 10);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (29, 'Вес', '250 гр.', '2023-05-27 22:10:18.089+03', '2023-05-27 22:10:18.089+03', 10);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (30, 'Калорийность', '234 ккал.', '2023-05-27 22:10:18.09+03', '2023-05-27 22:10:18.09+03', 10);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (31, 'Состав', 'вода питьевая, яичная лапша, лук репчатый, морковь, яйцо куриное, курица, масло растительное, соль, специи, зелень', '2023-05-27 22:14:46.355+03', '2023-05-27 22:14:46.355+03', 11);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (32, 'Вес', '200 гр.', '2023-05-27 22:14:46.356+03', '2023-05-27 22:14:46.356+03', 11);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (33, 'Калорийность', '275 ккал.', '2023-05-27 22:14:46.357+03', '2023-05-27 22:14:46.357+03', 11);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (34, 'Состав', 'вода питьевая, свинина, колбаса копчёная, ветчина, сосиски, лук репчатый, огурцы солёные, рассол огуречный, маслины без косточек, томат-паста, масло растительное, соль, специи ', '2023-05-27 22:18:08.67+03', '2023-05-27 22:18:08.67+03', 12);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (35, 'Вес', '300 гр.', '2023-05-27 22:18:08.671+03', '2023-05-27 22:18:08.671+03', 12);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (36, 'Калорийность', '217 ккал.', '2023-05-27 22:18:08.672+03', '2023-05-27 22:18:08.672+03', 12);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (37, 'Состав', 'вода питьевая, свекла, огурцы свежие, яйцо куриное, уксус, лук зелёный, сметана, соль, специи', '2023-05-27 22:21:23.177+03', '2023-05-27 22:21:23.177+03', 13);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (38, 'Вес', '300 гр.', '2023-05-27 22:21:23.178+03', '2023-05-27 22:21:23.178+03', 13);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (39, 'Калорийность', '206 ккал.', '2023-05-27 22:21:23.179+03', '2023-05-27 22:21:23.179+03', 13);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (40, 'Состав', 'вода питьевая, филе куриное, лук репчатый, картофель, стручковая фасоль, морковь, масло подсолнечное, чеснок, соль, специи', '2023-05-27 22:24:06.64+03', '2023-05-27 22:24:06.64+03', 14);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (41, 'Вес', '300 гр.', '2023-05-27 22:24:06.644+03', '2023-05-27 22:24:06.644+03', 14);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (42, 'Калорийность', '129 ккал.', '2023-05-27 22:24:06.645+03', '2023-05-27 22:24:06.645+03', 14);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (43, 'Состав', 'вода питьевая, шампиньоны, лук репчатый, картофель, сливки, масло растительное, соль, специи, зелень, сухарики', '2023-05-27 22:26:52.505+03', '2023-05-27 22:26:52.505+03', 15);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (44, 'Вес', '300 гр.', '2023-05-27 22:26:52.507+03', '2023-05-27 22:26:52.507+03', 15);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (45, 'Калорийность', '274 ккал.', '2023-05-27 22:26:52.508+03', '2023-05-27 22:26:52.508+03', 15);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (46, 'Состав', 'филе тилапии, соль, специи, фирменный соус, помидоры, сыр, лимон', '2023-05-27 22:31:08.845+03', '2023-05-27 22:31:08.845+03', 16);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (47, 'Вес', '130 гр.', '2023-05-27 22:31:08.846+03', '2023-05-27 22:31:08.846+03', 16);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (48, 'Калорийность', '249 ккал.', '2023-05-27 22:31:08.846+03', '2023-05-27 22:31:08.846+03', 16);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (49, 'Состав', 'фарш куриный, рис, лук репчатый, морковь, соль, специи, капуста белокочанная, вода питьевая, томат-паста, зелень', '2023-05-27 22:33:47.617+03', '2023-05-27 22:33:47.617+03', 17);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (50, 'Вес', '140 гр.', '2023-05-27 22:33:47.619+03', '2023-05-27 22:33:47.619+03', 17);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (51, 'Калорийность', '103 ккал.', '2023-05-27 22:33:47.62+03', '2023-05-27 22:33:47.62+03', 17);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (52, 'Состав', 'мясо куриное, соль, специи, грибы, масло подсолнечное, фирменный соус, сыр', '2023-05-27 22:36:37.774+03', '2023-05-27 22:36:37.774+03', 18);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (53, 'Вес', '130 гр.', '2023-05-27 22:36:37.776+03', '2023-05-27 22:36:37.776+03', 18);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (54, 'Калорийность', '226 ккал.', '2023-05-27 22:36:37.777+03', '2023-05-27 22:36:37.777+03', 18);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (55, 'Состав', 'редис, огурец, соль, специи, масло подсолнечное, яйцо перепелиное, ', '2023-05-27 22:39:38.5+03', '2023-05-27 22:39:38.5+03', 19);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (56, 'Вес', '170 гр.', '2023-05-27 22:39:38.501+03', '2023-05-27 22:39:38.501+03', 19);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (57, 'Калорийность', '220 ккал.', '2023-05-27 22:39:38.502+03', '2023-05-27 22:39:38.502+03', 19);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (58, 'Состав', 'яйцо куриное, крабовое мясо, кукуруза консервированная, рис, майонез, лук репчатый, зелень, соль', '2023-05-27 22:53:28.234+03', '2023-05-27 22:53:28.234+03', 20);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (59, 'Вес', '120 гр.', '2023-05-27 22:53:28.236+03', '2023-05-27 22:53:28.236+03', 20);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (60, 'Калорийность', '202 ккал.', '2023-05-27 22:53:28.237+03', '2023-05-27 22:53:28.237+03', 20);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (61, 'Состав', 'сельдь слабосолёная, масло оливковое, лук репчатый, зелень', '2023-05-27 22:55:45.132+03', '2023-05-27 22:55:45.132+03', 21);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (62, 'Вес', '65 гр.', '2023-05-27 22:55:45.133+03', '2023-05-27 22:55:45.133+03', 21);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (63, 'Калорийность', '101 ккал.', '2023-05-27 22:55:45.134+03', '2023-05-27 22:55:45.134+03', 21);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (64, 'Состав', 'морковь, майонез, сыр', '2023-05-27 22:57:01.495+03', '2023-05-27 22:57:01.495+03', 22);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (65, 'Вес', '100 гр.', '2023-05-27 22:57:01.496+03', '2023-05-27 22:57:01.496+03', 22);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (66, 'Калорийность', '127 ккал.', '2023-05-27 22:57:01.497+03', '2023-05-27 22:57:01.497+03', 22);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (67, 'Состав', 'мука, вода питьевая, масло сливочное, яйцо куриное, соль', '2023-05-27 22:59:27.563+03', '2023-05-27 22:59:27.563+03', 23);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (68, 'Вес', '70 гр.', '2023-05-27 22:59:27.565+03', '2023-05-27 22:59:27.565+03', 23);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (69, 'Калорийность', '149 ккал.', '2023-05-27 22:59:27.567+03', '2023-05-27 22:59:27.567+03', 23);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (70, 'Состав', 'яйцо куриное, сахар, мука, сливочное масло, сливочный сыр, сливки, сгущённое молоко, кокосовая стружка, миндаль', '2023-05-27 23:02:33.344+03', '2023-05-27 23:02:33.344+03', 24);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (71, 'Вес', '110 гр.', '2023-05-27 23:02:33.346+03', '2023-05-27 23:02:33.346+03', 24);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (72, 'Калорийность', '150 ккал.', '2023-05-27 23:02:33.346+03', '2023-05-27 23:02:33.346+03', 24);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (73, 'Состав', 'яйцо куриное, сахар, лимонный сок, кукурузный крахмал, миндаль, малина, маскарпоне', '2023-05-27 23:04:50.473+03', '2023-05-27 23:04:50.473+03', 25);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (74, 'Вес', '120 гр.', '2023-05-27 23:04:50.474+03', '2023-05-27 23:04:50.474+03', 25);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (75, 'Калорийность', '287 ккал.', '2023-05-27 23:04:50.475+03', '2023-05-27 23:04:50.475+03', 25);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (76, 'Состав', 'молоко, мука, соль, сахар, масло растительное, яйцо куриное, масло сливочное', '2023-05-27 23:09:51.271+03', '2023-05-27 23:09:51.271+03', 26);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (77, 'Количество', '2 шт.', '2023-05-27 23:09:51.272+03', '2023-05-27 23:09:51.272+03', 26);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (78, 'Калорийность', '160 ккал.', '2023-05-27 23:09:51.274+03', '2023-05-27 23:09:51.274+03', 26);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (79, 'Состав', 'вода питьевая, мука, дрожжи, сахар, соль, масло растительное, сосиска куриная, кунжут', '2023-05-27 23:11:46.441+03', '2023-05-27 23:11:46.441+03', 27);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (80, 'Вес', '110 гр.', '2023-05-27 23:11:46.443+03', '2023-05-27 23:11:46.443+03', 27);
INSERT INTO public.product_props (id, name, value, created_at, updated_at, product_id) VALUES (81, 'Калорийность', '242 ккал.', '2023-05-27 23:11:46.443+03', '2023-05-27 23:11:46.443+03', 27);


--
-- TOC entry 3394 (class 0 OID 16428)
-- Dependencies: 221
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (1, 'Ассорти грибное 100гр.', 108, 288, '11c62b8f-8a3a-4070-b644-7fe41c41c4bd.jpeg', '2023-05-27 20:49:18.517+03', '2023-05-27 20:49:18.517+03', 3);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (2, 'Чука салат 120гр', 96, 194, 'aa1bedb9-4bd5-476a-81e5-719b3980c630.jpeg', '2023-05-27 20:53:36.465+03', '2023-05-27 20:53:36.465+03', 3);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (3, 'Форель с овощами 250гр', 295, 239, '9024cd70-a289-44f8-bebe-4ee904bcfec3.jpeg', '2023-05-27 20:56:18.501+03', '2023-05-27 20:56:18.501+03', 2);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (4, 'Индейка гриль 95гр', 139, 230, 'c102f2e8-36dd-498a-a39b-c532de833f68.jpeg', '2023-05-27 20:59:35.899+03', '2023-05-27 20:59:35.899+03', 2);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (5, 'Десерт "Экзотика" 125гр', 104, 234, '8a68b4c2-ac60-4b00-9a9f-2fe60eec6960.jpeg', '2023-05-27 21:01:59.532+03', '2023-05-27 21:01:59.532+03', 4);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (6, 'Круассан с сёмгой 150гр', 149, 237, 'dc6623e5-3b52-4b64-bb00-cf8b03993d33.jpeg', '2023-05-27 21:10:05.929+03', '2023-05-27 21:10:05.929+03', 5);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (8, 'Буженина 100гр', 135, 237, 'a001dfba-5aa9-4a5b-857d-65bf0866ae5a.jpeg', '2023-05-27 22:03:45.782+03', '2023-05-27 22:03:45.782+03', 2);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (9, '"Анна Павлова" 120 гр.', 108, 164, '922bb3d0-b828-4ac2-83fe-125bf6b45e1d.jpeg', '2023-05-27 22:05:55.224+03', '2023-05-27 22:05:55.224+03', 4);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (10, 'Лагман 250гр', 104, 234, '625a049f-0a6a-45cf-9dcf-294664045a6c.jpeg', '2023-05-27 22:10:18.039+03', '2023-05-27 22:10:18.039+03', 1);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (11, 'Лапша куриная 200гр', 76, 275, 'f880cfae-722a-4c43-b999-0baa35cdbeed.jpeg', '2023-05-27 22:14:46.299+03', '2023-05-27 22:14:46.299+03', 1);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (12, 'Солянка мясная 300гр', 124, 217, '3606731d-581f-4eff-8765-d71a692a77a1.jpeg', '2023-05-27 22:18:08.614+03', '2023-05-27 22:18:08.614+03', 1);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (13, 'Свекольник 300гр', 82, 206, '56b076fe-5715-485a-aaef-ac91a923d8ee.jpeg', '2023-05-27 22:21:23.123+03', '2023-05-27 22:21:23.123+03', 1);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (14, 'Суп с кур. фрикад. 300гр', 94, 129, 'adf9e7b1-e79a-401e-9f3d-ed4fce2a1681.jpeg', '2023-05-27 22:24:06.584+03', '2023-05-27 22:24:06.584+03', 1);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (15, 'Суп-пюре грибной 300гр', 100, 274, 'fbcc3101-52a9-4bab-be6b-7614301441c2.jpeg', '2023-05-27 22:26:52.451+03', '2023-05-27 22:26:52.451+03', 1);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (16, 'Тилапия с помид. 130гр', 169, 249, 'd49c5ca3-7cc1-4eba-8c8d-ce0b43c6cf50.jpeg', '2023-05-27 22:31:08.791+03', '2023-05-27 22:31:08.791+03', 2);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (17, 'Голубцы из курицы 140гр', 106, 103, '57248f5d-4908-4c34-a025-3190d2846b7f.jpeg', '2023-05-27 22:33:47.56+03', '2023-05-27 22:33:47.56+03', 2);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (18, 'Курочка с гриб. 130гр', 154, 226, 'cb7bdf4d-a7c2-413b-987a-4a4710557adf.jpeg', '2023-05-27 22:36:37.718+03', '2023-05-27 22:36:37.718+03', 2);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (19, 'Редис с огурцом 170гр', 68, 220, '4502d58f-e2ec-40ee-a89c-94e933f398e3.jpeg', '2023-05-27 22:39:38.443+03', '2023-05-27 22:39:38.443+03', 3);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (20, 'Салат "Крабовый" 120гр', 88, 202, '8abec9eb-a71e-46c7-97c9-420db872eda3.jpeg', '2023-05-27 22:53:28.178+03', '2023-05-27 22:53:28.178+03', 3);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (21, 'Сельдь с луком 65гр', 72, 101, '8c96b420-21f8-4c35-afb4-450e6c41e721.jpeg', '2023-05-27 22:55:45.075+03', '2023-05-27 22:55:45.075+03', 3);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (22, 'Морковь с сыром 100гр', 49, 127, 'eccb2267-3307-4914-a4ba-a814fec98880.jpeg', '2023-05-27 22:57:01.438+03', '2023-05-27 22:57:01.438+03', 3);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (23, 'Заварное кольцо 70гр', 54, 149, 'b24b5baf-facc-4420-b863-52175812e8e4.jpeg', '2023-05-27 22:59:27.5+03', '2023-05-27 22:59:27.5+03', 4);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (24, 'Торт "Рафаэлло" 110гр', 106, 150, '465c95ac-bb48-4265-a247-9e43df728556.jpeg', '2023-05-27 23:02:33.285+03', '2023-05-27 23:02:33.285+03', 4);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (25, 'Меренговый рулет 120гр', 89, 287, '0c513759-46bd-4a07-a232-934746f5c9a6.jpeg', '2023-05-27 23:04:50.42+03', '2023-05-27 23:04:50.42+03', 4);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (7, 'Круассан с малиной 90гр', 70, 201, 'efa20bf8-e580-4911-a92f-717b7a4b1220.jpeg', '2023-05-27 21:14:50.064+03', '2023-05-27 23:05:53.198+03', 4);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (26, 'Блинчики 2 шт.', 48, 160, '34db8c48-fd82-48c2-a35f-384649eaaae9.jpeg', '2023-05-27 23:09:51.214+03', '2023-05-27 23:09:51.214+03', 5);
INSERT INTO public.products (id, name, price, calories, image, created_at, updated_at, category_id) VALUES (27, 'Сосиска в тесте 110гр', 49, 242, 'db48965f-dc72-4875-bd43-d8b5c0742bce.jpeg', '2023-05-27 23:11:46.382+03', '2023-05-27 23:11:46.382+03', 5);


--
-- TOC entry 3388 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, email, password, role, created_at, updated_at) VALUES (4, 'oganesyan.vika@inbox.ru', '$2b$05$.0pFCvT13zEHgdQ4JZYrqu6cdX4R5fjyH3UY8jH.WNOF7oxv29jAu', 'USER', '2023-05-29 21:14:08.103+03', '2023-05-29 21:14:08.103+03');
INSERT INTO public.users (id, email, password, role, created_at, updated_at) VALUES (5, 'oganesyan.vika@icloud.com', '$2b$05$DFb/OFbbEaa7WQOD85S1SuBWautfPZt/B9i7OavZxQs4m5y32PxRW', 'ADMIN', '2023-05-29 21:15:14.147+03', '2023-05-29 21:15:14.147+03');


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 216
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 1, true);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 14, true);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 225
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_props_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_props_id_seq', 81, true);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 220
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 27, true);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 3232 (class 2606 OID 16448)
-- Name: basket_products basket_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_pkey PRIMARY KEY (basket_id, product_id);


--
-- TOC entry 3222 (class 2606 OID 16417)
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 16426)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 3226 (class 2606 OID 16424)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 16494)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 16482)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 16467)
-- Name: product_props product_props_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 16437)
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- TOC entry 3230 (class 2606 OID 16435)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 16410)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3220 (class 2606 OID 16408)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 2606 OID 16449)
-- Name: basket_products basket_products_basket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_basket_id_fkey FOREIGN KEY (basket_id) REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3241 (class 2606 OID 16454)
-- Name: basket_products basket_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3244 (class 2606 OID 16495)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3243 (class 2606 OID 16483)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3242 (class 2606 OID 16468)
-- Name: product_props product_props_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3239 (class 2606 OID 16438)
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2023-05-29 21:55:37

--
-- PostgreSQL database dump complete
--

