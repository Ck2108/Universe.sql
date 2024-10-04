--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    name character varying(255),
    comet_id integer NOT NULL,
    discovered_year integer NOT NULL,
    perihelion_distance_au double precision NOT NULL,
    aphelion_distance_au double precision NOT NULL,
    orbital_period_years numeric
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(255),
    galaxy_id integer NOT NULL,
    distance_light_years double precision NOT NULL,
    discovered_year integer NOT NULL,
    contains_black_hole boolean,
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(255),
    moon_id integer NOT NULL,
    planet_id integer,
    distance_from_planet_km double precision NOT NULL,
    discovered_year double precision NOT NULL,
    notes text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(255),
    planet_id integer NOT NULL,
    star_id integer,
    radius_km double precision NOT NULL,
    discovered_year double precision NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(255),
    star_id integer NOT NULL,
    temperature_kelvin double precision NOT NULL,
    distance_light_years double precision NOT NULL,
    status character varying(50),
    is_variable_star boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES ('Halley''s Comet', 6, 240, 0.09, 35.1, 75.3);
INSERT INTO public.comet VALUES ('Comet Hale-Bopp', 7, 1995, 0.91, 50, 253.7);
INSERT INTO public.comet VALUES ('Comet NEOWISE', 8, 2020, 0.21, 50, 6767);
INSERT INTO public.comet VALUES ('Comet Swift-Tuttle', 9, 1862, 0.96, 31.6, 133.3);
INSERT INTO public.comet VALUES ('Comet Lovejoy', 10, 2011, 0.15, 7, 12.0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 0, 1783, true, 'Home galaxy of Earth and Solar System');
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 2.537, 961, true, 'Nearest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 2.73, 1654, false, 'Third-largest member of the Local Group.');
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 4, 23.2, 1773, true, 'Known for its distinct spiral structure.');
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 5, 29.35, 1767, true, 'Famous for its bright nucleus and dust lane.');
INSERT INTO public.galaxy VALUES ('Centaurus A', 6, 13, 1835, true, 'A giant elliptical galaxy with a supermassive black hole.');
INSERT INTO public.galaxy VALUES ('Sculptor Galaxy', 7, 11.7, 1838, false, 'A dwarf galaxy located in the Sculptor constellation.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 1, 384400, -0.001, 'Earth''s only natural satellite.');
INSERT INTO public.moon VALUES ('Phobos', 2, 2, 9377, 1877, 'A moon of Mars, known for its irregular shape.');
INSERT INTO public.moon VALUES ('Deimos', 3, 2, 23460, 1877, 'The smaller moon of Mars, also irregularly shaped.');
INSERT INTO public.moon VALUES ('Titan', 4, 3, 1221700, 1655, 'Saturn''s largest moon.');
INSERT INTO public.moon VALUES ('Europa', 5, 4, 670900, 1610, 'Potential subsurface ocean.');
INSERT INTO public.moon VALUES ('Ganymede', 6, 4, 1560000, 1610, 'Largest moon in the solar system.');
INSERT INTO public.moon VALUES ('Callisto', 7, 4, 1883000, 1610, 'Known for its impact craters.');
INSERT INTO public.moon VALUES ('Io', 8, 4, 421800, 1610, 'Most volcanically active body.');
INSERT INTO public.moon VALUES ('Enceladus', 9, 3, 238000, 1789, 'Known for its ice geysers.');
INSERT INTO public.moon VALUES ('Mimas', 10, 3, 185000, 1789, 'Has a large crater called Herschel.');
INSERT INTO public.moon VALUES ('Tethys', 11, 3, 294600, 1684, 'Features a large valley named Ithaca Chasma.');
INSERT INTO public.moon VALUES ('Miranda', 12, 5, 129000, 1986, 'Uranus'' moon with extreme geological features.');
INSERT INTO public.moon VALUES ('Ariel', 13, 5, 115000, 1851, 'Known for its bright, icy surface.');
INSERT INTO public.moon VALUES ('Umbriel', 14, 5, 266000, 1851, 'Darker surface than Ariel.');
INSERT INTO public.moon VALUES ('Titania', 15, 5, 436300, 1787, 'Largest moon of Uranus.');
INSERT INTO public.moon VALUES ('Ruby', 25, 4, 294600, 1684, 'A moon of Saturn that features a large canyon system.');
INSERT INTO public.moon VALUES ('Charon', 23, 5, 19700, 1978, 'The largest moon of the dwarf planet Pluto.');
INSERT INTO public.moon VALUES ('Zogglin', 32, 1, 5000, 2024, 'A small, irregularly shaped moon with purple dust.');
INSERT INTO public.moon VALUES ('Quirkyon', 33, 2, 12000, 2025, 'Known for its bizarre orbit and colorful surface.');
INSERT INTO public.moon VALUES ('Blorpster', 34, 3, 15000, 2026, 'A moon that emits a soft glow and has a jelly-like surface.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, 6371, 1000);
INSERT INTO public.planet VALUES ('Mars', 2, 1, 3389.5, 1000);
INSERT INTO public.planet VALUES ('Jupiter', 3, 2, 69911, 1000);
INSERT INTO public.planet VALUES ('Saturn', 4, 2, 58232, 1000);
INSERT INTO public.planet VALUES ('Neptune', 5, 2, 24622, 1000);
INSERT INTO public.planet VALUES ('Kepler-22b', 11, 1, 6000, 2009);
INSERT INTO public.planet VALUES ('HD 209458 b', 12, 2, 1200, 1999);
INSERT INTO public.planet VALUES ('WASP-12b', 13, 3, 2100, 2008);
INSERT INTO public.planet VALUES ('TRAPPIST-1d', 14, 4, 8200, 2017);
INSERT INTO public.planet VALUES ('LHS 1140 b', 15, 5, 7200, 2017);
INSERT INTO public.planet VALUES ('GJ 357 d', 16, 6, 6000, 2019);
INSERT INTO public.planet VALUES ('Proxima Centauri c', 17, 6, 6600, 2020);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 5778, 0, 'Main Sequence', false, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 2, 3042, 4.24, 'Red Dwarf', false, 1);
INSERT INTO public.star VALUES ('Betelgeuse', 3, 3500, 642, 'Red Supergiant', true, 1);
INSERT INTO public.star VALUES ('Sirius A', 4, 9940, 8.6, 'Main Sequence', false, 1);
INSERT INTO public.star VALUES ('Aldebaran', 5, 3900, 65.7, 'Red Giant', true, 1);
INSERT INTO public.star VALUES ('Rho Cassiopeiae', 6, 5820, 320, 'Variable Star', true, 1);


--
-- Name: comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_id_seq', 10, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 5, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, true);


--
-- Name: comet comet_perihelion_distance_au_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_perihelion_distance_au_key UNIQUE (perihelion_distance_au);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

