--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    speed integer,
    is_periodic boolean
);


ALTER TABLE public.comet OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    age_in_millions_of_years integer
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    is_spherical boolean,
    age_in_millions_of_years integer
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comet VALUES (1, 'Halley', 70, true);
INSERT INTO public.comet VALUES (2, 'Encke', 65, true);
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 80, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 13000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', false, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy', false, 9000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting galaxy', false, 8000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Bright nucleus galaxy', false, 11000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy', false, 9500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon1', 1, true, 1000);
INSERT INTO public.moon VALUES (2, 'Moon2', 1, true, 1200);
INSERT INTO public.moon VALUES (3, 'Moon3', 2, true, 800);
INSERT INTO public.moon VALUES (4, 'Moon4', 2, true, 700);
INSERT INTO public.moon VALUES (5, 'Moon5', 3, true, 600);
INSERT INTO public.moon VALUES (6, 'Moon6', 3, true, 500);
INSERT INTO public.moon VALUES (7, 'Moon7', 4, true, 400);
INSERT INTO public.moon VALUES (8, 'Moon8', 4, true, 300);
INSERT INTO public.moon VALUES (9, 'Moon9', 5, true, 200);
INSERT INTO public.moon VALUES (10, 'Moon10', 5, true, 100);
INSERT INTO public.moon VALUES (11, 'Moon11', 6, true, 150);
INSERT INTO public.moon VALUES (12, 'Moon12', 6, true, 160);
INSERT INTO public.moon VALUES (13, 'Moon13', 7, true, 170);
INSERT INTO public.moon VALUES (14, 'Moon14', 7, true, 180);
INSERT INTO public.moon VALUES (15, 'Moon15', 8, true, 190);
INSERT INTO public.moon VALUES (16, 'Moon16', 8, true, 210);
INSERT INTO public.moon VALUES (17, 'Moon17', 9, true, 220);
INSERT INTO public.moon VALUES (18, 'Moon18', 10, true, 230);
INSERT INTO public.moon VALUES (19, 'Moon19', 11, true, 240);
INSERT INTO public.moon VALUES (20, 'Moon20', 12, true, 250);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, true);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, true);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, false, true);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, false, true);
INSERT INTO public.planet VALUES (6, 'Sirius b1', 3, false, true);
INSERT INTO public.planet VALUES (7, 'Sirius b2', 3, false, true);
INSERT INTO public.planet VALUES (8, 'Betel Planet 1', 4, false, true);
INSERT INTO public.planet VALUES (9, 'Betel Planet 2', 4, false, true);
INSERT INTO public.planet VALUES (10, 'Rigel Planet 1', 5, false, true);
INSERT INTO public.planet VALUES (11, 'Rigel Planet 2', 5, false, true);
INSERT INTO public.planet VALUES (12, 'Vega Planet 1', 6, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, true, 4500);
INSERT INTO public.star VALUES (3, 'Sirius', 2, true, 300);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, true, 10000);
INSERT INTO public.star VALUES (5, 'Rigel', 4, true, 8000);
INSERT INTO public.star VALUES (6, 'Vega', 5, true, 500);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

