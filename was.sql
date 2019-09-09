--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    "Id" uuid NOT NULL,
    "CX" bigint NOT NULL,
    "Name" character varying(500) NOT NULL,
    "Type" boolean NOT NULL,
    "Image" bytea
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- Name: Category_CX_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Category_CX_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Category_CX_seq" OWNER TO postgres;

--
-- Name: Category_CX_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Category_CX_seq" OWNED BY public."Category"."CX";


--
-- Name: Transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Transaction" (
    "Id" uuid NOT NULL,
    "CX" bigint NOT NULL,
    "WalletId" uuid NOT NULL,
    "CategoryId" uuid NOT NULL,
    "Amount" numeric NOT NULL,
    "Note" character varying(500),
    "Date" timestamp without time zone NOT NULL
);


ALTER TABLE public."Transaction" OWNER TO postgres;

--
-- Name: Transaction_CX_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Transaction_CX_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Transaction_CX_seq" OWNER TO postgres;

--
-- Name: Transaction_CX_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Transaction_CX_seq" OWNED BY public."Transaction"."CX";


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "Id" uuid NOT NULL,
    "CX" bigint NOT NULL,
    "Username" character varying(500) NOT NULL,
    "Password" character varying(500) NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_CX_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_CX_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_CX_seq" OWNER TO postgres;

--
-- Name: User_CX_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_CX_seq" OWNED BY public."User"."CX";


--
-- Name: Wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Wallet" (
    "Id" uuid NOT NULL,
    "CX" bigint NOT NULL,
    "Name" character varying(500) NOT NULL,
    "Balance" numeric NOT NULL,
    "UserId" uuid NOT NULL
);


ALTER TABLE public."Wallet" OWNER TO postgres;

--
-- Name: Wallet_CX_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Wallet_CX_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Wallet_CX_seq" OWNER TO postgres;

--
-- Name: Wallet_CX_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Wallet_CX_seq" OWNED BY public."Wallet"."CX";


--
-- Name: Category CX; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category" ALTER COLUMN "CX" SET DEFAULT nextval('public."Category_CX_seq"'::regclass);


--
-- Name: Transaction CX; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction" ALTER COLUMN "CX" SET DEFAULT nextval('public."Transaction_CX_seq"'::regclass);


--
-- Name: User CX; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN "CX" SET DEFAULT nextval('public."User_CX_seq"'::regclass);


--
-- Name: Wallet CX; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet" ALTER COLUMN "CX" SET DEFAULT nextval('public."Wallet_CX_seq"'::regclass);


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Category" ("Id", "CX", "Name", "Type", "Image") FROM stdin;
\.


--
-- Data for Name: Transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transaction" ("Id", "CX", "WalletId", "CategoryId", "Amount", "Note", "Date") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" ("Id", "CX", "Username", "Password") FROM stdin;
\.


--
-- Data for Name: Wallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Wallet" ("Id", "CX", "Name", "Balance", "UserId") FROM stdin;
\.


--
-- Name: Category_CX_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Category_CX_seq"', 1, false);


--
-- Name: Transaction_CX_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Transaction_CX_seq"', 1, false);


--
-- Name: User_CX_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_CX_seq"', 1, false);


--
-- Name: Wallet_CX_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Wallet_CX_seq"', 1, false);


--
-- Name: Category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT category_pk PRIMARY KEY ("Id");


--
-- Name: Transaction transaction_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT transaction_pk PRIMARY KEY ("Id");


--
-- Name: User user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT user_pk PRIMARY KEY ("Id");


--
-- Name: Wallet wallet_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet"
    ADD CONSTRAINT wallet_pk PRIMARY KEY ("Id");


--
-- Name: category_cx_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX category_cx_idx ON public."Category" USING btree ("CX");


--
-- Name: transaction_cx_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX transaction_cx_idx ON public."Transaction" USING btree ("CX");


--
-- Name: user_cx_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_cx_idx ON public."User" USING btree ("CX");


--
-- Name: wallet_cx_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX wallet_cx_idx ON public."Wallet" USING btree ("CX");


--
-- Name: Transaction transaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT transaction_fk FOREIGN KEY ("CategoryId") REFERENCES public."Category"("Id") ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Transaction transaction_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT transaction_fk_1 FOREIGN KEY ("WalletId") REFERENCES public."Wallet"("Id") ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Wallet wallet_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet"
    ADD CONSTRAINT wallet_fk FOREIGN KEY ("UserId") REFERENCES public."User"("Id") ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

