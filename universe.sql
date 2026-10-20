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
-- Name: celestial_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_type (
    celestial_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.celestial_type OWNER TO freecodecamp;

--
-- Name: celestial_type_celestial_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.celestial_type ALTER COLUMN celestial_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.celestial_type_celestial_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    age_million_years numeric(10,2),
    is_spiral boolean NOT NULL,
    number_of_stars integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    radius_km numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    discovery_year integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type text NOT NULL,
    orbital_period_days numeric(12,2),
    has_rings boolean NOT NULL,
    number_of_moons integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class character varying(10) NOT NULL,
    mass_solar numeric(10,3),
    is_main_sequence boolean NOT NULL,
    discovery_year integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: celestial_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_type OVERRIDING SYSTEM VALUE VALUES (1, 'Star', 'A celestial object that produces energy through nuclear fusion', false);
INSERT INTO public.celestial_type OVERRIDING SYSTEM VALUE VALUES (2, 'Planet', 'A celestial body that orbits a star', false);
INSERT INTO public.celestial_type OVERRIDING SYSTEM VALUE VALUES (3, 'Moon', 'A natural satellite that orbits a planet', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 'Barred spiral galaxy', 13600.00, true, 100000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 'Spiral galaxy', 10000.00, true, 200000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 'Spiral galaxy', 12000.00, true, 40000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Whirlpool', 'Grand-design spiral galaxy', 9000.00, true, 100000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Sombrero', 'Lenticular galaxy', 13000.00, false, 80000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Messier 87', 'Elliptical galaxy', 13000.00, false, 1000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 3, 1737.40, true, NULL, 'Earth natural satellite');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 4, 11.27, false, 1877, 'Inner moon of Mars');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 4, 6.20, false, 1877, 'Outer moon of Mars');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Io', 5, 1821.60, true, 1610, 'Volcanically active moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 5, 1560.80, true, 1610, 'Icy moon of Jupiter');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Ganymede', 5, 2634.10, true, 1610, 'Largest moon in the Solar System');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Callisto', 5, 2410.30, true, 1610, 'Heavily cratered moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Amalthea', 5, 83.50, false, 1892, 'Small inner moon of Jupiter');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Titan', 6, 2574.70, true, 1655, 'Moon with a dense atmosphere');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Enceladus', 6, 252.10, true, 1789, 'Icy moon with water plumes');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Rhea', 6, 763.80, true, 1672, 'Second-largest moon of Saturn');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Iapetus', 6, 734.50, true, 1671, 'Moon with contrasting hemispheres');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Dione', 6, 561.40, true, 1684, 'Icy moon of Saturn');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Tethys', 6, 531.10, true, 1684, 'Icy moon with a large crater');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Mimas', 6, 198.20, true, 1789, 'Small moon with a large crater');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Hyperion', 6, 135.00, false, 1848, 'Irregularly shaped moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Phoebe', 6, 106.50, false, 1899, 'Outer moon of Saturn');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Sirius Moon A', 7, 900.00, true, 2020, 'Fictional satellite');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Vega Moon A', 11, 700.00, true, 2021, 'Fictional satellite');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Polaris Moon A', 12, 500.00, true, 2022, 'Fictional satellite');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Mercury', 1, 'Terrestrial', 87.97, false, 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', 1, 'Terrestrial', 224.70, false, 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Earth', 1, 'Terrestrial', 365.25, false, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', 1, 'Terrestrial', 687.00, false, 2);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', 1, 'Gas giant', 4332.59, true, 95);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', 1, 'Gas giant', 10759.22, true, 146);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Sirius Prime', 2, 'Gas giant', 400.00, true, 3);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Sirius Minor', 2, 'Terrestrial', 120.00, false, 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Proxima b', 3, 'Terrestrial', 11.19, false, 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Proxima c', 3, 'Super-Earth', 1928.00, false, 0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Vega Prime', 4, 'Gas giant', 200.00, true, 2);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Polaris b', 5, 'Terrestrial', 300.00, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 1, 'G2V', 1.000, true, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Sirius A', 1, 'A1V', 2.063, true, 1844);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Proxima Centauri', 1, 'M5.5V', 0.122, true, 1915);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Vega', 2, 'A0V', 2.135, true, 1850);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Polaris', 3, 'F7Ib', 5.400, false, 1899);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Betelgeuse', 4, 'M1-M2Ia', 16.500, false, 1836);


--
-- Name: celestial_type_celestial_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_type_celestial_type_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_type celestial_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_type
    ADD CONSTRAINT celestial_type_name_key UNIQUE (name);


--
-- Name: celestial_type celestial_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_type
    ADD CONSTRAINT celestial_type_pkey PRIMARY KEY (celestial_type_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

