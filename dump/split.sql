--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id integer NOT NULL,
    username character varying,
    amount numeric,
    user_id integer,
    currency_id integer
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_group (
    id integer NOT NULL,
    role_id integer,
    added_by_id integer,
    group_id integer,
    account_id integer
);


ALTER TABLE public.account_group OWNER TO postgres;

--
-- Name: account_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_group_id_seq OWNER TO postgres;

--
-- Name: account_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_group_id_seq OWNED BY public.account_group.id;


--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- Name: authorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorities (
    id integer NOT NULL,
    username character varying NOT NULL,
    authority integer NOT NULL
);


ALTER TABLE public.authorities OWNER TO postgres;

--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    id integer NOT NULL,
    title character varying,
    exchange_rate numeric,
    change_time timestamp without time zone
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currency_id_seq OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;


--
-- Name: expense; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expense (
    id integer NOT NULL,
    title character varying,
    amount numeric,
    creation_date timestamp without time zone,
    paid boolean NOT NULL,
    author_id integer,
    currency_id integer
);


ALTER TABLE public.expense OWNER TO postgres;

--
-- Name: expense_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expense_id_seq OWNER TO postgres;

--
-- Name: expense_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expense_id_seq OWNED BY public.expense.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."group" (
    id integer NOT NULL,
    title character varying,
    creator_id integer
);


ALTER TABLE public."group" OWNER TO postgres;

--
-- Name: group_expense; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_expense (
    id integer NOT NULL,
    expense_id integer,
    group_id integer
);


ALTER TABLE public.group_expense OWNER TO postgres;

--
-- Name: group_expense_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_expense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_expense_id_seq OWNER TO postgres;

--
-- Name: group_expense_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_expense_id_seq OWNED BY public.group_expense.id;


--
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_id_seq OWNER TO postgres;

--
-- Name: group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_id_seq OWNED BY public."group".id;


--
-- Name: group_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_role (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.group_role OWNER TO postgres;

--
-- Name: group_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_role_id_seq OWNER TO postgres;

--
-- Name: group_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_role_id_seq OWNED BY public.group_role.id;


--
-- Name: individual_expense; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individual_expense (
    id integer NOT NULL,
    expense_id integer,
    user_id integer
);


ALTER TABLE public.individual_expense OWNER TO postgres;

--
-- Name: individual_expense_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.individual_expense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.individual_expense_id_seq OWNER TO postgres;

--
-- Name: individual_expense_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.individual_expense_id_seq OWNED BY public.individual_expense.id;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    amount numeric,
    currency_id integer,
    lander_id integer,
    receiver_id integer,
    expense_id integer
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_id_seq OWNER TO postgres;

--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: user_authorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_authorities (
    id integer NOT NULL,
    authorities character varying NOT NULL
);


ALTER TABLE public.user_authorities OWNER TO postgres;

--
-- Name: user_authorities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_authorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_authorities_id_seq OWNER TO postgres;

--
-- Name: user_authorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_authorities_id_seq OWNED BY public.user_authorities.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    enabled boolean NOT NULL,
    phone_number character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
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
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- Name: account_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_group ALTER COLUMN id SET DEFAULT nextval('public.account_group_id_seq'::regclass);


--
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- Name: expense id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense ALTER COLUMN id SET DEFAULT nextval('public.expense_id_seq'::regclass);


--
-- Name: group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group" ALTER COLUMN id SET DEFAULT nextval('public.group_id_seq'::regclass);


--
-- Name: group_expense id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_expense ALTER COLUMN id SET DEFAULT nextval('public.group_expense_id_seq'::regclass);


--
-- Name: group_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role ALTER COLUMN id SET DEFAULT nextval('public.group_role_id_seq'::regclass);


--
-- Name: individual_expense id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_expense ALTER COLUMN id SET DEFAULT nextval('public.individual_expense_id_seq'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- Name: user_authorities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_authorities ALTER COLUMN id SET DEFAULT nextval('public.user_authorities_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.account VALUES (2, 'admin@gmail.com', 5, 2, 1);
INSERT INTO public.account VALUES (3, '34n@gmail.com', 24, 3, 1);
INSERT INTO public.account VALUES (1, 'qwe@gmail.com', 6, 1, 1);


--
-- Data for Name: account_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.account_group VALUES (1, 1, 2, 1, 2);
INSERT INTO public.account_group VALUES (2, 1, 2, 2, 2);
INSERT INTO public.account_group VALUES (3, 1, 2, 3, 2);
INSERT INTO public.account_group VALUES (4, 2, 2, 1, 1);
INSERT INTO public.account_group VALUES (5, 2, 2, 1, 3);


--
-- Data for Name: authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.authorities VALUES (1, 'qwe@gmail.com', 0);
INSERT INTO public.authorities VALUES (2, 'admin@gmail.com', 0);
INSERT INTO public.authorities VALUES (3, '34n@gmail.com', 0);


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.currency VALUES (1, 'USD', 1, '2022-06-08 19:38:00.37576');
INSERT INTO public.currency VALUES (2, 'EUR', 1.13, '2022-06-08 19:38:00.37576');
INSERT INTO public.currency VALUES (3, 'UAH', 0.037, '2022-06-08 19:38:00.37576');


--
-- Data for Name: expense; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.expense VALUES (1, 'food', 5, '2022-06-08 19:38:47.2', false, 2, 1);
INSERT INTO public.expense VALUES (2, 'food', 11, '2022-06-08 19:39:03.102', false, 2, 1);
INSERT INTO public.expense VALUES (3, 'food', 7, '2022-06-08 19:39:39.496', false, 2, 1);
INSERT INTO public.expense VALUES (4, 'buy game', 255, '2022-06-08 19:40:27.346', false, 1, 1);
INSERT INTO public.expense VALUES (5, 'buy paper for printer', 7, '2022-06-08 19:41:47.863', false, 1, 1);
INSERT INTO public.expense VALUES (6, 'food', 15, '2022-06-08 20:16:13.393', false, 2, 1);


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.flyway_schema_history VALUES (1, '20220117014750', 'add users table', 'SQL', 'V20220117014750__add_users_table.sql', 1701833815, 'postgres', '2022-06-08 19:38:00.190413', 12, true);
INSERT INTO public.flyway_schema_history VALUES (2, '20220117014820', 'add user authorities table', 'SQL', 'V20220117014820__add_user_authorities_table.sql', -1814568499, 'postgres', '2022-06-08 19:38:00.211388', 9, true);
INSERT INTO public.flyway_schema_history VALUES (3, '20220117014902', 'add authorities table', 'SQL', 'V20220117014902__add_authorities_table.sql', -2061974246, 'postgres', '2022-06-08 19:38:00.225352', 5, true);
INSERT INTO public.flyway_schema_history VALUES (4, '20220117021446', 'add currency table', 'SQL', 'V20220117021446__add_currency_table.sql', 1835913990, 'postgres', '2022-06-08 19:38:00.237466', 10, true);
INSERT INTO public.flyway_schema_history VALUES (5, '20220117021518', 'add group role table', 'SQL', 'V20220117021518__add_group_role_table.sql', 1417877435, 'postgres', '2022-06-08 19:38:00.255274', 12, true);
INSERT INTO public.flyway_schema_history VALUES (6, '20220117021608', 'add account table', 'SQL', 'V20220117021608__add_account_table.sql', 2029932097, 'postgres', '2022-06-08 19:38:00.275322', 10, true);
INSERT INTO public.flyway_schema_history VALUES (7, '20220117021653', 'add group table', 'SQL', 'V20220117021653__add_group_table.sql', -1790799911, 'postgres', '2022-06-08 19:38:00.290576', 8, true);
INSERT INTO public.flyway_schema_history VALUES (8, '20220117022323', 'add account group table', 'SQL', 'V20220117022323__add_account_group_table.sql', 832382151, 'postgres', '2022-06-08 19:38:00.303701', 7, true);
INSERT INTO public.flyway_schema_history VALUES (9, '20220117022341', 'add expense table', 'SQL', 'V20220117022341__add_expense_table.sql', -1887673091, 'postgres', '2022-06-08 19:38:00.317217', 9, true);
INSERT INTO public.flyway_schema_history VALUES (10, '20220117022404', 'add group expense table', 'SQL', 'V20220117022404__add_group_expense_table.sql', -2142220198, 'postgres', '2022-06-08 19:38:00.330837', 8, true);
INSERT INTO public.flyway_schema_history VALUES (11, '20220117022428', 'add individual expense table', 'SQL', 'V20220117022428__add_individual_expense_table.sql', -734244013, 'postgres', '2022-06-08 19:38:00.34344', 5, true);
INSERT INTO public.flyway_schema_history VALUES (12, '20220117022446', 'add transaction table', 'SQL', 'V20220117022446__add_transaction_table.sql', -915187667, 'postgres', '2022-06-08 19:38:00.35384', 10, true);
INSERT INTO public.flyway_schema_history VALUES (13, '20220117022447', 'populate user authorities table', 'SQL', 'V20220117022447__populate_user_authorities_table.sql', -1202609563, 'postgres', '2022-06-08 19:38:00.369343', 3, true);
INSERT INTO public.flyway_schema_history VALUES (14, '20220117022623', 'populate currency table', 'SQL', 'V20220117022623__populate_currency_table.sql', 1892963076, 'postgres', '2022-06-08 19:38:00.37576', 3, true);
INSERT INTO public.flyway_schema_history VALUES (15, '20220117022727', 'populate group role table', 'SQL', 'V20220117022727__populate_group_role_table.sql', 1069350454, 'postgres', '2022-06-08 19:38:00.382898', 2, true);
INSERT INTO public.flyway_schema_history VALUES (16, '20220119065520', 'add account index', 'SQL', 'V20220119065520__add_account_index.sql', -1787400909, 'postgres', '2022-06-08 19:38:00.389074', 3, true);


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."group" VALUES (1, 'group1', 2);
INSERT INTO public."group" VALUES (2, 'group2', 2);
INSERT INTO public."group" VALUES (3, 'group3', 2);


--
-- Data for Name: group_expense; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.group_expense VALUES (1, 6, 1);


--
-- Data for Name: group_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.group_role VALUES (1, 'OWNER');
INSERT INTO public.group_role VALUES (2, 'MEMBER');


--
-- Data for Name: individual_expense; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.individual_expense VALUES (1, 1, 1);
INSERT INTO public.individual_expense VALUES (2, 2, 1);
INSERT INTO public.individual_expense VALUES (3, 3, 1);
INSERT INTO public.individual_expense VALUES (4, 4, 2);
INSERT INTO public.individual_expense VALUES (5, 5, 2);


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaction VALUES (1, 2.5, 1, 2, 1, 1);
INSERT INTO public.transaction VALUES (2, -2.5, 1, 2, 1, 1);
INSERT INTO public.transaction VALUES (3, 5.5, 1, 2, 1, 2);
INSERT INTO public.transaction VALUES (4, -5.5, 1, 2, 1, 2);
INSERT INTO public.transaction VALUES (5, 3.5, 1, 2, 1, 3);
INSERT INTO public.transaction VALUES (6, -3.5, 1, 2, 1, 3);
INSERT INTO public.transaction VALUES (7, 130, 1, 1, 2, 4);
INSERT INTO public.transaction VALUES (8, -130, 1, 1, 2, 4);
INSERT INTO public.transaction VALUES (9, 3.5, 1, 1, 2, 5);
INSERT INTO public.transaction VALUES (10, -3.5, 1, 1, 2, 5);
INSERT INTO public.transaction VALUES (11, 5, 1, 2, 2, 6);
INSERT INTO public.transaction VALUES (12, 5, 1, 2, 2, 6);
INSERT INTO public.transaction VALUES (13, 5, 1, 2, 1, 6);
INSERT INTO public.transaction VALUES (14, 5, 1, 2, 3, 6);


--
-- Data for Name: user_authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_authorities VALUES (0, 'MEMBER');
INSERT INTO public.user_authorities VALUES (1, 'ADMIN');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'qwe@gmail.com', '$2a$10$V9ocPYQbmnWKMj.Flj0S.uhE.LKiDyEaINWyRmP9BNb.HaFbHtxiC', true, '380993499954');
INSERT INTO public.users VALUES (2, 'admin@gmail.com', '$2a$10$sKS3seN8hwPxw7R5qI3.iOgzOjr.hEFKFoxXJ4c3cYBDFRfCzSuF6', true, '380969798234');
INSERT INTO public.users VALUES (3, '34n@gmail.com', '$2a$10$BGJBPmQXIzR3LXpwcSKWJOinnIaktxcz4MkpkcKT81thzhyrvQEIu', true, '380993499955');


--
-- Name: account_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_group_id_seq', 5, true);


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_id_seq', 3, true);


--
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_id_seq', 3, true);


--
-- Name: expense_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.expense_id_seq', 6, true);


--
-- Name: group_expense_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_expense_id_seq', 1, true);


--
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_id_seq', 3, true);


--
-- Name: group_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_role_id_seq', 2, true);


--
-- Name: individual_expense_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.individual_expense_id_seq', 5, true);


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_seq', 14, true);


--
-- Name: user_authorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_authorities_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: account_group account_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_group
    ADD CONSTRAINT account_group_pkey PRIMARY KEY (id);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- Name: expense expense_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT expense_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: group_expense group_expense_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_expense
    ADD CONSTRAINT group_expense_pkey PRIMARY KEY (id);


--
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- Name: group_role group_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role
    ADD CONSTRAINT group_role_pkey PRIMARY KEY (id);


--
-- Name: individual_expense individual_expense_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_expense
    ADD CONSTRAINT individual_expense_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: user_authorities user_authorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_authorities
    ADD CONSTRAINT user_authorities_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: ix_auth_account; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_auth_account ON public.authorities USING btree (id, authority);


--
-- Name: authorities authorities_authority_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT authorities_authority_fkey FOREIGN KEY (authority) REFERENCES public.user_authorities(id);


--
-- Name: account_group fk_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_group
    ADD CONSTRAINT fk_account FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: individual_expense fk_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_expense
    ADD CONSTRAINT fk_account_id FOREIGN KEY (user_id) REFERENCES public.account(id);


--
-- Name: account_group fk_added_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_group
    ADD CONSTRAINT fk_added_by FOREIGN KEY (added_by_id) REFERENCES public.account(id);


--
-- Name: expense fk_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES public.account(id);


--
-- Name: group fk_creator; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT fk_creator FOREIGN KEY (creator_id) REFERENCES public.account(id);


--
-- Name: account fk_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT fk_currency_id FOREIGN KEY (currency_id) REFERENCES public.currency(id);


--
-- Name: expense fk_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT fk_currency_id FOREIGN KEY (currency_id) REFERENCES public.currency(id);


--
-- Name: transaction fk_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_currency_id FOREIGN KEY (currency_id) REFERENCES public.currency(id);


--
-- Name: group_expense fk_expense_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_expense
    ADD CONSTRAINT fk_expense_id FOREIGN KEY (expense_id) REFERENCES public.expense(id);


--
-- Name: individual_expense fk_expense_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_expense
    ADD CONSTRAINT fk_expense_id FOREIGN KEY (expense_id) REFERENCES public.expense(id);


--
-- Name: transaction fk_expense_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_expense_id FOREIGN KEY (expense_id) REFERENCES public.expense(id);


--
-- Name: account_group fk_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_group
    ADD CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES public."group"(id);


--
-- Name: group_expense fk_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_expense
    ADD CONSTRAINT fk_group_id FOREIGN KEY (group_id) REFERENCES public."group"(id);


--
-- Name: account_group fk_group_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_group
    ADD CONSTRAINT fk_group_role FOREIGN KEY (role_id) REFERENCES public.group_role(id);


--
-- Name: transaction fk_lander_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_lander_id FOREIGN KEY (lander_id) REFERENCES public.account(id);


--
-- Name: transaction fk_receiver_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_receiver_id FOREIGN KEY (receiver_id) REFERENCES public.account(id);


--
-- Name: authorities fk_user_authorities; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT fk_user_authorities FOREIGN KEY (id) REFERENCES public.users(id);


--
-- Name: account fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

