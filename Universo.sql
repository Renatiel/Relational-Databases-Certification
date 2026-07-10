--
-- PostgreSQL database dump
--

\restrict oEBK6fnGjTY99KwGimSnynh4Amre5CeekFEj9IneiXwWqgyjRRNhlS72xF8xwb3

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

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

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

\unrestrict oEBK6fnGjTY99KwGimSnynh4Amre5CeekFEj9IneiXwWqgyjRRNhlS72xF8xwb3
\connect universe
\restrict oEBK6fnGjTY99KwGimSnynh4Amre5CeekFEj9IneiXwWqgyjRRNhlS72xF8xwb3

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    distance_from_earth_mly numeric,
    num_stars_estimate_billions numeric,
    diameter_light_years integer,
    num_dwarf_galaxies_orbiting integer,
    has_supermassive_black_hole boolean,
    is_spiral boolean,
    galaxy_type_id integer
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


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO postgres;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNER TO postgres;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    radius_km numeric,
    orbital_period_days integer,
    discovery_year integer,
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL
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


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mass_earth_masses numeric,
    radius_km integer,
    num_moons integer,
    is_dwarf_planet boolean,
    has_rings boolean,
    star_id integer NOT NULL
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


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mass_solar_masses numeric,
    temperature_kelvin integer,
    radius_solar_radii integer,
    is_binary boolean,
    has_planets boolean NOT NULL,
    spectral_type character varying(10),
    galaxy_id integer NOT NULL
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


ALTER SEQUENCE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System.', 0, 250, 105700, 59, true, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest large galaxy to the Milky Way.', 2500000, 1000, 220000, 14, true, true, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy in the constellation Triangulum.', 2730000, 40, 60000, 0, false, true, 1);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'A classic spiral galaxy interacting with a companion galaxy.', 23000000, 100, 60000, 1, true, true, 1);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'A galaxy known for its bright nucleus and dust lane.', 31000000, 200, 50000, 0, true, false, 4);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 'A lenticular ring galaxy formed by a galactic collision.', 500000000, 5, 150000, 0, false, false, 4);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'An irregular dwarf galaxy orbiting the Milky Way.', 163000, 30, 14000, 0, false, false, 3);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'A galaxy with a flat, rotating disk containing stars, gas and dust, and a central concentration of stars known as the bulge.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'A galaxy with an approximately ellipsoidal shape and a smooth, nearly featureless brightness profile.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'A galaxy that does not have a distinct regular shape, unlike a spiral or an elliptical galaxy.');
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'A galaxy that has both a large-scale disk and a bulge, but no visible spiral arm structure.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite.', 1737.4, 27, NULL, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer of Mars'' two moons.', 11.2, 0, 1877, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and farther of Mars'' two moons.', 6.2, 1, 1877, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'The most volcanically active body in the Solar System.', 1821.6, 2, 1610, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon thought to have a subsurface ocean.', 1560.8, 4, 1610, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System.', 2634.1, 7, 1610, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The second largest moon of Jupiter.', 2410.3, 17, 1610, true, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'An irregularly shaped inner moon of Jupiter.', 83.5, 0, 1892, false, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 'The largest moon of Saturn with a thick atmosphere.', 2574.7, 16, 1655, true, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'An icy moon with geysers erupting from its south pole.', 252.1, 1, 1789, true, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 'Known for its large crater resembling the Death Star.', 198.2, 1, 1789, true, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'A moon with a striking two-toned coloration.', 734.5, 79, 1671, true, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'The second largest moon of Saturn.', 763.8, 4, 1672, true, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 'The largest moon of Uranus.', 788.4, 8, 1787, true, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 'The second largest and outermost major moon of Uranus.', 761.4, 13, 1787, true, 7);
INSERT INTO public.moon VALUES (16, 'Miranda', 'A moon of Uranus known for its extreme, varied terrain.', 235.8, 1, 1948, true, 7);
INSERT INTO public.moon VALUES (17, 'Triton', 'The largest moon of Neptune, orbiting retrograde.', 1353.4, 5, 1846, true, 8);
INSERT INTO public.moon VALUES (18, 'Nereid', 'An outer moon of Neptune with a very eccentric orbit.', 170.0, 360, 1949, false, 8);
INSERT INTO public.moon VALUES (19, 'Charon', 'The largest of Pluto''s five moons.', 606.0, 6, 1978, true, 9);
INSERT INTO public.moon VALUES (20, 'Nix', 'A small moon of Pluto.', 23.0, 25, 2005, false, 9);
INSERT INTO public.moon VALUES (21, 'Hydra', 'A small, irregularly shaped moon of Pluto.', 25.0, 39, 2005, false, 9);
INSERT INTO public.moon VALUES (22, 'Styx', 'A tiny moon of Pluto discovered in 2012.', 5.0, 21, 2012, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.055, 2440, 0, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.815, 6052, 0, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.0, 6371, 1, false, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.107, 3390, 2, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 317.8, 69911, 95, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.2, 58232, 146, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.5, 25362, 27, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.1, 24622, 14, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.0022, 1188, 5, true, false, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 1.27, 7159, 0, false, false, 3);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', 7.0, 12000, 0, false, false, 3);
INSERT INTO public.planet VALUES (12, 'Trappist-1e', 0.62, 5800, 0, false, false, 8);
INSERT INTO public.planet VALUES (13, 'Trappist-1f', 0.68, 6300, 0, false, false, 8);
INSERT INTO public.planet VALUES (14, 'Vega b', 20.0, 40000, 0, false, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1.0, 5778, 1, false, true, 'G2V', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2.02, 9940, 2, true, false, 'A1V', 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 0.12, 3042, 0, false, true, 'M5.5Ve', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 16.5, 3600, 764, false, false, 'M1-2Ia-Iab', 1);
INSERT INTO public.star VALUES (5, 'Vega', 2.14, 9602, 2, false, true, 'A0V', 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1.1, 5790, 1, true, false, 'G2V', 1);
INSERT INTO public.star VALUES (7, 'Rigel', 21.0, 12100, 78, true, false, 'B8Ia', 1);
INSERT INTO public.star VALUES (8, 'Trappist-1', 0.089, 2566, 0, false, true, 'M8V', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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

\unrestrict oEBK6fnGjTY99KwGimSnynh4Amre5CeekFEj9IneiXwWqgyjRRNhlS72xF8xwb3
