--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2026-04-27 12:12:11

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16416)
-- Name: beneficios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beneficios (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    id_comercio integer,
    descripcion_corta character varying,
    descuento smallint,
    activo bit(1)
);


ALTER TABLE public.beneficios OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16415)
-- Name: beneficios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.beneficios ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.beneficios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: beneficios_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beneficios_usuarios (
    id integer NOT NULL,
    id_beneficio integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha timestamp with time zone NOT NULL
);


ALTER TABLE public.beneficios_usuarios OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: beneficios_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.beneficios_usuarios ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.beneficios_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16432)
-- Name: comercios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comercios (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying,
    telefono_principal character varying,
    "Comercio_DatosContacto" character varying,
    url character varying,
    email character varying,
    activo bit(1)
);


ALTER TABLE public.comercios OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16431)
-- Name: comercios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.comercios ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comercios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16424)
-- Name: provincias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provincias (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    orden integer,
    activo bit(1)
);


ALTER TABLE public.provincias OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16423)
-- Name: provincias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.provincias ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.provincias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16406)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying,
    fecha_nacimiento timestamp with time zone,
    id_provincia integer NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16405)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.usuarios ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4816 (class 0 OID 16416)
-- Dependencies: 220
-- Data for Name: beneficios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4812 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: beneficios_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4820 (class 0 OID 16432)
-- Dependencies: 224
-- Data for Name: comercios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4818 (class 0 OID 16424)
-- Dependencies: 222
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4814 (class 0 OID 16406)
-- Dependencies: 218
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 219
-- Name: beneficios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beneficios_id_seq', 1, false);


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 215
-- Name: beneficios_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beneficios_usuarios_id_seq', 1, false);


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 223
-- Name: comercios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comercios_id_seq', 1, false);


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 221
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provincias_id_seq', 1, false);


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);


--
-- TOC entry 4659 (class 2606 OID 16422)
-- Name: beneficios beneficios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficios
    ADD CONSTRAINT beneficios_pk PRIMARY KEY (id);


--
-- TOC entry 4655 (class 2606 OID 16404)
-- Name: beneficios_usuarios beneficios_usuarios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficios_usuarios
    ADD CONSTRAINT beneficios_usuarios_pk PRIMARY KEY (id);


--
-- TOC entry 4663 (class 2606 OID 16438)
-- Name: comercios comercios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comercios
    ADD CONSTRAINT comercios_pk PRIMARY KEY (id);


--
-- TOC entry 4661 (class 2606 OID 16430)
-- Name: provincias provincias_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT provincias_pk PRIMARY KEY (id);


--
-- TOC entry 4657 (class 2606 OID 16414)
-- Name: usuarios usuarios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pk PRIMARY KEY (id);


--
-- TOC entry 4667 (class 2606 OID 16439)
-- Name: beneficios fk_beneficios_comercios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficios
    ADD CONSTRAINT fk_beneficios_comercios FOREIGN KEY (id_comercio) REFERENCES public.comercios(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4664 (class 2606 OID 16449)
-- Name: beneficios_usuarios fk_beneficios_usuarios_beneficios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficios_usuarios
    ADD CONSTRAINT fk_beneficios_usuarios_beneficios FOREIGN KEY (id_beneficio) REFERENCES public.beneficios(id) NOT VALID;


--
-- TOC entry 4665 (class 2606 OID 16444)
-- Name: beneficios_usuarios fk_beneficios_usuarios_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficios_usuarios
    ADD CONSTRAINT fk_beneficios_usuarios_usuarios FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4666 (class 2606 OID 16454)
-- Name: usuarios fk_usuarios_provincias; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuarios_provincias FOREIGN KEY (id_provincia) REFERENCES public.provincias(id) NOT VALID;


-- Completed on 2026-04-27 12:12:11

--
-- PostgreSQL database dump complete
--

