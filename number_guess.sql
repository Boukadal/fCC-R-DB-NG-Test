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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    tries integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 17, 598);
INSERT INTO public.games VALUES (2, 18, 551);
INSERT INTO public.games VALUES (3, 17, 658);
INSERT INTO public.games VALUES (4, 17, 869);
INSERT INTO public.games VALUES (5, 17, 869);
INSERT INTO public.games VALUES (6, 17, 652);
INSERT INTO public.games VALUES (7, 19, 227);
INSERT INTO public.games VALUES (8, 19, 632);
INSERT INTO public.games VALUES (9, 20, 250);
INSERT INTO public.games VALUES (10, 20, 925);
INSERT INTO public.games VALUES (11, 19, 912);
INSERT INTO public.games VALUES (12, 19, 1000);
INSERT INTO public.games VALUES (13, 19, 383);
INSERT INTO public.games VALUES (14, 21, 691);
INSERT INTO public.games VALUES (15, 21, 457);
INSERT INTO public.games VALUES (16, 22, 523);
INSERT INTO public.games VALUES (17, 22, 448);
INSERT INTO public.games VALUES (18, 21, 812);
INSERT INTO public.games VALUES (19, 21, 184);
INSERT INTO public.games VALUES (20, 21, 695);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1739766304030');
INSERT INTO public.users VALUES (2, 'user_1739766304029');
INSERT INTO public.users VALUES (3, 'user_1739766375166');
INSERT INTO public.users VALUES (4, 'user_1739766375165');
INSERT INTO public.users VALUES (5, 'user_1739766411111');
INSERT INTO public.users VALUES (6, 'user_1739766411110');
INSERT INTO public.users VALUES (7, 'user_1739766496060');
INSERT INTO public.users VALUES (8, 'user_1739766496059');
INSERT INTO public.users VALUES (9, 'user_1739766539829');
INSERT INTO public.users VALUES (10, 'user_1739766539828');
INSERT INTO public.users VALUES (11, 'user_1739766723415');
INSERT INTO public.users VALUES (12, 'user_1739766723414');
INSERT INTO public.users VALUES (13, 'user_1739766816459');
INSERT INTO public.users VALUES (14, 'user_1739766816458');
INSERT INTO public.users VALUES (15, 'user_1739766839657');
INSERT INTO public.users VALUES (16, 'user_1739766839656');
INSERT INTO public.users VALUES (17, 'user_1739766857990');
INSERT INTO public.users VALUES (18, 'user_1739766857989');
INSERT INTO public.users VALUES (19, 'user_1739766957345');
INSERT INTO public.users VALUES (20, 'user_1739766957344');
INSERT INTO public.users VALUES (21, 'user_1739767071217');
INSERT INTO public.users VALUES (22, 'user_1739767071216');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 20, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

