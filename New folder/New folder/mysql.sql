--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-11-22 00:33:03

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

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 24611)
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    auth_id character(6) NOT NULL,
    a_name character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    address character(25),
    pname character(20)
);


ALTER TABLE public.author OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24623)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    code integer NOT NULL,
    year integer,
    topic character varying(50),
    name character(25),
    prize real NOT NULL,
    aauth_id character(6),
    pname character(20),
    CONSTRAINT book_year_check CHECK (((year >= 1980) AND (year <= 2020)))
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24651)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    email character(20) NOT NULL,
    name character(20),
    province character(10) NOT NULL,
    phone integer,
    address character(25)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24645)
-- Name: independent_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.independent_book (
    code integer NOT NULL,
    discount real NOT NULL,
    CONSTRAINT independent_book_discount_check CHECK ((discount > (0)::double precision))
);


ALTER TABLE public.independent_book OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24601)
-- Name: pub_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pub_phone (
    name character(20) NOT NULL,
    phone_num integer NOT NULL
);


ALTER TABLE public.pub_phone OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24594)
-- Name: publisher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publisher (
    name character(20) NOT NULL,
    web_site character(50),
    address character(25)
);


ALTER TABLE public.publisher OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24656)
-- Name: registered_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registered_customer (
    email character(20) NOT NULL,
    c_name character(20)
);


ALTER TABLE public.registered_customer OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24639)
-- Name: translate_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translate_book (
    code integer NOT NULL,
    limi_edition character(4),
    CONSTRAINT translate_book_limi_edition_check CHECK (((limi_edition = 'Yes'::bpchar) OR (limi_edition = 'No'::bpchar)))
);


ALTER TABLE public.translate_book OWNER TO postgres;

--
-- TOC entry 3372 (class 0 OID 24611)
-- Dependencies: 217
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (auth_id, a_name, email, address, pname) FROM stdin;
#mnjul	Manjula Senarathna	manjula@45.gmail.com	Colombo 4                	Muses               
#cndn 	Chandana Gunesekara	chanfana@67.gmail.com	\N	\N
#keshn	Keshan Hareshu	kesh@108.gmail.com	\N	\N
\.


--
-- TOC entry 3373 (class 0 OID 24623)
-- Dependencies: 218
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (code, year, topic, name, prize, aauth_id, pname) FROM stdin;
10805	\N	\N	Amazonia                 	1200	#mnjul	\N
11256	\N	\N	\N	1800	#keshn	\N
11455	\N	\N	Pet Semetary             	1800	#cndn 	Muses               
\.


--
-- TOC entry 3376 (class 0 OID 24651)
-- Dependencies: 221
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (email, name, province, phone, address) FROM stdin;
namal@456gmail.com  	\N	Western   	\N	\N
Laksh@gmail.com     	\N	Southern  	\N	\N
jeewanta@gmail.com  	\N	Westeren  	\N	\N
\.


--
-- TOC entry 3375 (class 0 OID 24645)
-- Dependencies: 220
-- Data for Name: independent_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.independent_book (code, discount) FROM stdin;
402	0.2
1255	0.1
11354	0.1
\.


--
-- TOC entry 3371 (class 0 OID 24601)
-- Dependencies: 216
-- Data for Name: pub_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pub_phone (name, phone_num) FROM stdin;
Muses               	112346777
Muses               	114534444
Grantha             	116767888
\.


--
-- TOC entry 3370 (class 0 OID 24594)
-- Dependencies: 215
-- Data for Name: publisher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publisher (name, web_site, address) FROM stdin;
Muses               	www.musesbooks.com                                	Ganemulla                
Grantha             	www.grantha.lk                                    	Moratuwa                 
Ashirwada           	www.ashirwadabooks.com                            	Mirigama                 
\.


--
-- TOC entry 3377 (class 0 OID 24656)
-- Dependencies: 222
-- Data for Name: registered_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registered_customer (email, c_name) FROM stdin;
namal@456gmail.com  	\N
Thml@630gmail.com   	#mtama              
jeewanta@gmail.com  	\N
\.


--
-- TOC entry 3374 (class 0 OID 24639)
-- Dependencies: 219
-- Data for Name: translate_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.translate_book (code, limi_edition) FROM stdin;
10805	No  
11256	No  
11456	Yes 
\.


--
-- TOC entry 3211 (class 2606 OID 24617)
-- Name: author author_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_email_key UNIQUE (email);


--
-- TOC entry 3213 (class 2606 OID 24615)
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (auth_id);


--
-- TOC entry 3215 (class 2606 OID 24628)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (code);


--
-- TOC entry 3221 (class 2606 OID 24655)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (email);


--
-- TOC entry 3219 (class 2606 OID 24650)
-- Name: independent_book independent_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.independent_book
    ADD CONSTRAINT independent_book_pkey PRIMARY KEY (code);


--
-- TOC entry 3205 (class 2606 OID 24600)
-- Name: publisher must_be_different; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT must_be_different UNIQUE (web_site);


--
-- TOC entry 3209 (class 2606 OID 24605)
-- Name: pub_phone pub_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pub_phone
    ADD CONSTRAINT pub_phone_pkey PRIMARY KEY (name, phone_num);


--
-- TOC entry 3207 (class 2606 OID 24598)
-- Name: publisher publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (name);


--
-- TOC entry 3223 (class 2606 OID 24660)
-- Name: registered_customer registered_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registered_customer
    ADD CONSTRAINT registered_customer_pkey PRIMARY KEY (email);


--
-- TOC entry 3217 (class 2606 OID 24644)
-- Name: translate_book translate_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translate_book
    ADD CONSTRAINT translate_book_pkey PRIMARY KEY (code);


--
-- TOC entry 3225 (class 2606 OID 24618)
-- Name: author author_pname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pname_fkey FOREIGN KEY (pname) REFERENCES public.publisher(name);


--
-- TOC entry 3226 (class 2606 OID 24629)
-- Name: book book_aauth_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_aauth_id_fkey FOREIGN KEY (aauth_id) REFERENCES public.author(auth_id);


--
-- TOC entry 3227 (class 2606 OID 24634)
-- Name: book book_pname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pname_fkey FOREIGN KEY (pname) REFERENCES public.publisher(name);


--
-- TOC entry 3224 (class 2606 OID 24606)
-- Name: pub_phone pub_phone_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pub_phone
    ADD CONSTRAINT pub_phone_name_fkey FOREIGN KEY (name) REFERENCES public.publisher(name);


-- Completed on 2022-11-22 00:33:03

--
-- PostgreSQL database dump complete
--

