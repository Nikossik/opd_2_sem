--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-22 20:44:28

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
-- TOC entry 892 (class 1247 OID 16501)
-- Name: enum_heart_rates_testType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_heart_rates_testType" AS ENUM (
    'light',
    '3_colors',
    'sound',
    'math_sound_test',
    'math_vis',
    'easy_action',
    'hard_action',
    'analog_tracking_test',
    'random_access_memory',
    'short_term_memory_test',
    'myunsterberg_test',
    'compare_test',
    'attention_assessment_test',
    'abstract_thinking_test',
    'abstract_test'
);


ALTER TYPE public."enum_heart_rates_testType" OWNER TO postgres;

--
-- TOC entry 877 (class 1247 OID 16450)
-- Name: enum_prefessions_competition; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_prefessions_competition AS ENUM (
    'Низкая',
    'Средняя',
    'Высокая'
);


ALTER TYPE public.enum_prefessions_competition OWNER TO postgres;

--
-- TOC entry 880 (class 1247 OID 16458)
-- Name: enum_prefessions_study; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_prefessions_study AS ENUM (
    'Низкая',
    'Средняя',
    'Высокая'
);


ALTER TYPE public.enum_prefessions_study OWNER TO postgres;

--
-- TOC entry 883 (class 1247 OID 16475)
-- Name: enum_professions_competition; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_professions_competition AS ENUM (
    'Низкая',
    'Средняя',
    'Высокая'
);


ALTER TYPE public.enum_professions_competition OWNER TO postgres;

--
-- TOC entry 886 (class 1247 OID 16482)
-- Name: enum_professions_study; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_professions_study AS ENUM (
    'Низкая',
    'Средняя',
    'Высокая'
);


ALTER TYPE public.enum_professions_study OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 16532)
-- Name: abstract_tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abstract_tests (
    id integer NOT NULL,
    "user" integer,
    type character varying(255),
    result double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.abstract_tests OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16531)
-- Name: abstract_tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.abstract_tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.abstract_tests_id_seq OWNER TO postgres;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 233
-- Name: abstract_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abstract_tests_id_seq OWNED BY public.abstract_tests.id;


--
-- TOC entry 226 (class 1259 OID 16443)
-- Name: accuracy_tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accuracy_tests (
    id integer NOT NULL,
    "user" integer,
    type character varying(255),
    accuracy double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.accuracy_tests OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16442)
-- Name: accuracy_tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accuracy_tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accuracy_tests_id_seq OWNER TO postgres;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 225
-- Name: accuracy_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accuracy_tests_id_seq OWNED BY public.accuracy_tests.id;


--
-- TOC entry 222 (class 1259 OID 16427)
-- Name: complex_reaction_tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complex_reaction_tests (
    id integer NOT NULL,
    "user" integer,
    type character varying(255),
    "reactionTime1" double precision,
    "reactionTime2" double precision,
    "reactionTime3" double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.complex_reaction_tests OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16426)
-- Name: complex_reaction_tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.complex_reaction_tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.complex_reaction_tests_id_seq OWNER TO postgres;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 221
-- Name: complex_reaction_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.complex_reaction_tests_id_seq OWNED BY public.complex_reaction_tests.id;


--
-- TOC entry 230 (class 1259 OID 16518)
-- Name: heart_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.heart_rates (
    id integer NOT NULL,
    "respondentID" integer,
    "testType" public."enum_heart_rates_testType",
    "heartRateBefore" integer,
    "heartRateDuring" json,
    "heartRateAfter" integer,
    "check" boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.heart_rates OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16517)
-- Name: heart_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.heart_rates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.heart_rates_id_seq OWNER TO postgres;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 229
-- Name: heart_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.heart_rates_id_seq OWNED BY public.heart_rates.id;


--
-- TOC entry 224 (class 1259 OID 16434)
-- Name: invite_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invite_links (
    id integer NOT NULL,
    "userWhoCreated" integer,
    tests character varying(255)[],
    code character varying(255),
    used boolean
);


ALTER TABLE public.invite_links OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16433)
-- Name: invite_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invite_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invite_links_id_seq OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 223
-- Name: invite_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invite_links_id_seq OWNED BY public.invite_links.id;


--
-- TOC entry 218 (class 1259 OID 16411)
-- Name: polls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls (
    id integer NOT NULL,
    "user" integer,
    profession character varying(255),
    points character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.polls OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16410)
-- Name: polls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.polls_id_seq OWNER TO postgres;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 217
-- Name: polls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_id_seq OWNED BY public.polls.id;


--
-- TOC entry 228 (class 1259 OID 16490)
-- Name: professions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professions (
    id integer NOT NULL,
    profession character varying(255),
    competition public.enum_professions_competition,
    salary character varying(255),
    study public.enum_professions_study,
    description text,
    task text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.professions OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16489)
-- Name: professions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professions_id_seq OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 227
-- Name: professions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professions_id_seq OWNED BY public.professions.id;


--
-- TOC entry 220 (class 1259 OID 16420)
-- Name: reaction_tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reaction_tests (
    id integer NOT NULL,
    "user" integer,
    type character varying(255),
    "reactionTime" double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.reaction_tests OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16419)
-- Name: reaction_tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reaction_tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reaction_tests_id_seq OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 219
-- Name: reaction_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reaction_tests_id_seq OWNED BY public.reaction_tests.id;


--
-- TOC entry 232 (class 1259 OID 16525)
-- Name: statistics_alls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statistics_alls (
    id integer NOT NULL,
    "user" integer,
    type character varying(255),
    result double precision,
    "heartRateCheck" boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.statistics_alls OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16524)
-- Name: statistics_alls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statistics_alls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.statistics_alls_id_seq OWNER TO postgres;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 231
-- Name: statistics_alls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statistics_alls_id_seq OWNED BY public.statistics_alls.id;


--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(255),
    password character varying(255),
    "isAdmin" boolean,
    age integer,
    sex character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    respondent boolean,
    email character varying(256)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4703 (class 2604 OID 16535)
-- Name: abstract_tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abstract_tests ALTER COLUMN id SET DEFAULT nextval('public.abstract_tests_id_seq'::regclass);


--
-- TOC entry 4699 (class 2604 OID 16446)
-- Name: accuracy_tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accuracy_tests ALTER COLUMN id SET DEFAULT nextval('public.accuracy_tests_id_seq'::regclass);


--
-- TOC entry 4697 (class 2604 OID 16430)
-- Name: complex_reaction_tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complex_reaction_tests ALTER COLUMN id SET DEFAULT nextval('public.complex_reaction_tests_id_seq'::regclass);


--
-- TOC entry 4701 (class 2604 OID 16521)
-- Name: heart_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.heart_rates ALTER COLUMN id SET DEFAULT nextval('public.heart_rates_id_seq'::regclass);


--
-- TOC entry 4698 (class 2604 OID 16437)
-- Name: invite_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite_links ALTER COLUMN id SET DEFAULT nextval('public.invite_links_id_seq'::regclass);


--
-- TOC entry 4695 (class 2604 OID 16414)
-- Name: polls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls ALTER COLUMN id SET DEFAULT nextval('public.polls_id_seq'::regclass);


--
-- TOC entry 4700 (class 2604 OID 16493)
-- Name: professions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professions ALTER COLUMN id SET DEFAULT nextval('public.professions_id_seq'::regclass);


--
-- TOC entry 4696 (class 2604 OID 16423)
-- Name: reaction_tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reaction_tests ALTER COLUMN id SET DEFAULT nextval('public.reaction_tests_id_seq'::regclass);


--
-- TOC entry 4702 (class 2604 OID 16528)
-- Name: statistics_alls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistics_alls ALTER COLUMN id SET DEFAULT nextval('public.statistics_alls_id_seq'::regclass);


--
-- TOC entry 4694 (class 2604 OID 16403)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4888 (class 0 OID 16532)
-- Dependencies: 234
-- Data for Name: abstract_tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.abstract_tests VALUES (1, 1, 'abstract_test', 0, '2024-05-15 16:55:42.134+03', '2024-05-15 16:55:42.134+03');
INSERT INTO public.abstract_tests VALUES (4, 1, 'myunsterberg_test', 0, '2024-05-15 16:59:19.926+03', '2024-05-15 16:59:19.926+03');
INSERT INTO public.abstract_tests VALUES (5, 1, 'random_access_memory', 1, '2024-05-15 17:01:28.218+03', '2024-05-15 17:01:28.218+03');
INSERT INTO public.abstract_tests VALUES (6, 1, 'short_term_memory_test', 2, '2024-05-15 17:03:57.07+03', '2024-05-15 17:03:57.07+03');
INSERT INTO public.abstract_tests VALUES (7, 1, 'abstract_test', 4, '2024-05-15 17:55:32.001569+03', '2024-05-15 17:55:32.001569+03');
INSERT INTO public.abstract_tests VALUES (9, 8, 'abstract_test', 3, '2024-05-15 17:56:50.204045+03', '2024-05-15 17:56:50.204045+03');
INSERT INTO public.abstract_tests VALUES (11, 1, 'abstract_thinking_test', 4, '2024-05-15 17:59:02.989265+03', '2024-05-15 17:59:02.989265+03');
INSERT INTO public.abstract_tests VALUES (12, 1, 'random_access_memory', 4, '2024-05-15 18:04:13.271+03', '2024-05-15 18:04:13.271+03');
INSERT INTO public.abstract_tests VALUES (13, 8, 'random_access_memory', 3, '2024-05-15 18:07:28.360014+03', '2024-05-15 18:07:28.360014+03');
INSERT INTO public.abstract_tests VALUES (15, 8, 'short_term_memory_test', 6, '2024-05-15 18:09:35.119094+03', '2024-05-15 18:09:35.119094+03');
INSERT INTO public.abstract_tests VALUES (17, 8, 'compare_test', 13, '2024-05-15 18:16:30.826948+03', '2024-05-15 18:16:30.826948+03');
INSERT INTO public.abstract_tests VALUES (3, 1, 'compare_test', 10, '2024-05-15 16:58:38.375+03', '2024-05-15 16:58:38.375+03');
INSERT INTO public.abstract_tests VALUES (16, 1, 'compare_test', 17, '2024-05-15 18:13:29.131+03', '2024-05-15 18:13:29.131+03');
INSERT INTO public.abstract_tests VALUES (18, 2, 'abstract_test', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (19, 3, 'abstract_test', 4, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (20, 4, 'abstract_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (21, 5, 'abstract_test', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (22, 6, 'abstract_test', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (23, 7, 'abstract_test', 4, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (24, 8, 'abstract_test', 6, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (25, 9, 'abstract_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (26, 2, 'abstract_thinking_test', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (27, 3, 'abstract_thinking_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (28, 4, 'abstract_thinking_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (29, 5, 'abstract_thinking_test', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (30, 6, 'abstract_thinking_test', 4, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (31, 7, 'abstract_thinking_test', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (32, 8, 'abstract_thinking_test', 2, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (33, 9, 'abstract_thinking_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (34, 2, 'attention_assessment_test', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (35, 3, 'attention_assessment_test', 6, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (36, 4, 'attention_assessment_test', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (37, 5, 'attention_assessment_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (38, 6, 'attention_assessment_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (39, 7, 'attention_assessment_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (40, 8, 'attention_assessment_test', 4, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (41, 9, 'attention_assessment_test', 4, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (42, 2, 'myunsterberg_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (43, 3, 'myunsterberg_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (44, 4, 'myunsterberg_test', 6, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (45, 5, 'myunsterberg_test', 6, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (46, 6, 'myunsterberg_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (47, 7, 'myunsterberg_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (48, 8, 'myunsterberg_test', 2, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (49, 9, 'myunsterberg_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (50, 2, 'short_term_memory_test', 4, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (51, 3, 'short_term_memory_test', 6, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (52, 4, 'short_term_memory_test', 2, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (53, 5, 'short_term_memory_test', 2, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (54, 6, 'short_term_memory_test', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (55, 7, 'short_term_memory_test', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (56, 8, 'short_term_memory_test', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (57, 9, 'short_term_memory_test', 2, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (58, 2, 'random_access_memory', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (59, 3, 'random_access_memory', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (60, 4, 'random_access_memory', 5, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (61, 5, 'random_access_memory', 2, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (62, 6, 'random_access_memory', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (63, 7, 'random_access_memory', 6, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (64, 8, 'random_access_memory', 4, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (65, 9, 'random_access_memory', 3, '2024-05-15 23:04:14.45557+03', '2024-05-15 23:04:14.45557+03');
INSERT INTO public.abstract_tests VALUES (74, 2, 'compare_test', 17, '2024-05-15 23:07:30.483447+03', '2024-05-15 23:07:30.483447+03');
INSERT INTO public.abstract_tests VALUES (75, 3, 'compare_test', 22, '2024-05-15 23:07:30.483447+03', '2024-05-15 23:07:30.483447+03');
INSERT INTO public.abstract_tests VALUES (76, 4, 'compare_test', 15, '2024-05-15 23:07:30.483447+03', '2024-05-15 23:07:30.483447+03');
INSERT INTO public.abstract_tests VALUES (77, 5, 'compare_test', 14, '2024-05-15 23:07:30.483447+03', '2024-05-15 23:07:30.483447+03');
INSERT INTO public.abstract_tests VALUES (78, 6, 'compare_test', 22, '2024-05-15 23:07:30.483447+03', '2024-05-15 23:07:30.483447+03');
INSERT INTO public.abstract_tests VALUES (79, 7, 'compare_test', 19, '2024-05-15 23:07:30.483447+03', '2024-05-15 23:07:30.483447+03');
INSERT INTO public.abstract_tests VALUES (80, 8, 'compare_test', 22, '2024-05-15 23:07:30.483447+03', '2024-05-15 23:07:30.483447+03');
INSERT INTO public.abstract_tests VALUES (81, 9, 'compare_test', 25, '2024-05-15 23:07:30.483447+03', '2024-05-15 23:07:30.483447+03');
INSERT INTO public.abstract_tests VALUES (82, 1, 'attention_assessment_test', 801.1882352969226, '2024-05-21 23:27:10.153+03', '2024-05-21 23:27:10.153+03');
INSERT INTO public.abstract_tests VALUES (83, 1, 'attention_assessment_test', 1019.1176470623296, '2024-05-22 00:05:24.106+03', '2024-05-22 00:05:24.106+03');
INSERT INTO public.abstract_tests VALUES (85, 1, 'compare_test', 11, '2024-05-22 00:09:33.956+03', '2024-05-22 00:09:33.956+03');
INSERT INTO public.abstract_tests VALUES (87, 2, 'attention_assessment_test', 832.3154, '2024-05-22 00:19:09.655766+03', '2024-05-22 00:19:09.655766+03');
INSERT INTO public.abstract_tests VALUES (88, 3, 'attention_assessment_test', 973.4765872, '2024-05-22 00:19:25.063564+03', '2024-05-22 00:19:25.063564+03');
INSERT INTO public.abstract_tests VALUES (89, 4, 'attention_assessment_test', 889.7634733, '2024-05-22 00:19:34.431582+03', '2024-05-22 00:19:34.431582+03');
INSERT INTO public.abstract_tests VALUES (90, 5, 'attention_assessment_test', 1025.48634, '2024-05-22 00:19:48.337557+03', '2024-05-22 00:19:48.337557+03');
INSERT INTO public.abstract_tests VALUES (91, 6, 'attention_assessment_test', 953.435265, '2024-05-22 00:19:58.198245+03', '2024-05-22 00:19:58.198245+03');
INSERT INTO public.abstract_tests VALUES (92, 7, 'attention_assessment_test', 998.45628525, '2024-05-22 00:20:15.835476+03', '2024-05-22 00:20:15.835476+03');
INSERT INTO public.abstract_tests VALUES (93, 8, 'attention_assessment_test', 1007.058375, '2024-05-22 00:20:34.190524+03', '2024-05-22 00:20:34.190524+03');
INSERT INTO public.abstract_tests VALUES (14, 1, 'short_term_memory_test', 10, '2024-05-15 18:08:33.943889+03', '2024-05-15 18:08:33.943889+03');
INSERT INTO public.abstract_tests VALUES (2, 1, 'abstract_thinking_test', 5, '2024-05-15 16:56:24.661+03', '2024-05-15 16:56:24.661+03');
INSERT INTO public.abstract_tests VALUES (86, 1, 'myunsterberg_test', 8, '2024-05-22 00:13:18.295+03', '2024-05-22 00:13:18.295+03');


--
-- TOC entry 4880 (class 0 OID 16443)
-- Dependencies: 226
-- Data for Name: accuracy_tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accuracy_tests VALUES (1, 1, 'analog_tracking_test', NULL, '2024-04-04 18:36:34.859+03', '2024-04-04 18:36:34.859+03');
INSERT INTO public.accuracy_tests VALUES (2, 1, 'analog_tracking_test', 50.117244405440694, '2024-04-04 18:47:41.795+03', '2024-04-04 18:47:41.795+03');
INSERT INTO public.accuracy_tests VALUES (3, 1, 'hard_action', 2.472627373381347, '2024-04-04 19:04:56.407+03', '2024-04-04 19:04:56.407+03');
INSERT INTO public.accuracy_tests VALUES (5, 1, 'analog_tracking_test', 34.46649995833401, '2024-04-04 19:08:36.902+03', '2024-04-04 19:08:36.902+03');
INSERT INTO public.accuracy_tests VALUES (6, 1, 'easy_action', 23.45024333763403, '2024-04-15 17:23:56.197+03', '2024-04-15 17:23:56.197+03');
INSERT INTO public.accuracy_tests VALUES (7, 1, 'analog_tracking_test', 64.24534083089364, '2024-04-15 17:27:02.393+03', '2024-04-15 17:27:02.393+03');
INSERT INTO public.accuracy_tests VALUES (8, 1, 'analog_tracking_test', 76.48479427549131, '2024-04-15 17:28:20.045+03', '2024-04-15 17:28:20.045+03');
INSERT INTO public.accuracy_tests VALUES (9, 2, 'analog_tracking_test', 50.117244405440694, '2024-05-13 16:39:18.631247+03', '2024-05-13 16:39:18.631247+03');
INSERT INTO public.accuracy_tests VALUES (10, 2, 'analog_tracking_test', 50.117244405440694, '2024-05-13 16:40:08.393731+03', '2024-05-13 16:40:08.393731+03');
INSERT INTO public.accuracy_tests VALUES (11, 2, 'analog_tracking_test', 69.33066045514605, '2024-05-13 16:42:12.112065+03', '2024-05-13 16:42:12.112065+03');
INSERT INTO public.accuracy_tests VALUES (12, 3, 'analog_tracking_test', 64.67059402544972, '2024-05-13 16:42:12.112065+03', '2024-05-13 16:42:12.112065+03');
INSERT INTO public.accuracy_tests VALUES (13, 4, 'analog_tracking_test', 56.322178849274565, '2024-05-13 16:42:12.112065+03', '2024-05-13 16:42:12.112065+03');
INSERT INTO public.accuracy_tests VALUES (14, 5, 'analog_tracking_test', 55.82460240784179, '2024-05-13 16:42:12.112065+03', '2024-05-13 16:42:12.112065+03');
INSERT INTO public.accuracy_tests VALUES (15, 6, 'analog_tracking_test', 62.00292653333081, '2024-05-13 16:42:12.112065+03', '2024-05-13 16:42:12.112065+03');
INSERT INTO public.accuracy_tests VALUES (16, 7, 'analog_tracking_test', 52.118408344756574, '2024-05-13 16:42:12.112065+03', '2024-05-13 16:42:12.112065+03');
INSERT INTO public.accuracy_tests VALUES (17, 8, 'analog_tracking_test', 71.05096421231823, '2024-05-13 16:42:12.112065+03', '2024-05-13 16:42:12.112065+03');
INSERT INTO public.accuracy_tests VALUES (18, 9, 'analog_tracking_test', 78.22590733652709, '2024-05-13 16:42:12.112065+03', '2024-05-13 16:42:12.112065+03');
INSERT INTO public.accuracy_tests VALUES (19, 2, 'easy_action', 26.903450904307572, '2024-05-13 16:43:19.644124+03', '2024-05-13 16:43:19.644124+03');
INSERT INTO public.accuracy_tests VALUES (20, 3, 'easy_action', 36.858041813895746, '2024-05-13 16:43:19.644124+03', '2024-05-13 16:43:19.644124+03');
INSERT INTO public.accuracy_tests VALUES (21, 4, 'easy_action', 20.81618294935217, '2024-05-13 16:43:19.644124+03', '2024-05-13 16:43:19.644124+03');
INSERT INTO public.accuracy_tests VALUES (22, 5, 'easy_action', 24.94094450546699, '2024-05-13 16:43:19.644124+03', '2024-05-13 16:43:19.644124+03');
INSERT INTO public.accuracy_tests VALUES (23, 6, 'easy_action', 35.69273455634901, '2024-05-13 16:43:19.644124+03', '2024-05-13 16:43:19.644124+03');
INSERT INTO public.accuracy_tests VALUES (24, 7, 'easy_action', 42.93460358044038, '2024-05-13 16:43:19.644124+03', '2024-05-13 16:43:19.644124+03');
INSERT INTO public.accuracy_tests VALUES (25, 8, 'easy_action', 41.68173765271828, '2024-05-13 16:43:19.644124+03', '2024-05-13 16:43:19.644124+03');
INSERT INTO public.accuracy_tests VALUES (26, 9, 'easy_action', 24.488649723758307, '2024-05-13 16:43:19.644124+03', '2024-05-13 16:43:19.644124+03');
INSERT INTO public.accuracy_tests VALUES (27, 2, 'hard_action', 18.076991473924497, '2024-05-13 16:44:22.453714+03', '2024-05-13 16:44:22.453714+03');
INSERT INTO public.accuracy_tests VALUES (28, 3, 'hard_action', 20.427807605255698, '2024-05-13 16:44:22.453714+03', '2024-05-13 16:44:22.453714+03');
INSERT INTO public.accuracy_tests VALUES (29, 4, 'hard_action', 22.84853173535749, '2024-05-13 16:44:22.453714+03', '2024-05-13 16:44:22.453714+03');
INSERT INTO public.accuracy_tests VALUES (30, 5, 'hard_action', 20.53409543551853, '2024-05-13 16:44:22.453714+03', '2024-05-13 16:44:22.453714+03');
INSERT INTO public.accuracy_tests VALUES (31, 6, 'hard_action', 20.096361465542962, '2024-05-13 16:44:22.453714+03', '2024-05-13 16:44:22.453714+03');
INSERT INTO public.accuracy_tests VALUES (32, 7, 'hard_action', 20.52931371260516, '2024-05-13 16:44:22.453714+03', '2024-05-13 16:44:22.453714+03');
INSERT INTO public.accuracy_tests VALUES (33, 8, 'hard_action', 19.5294546632494, '2024-05-13 16:44:22.453714+03', '2024-05-13 16:44:22.453714+03');
INSERT INTO public.accuracy_tests VALUES (34, 9, 'hard_action', 21.868780722436732, '2024-05-13 16:44:22.453714+03', '2024-05-13 16:44:22.453714+03');


--
-- TOC entry 4876 (class 0 OID 16427)
-- Dependencies: 222
-- Data for Name: complex_reaction_tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.complex_reaction_tests VALUES (17, 1, 'math_vis', 202.438, 393.98, 284.921, '2024-05-13 16:20:19.962998+03', '2024-05-13 16:20:19.962998+03');
INSERT INTO public.complex_reaction_tests VALUES (18, 2, 'math_vis', 241.851, 213.698, 336.633, '2024-05-13 16:20:19.962998+03', '2024-05-13 16:20:19.962998+03');
INSERT INTO public.complex_reaction_tests VALUES (19, 3, 'math_vis', 342.905, 250.423, 344.104, '2024-05-13 16:20:19.962998+03', '2024-05-13 16:20:19.962998+03');
INSERT INTO public.complex_reaction_tests VALUES (20, 4, 'math_vis', 196.715, 279.442, 271.681, '2024-05-13 16:20:19.962998+03', '2024-05-13 16:20:19.962998+03');
INSERT INTO public.complex_reaction_tests VALUES (21, 5, 'math_vis', 366.431, 397.211, 308.443, '2024-05-13 16:20:19.962998+03', '2024-05-13 16:20:19.962998+03');
INSERT INTO public.complex_reaction_tests VALUES (22, 6, 'math_vis', 199.438, 215.525, 295.581, '2024-05-13 16:20:19.962998+03', '2024-05-13 16:20:19.962998+03');
INSERT INTO public.complex_reaction_tests VALUES (23, 7, 'math_vis', 237.542, 258.815, 181.283, '2024-05-13 16:20:19.962998+03', '2024-05-13 16:20:19.962998+03');
INSERT INTO public.complex_reaction_tests VALUES (24, 8, 'math_vis', 205.738, 231.276, 332.337, '2024-05-13 16:20:19.962998+03', '2024-05-13 16:20:19.962998+03');
INSERT INTO public.complex_reaction_tests VALUES (25, 9, 'math_vis', 235.405, 367.889, 284.236, '2024-05-13 16:20:19.962998+03', '2024-05-13 16:20:19.962998+03');
INSERT INTO public.complex_reaction_tests VALUES (26, 1, '3_colors', 290.87, 254.776, 292.5, '2024-05-13 16:54:48.69155+03', '2024-05-13 16:54:48.69155+03');
INSERT INTO public.complex_reaction_tests VALUES (27, 2, '3_colors', 302.077, 272.767, 191.002, '2024-05-13 16:54:48.69155+03', '2024-05-13 16:54:48.69155+03');
INSERT INTO public.complex_reaction_tests VALUES (28, 3, '3_colors', 206.425, 294.669, 283.702, '2024-05-13 16:54:48.69155+03', '2024-05-13 16:54:48.69155+03');
INSERT INTO public.complex_reaction_tests VALUES (29, 4, '3_colors', 329.725, 327.38, 247.891, '2024-05-13 16:54:48.69155+03', '2024-05-13 16:54:48.69155+03');
INSERT INTO public.complex_reaction_tests VALUES (30, 5, '3_colors', 269.383, 200.049, 202.077, '2024-05-13 16:54:48.69155+03', '2024-05-13 16:54:48.69155+03');
INSERT INTO public.complex_reaction_tests VALUES (31, 6, '3_colors', 186.014, 328.978, 204.35, '2024-05-13 16:54:48.69155+03', '2024-05-13 16:54:48.69155+03');
INSERT INTO public.complex_reaction_tests VALUES (32, 7, '3_colors', 309.663, 229.101, 189.332, '2024-05-13 16:54:48.69155+03', '2024-05-13 16:54:48.69155+03');
INSERT INTO public.complex_reaction_tests VALUES (33, 8, '3_colors', 194.272, 200.08, 286.277, '2024-05-13 16:54:48.69155+03', '2024-05-13 16:54:48.69155+03');
INSERT INTO public.complex_reaction_tests VALUES (34, 9, '3_colors', 315.153, 215.622, 203.626, '2024-05-13 16:54:48.69155+03', '2024-05-13 16:54:48.69155+03');
INSERT INTO public.complex_reaction_tests VALUES (35, 1, 'math_vis', 1568.6666666666667, 1899.3333333333333, 2650.3333333333335, '2024-05-14 22:44:33.662+03', '2024-05-14 22:44:33.662+03');
INSERT INTO public.complex_reaction_tests VALUES (36, 1, '3_colors', 539.3333333333334, 337, 450.3333333333333, '2024-05-15 16:57:40.484+03', '2024-05-15 16:57:40.484+03');
INSERT INTO public.complex_reaction_tests VALUES (37, 1, '3_colors', 284.6666666666667, 220, 0, '2024-05-15 18:11:29.983+03', '2024-05-15 18:11:29.983+03');


--
-- TOC entry 4884 (class 0 OID 16518)
-- Dependencies: 230
-- Data for Name: heart_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.heart_rates VALUES (113, 1, 'light', 66, '["75", "87", "87"]', 67, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (114, 2, 'light', 73, '["82", "80", "85"]', 61, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (115, 3, 'light', 67, '["78", "92", "83"]', 82, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (116, 4, 'light', 69, '["82", "86", "83"]', 72, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (117, 5, 'light', 73, '["75", "80", "82"]', 80, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (118, 6, 'light', 73, '["84", "85", "83"]', 81, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (119, 7, 'light', 61, '["82", "89", "89"]', 76, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (120, 8, 'light', 75, '["82", "85", "78"]', 58, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (121, 9, 'light', 61, '["81", "90", "78"]', 67, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (122, 1, '3_colors', 66, '["86", "88", "89"]', 70, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (123, 2, '3_colors', 60, '["87", "82", "85"]', 65, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (124, 3, '3_colors', 71, '["81", "85", "83"]', 78, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (125, 4, '3_colors', 70, '["78", "90", "88"]', 69, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (126, 5, '3_colors', 65, '["78", "85", "81"]', 58, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (127, 6, '3_colors', 63, '["75", "82", "85"]', 62, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (128, 7, '3_colors', 62, '["78", "88", "83"]', 66, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (129, 8, '3_colors', 64, '["76", "89", "84"]', 63, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (130, 9, '3_colors', 62, '["79", "86", "77"]', 58, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (131, 1, 'sound', 76, '["86", "88", "77"]', 79, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (132, 2, 'sound', 69, '["81", "79", "86"]', 63, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (133, 3, 'sound', 61, '["86", "92", "84"]', 81, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (134, 4, 'sound', 73, '["77", "79", "86"]', 60, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (135, 5, 'sound', 61, '["87", "80", "89"]', 70, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (136, 6, 'sound', 69, '["87", "87", "82"]', 58, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (137, 7, 'sound', 63, '["82", "89", "80"]', 82, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (138, 8, 'sound', 67, '["85", "81", "85"]', 69, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (139, 9, 'sound', 65, '["84", "85", "85"]', 74, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (140, 1, 'math_sound_test', 67, '["86", "79", "77"]', 81, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (141, 2, 'math_sound_test', 63, '["82", "88", "87"]', 70, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (142, 3, 'math_sound_test', 67, '["82", "91", "81"]', 74, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (143, 4, 'math_sound_test', 75, '["81", "85", "83"]', 72, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (144, 5, 'math_sound_test', 68, '["86", "86", "85"]', 77, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (145, 6, 'math_sound_test', 76, '["79", "85", "87"]', 68, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (146, 7, 'math_sound_test', 63, '["78", "87", "80"]', 67, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (147, 8, 'math_sound_test', 60, '["86", "80", "82"]', 76, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (148, 9, 'math_sound_test', 76, '["76", "84", "78"]', 75, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (149, 1, 'math_vis', 64, '["85", "89", "77"]', 62, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (150, 2, 'math_vis', 62, '["79", "92", "87"]', 61, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (151, 3, 'math_vis', 72, '["82", "81", "81"]', 75, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (152, 4, 'math_vis', 69, '["78", "79", "82"]', 76, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (153, 5, 'math_vis', 63, '["83", "83", "83"]', 70, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (154, 6, 'math_vis', 74, '["86", "80", "77"]', 70, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (155, 7, 'math_vis', 73, '["84", "91", "86"]', 81, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (156, 8, 'math_vis', 70, '["77", "81", "78"]', 68, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (157, 9, 'math_vis', 73, '["85", "86", "87"]', 60, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (158, 1, 'easy_action', 61, '["85", "79", "87"]', 83, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (159, 2, 'easy_action', 64, '["81", "84", "82"]', 74, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (160, 3, 'easy_action', 60, '["84", "89", "85"]', 63, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (161, 4, 'easy_action', 64, '["77", "83", "88"]', 60, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (162, 5, 'easy_action', 64, '["81", "85", "85"]', 83, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (163, 6, 'easy_action', 64, '["86", "92", "86"]', 74, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (164, 7, 'easy_action', 73, '["84", "88", "78"]', 63, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (165, 8, 'easy_action', 69, '["83", "84", "89"]', 65, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (166, 9, 'easy_action', 74, '["77", "82", "80"]', 80, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (167, 1, 'hard_action', 72, '["81", "83", "89"]', 83, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (168, 2, 'hard_action', 69, '["78", "88", "81"]', 61, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (169, 3, 'hard_action', 69, '["81", "92", "89"]', 80, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (170, 4, 'hard_action', 66, '["85", "91", "77"]', 69, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (171, 5, 'hard_action', 69, '["83", "92", "82"]', 63, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (172, 6, 'hard_action', 60, '["84", "85", "87"]', 82, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (173, 7, 'hard_action', 69, '["78", "91", "81"]', 76, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (174, 8, 'hard_action', 70, '["85", "79", "88"]', 70, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (175, 9, 'hard_action', 76, '["75", "83", "87"]', 74, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (176, 1, 'analog_tracking_test', 71, '["82", "86", "79"]', 69, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (177, 2, 'analog_tracking_test', 69, '["79", "84", "78"]', 61, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (178, 3, 'analog_tracking_test', 76, '["87", "79", "85"]', 74, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (179, 4, 'analog_tracking_test', 73, '["77", "82", "79"]', 74, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (180, 5, 'analog_tracking_test', 73, '["81", "90", "78"]', 58, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (181, 6, 'analog_tracking_test', 68, '["78", "90", "87"]', 77, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (182, 7, 'analog_tracking_test', 63, '["82", "80", "86"]', 62, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (183, 8, 'analog_tracking_test', 74, '["86", "92", "84"]', 76, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (184, 9, 'analog_tracking_test', 72, '["76", "80", "89"]', 72, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (185, 1, 'random_access_memory', 67, '["86", "83", "86"]', 63, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (186, 2, 'random_access_memory', 62, '["76", "85", "79"]', 64, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (187, 3, 'random_access_memory', 61, '["77", "90", "83"]', 68, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (188, 4, 'random_access_memory', 68, '["83", "80", "89"]', 80, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (189, 5, 'random_access_memory', 61, '["87", "91", "89"]', 71, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (190, 6, 'random_access_memory', 75, '["86", "81", "84"]', 72, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (191, 7, 'random_access_memory', 60, '["75", "79", "77"]', 62, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (192, 8, 'random_access_memory', 75, '["79", "82", "81"]', 82, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (193, 9, 'random_access_memory', 66, '["82", "84", "85"]', 60, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (194, 1, 'short_term_memory_test', 67, '["84", "79", "81"]', 80, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (195, 2, 'short_term_memory_test', 61, '["86", "80", "86"]', 68, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (196, 3, 'short_term_memory_test', 60, '["84", "79", "79"]', 73, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (197, 4, 'short_term_memory_test', 64, '["75", "86", "84"]', 62, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (198, 5, 'short_term_memory_test', 63, '["75", "88", "86"]', 67, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (199, 6, 'short_term_memory_test', 60, '["85", "91", "80"]', 83, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (200, 7, 'short_term_memory_test', 63, '["78", "90", "80"]', 70, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (201, 8, 'short_term_memory_test', 62, '["80", "87", "81"]', 75, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (202, 9, 'short_term_memory_test', 69, '["83", "90", "87"]', 77, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (203, 1, 'myunsterberg_test', 76, '["85", "87", "82"]', 81, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (204, 2, 'myunsterberg_test', 69, '["78", "92", "81"]', 59, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (205, 3, 'myunsterberg_test', 76, '["85", "89", "80"]', 59, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (206, 4, 'myunsterberg_test', 74, '["85", "84", "86"]', 64, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (207, 5, 'myunsterberg_test', 67, '["76", "88", "87"]', 65, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (208, 6, 'myunsterberg_test', 72, '["86", "83", "88"]', 82, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (209, 7, 'myunsterberg_test', 71, '["76", "82", "89"]', 67, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (210, 8, 'myunsterberg_test', 75, '["86", "84", "86"]', 75, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (211, 9, 'myunsterberg_test', 71, '["78", "86", "89"]', 75, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (212, 1, 'compare_test', 65, '["87", "79", "87"]', 77, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (213, 2, 'compare_test', 66, '["80", "86", "87"]', 66, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (214, 3, 'compare_test', 71, '["87", "86", "81"]', 71, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (215, 4, 'compare_test', 72, '["84", "86", "86"]', 63, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (216, 5, 'compare_test', 67, '["81", "89", "85"]', 65, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (217, 6, 'compare_test', 65, '["86", "81", "81"]', 63, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (218, 7, 'compare_test', 62, '["78", "84", "86"]', 63, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (219, 8, 'compare_test', 74, '["85", "91", "82"]', 67, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (220, 9, 'compare_test', 71, '["77", "90", "89"]', 75, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (221, 1, 'attention_assessment_test', 60, '["85", "90", "81"]', 74, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (222, 2, 'attention_assessment_test', 60, '["80", "85", "81"]', 76, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (223, 3, 'attention_assessment_test', 66, '["82", "91", "80"]', 59, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (224, 4, 'attention_assessment_test', 61, '["87", "88", "78"]', 74, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (225, 5, 'attention_assessment_test', 64, '["75", "82", "82"]', 78, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (226, 6, 'attention_assessment_test', 74, '["77", "79", "78"]', 80, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (227, 7, 'attention_assessment_test', 75, '["79", "85", "85"]', 65, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (228, 8, 'attention_assessment_test', 61, '["75", "85", "79"]', 72, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (229, 9, 'attention_assessment_test', 60, '["75", "79", "87"]', 80, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (230, 1, 'abstract_thinking_test', 61, '["82", "91", "85"]', 78, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (231, 2, 'abstract_thinking_test', 75, '["85", "92", "89"]', 82, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (232, 3, 'abstract_thinking_test', 66, '["81", "81", "83"]', 72, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (233, 4, 'abstract_thinking_test', 70, '["78", "88", "86"]', 71, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (234, 5, 'abstract_thinking_test', 70, '["76", "79", "79"]', 74, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (235, 6, 'abstract_thinking_test', 63, '["82", "86", "87"]', 61, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (236, 7, 'abstract_thinking_test', 75, '["87", "81", "81"]', 81, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (237, 8, 'abstract_thinking_test', 72, '["82", "86", "85"]', 75, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (238, 9, 'abstract_thinking_test', 75, '["78", "86", "87"]', 79, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (239, 1, 'abstract_test', 67, '["75", "83", "83"]', 77, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (240, 2, 'abstract_test', 69, '["83", "91", "77"]', 60, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (241, 3, 'abstract_test', 69, '["75", "83", "86"]', 74, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (242, 4, 'abstract_test', 69, '["85", "84", "79"]', 75, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (243, 5, 'abstract_test', 75, '["82", "81", "88"]', 62, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (244, 6, 'abstract_test', 63, '["81", "80", "84"]', 60, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (245, 7, 'abstract_test', 62, '["82", "87", "83"]', 58, true, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (246, 8, 'abstract_test', 68, '["82", "86", "84"]', 78, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (247, 9, 'abstract_test', 70, '["86", "91", "85"]', 78, false, '2024-05-16 15:19:28.556635+03', '2024-05-16 15:19:28.556635+03');
INSERT INTO public.heart_rates VALUES (248, 1, '3_colors', 70, '["84","86","90"]', 70, true, '2024-05-22 00:24:01.176+03', '2024-05-22 00:24:01.176+03');
INSERT INTO public.heart_rates VALUES (249, 1, 'easy_action', 70, '["89","80","98","78"]', 70, true, '2024-05-22 00:25:39.855+03', '2024-05-22 00:25:39.855+03');


--
-- TOC entry 4878 (class 0 OID 16434)
-- Dependencies: 224
-- Data for Name: invite_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4872 (class 0 OID 16411)
-- Dependencies: 218
-- Data for Name: polls; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.polls VALUES (1, 1, 'Системный администратор', '0000000000050000900000000060090000000000000003002010000000000000000000000000000080000000000000000000400000000000000000700000000000000000000000000000000000000000000000000', '2024-04-07 12:30:52.652+03', '2024-04-07 12:30:52.652+03');
INSERT INTO public.polls VALUES (2, 1, 'Тестировщик', '0000000000010000000000000000000000000000002903000400000000000000000089000000000000000000000000000000050000600000000000000700000000000000000000000000000000000000000000000', '2024-04-07 12:39:15.875+03', '2024-04-07 12:39:15.875+03');
INSERT INTO public.polls VALUES (3, 1, 'Python developer', '0000000100002000000000300400000000000000000050007600800000000000000000000900000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-04-07 12:49:35.656+03', '2024-04-07 12:49:35.656+03');
INSERT INTO public.polls VALUES (6, 4, 'Системный администратор', '0000000000000000900000000065090000000000000003002010000000000000000000000000000800000000000000000000400000000000000000700000000000000000000000000000000000000000000000000', '2024-05-04 19:55:38.051+03', '2024-05-04 19:55:38.051+03');
INSERT INTO public.polls VALUES (13, 2, 'Системный администратор', '0000000000050000900000000060090000000000000003002010000000000000000000000000000080000000000000000000400000000000000000700000000000000000000000000000000000000000000000000', '2024-05-13 15:27:37.891031+03', '2024-05-13 15:27:37.891031+03');
INSERT INTO public.polls VALUES (14, 3, 'Системный администратор', '0000000000050000900000000060090000000000000003002010000000000000000000000000000080000000000000000000400000000000000000700000000000000000000000000000000000000000000000000', '2024-05-13 15:28:22.433528+03', '2024-05-13 15:28:22.433528+03');
INSERT INTO public.polls VALUES (15, 5, 'Системный администратор', '0000000000050000900000000060090000000000000003002010000000000000000000000000000080000000000000000000400000000000000000700000000000000000000000000000000000000000000000000', '2024-05-13 15:28:48.686884+03', '2024-05-13 15:28:48.686884+03');
INSERT INTO public.polls VALUES (16, 6, 'Системный администратор', '0000000000050000900000000060090000000000000003002010000000000000000000000000000080000000000000000000400000000000000000700000000000000000000000000000000000000000000000000', '2024-05-13 15:28:51.299454+03', '2024-05-13 15:28:51.299454+03');
INSERT INTO public.polls VALUES (17, 7, 'Системный администратор', '0000000000050000900000000060090000000000000003002010000000000000000000000000000080000000000000000000400000000000000000700000000000000000000000000000000000000000000000000', '2024-05-13 15:28:55.055366+03', '2024-05-13 15:28:55.055366+03');
INSERT INTO public.polls VALUES (18, 8, 'Системный администратор', '0000000000050000900000000060090000000000000003002010000000000000000000000000000080000000000000000000400000000000000000700000000000000000000000000000000000000000000000000', '2024-05-13 15:28:57.541028+03', '2024-05-13 15:28:57.541028+03');
INSERT INTO public.polls VALUES (19, 9, 'Системный администратор', '0000000000050000900000000060090000000000000003002010000000000000000000000000000080000000000000000000400000000000000000700000000000000000000000000000000000000000000000000', '2024-05-13 15:29:00.080862+03', '2024-05-13 15:29:00.080862+03');
INSERT INTO public.polls VALUES (20, 2, 'Тестировщик', '0000000000010000000000000000000000000000002903000400000000000000000089000000000000000000000000000000050000600000000000000700000000000000000000000000000000000000000000000', '2024-05-13 15:30:08.210117+03', '2024-05-13 15:30:08.210117+03');
INSERT INTO public.polls VALUES (21, 3, 'Тестировщик', '0000000000010000000000000000000000000000002903000400000000000000000089000000000000000000000000000000050000600000000000000700000000000000000000000000000000000000000000000', '2024-05-13 15:32:25.235362+03', '2024-05-13 15:32:25.235362+03');
INSERT INTO public.polls VALUES (22, 4, 'Тестировщик', '0000000000010000000000000000000000000000002903000400000000000000000089000000000000000000000000000000050000600000000000000700000000000000000000000000000000000000000000000', '2024-05-13 15:32:27.458359+03', '2024-05-13 15:32:27.458359+03');
INSERT INTO public.polls VALUES (23, 5, 'Тестировщик', '0000000000010000000000000000000000000000002903000400000000000000000089000000000000000000000000000000050000600000000000000700000000000000000000000000000000000000000000000', '2024-05-13 15:32:29.547438+03', '2024-05-13 15:32:29.547438+03');
INSERT INTO public.polls VALUES (24, 6, 'Тестировщик', '0000000000010000000000000000000000000000002903000400000000000000000089000000000000000000000000000000050000600000000000000700000000000000000000000000000000000000000000000', '2024-05-13 15:32:31.950431+03', '2024-05-13 15:32:31.950431+03');
INSERT INTO public.polls VALUES (25, 7, 'Тестировщик', '0000000000010000000000000000000000000000002903000400000000000000000089000000000000000000000000000000050000600000000000000700000000000000000000000000000000000000000000000', '2024-05-13 15:32:33.804718+03', '2024-05-13 15:32:33.804718+03');
INSERT INTO public.polls VALUES (26, 8, 'Тестировщик', '0000000000010000000000000000000000000000002903000400000000000000000089000000000000000000000000000000050000600000000000000700000000000000000000000000000000000000000000000', '2024-05-13 15:32:35.885961+03', '2024-05-13 15:32:35.885961+03');
INSERT INTO public.polls VALUES (27, 9, 'Тестировщик', '0000000000010000000000000000000000000000002903000400000000000000000089000000000000000000000000000000050000600000000000000700000000000000000000000000000000000000000000000', '2024-05-13 15:32:41.089613+03', '2024-05-13 15:32:41.089613+03');
INSERT INTO public.polls VALUES (28, 2, 'Python developer', '0000000100002000000000300400000000000000000050007600800000000000000000000900000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-13 15:34:15.753761+03', '2024-05-13 15:34:15.753761+03');
INSERT INTO public.polls VALUES (29, 3, 'Python developer', '0000000100002000000000300400000000000000000050007600800000000000000000000900000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-13 15:34:18.190515+03', '2024-05-13 15:34:18.190515+03');
INSERT INTO public.polls VALUES (30, 4, 'Python developer', '0000000100002000000000300400000000000000000050007600800000000000000000000900000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-13 15:34:30.602627+03', '2024-05-13 15:34:30.602627+03');
INSERT INTO public.polls VALUES (31, 5, 'Python developer', '0000000100002000000000300400000000000000000050007600800000000000000000000900000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-13 15:34:32.650772+03', '2024-05-13 15:34:32.650772+03');
INSERT INTO public.polls VALUES (32, 6, 'Python developer', '0000000100002000000000300400000000000000000050007600800000000000000000000900000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-13 15:34:34.625662+03', '2024-05-13 15:34:34.625662+03');
INSERT INTO public.polls VALUES (33, 7, 'Python developer', '0000000100002000000000300400000000000000000050007600800000000000000000000900000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-13 15:34:36.605244+03', '2024-05-13 15:34:36.605244+03');
INSERT INTO public.polls VALUES (34, 8, 'Python developer', '0000000100002000000000300400000000000000000050007600800000000000000000000900000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-13 15:34:38.918783+03', '2024-05-13 15:34:38.918783+03');
INSERT INTO public.polls VALUES (35, 9, 'Python developer', '0000000100002000000000300400000000000000000050007600800000000000000000000900000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-13 15:34:42.066428+03', '2024-05-13 15:34:42.066428+03');
INSERT INTO public.polls VALUES (36, 1, 'Программист', '0000000800009000000000100060000000000000000050004300200000000000000000000700000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-15 17:27:09.174+03', '2024-05-15 17:27:09.174+03');
INSERT INTO public.polls VALUES (37, 2, 'Программист', '0000000800009000000000100060000000000000000050004300200000000000000000000700000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-15 17:32:08.015327+03', '2024-05-15 17:32:08.015327+03');
INSERT INTO public.polls VALUES (38, 3, 'Программист', '0000000800009000000000100060000000000000000050004300200000000000000000000700000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-15 17:32:30.905451+03', '2024-05-15 17:32:30.905451+03');
INSERT INTO public.polls VALUES (39, 4, 'Программист', '0000000800009000000000100060000000000000000050004300200000000000000000000700000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-15 17:32:37.035526+03', '2024-05-15 17:32:37.035526+03');
INSERT INTO public.polls VALUES (40, 5, 'Программист', '0000000800009000000000100060000000000000000050004300200000000000000000000700000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-15 17:32:41.862072+03', '2024-05-15 17:32:41.862072+03');
INSERT INTO public.polls VALUES (41, 6, 'Программист', '0000000800009000000000100060000000000000000050004300200000000000000000000700000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-15 17:32:47.265705+03', '2024-05-15 17:32:47.265705+03');
INSERT INTO public.polls VALUES (42, 7, 'Программист', '0000000800009000000000100060000000000000000050004300200000000000000000000700000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-15 17:32:51.896393+03', '2024-05-15 17:32:51.896393+03');
INSERT INTO public.polls VALUES (43, 8, 'Программист', '0000000800009000000000100060000000000000000050004300200000000000000000000700000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-15 17:32:56.346701+03', '2024-05-15 17:32:56.346701+03');
INSERT INTO public.polls VALUES (44, 9, 'Программист', '0000000800009000000000100060000000000000000050004300200000000000000000000700000000000000000000000090000000000000000000000000000000000000000000000000000000000000000000000', '2024-05-15 17:33:00.041189+03', '2024-05-15 17:33:00.041189+03');


--
-- TOC entry 4882 (class 0 OID 16490)
-- Dependencies: 228
-- Data for Name: professions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.professions VALUES (1, 'Системный администратор', 'Средняя', '60-120', 'Средняя', 'Системный администратор – сотрудник компании, который занимается поддержкой 
компьютерного оборудования, следит за бесперебойной работой техники, поддерживает 
локальную сеть и центральный сервер, отвечает за информационную безопасность 
компании.', 'Устанавливать, настраивать и обновлять все ПО, необходимое для работы компании, в 
том числе операционные системы Windows и Linux.
 Отслеживать и устранять ошибки в работе инфраструктуры: ПО для работы сотрудников, 
сайта или приложения компании.
 Поддерживать информационную безопасность, защищать локальные сети и 
инфраструктуру разработки от взломов.
 Проводить профилактику перегрузок инфраструктуры: писать скрипты для 
автоматизации, которые помогут системе бесперебойно работать и не «падать». Также 
сисадмин должен регулярно сохранять резервные копии баз данных, чтобы система 
продолжала работать, если возникнут проблемы.
 Поддерживать и настраивать системы мониторинга. Это помогает в будущем защитить 
инфраструктуру от таких же или схожих проблем.', '2024-04-07 12:15:26.259+03', '2024-04-07 12:15:26.259+03');
INSERT INTO public.professions VALUES (2, 'Тестировщик', 'Высокая', '65-150', 'Низкая', 'Инженер по тестированию программного обеспечения (Software Testing 
Engineer) – проверяет IT-продукты на прочность. Он продумывает, что и где 
может сломаться, прогнозирует сбои и находит ошибки в приложениях, 
сайтах и программах, чтобы продукт вышел работоспособным', 'Разработка и реализация тестовых планов: Инженер по тестированию разрабатывает детальные планы тестирования, включающие цели, подходы, временные рамки и ресурсы, необходимые для тестирования 
программного обеспечения. Эти планы ориентированы на выявление ошибок и недочетов продукта до его выпуска
Создание тестовых сценариев и тест-кейсов: Задача включает в себя разработку конкретных сценариев и случаев использования продукта 
для проверки всех возможных путей пользовательского взаимодействия и функциональности программного обеспечения, чтобы убедиться, что все работает как предполагалось.', '2024-04-07 12:17:41.296+03', '2024-04-07 12:17:41.296+03');
INSERT INTO public.professions VALUES (3, 'Python developer', 'Высокая', '75-250', 'Средняя', 'Python developer (разработчик на питоне) — это программист, который использует 
Python в качестве своего основного языка, пишет на нем код, разрабатывает веб-сайты, 
приложения, десктоп-программы, нейросети и даже небольшие игры', 'Веб-разработка
Аналитика данных и Data Science
Машинное обучение
Тестирование приложения и ПО
Геймдев', '2024-04-07 12:18:48.122+03', '2024-04-07 12:18:48.122+03');
INSERT INTO public.professions VALUES (4, 'Программист', 'Средняя', '60-350', 'Низкая', 'Программист — это специалист по созданию и доработке программных продуктов для 
компьютеров и других устройств, архитектуры различных интернет-ресурсов, 
компонентов и методов анализа и моделирования.
В основе этой деятельности лежит разработка системных кодов для программ с 
использованием языков программирования и алгоритмов, их тестирование и 
оптимизация', 'Веб-разработка (написание сайтов и/или их бэкенда, то есть функциональной 
части)
Машинное обучение (создание и обучение нейросетей)
Геймдев (разработка игр)
Работа с базами данных', '2024-05-15 17:20:39.322+03', '2024-05-15 17:20:39.322+03');


--
-- TOC entry 4874 (class 0 OID 16420)
-- Dependencies: 220
-- Data for Name: reaction_tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reaction_tests VALUES (1, 1, 'sound', 292.3333333333333, '2024-04-07 13:02:31.897+03', '2024-04-07 13:02:31.897+03');
INSERT INTO public.reaction_tests VALUES (2, 1, 'light', 223.36363636363637, '2024-04-07 13:08:05.014+03', '2024-04-07 13:08:05.014+03');
INSERT INTO public.reaction_tests VALUES (3, 1, 'sound', 293.3333333333333, '2024-04-08 11:19:01.38+03', '2024-04-08 11:19:01.38+03');
INSERT INTO public.reaction_tests VALUES (4, 1, 'sound', 358.26666666666665, '2024-04-08 12:15:52.592+03', '2024-04-08 12:15:52.592+03');
INSERT INTO public.reaction_tests VALUES (14, 2, 'sound', 362.9910401529275, '2024-05-13 16:47:57.278678+03', '2024-05-13 16:47:57.278678+03');
INSERT INTO public.reaction_tests VALUES (15, 3, 'sound', 258.47243564122624, '2024-05-13 16:47:57.278678+03', '2024-05-13 16:47:57.278678+03');
INSERT INTO public.reaction_tests VALUES (16, 4, 'sound', 230.75327706341255, '2024-05-13 16:47:57.278678+03', '2024-05-13 16:47:57.278678+03');
INSERT INTO public.reaction_tests VALUES (17, 5, 'sound', 236.33877919643623, '2024-05-13 16:47:57.278678+03', '2024-05-13 16:47:57.278678+03');
INSERT INTO public.reaction_tests VALUES (18, 6, 'sound', 329.8104816606433, '2024-05-13 16:47:57.278678+03', '2024-05-13 16:47:57.278678+03');
INSERT INTO public.reaction_tests VALUES (19, 7, 'sound', 373.8425288017429, '2024-05-13 16:47:57.278678+03', '2024-05-13 16:47:57.278678+03');
INSERT INTO public.reaction_tests VALUES (20, 8, 'sound', 292.4164782029158, '2024-05-13 16:47:57.278678+03', '2024-05-13 16:47:57.278678+03');
INSERT INTO public.reaction_tests VALUES (21, 9, 'sound', 272.077564293715, '2024-05-13 16:47:57.278678+03', '2024-05-13 16:47:57.278678+03');
INSERT INTO public.reaction_tests VALUES (22, 2, 'light', 255.4079359711621, '2024-05-13 16:53:09.713921+03', '2024-05-13 16:53:09.713921+03');
INSERT INTO public.reaction_tests VALUES (23, 3, 'light', 212.26699383677655, '2024-05-13 16:53:09.713921+03', '2024-05-13 16:53:09.713921+03');
INSERT INTO public.reaction_tests VALUES (24, 4, 'light', 256.8548555483072, '2024-05-13 16:53:09.713921+03', '2024-05-13 16:53:09.713921+03');
INSERT INTO public.reaction_tests VALUES (25, 5, 'light', 214.30885419748378, '2024-05-13 16:53:09.713921+03', '2024-05-13 16:53:09.713921+03');
INSERT INTO public.reaction_tests VALUES (26, 6, 'light', 213.385507512795, '2024-05-13 16:53:09.713921+03', '2024-05-13 16:53:09.713921+03');
INSERT INTO public.reaction_tests VALUES (27, 7, 'light', 199.40491227586, '2024-05-13 16:53:09.713921+03', '2024-05-13 16:53:09.713921+03');
INSERT INTO public.reaction_tests VALUES (28, 8, 'light', 287.71678836248367, '2024-05-13 16:53:09.713921+03', '2024-05-13 16:53:09.713921+03');
INSERT INTO public.reaction_tests VALUES (29, 9, 'light', 212.39206738545525, '2024-05-13 16:53:09.713921+03', '2024-05-13 16:53:09.713921+03');


--
-- TOC entry 4886 (class 0 OID 16525)
-- Dependencies: 232
-- Data for Name: statistics_alls; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.statistics_alls VALUES (1747, 1, 'sound', 292.3333333333333, true, '2024-05-22 20:36:14.96+03', '2024-05-22 20:36:14.96+03');
INSERT INTO public.statistics_alls VALUES (1748, 1, 'light', 223.36363636363637, true, '2024-05-22 20:36:14.984+03', '2024-05-22 20:36:14.984+03');
INSERT INTO public.statistics_alls VALUES (1749, 1, 'hard_action', 2.472627373381347, true, '2024-05-22 20:36:14.998+03', '2024-05-22 20:36:14.998+03');
INSERT INTO public.statistics_alls VALUES (1750, 1, 'easy_action', 23.45024333763403, true, '2024-05-22 20:36:15.006+03', '2024-05-22 20:36:15.006+03');
INSERT INTO public.statistics_alls VALUES (1751, 1, 'analog_tracking_test', 76.48479427549131, true, '2024-05-22 20:36:15.016+03', '2024-05-22 20:36:15.016+03');
INSERT INTO public.statistics_alls VALUES (1752, 1, '3_colors', 284.6666666666667, true, '2024-05-22 20:36:15.029+03', '2024-05-22 20:36:15.029+03');
INSERT INTO public.statistics_alls VALUES (1753, 1, 'math_vis', 202.438, true, '2024-05-22 20:36:15.038+03', '2024-05-22 20:36:15.038+03');
INSERT INTO public.statistics_alls VALUES (1754, 1, 'random_access_memory', 4, true, '2024-05-22 20:36:15.047+03', '2024-05-22 20:36:15.047+03');
INSERT INTO public.statistics_alls VALUES (1755, 1, 'short_term_memory_test', 10, true, '2024-05-22 20:36:15.055+03', '2024-05-22 20:36:15.055+03');
INSERT INTO public.statistics_alls VALUES (1756, 1, 'myunsterberg_test', 8, true, '2024-05-22 20:36:15.064+03', '2024-05-22 20:36:15.064+03');
INSERT INTO public.statistics_alls VALUES (1757, 1, 'compare_test', 17, true, '2024-05-22 20:36:15.073+03', '2024-05-22 20:36:15.073+03');
INSERT INTO public.statistics_alls VALUES (1758, 1, 'attention_assessment_test', 1019.1176470623296, true, '2024-05-22 20:36:15.081+03', '2024-05-22 20:36:15.081+03');
INSERT INTO public.statistics_alls VALUES (1759, 1, 'abstract_thinking_test', 5, true, '2024-05-22 20:36:15.089+03', '2024-05-22 20:36:15.089+03');
INSERT INTO public.statistics_alls VALUES (1760, 1, 'abstract_test', 4, true, '2024-05-22 20:36:15.097+03', '2024-05-22 20:36:15.097+03');
INSERT INTO public.statistics_alls VALUES (1761, 3, 'sound', 258.47243564122624, true, '2024-05-22 20:36:15.106+03', '2024-05-22 20:36:15.106+03');
INSERT INTO public.statistics_alls VALUES (1762, 3, 'light', 212.26699383677655, true, '2024-05-22 20:36:15.113+03', '2024-05-22 20:36:15.113+03');
INSERT INTO public.statistics_alls VALUES (1763, 3, 'hard_action', 20.427807605255698, true, '2024-05-22 20:36:15.121+03', '2024-05-22 20:36:15.121+03');
INSERT INTO public.statistics_alls VALUES (1764, 3, 'easy_action', 36.858041813895746, true, '2024-05-22 20:36:15.128+03', '2024-05-22 20:36:15.128+03');
INSERT INTO public.statistics_alls VALUES (1765, 3, 'analog_tracking_test', 64.67059402544972, true, '2024-05-22 20:36:15.135+03', '2024-05-22 20:36:15.135+03');
INSERT INTO public.statistics_alls VALUES (1766, 3, '3_colors', 206.425, true, '2024-05-22 20:36:15.143+03', '2024-05-22 20:36:15.143+03');
INSERT INTO public.statistics_alls VALUES (1767, 3, 'math_vis', 342.905, true, '2024-05-22 20:36:15.148+03', '2024-05-22 20:36:15.148+03');
INSERT INTO public.statistics_alls VALUES (1768, 3, 'random_access_memory', 5, true, '2024-05-22 20:36:15.154+03', '2024-05-22 20:36:15.154+03');
INSERT INTO public.statistics_alls VALUES (1769, 3, 'short_term_memory_test', 6, true, '2024-05-22 20:36:15.162+03', '2024-05-22 20:36:15.162+03');
INSERT INTO public.statistics_alls VALUES (1770, 3, 'myunsterberg_test', 5, true, '2024-05-22 20:36:15.17+03', '2024-05-22 20:36:15.17+03');
INSERT INTO public.statistics_alls VALUES (1771, 3, 'compare_test', 22, true, '2024-05-22 20:36:15.178+03', '2024-05-22 20:36:15.178+03');
INSERT INTO public.statistics_alls VALUES (1772, 3, 'attention_assessment_test', 973.4765872, true, '2024-05-22 20:36:15.185+03', '2024-05-22 20:36:15.185+03');
INSERT INTO public.statistics_alls VALUES (1773, 3, 'abstract_thinking_test', 5, true, '2024-05-22 20:36:15.192+03', '2024-05-22 20:36:15.192+03');
INSERT INTO public.statistics_alls VALUES (1774, 3, 'abstract_test', 4, true, '2024-05-22 20:36:15.199+03', '2024-05-22 20:36:15.199+03');
INSERT INTO public.statistics_alls VALUES (1775, 4, 'sound', 230.75327706341255, true, '2024-05-22 20:36:15.208+03', '2024-05-22 20:36:15.208+03');
INSERT INTO public.statistics_alls VALUES (1776, 4, 'light', 256.8548555483072, true, '2024-05-22 20:36:15.215+03', '2024-05-22 20:36:15.215+03');
INSERT INTO public.statistics_alls VALUES (1777, 4, 'hard_action', 22.84853173535749, true, '2024-05-22 20:36:15.222+03', '2024-05-22 20:36:15.222+03');
INSERT INTO public.statistics_alls VALUES (1778, 4, 'easy_action', 20.81618294935217, true, '2024-05-22 20:36:15.23+03', '2024-05-22 20:36:15.23+03');
INSERT INTO public.statistics_alls VALUES (1779, 4, 'analog_tracking_test', 56.322178849274565, true, '2024-05-22 20:36:15.238+03', '2024-05-22 20:36:15.238+03');
INSERT INTO public.statistics_alls VALUES (1780, 4, '3_colors', 329.725, true, '2024-05-22 20:36:15.245+03', '2024-05-22 20:36:15.245+03');
INSERT INTO public.statistics_alls VALUES (1781, 4, 'math_vis', 196.715, true, '2024-05-22 20:36:15.253+03', '2024-05-22 20:36:15.253+03');
INSERT INTO public.statistics_alls VALUES (1782, 4, 'random_access_memory', 5, true, '2024-05-22 20:36:15.262+03', '2024-05-22 20:36:15.262+03');
INSERT INTO public.statistics_alls VALUES (1783, 4, 'short_term_memory_test', 2, true, '2024-05-22 20:36:15.273+03', '2024-05-22 20:36:15.273+03');
INSERT INTO public.statistics_alls VALUES (1784, 4, 'myunsterberg_test', 6, true, '2024-05-22 20:36:15.283+03', '2024-05-22 20:36:15.283+03');
INSERT INTO public.statistics_alls VALUES (1785, 4, 'compare_test', 15, true, '2024-05-22 20:36:15.292+03', '2024-05-22 20:36:15.292+03');
INSERT INTO public.statistics_alls VALUES (1786, 4, 'attention_assessment_test', 889.7634733, true, '2024-05-22 20:36:15.302+03', '2024-05-22 20:36:15.302+03');
INSERT INTO public.statistics_alls VALUES (1787, 4, 'abstract_thinking_test', 5, true, '2024-05-22 20:36:15.311+03', '2024-05-22 20:36:15.311+03');
INSERT INTO public.statistics_alls VALUES (1788, 4, 'abstract_test', 5, true, '2024-05-22 20:36:15.318+03', '2024-05-22 20:36:15.318+03');
INSERT INTO public.statistics_alls VALUES (1789, 5, 'sound', 236.33877919643623, true, '2024-05-22 20:36:15.329+03', '2024-05-22 20:36:15.329+03');
INSERT INTO public.statistics_alls VALUES (1790, 5, 'light', 214.30885419748378, true, '2024-05-22 20:36:15.342+03', '2024-05-22 20:36:15.342+03');
INSERT INTO public.statistics_alls VALUES (1791, 5, 'hard_action', 20.53409543551853, true, '2024-05-22 20:36:15.409+03', '2024-05-22 20:36:15.409+03');
INSERT INTO public.statistics_alls VALUES (1792, 5, 'easy_action', 24.94094450546699, true, '2024-05-22 20:36:15.418+03', '2024-05-22 20:36:15.418+03');
INSERT INTO public.statistics_alls VALUES (1793, 5, 'analog_tracking_test', 55.82460240784179, true, '2024-05-22 20:36:15.428+03', '2024-05-22 20:36:15.428+03');
INSERT INTO public.statistics_alls VALUES (1794, 5, '3_colors', 269.383, true, '2024-05-22 20:36:15.435+03', '2024-05-22 20:36:15.435+03');
INSERT INTO public.statistics_alls VALUES (1795, 5, 'math_vis', 366.431, true, '2024-05-22 20:36:15.44+03', '2024-05-22 20:36:15.44+03');
INSERT INTO public.statistics_alls VALUES (1796, 5, 'random_access_memory', 2, true, '2024-05-22 20:36:15.445+03', '2024-05-22 20:36:15.445+03');
INSERT INTO public.statistics_alls VALUES (1797, 5, 'short_term_memory_test', 2, true, '2024-05-22 20:36:15.45+03', '2024-05-22 20:36:15.45+03');
INSERT INTO public.statistics_alls VALUES (1798, 5, 'myunsterberg_test', 6, true, '2024-05-22 20:36:15.455+03', '2024-05-22 20:36:15.455+03');
INSERT INTO public.statistics_alls VALUES (1799, 5, 'compare_test', 14, true, '2024-05-22 20:36:15.459+03', '2024-05-22 20:36:15.459+03');
INSERT INTO public.statistics_alls VALUES (1800, 5, 'attention_assessment_test', 1025.48634, true, '2024-05-22 20:36:15.464+03', '2024-05-22 20:36:15.464+03');
INSERT INTO public.statistics_alls VALUES (1801, 5, 'abstract_thinking_test', 3, true, '2024-05-22 20:36:15.47+03', '2024-05-22 20:36:15.47+03');
INSERT INTO public.statistics_alls VALUES (1802, 5, 'abstract_test', 3, true, '2024-05-22 20:36:15.474+03', '2024-05-22 20:36:15.474+03');
INSERT INTO public.statistics_alls VALUES (1803, 6, 'sound', 329.8104816606433, true, '2024-05-22 20:36:15.48+03', '2024-05-22 20:36:15.48+03');
INSERT INTO public.statistics_alls VALUES (1804, 6, 'light', 213.385507512795, true, '2024-05-22 20:36:15.484+03', '2024-05-22 20:36:15.484+03');
INSERT INTO public.statistics_alls VALUES (1805, 6, 'hard_action', 20.096361465542962, true, '2024-05-22 20:36:15.49+03', '2024-05-22 20:36:15.49+03');
INSERT INTO public.statistics_alls VALUES (1806, 6, 'easy_action', 35.69273455634901, true, '2024-05-22 20:36:15.497+03', '2024-05-22 20:36:15.497+03');
INSERT INTO public.statistics_alls VALUES (1807, 6, 'analog_tracking_test', 62.00292653333081, true, '2024-05-22 20:36:15.503+03', '2024-05-22 20:36:15.503+03');
INSERT INTO public.statistics_alls VALUES (1808, 6, '3_colors', 186.014, true, '2024-05-22 20:36:15.509+03', '2024-05-22 20:36:15.509+03');
INSERT INTO public.statistics_alls VALUES (1809, 6, 'math_vis', 199.438, true, '2024-05-22 20:36:15.515+03', '2024-05-22 20:36:15.515+03');
INSERT INTO public.statistics_alls VALUES (1810, 6, 'random_access_memory', 3, true, '2024-05-22 20:36:15.52+03', '2024-05-22 20:36:15.52+03');
INSERT INTO public.statistics_alls VALUES (1811, 6, 'short_term_memory_test', 3, true, '2024-05-22 20:36:15.528+03', '2024-05-22 20:36:15.528+03');
INSERT INTO public.statistics_alls VALUES (1812, 6, 'myunsterberg_test', 5, true, '2024-05-22 20:36:15.536+03', '2024-05-22 20:36:15.536+03');
INSERT INTO public.statistics_alls VALUES (1813, 6, 'compare_test', 22, true, '2024-05-22 20:36:15.542+03', '2024-05-22 20:36:15.542+03');
INSERT INTO public.statistics_alls VALUES (1814, 6, 'attention_assessment_test', 953.435265, true, '2024-05-22 20:36:15.549+03', '2024-05-22 20:36:15.549+03');
INSERT INTO public.statistics_alls VALUES (1815, 6, 'abstract_thinking_test', 4, true, '2024-05-22 20:36:15.556+03', '2024-05-22 20:36:15.556+03');
INSERT INTO public.statistics_alls VALUES (1816, 6, 'abstract_test', 3, true, '2024-05-22 20:36:15.564+03', '2024-05-22 20:36:15.564+03');
INSERT INTO public.statistics_alls VALUES (1817, 7, 'sound', 373.8425288017429, true, '2024-05-22 20:36:15.572+03', '2024-05-22 20:36:15.572+03');
INSERT INTO public.statistics_alls VALUES (1818, 7, 'light', 199.40491227586, true, '2024-05-22 20:36:15.58+03', '2024-05-22 20:36:15.58+03');
INSERT INTO public.statistics_alls VALUES (1819, 7, 'hard_action', 20.52931371260516, true, '2024-05-22 20:36:15.588+03', '2024-05-22 20:36:15.588+03');
INSERT INTO public.statistics_alls VALUES (1820, 7, 'easy_action', 42.93460358044038, true, '2024-05-22 20:36:15.595+03', '2024-05-22 20:36:15.595+03');
INSERT INTO public.statistics_alls VALUES (1821, 7, 'analog_tracking_test', 52.118408344756574, true, '2024-05-22 20:36:15.602+03', '2024-05-22 20:36:15.602+03');
INSERT INTO public.statistics_alls VALUES (1822, 7, '3_colors', 309.663, true, '2024-05-22 20:36:15.609+03', '2024-05-22 20:36:15.609+03');
INSERT INTO public.statistics_alls VALUES (1823, 7, 'math_vis', 237.542, true, '2024-05-22 20:36:15.618+03', '2024-05-22 20:36:15.618+03');
INSERT INTO public.statistics_alls VALUES (1824, 7, 'random_access_memory', 6, true, '2024-05-22 20:36:15.627+03', '2024-05-22 20:36:15.627+03');
INSERT INTO public.statistics_alls VALUES (1825, 7, 'short_term_memory_test', 3, true, '2024-05-22 20:36:15.636+03', '2024-05-22 20:36:15.636+03');
INSERT INTO public.statistics_alls VALUES (1826, 7, 'myunsterberg_test', 5, true, '2024-05-22 20:36:15.643+03', '2024-05-22 20:36:15.643+03');
INSERT INTO public.statistics_alls VALUES (1827, 7, 'compare_test', 19, true, '2024-05-22 20:36:15.653+03', '2024-05-22 20:36:15.653+03');
INSERT INTO public.statistics_alls VALUES (1828, 7, 'attention_assessment_test', 998.45628525, true, '2024-05-22 20:36:15.659+03', '2024-05-22 20:36:15.659+03');
INSERT INTO public.statistics_alls VALUES (1829, 7, 'abstract_thinking_test', 3, true, '2024-05-22 20:36:15.668+03', '2024-05-22 20:36:15.668+03');
INSERT INTO public.statistics_alls VALUES (1830, 7, 'abstract_test', 4, true, '2024-05-22 20:36:15.677+03', '2024-05-22 20:36:15.677+03');
INSERT INTO public.statistics_alls VALUES (1831, 8, 'sound', 292.4164782029158, true, '2024-05-22 20:36:15.685+03', '2024-05-22 20:36:15.685+03');
INSERT INTO public.statistics_alls VALUES (1832, 8, 'light', 287.71678836248367, true, '2024-05-22 20:36:15.696+03', '2024-05-22 20:36:15.696+03');
INSERT INTO public.statistics_alls VALUES (1833, 8, 'hard_action', 19.5294546632494, true, '2024-05-22 20:36:15.704+03', '2024-05-22 20:36:15.704+03');
INSERT INTO public.statistics_alls VALUES (1834, 8, 'easy_action', 41.68173765271828, true, '2024-05-22 20:36:15.712+03', '2024-05-22 20:36:15.712+03');
INSERT INTO public.statistics_alls VALUES (1835, 8, 'analog_tracking_test', 71.05096421231823, true, '2024-05-22 20:36:15.72+03', '2024-05-22 20:36:15.72+03');
INSERT INTO public.statistics_alls VALUES (1836, 8, '3_colors', 194.272, true, '2024-05-22 20:36:15.727+03', '2024-05-22 20:36:15.727+03');
INSERT INTO public.statistics_alls VALUES (1837, 8, 'math_vis', 205.738, true, '2024-05-22 20:36:15.735+03', '2024-05-22 20:36:15.735+03');
INSERT INTO public.statistics_alls VALUES (1838, 8, 'random_access_memory', 4, true, '2024-05-22 20:36:15.744+03', '2024-05-22 20:36:15.744+03');
INSERT INTO public.statistics_alls VALUES (1839, 8, 'short_term_memory_test', 6, true, '2024-05-22 20:36:15.752+03', '2024-05-22 20:36:15.752+03');
INSERT INTO public.statistics_alls VALUES (1840, 8, 'myunsterberg_test', 2, true, '2024-05-22 20:36:15.761+03', '2024-05-22 20:36:15.761+03');
INSERT INTO public.statistics_alls VALUES (1841, 8, 'compare_test', 22, true, '2024-05-22 20:36:15.77+03', '2024-05-22 20:36:15.77+03');
INSERT INTO public.statistics_alls VALUES (1842, 8, 'attention_assessment_test', 1007.058375, true, '2024-05-22 20:36:15.777+03', '2024-05-22 20:36:15.777+03');
INSERT INTO public.statistics_alls VALUES (1843, 8, 'abstract_thinking_test', 2, true, '2024-05-22 20:36:15.785+03', '2024-05-22 20:36:15.785+03');
INSERT INTO public.statistics_alls VALUES (1844, 8, 'abstract_test', 6, true, '2024-05-22 20:36:15.793+03', '2024-05-22 20:36:15.793+03');
INSERT INTO public.statistics_alls VALUES (1845, 9, 'sound', 272.077564293715, true, '2024-05-22 20:36:15.802+03', '2024-05-22 20:36:15.802+03');
INSERT INTO public.statistics_alls VALUES (1846, 9, 'light', 212.39206738545525, true, '2024-05-22 20:36:15.81+03', '2024-05-22 20:36:15.81+03');
INSERT INTO public.statistics_alls VALUES (1847, 9, 'hard_action', 21.868780722436732, true, '2024-05-22 20:36:15.82+03', '2024-05-22 20:36:15.82+03');
INSERT INTO public.statistics_alls VALUES (1848, 9, 'easy_action', 24.488649723758307, true, '2024-05-22 20:36:15.828+03', '2024-05-22 20:36:15.828+03');
INSERT INTO public.statistics_alls VALUES (1849, 9, 'analog_tracking_test', 78.22590733652709, true, '2024-05-22 20:36:15.836+03', '2024-05-22 20:36:15.836+03');
INSERT INTO public.statistics_alls VALUES (1850, 9, '3_colors', 315.153, true, '2024-05-22 20:36:15.844+03', '2024-05-22 20:36:15.844+03');
INSERT INTO public.statistics_alls VALUES (1851, 9, 'math_vis', 235.405, true, '2024-05-22 20:36:15.855+03', '2024-05-22 20:36:15.855+03');
INSERT INTO public.statistics_alls VALUES (1852, 9, 'random_access_memory', 3, true, '2024-05-22 20:36:15.864+03', '2024-05-22 20:36:15.864+03');
INSERT INTO public.statistics_alls VALUES (1853, 9, 'short_term_memory_test', 2, true, '2024-05-22 20:36:15.872+03', '2024-05-22 20:36:15.872+03');
INSERT INTO public.statistics_alls VALUES (1854, 9, 'myunsterberg_test', 5, true, '2024-05-22 20:36:15.881+03', '2024-05-22 20:36:15.881+03');
INSERT INTO public.statistics_alls VALUES (1855, 9, 'compare_test', 25, true, '2024-05-22 20:36:15.89+03', '2024-05-22 20:36:15.89+03');
INSERT INTO public.statistics_alls VALUES (1856, 9, 'attention_assessment_test', 4, true, '2024-05-22 20:36:15.896+03', '2024-05-22 20:36:15.896+03');
INSERT INTO public.statistics_alls VALUES (1857, 9, 'abstract_thinking_test', 5, true, '2024-05-22 20:36:15.9+03', '2024-05-22 20:36:15.9+03');
INSERT INTO public.statistics_alls VALUES (1858, 9, 'abstract_test', 5, true, '2024-05-22 20:36:15.905+03', '2024-05-22 20:36:15.905+03');
INSERT INTO public.statistics_alls VALUES (1859, 10, 'sound', 0, false, '2024-05-22 20:36:15.91+03', '2024-05-22 20:36:15.91+03');
INSERT INTO public.statistics_alls VALUES (1860, 10, 'light', 0, false, '2024-05-22 20:36:15.915+03', '2024-05-22 20:36:15.915+03');
INSERT INTO public.statistics_alls VALUES (1861, 10, 'hard_action', 0, false, '2024-05-22 20:36:15.921+03', '2024-05-22 20:36:15.921+03');
INSERT INTO public.statistics_alls VALUES (1862, 10, 'easy_action', 0, false, '2024-05-22 20:36:15.927+03', '2024-05-22 20:36:15.927+03');
INSERT INTO public.statistics_alls VALUES (1863, 10, 'analog_tracking_test', 0, false, '2024-05-22 20:36:15.933+03', '2024-05-22 20:36:15.933+03');
INSERT INTO public.statistics_alls VALUES (1864, 10, '3_colors', 0, false, '2024-05-22 20:36:15.941+03', '2024-05-22 20:36:15.941+03');
INSERT INTO public.statistics_alls VALUES (1865, 10, 'math_vis', 0, false, '2024-05-22 20:36:15.947+03', '2024-05-22 20:36:15.947+03');
INSERT INTO public.statistics_alls VALUES (1866, 10, 'random_access_memory', 0, false, '2024-05-22 20:36:15.954+03', '2024-05-22 20:36:15.954+03');
INSERT INTO public.statistics_alls VALUES (1867, 10, 'short_term_memory_test', 0, false, '2024-05-22 20:36:15.96+03', '2024-05-22 20:36:15.96+03');
INSERT INTO public.statistics_alls VALUES (1868, 10, 'myunsterberg_test', 0, false, '2024-05-22 20:36:15.967+03', '2024-05-22 20:36:15.967+03');
INSERT INTO public.statistics_alls VALUES (1869, 10, 'compare_test', 0, false, '2024-05-22 20:36:15.974+03', '2024-05-22 20:36:15.974+03');
INSERT INTO public.statistics_alls VALUES (1870, 10, 'attention_assessment_test', 0, false, '2024-05-22 20:36:15.981+03', '2024-05-22 20:36:15.981+03');
INSERT INTO public.statistics_alls VALUES (1871, 10, 'abstract_thinking_test', 0, false, '2024-05-22 20:36:15.987+03', '2024-05-22 20:36:15.987+03');
INSERT INTO public.statistics_alls VALUES (1872, 10, 'abstract_test', 0, false, '2024-05-22 20:36:15.994+03', '2024-05-22 20:36:15.994+03');


--
-- TOC entry 4870 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'Витя', '$2b$10$TvqBPOnK2SeMUpcPXSoYPepLM5gsd0VLeHJZTlb01EC9BppjADF5q', true, 18, 'm', '2024-04-02 23:58:49.912+03', '2024-04-02 23:58:49.912+03', true, 'test@mail.ru');
INSERT INTO public.users VALUES (3, 'Матвей', '$2b$10$fzvk3x0qnRdFov8hpFD5Y.Ty6HMiBu1q78RlpeXo7Quc1e1ao01eO', true, 18, 'm', '2024-04-07 12:52:51.889+03', '2024-04-07 12:52:51.889+03', true, 'test@mail.ru');
INSERT INTO public.users VALUES (4, 'Никита', '$2b$10$SQiDh1tVCCwKQeAA5/w1yebKObHufnj2mKBxcxZPvnmRAhtAbKPhy', true, 18, 'm', '2024-04-07 12:53:00.619+03', '2024-04-07 12:53:00.619+03', true, 'test@mail.ru');
INSERT INTO public.users VALUES (5, 'Эдик', '$2b$10$mBg5GXVSfkWOF.H90zCkkOWIOwB/WwuJRF9KbIrAjaxoCiK5IklWy', true, 18, 'm', '2024-04-07 12:53:08.499+03', '2024-04-07 12:53:08.499+03', true, 'test@mail.ru');
INSERT INTO public.users VALUES (6, 'Юля', '$2b$10$61cec.ZeOnl.aOr1IDqPkOBjED6fmdlULc1ZJyHccagDUngU8SWlm', true, 18, 'm', '2024-04-07 12:53:14.557+03', '2024-04-07 12:53:14.557+03', true, 'test@mail.ru');
INSERT INTO public.users VALUES (7, 'Влад', '$2b$10$poH3hJh8x6Z6/KkT8sv7S.Yonc.PdCgy9/DxDZYGl9P2aYc2251mS', true, 18, 'm', '2024-04-07 12:53:22.501+03', '2024-04-07 12:53:22.501+03', true, 'test@mail.ru');
INSERT INTO public.users VALUES (8, 'Стёпа', '$2b$10$/ZfwE4OAeP..o0LE96LsZu6ggMmHBiMNaSIvQZtETVquYpn9gcEwO', true, 18, 'm', '2024-04-07 12:53:31.46+03', '2024-04-07 12:53:31.46+03', true, 'test@mail.ru');
INSERT INTO public.users VALUES (9, 'Эля', '$2b$10$E8YiycTJR9C1dDJU5RxEsub2jXbqi8NXB0KeFsLw8Wlt/kls58o9W', true, 18, 'm', '2024-04-07 12:53:39.346+03', '2024-04-07 12:53:39.346+03', true, 'test@mail.ru');
INSERT INTO public.users VALUES (10, 'test4', '$2b$10$v37D.ARLfhjm67Kq.U/ecuKwitiD/ZIDlRXKWbvO0G2.J6yRLfoy.', false, 18, 'm', '2024-04-15 17:28:36.316+03', '2024-04-15 17:28:36.316+03', true, 'test@mail.ru');


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 233
-- Name: abstract_tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.abstract_tests_id_seq', 93, true);


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 225
-- Name: accuracy_tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accuracy_tests_id_seq', 34, true);


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 221
-- Name: complex_reaction_tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complex_reaction_tests_id_seq', 37, true);


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 229
-- Name: heart_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.heart_rates_id_seq', 249, true);


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 223
-- Name: invite_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invite_links_id_seq', 1, false);


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 217
-- Name: polls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_id_seq', 44, true);


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 227
-- Name: professions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professions_id_seq', 4, true);


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 219
-- Name: reaction_tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reaction_tests_id_seq', 29, true);


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 231
-- Name: statistics_alls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statistics_alls_id_seq', 1872, true);


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- TOC entry 4725 (class 2606 OID 16537)
-- Name: abstract_tests abstract_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abstract_tests
    ADD CONSTRAINT abstract_tests_pkey PRIMARY KEY (id);


--
-- TOC entry 4717 (class 2606 OID 16448)
-- Name: accuracy_tests accuracy_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accuracy_tests
    ADD CONSTRAINT accuracy_tests_pkey PRIMARY KEY (id);


--
-- TOC entry 4713 (class 2606 OID 16432)
-- Name: complex_reaction_tests complex_reaction_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complex_reaction_tests
    ADD CONSTRAINT complex_reaction_tests_pkey PRIMARY KEY (id);


--
-- TOC entry 4721 (class 2606 OID 16523)
-- Name: heart_rates heart_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.heart_rates
    ADD CONSTRAINT heart_rates_pkey PRIMARY KEY (id);


--
-- TOC entry 4715 (class 2606 OID 16441)
-- Name: invite_links invite_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite_links
    ADD CONSTRAINT invite_links_pkey PRIMARY KEY (id);


--
-- TOC entry 4709 (class 2606 OID 16418)
-- Name: polls polls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls
    ADD CONSTRAINT polls_pkey PRIMARY KEY (id);


--
-- TOC entry 4719 (class 2606 OID 16497)
-- Name: professions professions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professions
    ADD CONSTRAINT professions_pkey PRIMARY KEY (id);


--
-- TOC entry 4711 (class 2606 OID 16425)
-- Name: reaction_tests reaction_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reaction_tests
    ADD CONSTRAINT reaction_tests_pkey PRIMARY KEY (id);


--
-- TOC entry 4723 (class 2606 OID 16530)
-- Name: statistics_alls statistics_alls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistics_alls
    ADD CONSTRAINT statistics_alls_pkey PRIMARY KEY (id);


--
-- TOC entry 4705 (class 2606 OID 16409)
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- TOC entry 4707 (class 2606 OID 16407)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2024-05-22 20:44:28

--
-- PostgreSQL database dump complete
--

