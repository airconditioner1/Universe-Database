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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    abbreviation character varying(10),
    description text,
    zodiac text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    is_active boolean,
    type text,
    composition text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20) NOT NULL,
    moon_id integer NOT NULL,
    gravitational_acc numeric,
    planet_id integer,
    circumference_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    circumference_km integer,
    diameter_km integer,
    is_habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    solar_system text,
    galaxy_id integer,
    type text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'The Hunter', 'No');
INSERT INTO public.constellation VALUES (2, 'Scorpius', 'Sco', 'The Scorpion', 'Yes');
INSERT INTO public.constellation VALUES (3, 'Leo', 'Leo', 'The Lion', 'Yes');
INSERT INTO public.constellation VALUES (4, 'Ursa Major', 'UMa', 'The Great Bear', 'No');
INSERT INTO public.constellation VALUES (5, 'Taurus', 'Tau', 'The Bull', 'Yes');
INSERT INTO public.constellation VALUES (6, 'Cassiopeia', 'Cas', 'The Seated Queen', 'No');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, true, 'Spiral', 'Gas, Dust, Stars');
INSERT INTO public.galaxy VALUES ('Andromeda', 2, true, 'Spiral', 'Gas, Dust, Stars');
INSERT INTO public.galaxy VALUES ('Triangulum', 3, true, 'Spiral', 'Gas, Dust, Stars');
INSERT INTO public.galaxy VALUES ('Large Magellanic', 4, true, 'Irregular', 'Gas, Dust, Stars');
INSERT INTO public.galaxy VALUES ('Small Magellanic', 5, true, 'Irregular', 'Gas, Dust, Stars');
INSERT INTO public.galaxy VALUES ('Whirlpool', 6, true, 'Spiral', 'Gas, Dust, Stars');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, 1.625, 3, 10921);
INSERT INTO public.moon VALUES ('Phobos', 2, 0.0057, 4, 22);
INSERT INTO public.moon VALUES ('Deimos', 3, 0.003, 4, 12);
INSERT INTO public.moon VALUES ('Io', 4, 1.796, 5, 3642);
INSERT INTO public.moon VALUES ('Europa', 5, 1.314, 5, 3121);
INSERT INTO public.moon VALUES ('Ganymede', 6, 1.428, 5, 5262);
INSERT INTO public.moon VALUES ('Callisto', 7, 1.235, 5, 4820);
INSERT INTO public.moon VALUES ('Titan', 8, 1.352, 6, 5150);
INSERT INTO public.moon VALUES ('Enceladus', 9, 0.113, 6, 504);
INSERT INTO public.moon VALUES ('Mimas', 10, 0.064, 6, 198);
INSERT INTO public.moon VALUES ('Triton', 11, 0.779, 8, 1353);
INSERT INTO public.moon VALUES ('Charon', 12, 0.278, 9, 1207);
INSERT INTO public.moon VALUES ('Hyperion', 13, 0.027, 6, 360);
INSERT INTO public.moon VALUES ('Rhea', 14, 0.26, 6, 1528);
INSERT INTO public.moon VALUES ('Tethys', 15, 0.145, 6, 1062);
INSERT INTO public.moon VALUES ('Dione', 16, 0.232, 6, 1123);
INSERT INTO public.moon VALUES ('Iapetus', 17, 0.224, 6, 1469);
INSERT INTO public.moon VALUES ('Miranda', 18, 0.079, 7, 472);
INSERT INTO public.moon VALUES ('Ariel', 19, 0.267, 7, 1158);
INSERT INTO public.moon VALUES ('Umbriel', 20, 0.233, 7, 1169);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 15320, 4879, false, 1);
INSERT INTO public.planet VALUES ('Venus', 2, 38000, 12104, false, 1);
INSERT INTO public.planet VALUES ('Earth', 3, 40075, 12742, true, 1);
INSERT INTO public.planet VALUES ('Mars', 4, 21396, 6792, false, 1);
INSERT INTO public.planet VALUES ('Jupiter', 5, 439263, 139822, false, 1);
INSERT INTO public.planet VALUES ('Saturn', 6, 365882, 116464, false, 1);
INSERT INTO public.planet VALUES ('Uranus', 7, 157712, 50244, false, 1);
INSERT INTO public.planet VALUES ('Neptune', 8, 155600, 49244, false, 1);
INSERT INTO public.planet VALUES ('Pluto', 9, 740, 2370, false, 1);
INSERT INTO public.planet VALUES ('Kepler-186f', 10, 0, 0, true, 2);
INSERT INTO public.planet VALUES ('HD 209458 b', 11, 0, 0, false, 3);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 12, 0, 0, true, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 'Solar System', 1, 'G-type');
INSERT INTO public.star VALUES ('Proxima Centauri', 2, 'Alpha Centauri', 1, 'M-type');
INSERT INTO public.star VALUES ('Betelgeuse', 3, 'Orion', 2, 'M-type');
INSERT INTO public.star VALUES ('Rigel', 4, 'Orion', 2, 'B-type');
INSERT INTO public.star VALUES ('Vega', 5, 'Lyra', 3, 'A-type');
INSERT INTO public.star VALUES ('Sirius', 6, 'Canis Major', 1, 'A-type');


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_name UNIQUE (name);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

