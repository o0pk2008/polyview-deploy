--
-- PostgreSQL database dump
--

\restrict BSk1RdtzK0GOZl5Q3w34DE6zRYYgxDbYiBcktqarWSop9EaVe3uHIZV2qsofC4t

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: polyview_gpu; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE polyview_gpu WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Chinese (Simplified)_Singapore.1252';


\unrestrict BSk1RdtzK0GOZl5Q3w34DE6zRYYgxDbYiBcktqarWSop9EaVe3uHIZV2qsofC4t
\connect polyview_gpu
\restrict BSk1RdtzK0GOZl5Q3w34DE6zRYYgxDbYiBcktqarWSop9EaVe3uHIZV2qsofC4t

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: export; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.export (
    id integer NOT NULL,
    project_id character varying(255) NOT NULL,
    configpath text,
    export_format character varying(50),
    cropposition text,
    cropscale text,
    croprotation text,
    status character varying(50) DEFAULT 'Waiting'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: export_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.export_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: export_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.export_id_seq OWNED BY public.export.id;


--
-- Name: gpuserver; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gpuserver (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ip_address character varying(255) NOT NULL,
    port integer NOT NULL,
    status character varying(50) DEFAULT 'idle'::character varying,
    priority integer DEFAULT 0,
    node_type character varying(50) DEFAULT 'GNode'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_heartbeat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: gpuserver_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gpuserver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gpuserver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gpuserver_id_seq OWNED BY public.gpuserver.id;


--
-- Name: taskproject; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taskproject (
    id integer NOT NULL,
    project_id character varying(255) NOT NULL,
    video_path text,
    start_time timestamp without time zone,
    finish_time timestamp without time zone,
    progress integer DEFAULT 0,
    status character varying(50) DEFAULT 'Waiting'::character varying,
    finish integer DEFAULT 0,
    type character varying(50) DEFAULT 'train'::character varying,
    configpath text,
    cropposition text,
    cropscale text,
    croprotation text,
    export_mesh integer DEFAULT 0,
    error_message text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_bg_removed integer DEFAULT 0
);


--
-- Name: taskproject_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taskproject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taskproject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taskproject_id_seq OWNED BY public.taskproject.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: export id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.export ALTER COLUMN id SET DEFAULT nextval('public.export_id_seq'::regclass);


--
-- Name: gpuserver id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpuserver ALTER COLUMN id SET DEFAULT nextval('public.gpuserver_id_seq'::regclass);


--
-- Name: taskproject id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taskproject ALTER COLUMN id SET DEFAULT nextval('public.taskproject_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: export; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.export (id, project_id, configpath, export_format, cropposition, cropscale, croprotation, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: gpuserver; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gpuserver (id, name, ip_address, port, status, priority, node_type, created_at, updated_at, last_heartbeat) FROM stdin;
1	GPU1-4090TI	192.168.1.191	5201	offline	1	GNode	2026-01-21 13:20:52.128087	2026-01-21 13:20:52.128087	2026-01-21 13:43:15.707732
2	GPU2-4090TI	192.168.2.94	5201	offline	1	GNode	2026-01-21 13:20:52.128087	2026-01-21 13:20:52.128087	2026-01-21 13:43:15.707732
4	GPU4-3090	192.168.1.209	5201	offline	1	GNode	2026-01-21 13:20:52.128087	2026-01-21 13:20:52.128087	2026-01-21 13:43:15.707732
5	GPU5-4090TI	192.168.1.191	9301	offline	1	TNode	2026-01-21 13:20:52.128087	2026-01-21 13:20:52.128087	2026-01-21 13:43:15.707732
6	GPU6-4090TI	192.168.2.94	5301	offline	1	TNode	2026-01-21 13:20:52.128087	2026-01-21 13:20:52.128087	2026-01-27 10:50:29.588625
3	GPU3-5090	192.168.6.21	5201	idle	1	GNode	2026-01-21 13:20:52.128087	2026-01-21 13:20:52.128087	2026-02-02 10:11:55.466712
\.


--
-- Data for Name: taskproject; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taskproject (id, project_id, video_path, start_time, finish_time, progress, status, finish, type, configpath, cropposition, cropscale, croprotation, export_mesh, error_message, created_at, updated_at, is_bg_removed) FROM stdin;
613	20260130_cd8ed992fd7611f0b272507c6f574e05	uploads/20260130_cd8ed992fd7611f0b272507c6f574e05/1UFASYOM2W.mov	2026-01-30 08:59:39	2026-01-30 01:04:03.443354	100	End	1	train					0	\N	2026-01-30 00:59:39.49903	2026-01-30 00:59:39.49903	0
616	20260130_a6982d41fdb311f0a4af507c6f574e05	uploads/20260130_a6982d41fdb311f0a4af507c6f574e05/147B6Z6J2R.MOV	2026-01-30 16:14:14	2026-01-30 08:18:23.774872	100	End	1	train					0	\N	2026-01-30 08:14:14.592529	2026-01-30 08:14:14.592529	0
605	20260123_f95cdc4bf83311f09da0507c6f574e05	uploads/20260123_f95cdc4bf83311f09da0507c6f574e05/UZH9UFYT2E.mov	2026-01-23 16:17:37	2026-01-23 08:21:27.587511	100	End	1	train					0	\N	2026-01-23 08:17:37.24924	2026-01-23 08:17:37.24924	0
607	20260126_3515943bfa9011f0a568507c6f574e05	uploads/20260126_3515943bfa9011f0a568507c6f574e05/G83AV8JBIN.mov	2026-01-26 16:22:57	2026-01-26 08:27:57.519448	100	End	1	train					0	\N	2026-01-26 08:22:57.63873	2026-01-26 08:22:57.63873	1
608	20260126_3515943bfa9011f0a568507c6f574e05_2148	20260126_3515943bfa9011f0a568507c6f574e05	2026-01-26 16:54:05	2026-01-26 09:36:17.257588	100	End	1	nerfact					0	\N	2026-01-26 08:54:05.571411	2026-01-26 08:54:05.571411	1
609	20260123_f95cdc4bf83311f09da0507c6f574e05_5524	20260123_f95cdc4bf83311f09da0507c6f574e05	2026-01-26 17:43:25	2026-01-26 10:27:30.167382	100	End	1	nerfact					0	\N	2026-01-26 09:43:25.470577	2026-01-26 09:43:25.470577	0
1	20240201_1261	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240201_1261\\IMG_9143.mov	2024-02-01 22:36:52	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.424594	2026-01-21 13:31:53.424594	0
2	20240201_1319	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240201_1319\\IMG_9519.mov	2024-02-01 22:36:57	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.428098	2026-01-21 13:31:53.428098	0
3	20240201_4843	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240201_4843\\IMG_9346.mov	2024-02-01 22:37:02	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.429665	2026-01-21 13:31:53.429665	0
4	20240201_5109	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240201_5109\\IMG_9519.mov	2024-02-01 22:55:37	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.431037	2026-01-21 13:31:53.431037	0
5	20240202_8263	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240202_8263\\IMG_9519.mov	2024-02-02 18:23:35	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.43266	2026-01-21 13:31:53.43266	0
6	20240202_9206	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240202_9206\\IMG_9143.mov	2024-02-02 21:28:14	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.434447	2026-01-21 13:31:53.434447	0
7	20240202_7137	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240202_7137\\IMG_9346.mov	2024-02-02 21:28:20	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.43585	2026-01-21 13:31:53.43585	0
8	20240202_9446	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240202_9446\\IMG_9519.mov	2024-02-02 21:28:27	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.437253	2026-01-21 13:31:53.437253	0
9	20240203_6783	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240203_6783\\IMG_9519.mov	2024-02-03 15:22:16	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.438645	2026-01-21 13:31:53.438645	0
10	20240203_8290	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240203_8290\\IMG_9143.mov	2024-02-03 15:22:21	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.439997	2026-01-21 13:31:53.439997	0
11	20240203_9636	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240203_9636\\IMG_9519.mov	2024-02-03 16:01:55	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.441369	2026-01-21 13:31:53.441369	0
12	20240203_0543	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240203_0543\\IMG_9143.mov	2024-02-03 16:01:59	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.442762	2026-01-21 13:31:53.442762	0
13	20240203_2641	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240203_2641\\IMG_9519.mov	2024-02-03 16:17:43	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.444063	2026-01-21 13:31:53.444063	0
14	20240203_4822	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240203_4822\\IMG_9143.mov	2024-02-03 16:17:47	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.445555	2026-01-21 13:31:53.445555	0
15	20240205_7937	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240205_7937\\IMG_9519.mov	2024-02-05 18:49:49	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.446968	2026-01-21 13:31:53.446968	0
16	20240205_8329	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240205_8329\\IMG_9498.mp4	2024-02-05 23:56:41	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.44833	2026-01-21 13:31:53.44833	0
17	20240223_9110	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240223_9110\\IMG_0109.mov	2024-02-23 14:42:49	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.449848	2026-01-21 13:31:53.449848	0
18	20240226_7566	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240226_7566\\IMG_0109.mov	2024-02-26 09:51:05	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.451251	2026-01-21 13:31:53.451251	0
19	20240226_1126	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240226_1126\\WeChat_20240226165301.mp4	2024-02-26 16:59:33	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.452654	2026-01-21 13:31:53.452654	0
20	20240227_6811	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240227_6811\\bike.mp4	2024-02-27 10:57:28	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.454026	2026-01-21 13:31:53.454026	0
21	20240227_1999	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240227_1999\\IMG_0254.mov	2024-02-27 15:57:37	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.455398	2026-01-21 13:31:53.455398	0
22	20240227_3333	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240227_3333\\office_01.mp4	2024-02-27 16:09:50	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.456842	2026-01-21 13:31:53.456842	0
23	20240227_6982	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240227_6982\\IMG_0255.mov	2024-02-27 16:34:17	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.458214	2026-01-21 13:31:53.458214	0
24	20240227_4808	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240227_4808\\IMG_0256.mov	2024-02-27 16:52:21	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.459336	2026-01-21 13:31:53.459336	0
25	20240227_8399	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240227_8399\\IMG_0257.mov	2024-02-27 17:03:25	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.460703	2026-01-21 13:31:53.460703	0
26	20240229_5132	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240229_5132\\IMG_9346.mov	2024-02-29 10:19:38	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.462137	2026-01-21 13:31:53.462137	0
27	20240229_4302	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240229_4302\\IMG_0277.mov	2024-02-29 11:19:13	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.463559	2026-01-21 13:31:53.463559	0
28	20240229_5631	E:\\Python\\AI_V2M_Distributed\\AI_V2M_CloudStorage\\uploads\\20240229_5631\\IMG_9346.mov	2024-02-29 15:32:23	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.464941	2026-01-21 13:31:53.464941	0
29	20240325_6961	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240325_6961\\VID_20240325_163414.mp4	2024-03-25 16:34:59	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.466324	2026-01-21 13:31:53.466324	0
30	20240325_2910	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240325_2910\\IMG_0702.mov	2024-03-25 17:02:43	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.467675	2026-01-21 13:31:53.467675	0
31	20240325_2839	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240325_2839\\IMG_0702.mov	2024-03-25 21:46:02	\N	100	End	1	train	\N	\N	\N	\N	0	\N	2026-01-21 13:31:53.469089	2026-01-21 13:31:53.469089	0
32	20240326_0929	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240326_0929\\IMG_0702.mov	2024-03-26 17:25:42	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.470451	2026-01-21 13:31:53.470451	0
33	20240326_3915	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240326_3915\\IMG_0702.mov	2024-03-26 17:45:34	\N	98	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.471812	2026-01-21 13:31:53.471812	0
34	20240326_3258	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240326_3258\\IMG_0702.mov	2024-03-26 17:50:04	\N	98	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.473185	2026-01-21 13:31:53.473185	0
35	20240326_1045	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240326_1045\\IMG_0702.mov	2024-03-26 17:55:41	\N	98	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.474537	2026-01-21 13:31:53.474537	0
36	20240326_1045_4411	20240326_1045	2024-03-26 21:17:11	\N	100	End	0	export	outputs\\sfm\\nerfacto\\2024-03-26_175735\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.47596	2026-01-21 13:31:53.47596	0
37	20240326_8782	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240326_8782\\plant.mp4	2024-03-26 22:18:33	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.477362	2026-01-21 13:31:53.477362	0
38	20240326_8782_9774	20240326_8782	2024-03-27 00:59:57	\N	100	End	0	export	outputs\\sfm\\nerfacto\\2024-03-26_223058\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.478704	2026-01-21 13:31:53.478704	0
39	20240327_9835	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240327_9835\\plant.mp4	2024-03-27 16:03:57	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.480086	2026-01-21 13:31:53.480086	0
41	20240327_9835_1222	20240327_9835	2024-03-27 17:02:34	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-03-27_160517\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.481438	2026-01-21 13:31:53.481438	0
47	20240327_9835_4319	20240327_9835	2024-03-28 12:07:13	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-03-27_160517\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.48279	2026-01-21 13:31:53.48279	0
48	20240327_9835_6525	20240327_9835	2024-03-28 15:28:30	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-03-27_160517\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.484152	2026-01-21 13:31:53.484152	0
49	20240327_9835_1352	20240327_9835	2024-03-28 15:30:53	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-03-27_160517\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.485514	2026-01-21 13:31:53.485514	0
50	20240328_4805	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240328_4805\\IMG_0732.mov	2024-03-28 17:03:57	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.486865	2026-01-21 13:31:53.486865	0
51	20240328_4805_3144	20240328_4805	2024-03-28 17:55:30	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.488228	2026-01-21 13:31:53.488228	0
52	20240328_4805_5893	20240328_4805	2024-03-28 17:59:33	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.489569	2026-01-21 13:31:53.489569	0
53	20240328_4805_8970	20240328_4805	2024-03-28 18:11:16	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.490942	2026-01-21 13:31:53.490942	0
54	20240328_4805_3239	20240328_4805	2024-04-01 15:51:51	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.492333	2026-01-21 13:31:53.492333	0
55	20240328_4805_5479	20240328_4805	2024-04-01 15:55:13	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.493685	2026-01-21 13:31:53.493685	0
56	20240328_4805_2051	20240328_4805	2024-04-03 17:47:44	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.495037	2026-01-21 13:31:53.495037	0
57	20240328_4805_2678	20240328_4805	2024-04-03 17:50:53	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.496379	2026-01-21 13:31:53.496379	0
58	20240328_4805_5963	20240328_4805	2024-04-03 17:58:41	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.497884	2026-01-21 13:31:53.497884	0
59	20240328_4805_9735	20240328_4805	2024-04-03 17:59:08	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.499256	2026-01-21 13:31:53.499256	0
60	20240328_4805_4390	20240328_4805	2024-04-03 18:03:52	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.500618	2026-01-21 13:31:53.500618	0
61	20240328_4805_4352	20240328_4805	2024-04-03 18:04:45	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.50198	2026-01-21 13:31:53.50198	0
62	20240328_4805_3095	20240328_4805	2024-04-03 18:04:59	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.503331	2026-01-21 13:31:53.503331	0
63	20240404_9337	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240404_9337\\milk.mov	2024-04-04 14:36:24	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.504734	2026-01-21 13:31:53.504734	0
64	20240404_9337_1106	20240404_9337	2024-04-04 15:00:56	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-04_145052\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.506158	2026-01-21 13:31:53.506158	0
66	20240404_1965	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240404_1965\\milk.mov	2024-04-04 16:15:08	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.50752	2026-01-21 13:31:53.50752	0
67	20240404_1965_9784	20240404_1965	2024-04-04 16:31:25	\N	100	End	0	export	outputs\\sfm\\nerfacto\\2024-04-04_162128\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.508881	2026-01-21 13:31:53.508881	0
69	20240404_9377	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240404_9377\\IMG_0484.mov	2024-04-04 16:55:59	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.510233	2026-01-21 13:31:53.510233	0
70	20240404_9377_0595	20240404_9377	2024-04-04 17:23:02	\N	100	End	0	export	outputs\\sfm\\nerfacto\\2024-04-04_171227\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.511616	2026-01-21 13:31:53.511616	0
71	20240408_4772	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240408_4772\\milk.mov	2024-04-08 16:09:30	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.513008	2026-01-21 13:31:53.513008	0
72	20240408_4772_8595	20240408_4772	2024-04-08 16:34:23	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-08_162345\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.514442	2026-01-21 13:31:53.514442	0
73	20240408_4772_5503	20240408_4772	2024-04-08 16:52:12	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-08_162345\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.515804	2026-01-21 13:31:53.515804	0
74	20240408_9414	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240408_9414\\table.mov	2024-04-08 16:55:32	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.517176	2026-01-21 13:31:53.517176	0
75	20240408_9414_7584	20240408_9414	2024-04-08 17:13:23	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-08_170338\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.518548	2026-01-21 13:31:53.518548	0
76	20240408_9720	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240408_9720\\milk.mov	2024-04-08 21:47:54	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.51991	2026-01-21 13:31:53.51991	0
77	20240409_6915	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240409_6915\\milk.mov	2024-04-09 14:12:16	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.521187	2026-01-21 13:31:53.521187	0
78	20240409_6915_8120	20240409_6915	2024-04-09 14:37:59	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.522747	2026-01-21 13:31:53.522747	0
79	20240409_8644	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240409_8644\\事故车.mov	2024-04-09 16:44:51	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.524313	2026-01-21 13:31:53.524313	0
80	20240409_4487	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240409_4487\\案发现场.mov	2024-04-09 17:21:05	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.525808	2026-01-21 13:31:53.525808	0
81	20240409_8644_6963	20240409_8644	2024-04-09 17:24:44	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-09_170700\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.527293	2026-01-21 13:31:53.527293	0
82	20240409_4487_3196	20240409_4487	2024-04-09 18:34:44	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-09_180941\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.528706	2026-01-21 13:31:53.528706	0
83	20240409_6915_4291	20240409_6915	2024-04-11 17:51:22	\N	100	End	1	fbx	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.53014	2026-01-21 13:31:53.53014	0
84	20240409_6915_0602	20240409_6915	2024-04-11 17:51:22	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.531533	2026-01-21 13:31:53.531533	0
85	20240409_6915_6749	20240409_6915	2024-04-11 17:54:53	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.532946	2026-01-21 13:31:53.532946	0
86	20240409_6915_9687	20240409_6915	2024-04-11 17:55:25	\N	100	End	1	fbx	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.534328	2026-01-21 13:31:53.534328	0
87	20240409_6915_2767	20240409_6915	2024-04-11 18:07:14	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.535669	2026-01-21 13:31:53.535669	0
88	20240409_6915_9729	20240409_6915	2024-04-11 18:07:24	\N	100	End	1	fbx	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.537031	2026-01-21 13:31:53.537031	0
89	20240411_7592	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240411_7592\\8449.mov	2024-04-11 18:51:32	\N	100	End	1	train		\N	\N	\N	0	\N	2026-01-21 13:31:53.538414	2026-01-21 13:31:53.538414	0
90	20240411_7592_6127	20240411_7592	2024-04-11 19:36:08	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.539796	2026-01-21 13:31:53.539796	0
91	20240409_6915_8887	20240409_6915	2024-04-12 14:57:14	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.541209	2026-01-21 13:31:53.541209	0
92	20240409_6915_0202	20240409_6915	2024-04-12 14:57:26	\N	100	End	1	fbx	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.542582	2026-01-21 13:31:53.542582	0
93	20240409_6915_2555	20240409_6915	2024-04-12 15:08:02	\N	100	End	1	3ds	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.543985	2026-01-21 13:31:53.543985	0
94	20240409_6915_2817	20240409_6915	2024-04-12 15:08:12	\N	100	End	1	x	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.545346	2026-01-21 13:31:53.545346	0
95	20240409_6915_1796	20240409_6915	2024-04-12 15:09:59	\N	100	End	1	stl	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.546739	2026-01-21 13:31:53.546739	0
96	20240409_6915_9194	20240409_6915	2024-04-12 15:22:40	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.548152	2026-01-21 13:31:53.548152	0
97	20240409_6915_7584	20240409_6915	2024-04-12 16:35:31	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.549514	2026-01-21 13:31:53.549514	0
98	20240409_6915_5899	20240409_6915	2024-04-12 16:37:01	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.550896	2026-01-21 13:31:53.550896	0
99	20240409_6915_7181	20240409_6915	2024-04-12 16:38:02	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.552299	2026-01-21 13:31:53.552299	0
100	20240409_6915_5040	20240409_6915	2024-04-12 16:47:03	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.553692	2026-01-21 13:31:53.553692	0
101	20240409_6915_9670	20240409_6915	2024-04-12 16:47:10	\N	100	End	1	fbx	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.555061	2026-01-21 13:31:53.555061	0
102	20240409_6915_5538	20240409_6915	2024-04-12 16:47:18	\N	100	End	1	3ds	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.556518	2026-01-21 13:31:53.556518	0
103	20240409_6915_7604	20240409_6915	2024-04-12 16:47:31	\N	100	End	1	x	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.55788	2026-01-21 13:31:53.55788	0
104	20240409_6915_9523	20240409_6915	2024-04-12 16:47:42	\N	100	End	1	stl	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.559262	2026-01-21 13:31:53.559262	0
105	20240411_7592_6989	20240411_7592	2024-04-12 17:06:11	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.560655	2026-01-21 13:31:53.560655	0
106	20240411_7592_2884	20240411_7592	2024-04-12 17:11:33	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.562017	2026-01-21 13:31:53.562017	0
107	20240411_7592_1958	20240411_7592	2024-04-12 17:34:14	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.56341	2026-01-21 13:31:53.56341	0
108	20240411_7592_5263	20240411_7592	2024-04-12 17:34:25	\N	100	End	1	fbx	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.564782	2026-01-21 13:31:53.564782	0
109	20240411_7592_0549	20240411_7592	2024-04-12 17:34:42	\N	100	End	1	3ds	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.566133	2026-01-21 13:31:53.566133	0
110	20240411_7592_4162	20240411_7592	2024-04-12 17:34:51	\N	100	End	1	x	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.567485	2026-01-21 13:31:53.567485	0
111	20240411_7592_4353	20240411_7592	2024-04-12 17:35:06	\N	100	End	1	stl	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.568868	2026-01-21 13:31:53.568868	0
112	20240411_7592_4677	20240411_7592	2024-04-12 17:43:27	\N	100	End	1	gltf	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.570229	2026-01-21 13:31:53.570229	0
113	20240411_7592_0760	20240411_7592	2024-04-12 17:43:37	\N	100	End	1	fbx	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.571581	2026-01-21 13:31:53.571581	0
114	20240411_7592_3007	20240411_7592	2024-04-12 17:43:54	\N	100	End	1	3ds	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.572953	2026-01-21 13:31:53.572953	0
115	20240411_7592_2687	20240411_7592	2024-04-12 17:44:04	\N	100	End	1	x	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.574325	2026-01-21 13:31:53.574325	0
116	20240411_7592_2544	20240411_7592	2024-04-12 17:44:19	\N	100	End	1	stl	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml          	\N	\N	\N	0	\N	2026-01-21 13:31:53.575697	2026-01-21 13:31:53.575697	0
117	20240409_6915_9025	20240409_6915	2024-04-18 15:59:39	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	-0.014786571264266968, 0.01831430196762085, -1.2679270505905151	1.8304131627082825, 1.973347783088684, 3.3830344676971436	\N	0	\N	2026-01-21 13:31:53.577203	2026-01-21 13:31:53.577203	0
118	20240409_6915_5150	20240409_6915	2024-04-18 16:52:01	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-09_142801\\config.yml          	-0.014786571264266968, 0.01831430196762085, -1.2679270505905151	1.8304131627082825, 1.973347783088684, 3.3830344676971436	\N	0	\N	2026-01-21 13:31:53.578606	2026-01-21 13:31:53.578606	0
119	20240328_4805_8820	20240328_4805	2024-04-18 17:53:36	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-03-28_172629\\config.yml			\N	0	\N	2026-01-21 13:31:53.579957	2026-01-21 13:31:53.579957	0
120	20240408_9414_6448	20240408_9414	2024-04-18 17:54:57	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-08_170338\\config.yml			\N	0	\N	2026-01-21 13:31:53.58133	2026-01-21 13:31:53.58133	0
121	20240409_8644_4036	20240409_8644	2024-04-18 17:56:33	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-09_170700\\config.yml			\N	0	\N	2026-01-21 13:31:53.582681	2026-01-21 13:31:53.582681	0
122	20240409_4487_7623	20240409_4487	2024-04-18 17:57:20	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-09_180941\\config.yml			\N	0	\N	2026-01-21 13:31:53.584063	2026-01-21 13:31:53.584063	0
123	20240411_7592_8372	20240411_7592	2024-04-18 17:58:00	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-11_191900\\config.yml			\N	0	\N	2026-01-21 13:31:53.585426	2026-01-21 13:31:53.585426	0
124	20240409_4487_6526	20240409_4487	2024-04-18 17:59:33	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-09_180941\\config.yml			\N	0	\N	2026-01-21 13:31:53.586777	2026-01-21 13:31:53.586777	0
125	20240409_4487_8727	20240409_4487	2024-04-18 18:01:02	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-09_180941\\config.yml          	-0.1213533878326416, -0.0316145122051239, -0.5603375881910324	1.9197115898132324, 1.751609742641449, 0.2404252588748932	\N	0	\N	2026-01-21 13:31:53.5882	2026-01-21 13:31:53.5882	0
126	20240409_4487_5643	20240409_4487	2024-04-19 17:22:36	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-09_180941\\config.yml				0	\N	2026-01-21 13:31:53.589583	2026-01-21 13:31:53.589583	0
127	20240409_4487_0732	20240409_4487	2024-04-19 17:24:29	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-09_180941\\config.yml          	-0.13502377271652222, -0.032013505697250366, -0.5717691034078598	1.9470630884170532, 1.752493441104889, 0.22479084134101868	0.0, 0.0, 0.0	0	\N	2026-01-21 13:31:53.590955	2026-01-21 13:31:53.590955	0
128	20240409_4487_4158	20240409_4487	2024-04-19 17:30:37	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-09_180941\\config.yml          	-0.13502377271652222, -0.032013505697250366, -0.5717691034078598	1.9470630884170532, 1.752493441104889, 0.22479084134101868	0.0, 0.0, 0.0	0	\N	2026-01-21 13:31:53.592327	2026-01-21 13:31:53.592327	0
129	20240419_1536	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240419_1536\\IMG_0962.mov	2024-04-19 21:29:08	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.59371	2026-01-21 13:31:53.59371	0
130	20240419_1536_8604	20240419_1536	2024-04-19 21:50:43	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-19_213920\\config.yml          				0	\N	2026-01-21 13:31:53.595071	2026-01-21 13:31:53.595071	0
131	20240419_1536_3928	20240419_1536	2024-04-19 21:59:36	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-19_213920\\config.yml          	0.04500000000000004, -0.020000000000000018, -0.31	1.1700000000000002, 1.6, 0.42000000000000004	0, 0, 0	0	\N	2026-01-21 13:31:53.596433	2026-01-21 13:31:53.596433	0
132	20240419_1536_4188	20240419_1536	2024-04-19 22:07:22	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-19_213920\\config.yml          	0.04500000000000004, -0.020000000000000018, -0.31	1.1700000000000002, 1.6, 0.42000000000000004	0, 0, 0	0	\N	2026-01-21 13:31:53.597826	2026-01-21 13:31:53.597826	0
133	20240423_7034	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240423_7034\\bike.mp4	2024-04-23 17:39:48	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.599188	2026-01-21 13:31:53.599188	0
134	20240423_7034_7191	20240423_7034	2024-04-23 18:07:38	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-23_175655\\config.yml          				0	\N	2026-01-21 13:31:53.60057	2026-01-21 13:31:53.60057	0
135	20240425_1440	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240425_1440\\IMG_0962.mov	2024-04-25 18:06:39	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.601933	2026-01-21 13:31:53.601933	0
136	20240425_1440_7760	20240425_1440	2024-04-25 18:37:58	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-25_182102\\config.yml          				0	\N	2026-01-21 13:31:53.603294	2026-01-21 13:31:53.603294	0
137	20240425_4241	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240425_4241\\消防栓_709.mp4	2024-04-25 21:54:33	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.604656	2026-01-21 13:31:53.604656	0
138	20240425_4241_8357	20240425_4241	2024-04-25 22:48:53	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-25_223209\\config.yml          				0	\N	2026-01-21 13:31:53.606028	2026-01-21 13:31:53.606028	0
139	20240426_7394	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240426_7394\\消防栓_709_50s.mp4	2024-04-26 14:18:38	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.607391	2026-01-21 13:31:53.607391	0
140	20240426_7394_4615	20240426_7394	2024-04-26 15:15:43	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-26_145910\\config.yml          				0	\N	2026-01-21 13:31:53.608753	2026-01-21 13:31:53.608753	0
141	20240427_5104	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240427_5104\\WeChat_20240427163251.mp4	2024-04-27 16:39:40	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.610114	2026-01-21 13:31:53.610114	0
142	20240427_5104_6043	20240427_5104	2024-04-27 17:28:27	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          				0	\N	2026-01-21 13:31:53.611609	2026-01-21 13:31:53.611609	0
143	20240427_5104_4276	20240427_5104	2024-04-29 12:15:00	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          	0.145, 0.255, -0.08000000000000004	0.6699999999999999, 0.5900000000000001, 0.76	0, 0, 0	0	\N	2026-01-21 13:31:53.612971	2026-01-21 13:31:53.612971	0
144	20240427_5104_9961	20240427_5104	2024-04-29 14:20:35	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          	0.14500000000000002, 0.255, -0.08000000000000007	0.6699999999999999, 0.5900000000000001, 0.76	0, 0, 0	0	\N	2026-01-21 13:31:53.614364	2026-01-21 13:31:53.614364	0
145	20240427_5104_0338	20240427_5104	2024-04-29 14:43:14	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          	0.135, 0.23000000000000004, -0.07500000000000004	0.69, 0.64, 0.77	0, 0, 0	0	\N	2026-01-21 13:31:53.615726	2026-01-21 13:31:53.615726	0
146	20240427_5104_6624	20240427_5104	2024-04-29 14:59:56	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          	0.135, 0.23000000000000004, -0.05500000000000005	0.69, 0.64, 0.73	0, 0, 0	0	\N	2026-01-21 13:31:53.617108	2026-01-21 13:31:53.617108	0
147	20240427_5104_4062	20240427_5104	2024-04-29 15:40:53	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          	0.135, 0.23000000000000004, -0.05500000000000005	0.69, 0.64, 0.73	0, 0, 0	0	\N	2026-01-21 13:31:53.618481	2026-01-21 13:31:53.618481	0
148	20240427_5104_8143	20240427_5104	2024-04-29 15:47:59	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          	0.135, 0.23000000000000004, -0.05500000000000005	0.69, 0.64, 0.73	0, 0, 0	0	\N	2026-01-21 13:31:53.619832	2026-01-21 13:31:53.619832	0
149	20240427_5104_2555	20240427_5104	2024-04-29 16:38:01	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          	0.135, 0.23000000000000004, -0.05500000000000005	0.69, 0.64, 0.73	0, 0, 0	0	\N	2026-01-21 13:31:53.621184	2026-01-21 13:31:53.621184	0
150	20240427_5104_0426	20240427_5104	2024-04-29 17:25:18	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          	0.135, 0.23000000000000004, -0.05500000000000005	0.69, 0.64, 0.73	0, 0, 0	0	\N	2026-01-21 13:31:53.622556	2026-01-21 13:31:53.622556	0
151	20240419_1536_2263	20240419_1536	2024-04-29 18:22:41	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-19_213920\\config.yml          	0.08499999999999999, 0.010000000000000009, -0.28500000000000003	0.2700000000000001, 0.2600000000000001, 0.35000000000000003	0, 0, 0	0	\N	2026-01-21 13:31:53.623918	2026-01-21 13:31:53.623918	0
152	20240419_1536_9527	20240419_1536	2024-04-30 10:59:29	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-19_213920\\config.yml          	0.08499999999999996, 0.009999999999999926, -0.335	0.65, 0.7200000000000002, 0.45000000000000007	0, 0, 0	0	\N	2026-01-21 13:31:53.6253	2026-01-21 13:31:53.6253	0
153	20240427_5104_0606	20240427_5104	2024-04-30 14:07:23	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          	0.13, 0.42500000000000004, -0.07500000000000004	1.8800000000000001, 1.9500000000000002, 0.77	0, 0, 0	0	\N	2026-01-21 13:31:53.626652	2026-01-21 13:31:53.626652	0
154	20240427_5104_6846	20240427_5104	2024-04-30 14:14:34	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-27_171013\\config.yml          	0.11499999999999999, 0.24, -0.07500000000000004	0.6699999999999999, 0.78, 0.77	0, 0, 0	0	\N	2026-01-21 13:31:53.628075	2026-01-21 13:31:53.628075	0
155	20240508_7263	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240508_7263\\milk.mov	2024-05-08 12:04:13	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.629458	2026-01-21 13:31:53.629458	0
156	20240508_7263_9034	20240508_7263	2024-05-08 12:34:20	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-05-08_122407\\config.yml          				0	\N	2026-01-21 13:31:53.630799	2026-01-21 13:31:53.630799	0
157	20240508_0743	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240508_0743\\milk.mov	2024-05-08 17:47:36	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.632151	2026-01-21 13:31:53.632151	0
158	20240508_0743_9934	20240508_0743	2024-05-08 18:28:30	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-05-08_181323\\config.yml          				0	\N	2026-01-21 13:31:53.633512	2026-01-21 13:31:53.633512	0
159	20240508_6784	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240508_6784\\milk.mov	2024-05-08 19:20:36	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.635172	2026-01-21 13:31:53.635172	0
160	20240508_6784_4092	20240508_6784	2024-05-08 19:50:13	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-05-08_194009\\config.yml          				0	\N	2026-01-21 13:31:53.636533	2026-01-21 13:31:53.636533	0
161	20240508_6784_1081	20240508_6784	2024-05-08 19:52:16	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-05-08_194009\\config.yml          	-0.003983855247497559, -0.016286075115203857, -0.5583110249042511	1.8303265571594238, 2.0465418100357056, 1.9233779501914978	0, 0, 0	0	\N	2026-01-21 13:31:53.637906	2026-01-21 13:31:53.637906	0
162	20240419_1536_7796	20240419_1536	2024-05-08 23:06:10	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-04-19_213920\\config.yml          	0.09000000000000002, -0.025000000000000133, -0.325	1.06, 1.4700000000000002, 0.43000000000000005	0, 0, 0	0	\N	2026-01-21 13:31:53.639277	2026-01-21 13:31:53.639277	0
163	20240509_0839	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240509_0839\\IMG_0962.mov	2024-05-09 17:12:12	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.64066	2026-01-21 13:31:53.64066	0
164	20240509_9520	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240509_9520\\IMG_0962.mov	2024-05-09 17:52:18	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.642022	2026-01-21 13:31:53.642022	0
165	20240509_9520_9303	20240509_9520	2024-05-09 18:29:14	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-05-09_181229\\config.yml          				0	\N	2026-01-21 13:31:53.643507	2026-01-21 13:31:53.643507	0
166	20240509_9520_4088	20240509_9520	2024-05-09 19:54:26	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-05-09_181229\\config.yml          	0.12719860672950745, -0.020000000000000018, -0.4121719217300415	1.1294315457344055, 1.08, 0.515656156539917	0, 0, 0	0	\N	2026-01-21 13:31:53.644879	2026-01-21 13:31:53.644879	0
167	20240510_3637	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240510_3637\\IMG_1154.mov	2024-05-10 13:57:38	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.646251	2026-01-21 13:31:53.646251	0
168	20240510_3637_4609	20240510_3637	2024-05-10 14:43:43	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-05-10_142556\\config.yml          				0	\N	2026-01-21 13:31:53.647614	2026-01-21 13:31:53.647614	0
169	20240510_3637_7019	20240510_3637	2024-05-10 15:30:09	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-05-10_142556\\config.yml          	-0.004999999999999977, -0.054999999999999966, -0.35686903007328513	0.75, 0.6700000000000002, 0.6662619398534299	0, 0, 0	0	\N	2026-01-21 13:31:53.649026	2026-01-21 13:31:53.649026	0
170	20240516_4643	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240516_4643\\IMG_1248.mov	2024-05-16 11:02:58	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.650645	2026-01-21 13:31:53.650645	0
171	20240516_4643_5861	20240516_4643	2024-05-16 11:43:54	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-05-16_112725\\config.yml          				0	\N	2026-01-21 13:31:53.652509	2026-01-21 13:31:53.652509	0
172	20240516_7307	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240516_7307\\IMG_1249.mov	2024-05-16 11:55:15	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.654352	2026-01-21 13:31:53.654352	0
173	20240516_7307_4864	20240516_7307	2024-05-16 12:22:41	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-05-16_121221\\config.yml          				0	\N	2026-01-21 13:31:53.656082	2026-01-21 13:31:53.656082	0
176	20240516_3506	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240516_3506\\IMG_1249.mov	2024-05-16 13:06:50	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.6577	2026-01-21 13:31:53.6577	0
177	20240516_3506_2627	20240516_3506	2024-05-16 13:37:51	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-05-16_132719\\config.yml          				0	\N	2026-01-21 13:31:53.659225	2026-01-21 13:31:53.659225	0
178	20240516_3506_6179	20240516_3506	2024-05-16 13:55:02	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-05-16_132719\\config.yml          	-0.1558915376663208, 0.07375162839889526, -0.5333356946706772	1.8031396865844727, 1.753097653388977, 1.5333286106586457	0, 0, 0	0	\N	2026-01-21 13:31:53.66069	2026-01-21 13:31:53.66069	0
179	20240524_2975	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240524_2975\\IMG_1393.mov	2024-05-24 17:41:17	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.662184	2026-01-21 13:31:53.662184	0
180	20240524_2975_4597	20240524_2975	2024-05-24 18:35:50	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-05-24_182015\\config.yml          				0	\N	2026-01-21 13:31:53.663618	2026-01-21 13:31:53.663618	0
181	20240524_2975_5614	20240524_2975	2024-05-24 18:59:51	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-05-24_182015\\config.yml          	0.06499999999999989, 0.03499999999999992, -0.6208409953117371	1.4700000000000002, 1.3900000000000001, 0.37831800937652593	0, 0, 0	0	\N	2026-01-21 13:31:53.665022	2026-01-21 13:31:53.665022	0
182	20240603_2095	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240603_2095\\IMG_1488.mov	2024-06-03 14:05:56	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.666558	2026-01-21 13:31:53.666558	0
183	20240603_2095_0188	20240603_2095	2024-06-03 14:34:59	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-06-03_142337\\config.yml          				0	\N	2026-01-21 13:31:53.667908	2026-01-21 13:31:53.667908	0
184	20240603_2095_1915	20240603_2095	2024-06-03 14:35:32	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-06-03_142337\\config.yml          	-0.04500000000000007, 0.20500000000000004, -0.5	0.9300000000000002, 0.81, 1.12	0, 0, 0	0	\N	2026-01-21 13:31:53.66926	2026-01-21 13:31:53.66926	0
185	20240613_0255	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240613_0255\\IMG_1607.mov	2024-06-13 11:22:55	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.670571	2026-01-21 13:31:53.670571	0
186	20240613_0255_7952	20240613_0255	2024-06-13 11:52:26	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-06-13_114219\\config.yml          				0	\N	2026-01-21 13:31:53.671923	2026-01-21 13:31:53.671923	0
187	20240613_0255_7611	20240613_0255	2024-06-13 11:53:24	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-06-13_114219\\config.yml          	-0.1846710324287414, 0, -0.5240584111213684	1.669342064857483, 1.6600000000000001, 1.0081168222427368	0, 0, 0	0	\N	2026-01-21 13:31:53.673275	2026-01-21 13:31:53.673275	0
188	20240613_6532	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240613_6532\\IMG_1609.mov	2024-06-13 16:05:46	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.674626	2026-01-21 13:31:53.674626	0
189	20240613_6532_6497	20240613_6532	2024-06-13 17:25:51	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-06-13_165422\\config.yml          				0	\N	2026-01-21 13:31:53.675978	2026-01-21 13:31:53.675978	0
190	20240613_6532_6487	20240613_6532	2024-06-13 17:26:57	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-06-13_165422\\config.yml          	-0.185, 0.09, -0.395	0.85, 0.8200000000000001, 0.9099999999999999	0, 0, 0	0	\N	2026-01-21 13:31:53.67733	2026-01-21 13:31:53.67733	0
191	20240614_2648	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240614_2648\\IMG_1624.mov	2024-06-14 15:48:25	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.678722	2026-01-21 13:31:53.678722	0
192	20240614_8711	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240614_8711\\IMG_1625.mov	2024-06-14 16:26:15	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.680084	2026-01-21 13:31:53.680084	0
193	20240704_1884	E:\\Python\\AI_V2M_Distributedd_Gsplat\\AI_V2M_CloudStorage\\uploads\\20240704_1884\\IMG_2156.mov	2024-07-04 14:36:33	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.681446	2026-01-21 13:31:53.681446	0
194	20240704_1884_1926	20240704_1884	2024-07-04 15:13:09	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-07-04_150245\\config.yml          				0	\N	2026-01-21 13:31:53.682818	2026-01-21 13:31:53.682818	0
195	20240705_7536	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20240705_7536\\IMG_2168.mov	2024-07-05 12:17:30	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.68418	2026-01-21 13:31:53.68418	0
196	20240720_7130	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20240720_7130\\IMG_2414.mov	2024-07-20 17:06:57	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.685542	2026-01-21 13:31:53.685542	0
197	20240720_7130_3769	20240720_7130	2024-07-20 17:44:27	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-07-20_172911\\config.yml          				0	\N	2026-01-21 13:31:53.686894	2026-01-21 13:31:53.686894	0
198	20240720_7130_9921	20240720_7130	2024-07-20 17:52:13	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-07-20_172911\\config.yml          	0.04500000000000004, 0.025000000000000022, -0.3061978289484978	1.2500000000000002, 1.2500000000000002, 0.4476043421030045	0, 0, 0	0	\N	2026-01-21 13:31:53.688276	2026-01-21 13:31:53.688276	0
199	20240902_8720	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20240902_8720\\IMG_3080.mov	2024-09-02 11:50:36	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.689679	2026-01-21 13:31:53.689679	0
200	20240902_8720_6765	20240902_8720	2024-09-02 12:17:47	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-09-02_120658\\config.yml          				0	\N	2026-01-21 13:31:53.691041	2026-01-21 13:31:53.691041	0
201	20240902_8720_7112	20240902_8720	2024-09-02 12:35:43	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-09-02_120658\\config.yml          	0.10000000000000003, 0.15500000000000003, -0.601848304271698	0.9800000000000001, 0.9500000000000004, 1.427136778831482	0, 0, 0	0	\N	2026-01-21 13:31:53.692403	2026-01-21 13:31:53.692403	0
202	20241105_7548	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241105_7548\\IMG_4179.mov	2024-11-05 18:21:08	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.693765	2026-01-21 13:31:53.693765	0
203	20241105_5263	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241105_5263\\IMG_4180.mov	2024-11-05 18:31:16	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.695127	2026-01-21 13:31:53.695127	0
204	20241105_7548_2572	20241105_7548	2024-11-05 19:01:25	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-11-05_184958\\config.yml          				0	\N	2026-01-21 13:31:53.696489	2026-01-21 13:31:53.696489	0
205	20241105_5263_5143	20241105_5263	2024-11-05 19:45:15	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-11-05_193126\\config.yml          				0	\N	2026-01-21 13:31:53.697851	2026-01-21 13:31:53.697851	0
206	20241107_4680	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241107_4680\\IMG_4205.mov	2024-11-07 18:29:34	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.699274	2026-01-21 13:31:53.699274	0
207	20241111_5010	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241111_5010\\IMG_4272.mov	2024-11-11 17:31:53	\N	100	End	1	train					1	\N	2026-01-21 13:31:53.700666	2026-01-21 13:31:53.700666	0
208	20241111_5010_2372	20241111_5010	2024-11-11 18:08:31	\N	100	End	1	crop	outputs\\sfm\\nerfacto\\2024-11-11_175554\\config.yml          				0	\N	2026-01-21 13:31:53.702141	2026-01-21 13:31:53.702141	0
209	20241111_5010_3916	20241111_5010	2024-11-11 18:16:50	\N	100	End	1	export	outputs\\sfm\\nerfacto\\2024-11-11_175554\\config.yml          	0.004999999999999921, 0.09499999999999995, -0.2728285565972328	0.77, 0.79, 0.8613324612379074	0, 0, 0	0	\N	2026-01-21 13:31:53.703503	2026-01-21 13:31:53.703503	0
210	20241112_5753	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241112_5753\\IMG_4289.mov	2024-11-12 13:26:15	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.704865	2026-01-21 13:31:53.704865	0
211	20241112_8266	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241112_8266\\IMG_3420.mov	2024-11-12 21:05:40	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.706278	2026-01-21 13:31:53.706278	0
212	20241112_8650	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241112_8650\\IMG_4298.mov	2024-11-12 21:43:20	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.70765	2026-01-21 13:31:53.70765	0
213	20241112_1491	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241112_1491\\IMG_4299.mov	2024-11-12 22:07:48	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.709012	2026-01-21 13:31:53.709012	0
214	20241113_2289	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241113_2289\\IMG_4303.mov	2024-11-13 10:15:50	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.710425	2026-01-21 13:31:53.710425	0
215	20241122_1522	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241122_1522\\IMG_4421.mov	2024-11-22 10:30:57	\N	1	End	0	train					0	\N	2026-01-21 13:31:53.711807	2026-01-21 13:31:53.711807	0
216	20241122_6446	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241122_6446\\IMG_4422.mov	2024-11-22 11:03:18	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.713159	2026-01-21 13:31:53.713159	0
217	20241128_4124	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241128_4124\\IMG_4565.mov	2024-11-28 21:00:47	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.714511	2026-01-21 13:31:53.714511	0
218	20241129_7700	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241129_7700\\IMG_4421.mov	2024-11-29 10:42:28	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.715862	2026-01-21 13:31:53.715862	0
219	20241129_0218	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241129_0218\\IMG_4421.mov	2024-11-29 14:28:21	\N	100	End	0	train					1	\N	2026-01-21 13:31:53.717214	2026-01-21 13:31:53.717214	0
221	20241129_8756	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241129_8756\\IMG_4421.mov	2024-11-29 15:55:28	\N	100	End	0	train					1	\N	2026-01-21 13:31:53.718566	2026-01-21 13:31:53.718566	0
222	20241210_8404	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241210_8404\\IMG_4743.mov	2024-12-10 20:30:31	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.719928	2026-01-21 13:31:53.719928	0
223	20241210_1756	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241210_1756\\IMG_4743.mov	2024-12-10 22:53:59	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.721269	2026-01-21 13:31:53.721269	0
224	20241210_4369	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241210_4369\\IMG_4743.mov	2024-12-10 23:26:45	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.722631	2026-01-21 13:31:53.722631	0
225	20241211_3509	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241211_3509\\IMG_4743.mov	2024-12-11 00:12:26	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.723983	2026-01-21 13:31:53.723983	0
226	20241211_6225	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241211_6225\\IMG_4743.mov	2024-12-11 00:46:25	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.725335	2026-01-21 13:31:53.725335	0
227	20241211_1012	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241211_1012\\IMG_4743.mov	2024-12-11 01:12:51	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.726687	2026-01-21 13:31:53.726687	0
228	20241212_6632	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241212_6632\\IMG_4676.mov	2024-12-12 16:19:21	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.728079	2026-01-21 13:31:53.728079	0
229	20241212_6632_2418	20241212_6632	2024-12-12 16:34:46	\N	100	End	1	nerfact					0	\N	2026-01-21 13:31:53.729461	2026-01-21 13:31:53.729461	0
230	20241212_6632_7977	20241212_6632	2024-12-12 16:48:29	\N	100	End	0	crop	outputs/sfm/nerfacto/2024-12-12_163451/config.yml          				0	\N	2026-01-21 13:31:53.730844	2026-01-21 13:31:53.730844	0
231	20241212_6632_0360	20241212_6632	2024-12-13 10:23:23	\N	100	End	1	export	outputs/sfm/nerfacto/2024-12-12_163451/config.yml          	0, 0, -0.07999999999999996	1, 1, 0.8400000000000001	0, 0, 0	0	\N	2026-01-21 13:31:53.732236	2026-01-21 13:31:53.732236	0
232	20241213_0317	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241213_0317\\IMG_4771.mov	2024-12-13 11:38:08	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.733588	2026-01-21 13:31:53.733588	0
233	20241213_0317_3991	20241213_0317	2024-12-13 12:09:57	\N	100	End	1	nerfact					0	\N	2026-01-21 13:31:53.73494	2026-01-21 13:31:53.73494	0
234	20241213_0317_0533	20241213_0317	2024-12-13 12:20:10	\N	100	End	1	crop	outputs/sfm/nerfacto/2024-12-13_121002/config.yml          				0	\N	2026-01-21 13:31:53.736312	2026-01-21 13:31:53.736312	0
235	20241213_0317_1480	20241213_0317	2024-12-13 12:29:27	\N	100	End	1	export	outputs/sfm/nerfacto/2024-12-13_121002/config.yml          	-0.155, 0.095, -0.335	0.79, 0.7500000000000002, 0.85	0, 0, 0	0	\N	2026-01-21 13:31:53.737663	2026-01-21 13:31:53.737663	0
236	20241213_0317_9458	20241213_0317	2024-12-13 15:34:37	\N	100	End	1	export	outputs/sfm/nerfacto/2024-12-13_121002/config.yml          	-0.15500000000000003, 0.09499999999999997, -0.335	0.79, 0.7500000000000002, 0.85	0, 0, 0	0	\N	2026-01-21 13:31:53.739035	2026-01-21 13:31:53.739035	0
237	20241217_9565	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241217_9565\\17344095007371.mp4	2024-12-17 12:25:21	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.740387	2026-01-21 13:31:53.740387	0
238	20241217_3937	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241217_3937\\IMG_4824.mov	2024-12-17 13:12:57	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.74178	2026-01-21 13:31:53.74178	0
239	20241217_6847	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241217_6847\\17344153066002.mp4	2024-12-17 14:01:55	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.743132	2026-01-21 13:31:53.743132	0
240	20241217_8334	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241217_8334\\17344173709840.mp4	2024-12-17 14:36:22	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.744504	2026-01-21 13:31:53.744504	0
241	20241217_4164	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241217_4164\\17344187679121.mp4	2024-12-17 14:59:53	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.745897	2026-01-21 13:31:53.745897	0
242	20241217_1581	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241217_1581\\17344188481950.mp4	2024-12-17 15:01:09	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.747289	2026-01-21 13:31:53.747289	0
243	20241217_4405	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241217_4405\\17344209695771.mp4	2024-12-17 15:36:28	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.748641	2026-01-21 13:31:53.748641	0
244	20241217_5544	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241217_5544\\IMG_4825.mov	2024-12-17 15:49:08	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.750003	2026-01-21 13:31:53.750003	0
245	20241218_7250	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241218_7250\\17345018395070.mp4	2024-12-18 14:04:17	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.751365	2026-01-21 13:31:53.751365	0
246	20241218_9343	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241218_9343\\17345028158831.mp4	2024-12-18 14:26:24	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.752747	2026-01-21 13:31:53.752747	0
247	20241219_9875	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241219_9875\\17345775532140.mp4	2024-12-19 11:06:05	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.754098	2026-01-21 13:31:53.754098	0
248	20241219_9875_4428	20241219_9875	2024-12-19 11:20:26	\N	100	End	1	nerfact					0	\N	2026-01-21 13:31:53.75545	2026-01-21 13:31:53.75545	0
249	20241219_9875_1557	20241219_9875	2024-12-19 11:32:56	\N	100	End	1	crop	outputs/sfm/nerfacto/2024-12-19_112031/config.yml          				0	\N	2026-01-21 13:31:53.756802	2026-01-21 13:31:53.756802	0
250	20241219_9875_5220	20241219_9875	2024-12-19 11:34:57	\N	100	End	1	export	outputs/sfm/nerfacto/2024-12-19_112031/config.yml          	0.07999999999999996, 0.25000000000000006, -0.4540007942914963	1.4200000000000002, 1.3600000000000003, 0.7519984114170075	0, 0, 0	0	\N	2026-01-21 13:31:53.758185	2026-01-21 13:31:53.758185	0
251	20241226_7569	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20241226_7569\\17351986899560.mp4	2024-12-26 15:38:48	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.759536	2026-01-21 13:31:53.759536	0
252	20250102_7018	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250102_7018\\17357909119600.mp4	2025-01-02 12:08:49	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.760939	2026-01-21 13:31:53.760939	0
253	20250103_3225	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250103_3225\\IMG_1060.mov	2025-01-03 11:44:46	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.762312	2026-01-21 13:31:53.762312	0
254	20250103_0758	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250103_0758\\汽车扫描（红魔手机）.mp4	2025-01-03 12:03:56	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.763674	2026-01-21 13:31:53.763674	0
255	20250103_5120	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250103_5120\\IMG_1058.mov	2025-01-03 14:06:08	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.765046	2026-01-21 13:31:53.765046	0
256	20250103_9080	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250103_9080\\IMG_1060.mov	2025-01-03 14:29:45	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.766459	2026-01-21 13:31:53.766459	0
257	20250103_9279	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250103_9279\\IMG_1059.mov	2025-01-03 14:57:45	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.768187	2026-01-21 13:31:53.768187	0
258	20250103_9631	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250103_9631\\车_红魔手机_app端.mp4	2025-01-03 15:25:35	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.770585	2026-01-21 13:31:53.770585	0
259	20250106_0567	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250106_0567\\17361511201490.mp4	2025-01-06 16:12:19	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.772265	2026-01-21 13:31:53.772265	0
260	20250106_1797	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250106_1797\\17361532033811.mp4	2025-01-06 16:47:54	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.774089	2026-01-21 13:31:53.774089	0
261	20250106_7579	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250106_7579\\17361572031322.mp4	2025-01-06 17:53:52	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.775746	2026-01-21 13:31:53.775746	0
262	20250106_2911	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250106_2911\\17361583410640.mp4	2025-01-06 18:12:50	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.777303	2026-01-21 13:31:53.777303	0
263	20250106_3086	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250106_3086\\17357909119600.mp4	2025-01-06 18:39:18	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.779064	2026-01-21 13:31:53.779064	0
264	20250107_0865	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250107_0865\\IMG_1069.mov	2025-01-07 18:16:41	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.780754	2026-01-21 13:31:53.780754	0
265	20250107_6308	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250107_6308\\IMG_1068.mov	2025-01-07 19:47:37	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.782269	2026-01-21 13:31:53.782269	0
266	20250108_7476	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250108_7476\\IMG_1070.mov	2025-01-08 18:45:18	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.783713	2026-01-21 13:31:53.783713	0
267	20250108_4157	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250108_4157\\IMG_1072.mov	2025-01-08 18:46:40	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.785218	2026-01-21 13:31:53.785218	0
268	20250108_5849	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250108_5849\\IMG_1073.mov	2025-01-08 18:48:04	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.786641	2026-01-21 13:31:53.786641	0
269	20250108_0828	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250108_0828\\IMG_1074.mov	2025-01-08 18:50:56	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.788024	2026-01-21 13:31:53.788024	0
270	20250108_9524	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250108_9524\\IMG_1075.mov	2025-01-08 18:52:25	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.789417	2026-01-21 13:31:53.789417	0
271	20250109_8796	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250109_8796\\17344209695771.mp4	2025-01-09 16:52:00	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.790799	2026-01-21 13:31:53.790799	0
272	20250109_6495	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250109_6495\\VID_20250109_212710.mp4	2025-01-09 21:29:43	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.792171	2026-01-21 13:31:53.792171	0
273	20250110_4568	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250110_4568\\IMG_0732.mov	2025-01-10 10:36:18	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.793453	2026-01-21 13:31:53.793453	0
274	20250114_9704	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250114_9704\\IMG_0732.mov	2025-01-14 12:16:03	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.794803	2026-01-21 13:31:53.794803	0
275	20250114_7783	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250114_7783\\IMG_0732.mov	2025-01-14 15:32:10	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.796216	2026-01-21 13:31:53.796216	0
276	20250114_9755	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250114_9755\\IMG_0732.mov	2025-01-14 20:48:08	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.797598	2026-01-21 13:31:53.797598	0
277	20250114_2181	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250114_2181\\IMG_0732.mov	2025-01-14 20:48:23	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.79897	2026-01-21 13:31:53.79897	0
278	20250114_5423	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250114_5423\\IMG_0732.mov	2025-01-14 20:48:31	\N	100	End	1	train					0	\N	2026-01-21 13:31:53.800353	2026-01-21 13:31:53.800353	0
279	20250114_6510	E:\\Python\\AI_V2M_Distributedd_Gsplat_Docker\\AI_V2M_CloudStorage\\uploads\\20250114_6510\\IMG_0732.mov	2025-01-14 20:48:42	\N	100	End	1	train					0		2026-01-21 13:31:53.801725	2026-01-21 13:31:53.801725	0
280	20250123_6284	uploads/20250123_6284/IMG_5384.mov	2025-01-23 15:49:09	2025-01-23 15:59:23	100	End	1	train					0	\N	2026-01-21 13:31:53.803138	2026-01-21 13:31:53.803138	0
282	20250123_5854	uploads/20250123_5854/IMG_0702.mov	2025-01-23 22:25:51	2025-01-23 22:45:51	100	End	1	train					0	\N	2026-01-21 13:31:53.80451	2026-01-21 13:31:53.80451	0
283	20250123_9468	uploads/20250123_9468/IMG_5390.mov	2025-01-23 23:04:30	2025-01-23 23:24:30	100	End	1	train					0	\N	2026-01-21 13:31:53.805883	2026-01-21 13:31:53.805883	0
284	20250124_5506	uploads/20250124_5506/IMG_5400.mov	2025-01-24 00:48:12	2025-01-24 00:55:12	100	End	1	train					0	\N	2026-01-21 13:31:53.807285	2026-01-21 13:31:53.807285	0
285	20250125_3908	uploads/20250125_3908/IMG_5457.mov	2025-01-25 12:22:57	2025-01-25 12:22:57	100	End	1	train					0	\N	2026-01-21 13:31:53.808668	2026-01-21 13:31:53.808668	0
286	20250203_1524	uploads/20250203_1524/IMG_6814.mov	2025-02-03 12:45:55	2025-02-03 04:59:30	100	End	1	train					0	\N	2026-01-21 13:31:53.810071	2026-01-21 13:31:53.810071	0
290	20250212_4456	uploads/20250212_4456/WN8P874EME.mp4	2025-02-12 18:29:35	2025-02-12 10:40:12	100	End	1	train					0	\N	2026-01-21 13:31:53.811432	2026-01-21 13:31:53.811432	0
291	20250212_5125	uploads/20250212_5125/1M6QEV61IW.mp4	2025-02-12 20:13:13	2025-02-12 12:23:37	100	End	1	train					0	\N	2026-01-21 13:31:53.812876	2026-01-21 13:31:53.812876	0
292	20250212_3953	uploads/20250212_3953/CDDCN0H1SG.mp4	2025-02-12 20:30:18	2025-02-12 12:47:49	100	End	1	train					0	\N	2026-01-21 13:31:53.814238	2026-01-21 13:31:53.814238	0
293	20250212_8686	uploads/20250212_8686/IZGI46ZKV9.mp4	2025-02-12 21:20:28	2025-02-12 13:31:00	100	End	1	train					0	\N	2026-01-21 13:31:53.81558	2026-01-21 13:31:53.81558	0
294	20250212_7729	uploads/20250212_7729/SMXYJ2S8BK.mp4	2025-02-12 21:45:01	2025-02-12 13:56:16	100	End	1	train					0	\N	2026-01-21 13:31:53.816931	2026-01-21 13:31:53.816931	0
295	20250212_9646	uploads/20250212_9646/0RPE255NMR.mp4	2025-02-12 22:01:37	2025-02-12 14:17:06	100	End	1	train					0	\N	2026-01-21 13:31:53.818345	2026-01-21 13:31:53.818345	0
296	20250213_0650	uploads/20250213_0650/2HLFXKEYNC.mp4	2025-02-13 14:32:16	2025-02-13 06:48:50	100	End	1	train					0	\N	2026-01-21 13:31:53.819717	2026-01-21 13:31:53.819717	0
297	20250214_8090	uploads/20250214_8090/5LWWWH6ZTP.mp4	2025-02-14 11:02:14	2025-02-14 05:25:12	100	End	1	train					0	\N	2026-01-21 13:31:53.821079	2026-01-21 13:31:53.821079	0
298	20250214_2219	uploads/20250214_2219/M8AZKDVHUK.mp4	2025-02-14 16:48:41	2025-02-14 09:03:03	100	End	1	train					0	\N	2026-01-21 13:31:53.82242	2026-01-21 13:31:53.82242	0
299	20250214_7924	uploads/20250214_7924/6MDO8MVFIS.mp4	2025-02-14 19:37:30	2025-02-14 11:47:54	100	End	1	train					0	\N	2026-01-21 13:31:53.823772	2026-01-21 13:31:53.823772	0
300	20250214_9297	uploads/20250214_9297/FREH2RQ7FG.mp4	2025-02-14 20:02:48	2025-02-14 12:17:48	100	End	1	train					0	\N	2026-01-21 13:31:53.825123	2026-01-21 13:31:53.825123	0
301	20250218_2074	uploads/20250218_2074/KVCG0BWZJJ.mov	2025-02-18 11:42:51	2025-02-18 04:00:43	100	End	1	train					0	\N	2026-01-21 13:31:53.826475	2026-01-21 13:31:53.826475	0
303	20250218_2138	uploads/20250218_2138/111F6GBIN0.mp4	2025-02-18 20:46:37	2025-02-18 13:04:03	100	End	1	train					1	\N	2026-01-21 13:31:53.828636	2026-01-21 13:31:53.828636	0
304	20250221_0357	uploads/20250221_0357/K7WOS5OLIX.mov	2025-02-21 09:41:13	2025-02-21 09:51:13	100	End	1	train					0	\N	2026-01-21 13:31:53.830008	2026-01-21 13:31:53.830008	0
305	20250221_8758	uploads/20250221_8758/LT81WR6AM0.mov	2025-02-21 09:44:09	2025-02-21 09:54:09	100	End	1	train					0	\N	2026-01-21 13:31:53.83138	2026-01-21 13:31:53.83138	0
306	20250226_3047	uploads/20250226_3047/WTWG148VDO.mov	2025-02-26 00:48:14	2025-02-25 17:08:17	100	End	1	train					0	\N	2026-01-21 13:31:53.832762	2026-01-21 13:31:53.832762	0
307	20250226_5085	uploads/20250226_5085/H9RTWZWLOM.mp4	2025-02-26 21:13:43	2025-02-26 13:26:07	100	End	1	train					0	\N	2026-01-21 13:31:53.834114	2026-01-21 13:31:53.834114	0
308	20250226_0170	uploads/20250226_0170/XRZOTWG6QI.MOV	2025-02-26 21:17:28	2025-02-26 13:32:16	100	End	1	train					0	\N	2026-01-21 13:31:53.835456	2026-01-21 13:31:53.835456	0
309	20250227_5284	uploads/20250227_5284/S188Y69J21.MOV	2025-02-27 10:53:42	2025-02-27 03:04:39	100	End	1	train					0	\N	2026-01-21 13:31:53.836828	2026-01-21 13:31:53.836828	0
310	20250227_7366	uploads/20250227_7366/1R4ANZ0NIV.MOV	2025-02-27 15:25:57	2025-02-27 07:35:08	100	End	1	train					0	\N	2026-01-21 13:31:53.838179	2026-01-21 13:31:53.838179	0
311	20250227_8388	uploads/20250227_8388/980FFOZNC4.mp4	2025-02-27 16:16:09	2025-02-27 08:34:05	100	End	1	train					0	\N	2026-01-21 13:31:53.839562	2026-01-21 13:31:53.839562	0
312	20250227_4012	uploads/20250227_4012/T8IOOONP0J.mp4	2025-02-27 16:48:17	2025-02-27 08:58:13	100	End	1	train					0	\N	2026-01-21 13:31:53.840914	2026-01-21 13:31:53.840914	0
313	20250227_1596	uploads/20250227_1596/T6J57432LB.mov	2025-02-27 16:49:15	2025-02-27 09:01:22	100	End	1	train					0	\N	2026-01-21 13:31:53.842347	2026-01-21 13:31:53.842347	0
314	20250227_1586	uploads/20250227_1586/XD62KJ5XOK.mov	2025-02-27 17:18:10	2025-02-27 09:19:05	12	Failed	1	train					0	E1003	2026-01-21 13:31:53.84373	2026-01-21 13:31:53.84373	0
315	20250227_1313	uploads/20250227_1313/FZINAH2L8O.mp4	2025-02-27 21:20:07	2025-02-27 13:26:47	100	End	1	train					0	\N	2026-01-21 13:31:53.845092	2026-01-21 13:31:53.845092	0
316	20250227_6127	uploads/20250227_6127/S47VEM4SHZ.mp4	2025-02-27 21:21:31	2025-02-27 13:42:52	100	End	1	train					0	\N	2026-01-21 13:31:53.846443	2026-01-21 13:31:53.846443	0
317	20250227_4335	uploads/20250227_4335/0M5JRCLISZ.mp4	2025-02-27 21:28:38	2025-02-27 13:41:04	100	End	1	train					0	\N	2026-01-21 13:31:53.847836	2026-01-21 13:31:53.847836	0
318	20250228_8152	uploads/20250228_8152/TSC05ACLKK.mp4	2025-02-28 12:07:43	2025-02-28 04:32:27	100	End	1	train					0	\N	2026-01-21 13:31:53.849239	2026-01-21 13:31:53.849239	0
319	20250228_9337	uploads/20250228_9337/08R1GMUC74.mp4	2025-02-28 15:19:33	2025-02-28 07:31:36	100	End	1	train					0	\N	2026-01-21 13:31:53.85058	2026-01-21 13:31:53.85058	0
320	20250228_7541	uploads/20250228_7541/KLM3MNKD5W.mp4	2025-02-28 16:25:15	2025-02-28 08:43:12	100	End	1	train					0	\N	2026-01-21 13:31:53.851942	2026-01-21 13:31:53.851942	0
321	20250228_0279	uploads/20250228_0279/3SE269H583.mov	2025-02-28 16:35:22	2025-02-28 08:44:06	100	End	1	train					0	\N	2026-01-21 13:31:53.853284	2026-01-21 13:31:53.853284	0
322	20250309_0012	uploads/20250309_0012/5YFXAEH3E5.mov	2025-03-09 16:19:05	2025-03-09 08:33:53	100	End	1	train					0	\N	2026-01-21 13:31:53.854635	2026-01-21 13:31:53.854635	0
323	20250309_7211	uploads/20250309_7211/KYG83F5CI7.mov	2025-03-09 16:51:55	2025-03-09 09:06:26	100	End	1	train					0	\N	2026-01-21 13:31:53.855978	2026-01-21 13:31:53.855978	0
324	20250310_4928	uploads/20250310_4928/MDVS87UYG5.mp4	2025-03-10 10:29:12	2025-03-10 02:37:43	100	End	1	train					0	\N	2026-01-21 13:31:53.858087	2026-01-21 13:31:53.858087	0
325	20250310_3900	uploads/20250310_3900/E8EMH5I3XB.mov	2025-03-10 17:36:38	2025-03-10 09:50:30	100	End	1	train					0	\N	2026-01-21 13:31:53.859458	2026-01-21 13:31:53.859458	0
326	20250311_5727	uploads/20250311_5727/PJKIXU6BJO.mov	2025-03-11 12:50:33	2025-03-11 05:07:22	100	End	1	train					0	\N	2026-01-21 13:31:53.860841	2026-01-21 13:31:53.860841	0
327	20250312_1113	uploads/20250312_1113/7MSK1UJU1E.mp4	2025-03-12 19:29:13	2025-03-12 11:37:52	100	End	1	train					0	\N	2026-01-21 13:31:53.862223	2026-01-21 13:31:53.862223	0
328	20250314_6910	uploads/20250314_6910/18PIRVM5XJ.mov	2025-03-14 14:59:19	2025-03-14 07:38:17	100	End	1	train					0	\N	2026-01-21 13:31:53.863585	2026-01-21 13:31:53.863585	0
329	20250314_6910_3804	20250314_6910	2025-03-14 16:40:14	2025-03-14 09:39:36	100	End	1	nerfact					0		2026-01-21 13:31:53.864937	2026-01-21 13:31:53.864937	0
330	20250318_9414	uploads/20250318_9414/8HAM2ZA34Y.mov	2025-03-18 12:33:23	2025-03-18 04:51:37	100	End	1	train					0	\N	2026-01-21 13:31:53.86637	2026-01-21 13:31:53.86637	0
331	20250318_7856	uploads/20250318_7856/R8B3RK39CT.mp4	2025-03-18 15:45:49	2025-03-18 08:02:18	100	End	1	train					0	\N	2026-01-21 13:31:53.867732	2026-01-21 13:31:53.867732	0
332	20250318_3130	uploads/20250318_3130/PYOQE75I83.mov	2025-03-18 18:48:18	2025-03-18 11:01:08	100	End	1	train					0	\N	2026-01-21 13:31:53.869094	2026-01-21 13:31:53.869094	0
333	20250320_3088	uploads/20250320_3088/ALIX23NRL9.MOV	2025-03-20 11:55:30	2025-03-20 04:09:54	100	End	1	train					0	\N	2026-01-21 13:31:53.870446	2026-01-21 13:31:53.870446	0
334	20250323_4769	uploads/20250323_4769/0Z430Q3OUQ.MOV	2025-03-23 11:38:56	2025-03-23 03:52:57	100	End	1	train					0	\N	2026-01-21 13:31:53.871797	2026-01-21 13:31:53.871797	0
335	20250323_5385	uploads/20250323_5385/GBMEKUBGZD.MOV	2025-03-23 16:27:05	2025-03-23 08:38:20	100	End	1	train					0	\N	2026-01-21 13:31:53.87318	2026-01-21 13:31:53.87318	0
336	20250324_1295	uploads/20250324_1295/XFTOPSDTNP.MOV	2025-03-24 12:37:35	2025-03-24 04:48:44	100	End	1	train					0	\N	2026-01-21 13:31:53.87489	2026-01-21 13:31:53.87489	0
337	20250324_6684	uploads/20250324_6684/1TC8XPQWL3.mov	2025-03-24 13:04:13	2025-03-24 05:21:47	100	End	1	train					0	\N	2026-01-21 13:31:53.876262	2026-01-21 13:31:53.876262	0
338	20250325_1613	uploads/20250325_1613/LIM6OIR2HF.mp4	2025-03-25 11:36:52	2025-03-25 03:53:18	100	End	1	train					0	\N	2026-01-21 13:31:53.877635	2026-01-21 13:31:53.877635	0
339	20250325_7722	uploads/20250325_7722/CKHXIVG4VF.MOV	2025-03-25 11:39:40	2025-03-25 03:54:44	100	End	1	train					0	\N	2026-01-21 13:31:53.879007	2026-01-21 13:31:53.879007	0
340	20250325_9679	uploads/20250325_9679/AMPTWMINWU.mp4	2025-03-25 11:55:21	2025-03-25 04:08:07	100	End	1	train					0	\N	2026-01-21 13:31:53.880399	2026-01-21 13:31:53.880399	0
341	20250326_0799	uploads/20250326_0799/82S7UNC8XX.mov	2025-03-26 15:14:07	2025-03-26 07:23:17	100	End	1	train					0	\N	2026-01-21 13:31:53.881793	2026-01-21 13:31:53.881793	0
342	20250326_7455	uploads/20250326_7455/F6G8F93Z5X.MOV	2025-03-26 15:17:19	2025-03-26 07:38:52	100	End	1	train					0	\N	2026-01-21 13:31:53.883174	2026-01-21 13:31:53.883174	0
343	20250328_9465	uploads/20250328_9465/QMHGX4IR38.mp4	2025-03-28 14:21:16	2025-03-28 06:34:54	100	End	1	train					0	\N	2026-01-21 13:31:53.884526	2026-01-21 13:31:53.884526	0
344	20250328_1669	uploads/20250328_1669/VB9DP156U5.mp4	2025-03-28 14:59:21	2025-03-28 07:13:13	100	End	1	train					0	\N	2026-01-21 13:31:53.885888	2026-01-21 13:31:53.885888	0
345	20250328_9869	uploads/20250328_9869/7WJZDO2EI5.MOV	2025-03-28 19:42:54	2025-03-28 12:01:24	100	End	1	train					0	\N	2026-01-21 13:31:53.88728	2026-01-21 13:31:53.88728	0
346	20250402_8179	uploads/20250402_8179/1BHQ1WO9BE.mp4	2025-04-02 14:08:17	2025-04-02 07:59:51	100	End	1	train					0	\N	2026-01-21 13:31:53.888652	2026-01-21 13:31:53.888652	0
350	20250403_0038	uploads/20250403_0038/7I2JGOQRGJ.mov	2025-04-03 17:16:25	2025-04-03 09:33:31	100	End	1	train					0	\N	2026-01-21 13:31:53.890579	2026-01-21 13:31:53.890579	0
351	20250403_5291	uploads/20250403_5291/U9JBU8ZL3E.mov	2025-04-03 18:35:45	2025-04-03 10:52:57	100	End	1	train					0	\N	2026-01-21 13:31:53.89236	2026-01-21 13:31:53.89236	0
352	20250404_6562	uploads/20250404_6562/AMK2U694HG.mov	2025-04-04 17:14:43	2025-04-04 09:34:49	100	End	1	train					0	\N	2026-01-21 13:31:53.894039	2026-01-21 13:31:53.894039	0
353	20250404_8726	uploads/20250404_8726/YNSQYK47DG.mov	2025-04-04 18:39:00	2025-04-04 10:56:00	100	End	1	train					0	\N	2026-01-21 13:31:53.895626	2026-01-21 13:31:53.895626	0
354	20250407_8548	uploads/20250407_8548/XO1BUPPGK1.mp4	2025-04-07 15:05:51	2025-04-07 07:22:43	100	End	1	train					0	\N	2026-01-21 13:31:53.8971	2026-01-21 13:31:53.8971	0
355	20250408_3915	uploads/20250408_3915/T1OZ6T0A88.MOV	2025-04-08 19:59:22	2025-04-08 12:08:43	100	End	1	train					0	\N	2026-01-21 13:31:53.898565	2026-01-21 13:31:53.898565	0
356	20250408_1569	uploads/20250408_1569/M25NASXBHT.MOV	2025-04-08 21:09:52	2025-04-08 13:23:03	100	End	1	train					0	\N	2026-01-21 13:31:53.899988	2026-01-21 13:31:53.899988	0
357	20250408_3718	uploads/20250408_3718/GV34ZWAD5C.MOV	2025-04-08 21:21:34	2025-04-08 13:33:28	100	End	1	train					0	\N	2026-01-21 13:31:53.901412	2026-01-21 13:31:53.901412	0
358	20250409_8973	uploads/20250409_8973/7M9U7DR5IX.mp4	2025-04-09 14:43:08	2025-04-09 06:51:36	100	End	1	train					0	\N	2026-01-21 13:31:53.902825	2026-01-21 13:31:53.902825	0
359	20250409_9705	uploads/20250409_9705/G5M0IIPWLB.mp4	2025-04-09 14:55:55	2025-04-09 07:11:05	100	End	1	train					0	\N	2026-01-21 13:31:53.904187	2026-01-21 13:31:53.904187	0
360	20250409_5087	uploads/20250409_5087/5IUTT0DKI6.mp4	2025-04-09 15:20:24	2025-04-09 07:44:08	100	End	1	train					0	\N	2026-01-21 13:31:53.905589	2026-01-21 13:31:53.905589	0
361	20250409_1058	uploads/20250409_1058/BGRLXA4RLQ.mp4	2025-04-09 20:55:10	2025-04-09 13:10:21	100	End	1	train					0	\N	2026-01-21 13:31:53.906941	2026-01-21 13:31:53.906941	0
362	20250410_6982	uploads/20250410_6982/E5MGRDZEAX.mp4	2025-04-10 14:04:35	2025-04-10 06:19:56	100	End	1	train					0	\N	2026-01-21 13:31:53.908303	2026-01-21 13:31:53.908303	0
363	20250411_7277	uploads/20250411_7277/MESH6LYBCW.mov	2025-04-11 11:38:04	2025-04-11 03:56:58	100	End	1	train					0	\N	2026-01-21 13:31:53.909696	2026-01-21 13:31:53.909696	0
364	20250417_0041	uploads/20250417_0041/40M4EWS5TQ.MOV	2025-04-17 12:00:15	2025-04-17 04:14:49	100	End	1	train					0	\N	2026-01-21 13:31:53.911211	2026-01-21 13:31:53.911211	0
365	20250417_3823	uploads/20250417_3823/NOAV0E8FS3.mp4	2025-04-17 16:04:46	2025-04-17 08:27:39	100	End	1	train					0	\N	2026-01-21 13:31:53.912583	2026-01-21 13:31:53.912583	0
366	20250417_5983	uploads/20250417_5983/UMLUFNRYTP.mp4	2025-04-17 16:32:41	2025-04-17 08:58:23	100	End	1	train					0	\N	2026-01-21 13:31:53.913925	2026-01-21 13:31:53.913925	0
367	20250417_4596	uploads/20250417_4596/WDL4535R06.mp4	2025-04-17 17:02:03	2025-04-17 09:26:47	100	End	1	train					0	\N	2026-01-21 13:31:53.915307	2026-01-21 13:31:53.915307	0
368	20250417_3288	uploads/20250417_3288/OC6WZRG5WP.mp4	2025-04-17 17:53:04	2025-04-17 10:07:20	100	End	1	train					0	\N	2026-01-21 13:31:53.9167	2026-01-21 13:31:53.9167	0
369	20250417_0880	uploads/20250417_0880/6F7CO2NFEA.mp4	2025-04-17 18:05:52	2025-04-17 10:32:14	100	End	1	train					0	\N	2026-01-21 13:31:53.918041	2026-01-21 13:31:53.918041	0
370	20250417_4149	uploads/20250417_4149/8REDHI3G7Z.mp4	2025-04-17 20:45:25	2025-04-17 13:10:45	100	End	1	train					0	\N	2026-01-21 13:31:53.919393	2026-01-21 13:31:53.919393	0
371	20250417_2071	uploads/20250417_2071/HIQEBOOSC8.mp4	2025-04-17 21:09:46	2025-04-17 13:25:10	100	End	1	train					0	\N	2026-01-21 13:31:53.920796	2026-01-21 13:31:53.920796	0
372	20250417_8989	uploads/20250417_8989/U521QTS95O.mp4	2025-04-17 21:34:28	2025-04-17 13:59:17	100	End	1	train					0	\N	2026-01-21 13:31:53.922148	2026-01-21 13:31:53.922148	0
373	20250417_5586	uploads/20250417_5586/IBLP0BU37Q.mp4	2025-04-17 21:59:45	2025-04-17 14:24:47	100	End	1	train					0	\N	2026-01-21 13:31:53.923489	2026-01-21 13:31:53.923489	0
374	20250418_8165	uploads/20250418_8165/99G8DSQVMD.mp4	2025-04-18 00:24:12	2025-04-17 16:38:59	100	End	1	train					0	\N	2026-01-21 13:31:53.924841	2026-01-21 13:31:53.924841	0
375	20250421_7714	uploads/20250421_7714/XH6IG0VZMQ.mp4	2025-04-21 11:14:40	2025-04-21 03:38:29	100	End	1	train					0	\N	2026-01-21 13:31:53.926192	2026-01-21 13:31:53.926192	0
376	20250425_2033	uploads/20250425_2033/WTO4649U7N.mp4	2025-04-25 17:23:05	2025-04-25 10:23:02	100	End	1	train					0	\N	2026-01-21 13:31:53.927544	2026-01-21 13:31:53.927544	0
377	20250507_1947	uploads/20250507_1947/70E06EFNHR.mp4	2025-05-07 14:46:49	2025-05-07 07:01:43	100	End	1	train					0	\N	2026-01-21 13:31:53.928896	2026-01-21 13:31:53.928896	0
378	20250507_0597	uploads/20250507_0597/1VM4KIOUIO.mp4	2025-05-07 15:03:42	2025-05-07 07:20:15	100	End	1	train					0	\N	2026-01-21 13:31:53.93034	2026-01-21 13:31:53.93034	0
379	20250507_9329	uploads/20250507_9329/NL0K8C3OH1.mp4	2025-05-07 15:41:57	2025-05-07 07:54:59	100	End	1	train					0	\N	2026-01-21 13:31:53.931681	2026-01-21 13:31:53.931681	0
380	20250507_4827	uploads/20250507_4827/9CMTSB48BH.mp4	2025-05-07 15:59:04	2025-05-07 08:13:09	100	End	1	train					0	\N	2026-01-21 13:31:53.933033	2026-01-21 13:31:53.933033	0
381	20250507_3019	uploads/20250507_3019/FB1PY8O76P.mp4	2025-05-07 16:26:24	2025-05-07 08:53:32	100	End	1	train					0	\N	2026-01-21 13:31:53.934394	2026-01-21 13:31:53.934394	0
382	20250508_4372	uploads/20250508_4372/9TBD4PC24H.mp4	2025-05-08 14:01:33	2025-05-08 06:21:31	100	End	1	train					0	\N	2026-01-21 13:31:53.935767	2026-01-21 13:31:53.935767	0
383	20250508_9892	uploads/20250508_9892/K6TILOHBSR.mp4	2025-05-08 15:41:59	2025-05-08 08:02:53	100	End	1	train					0	\N	2026-01-21 13:31:53.937119	2026-01-21 13:31:53.937119	0
384	20250510_2838	uploads/20250510_2838/I2PD25CEVF.mp4	2025-05-10 13:48:21	2025-05-10 06:14:00	100	End	1	train					0	\N	2026-01-21 13:31:53.93846	2026-01-21 13:31:53.93846	0
385	20250510_5558	uploads/20250510_5558/PKUH0DVN2O.mp4	2025-05-10 13:52:20	2025-05-10 06:18:42	100	End	1	train					0	\N	2026-01-21 13:31:53.939802	2026-01-21 13:31:53.939802	0
386	20250510_7800	uploads/20250510_7800/O45ZHLDCJ4.mp4	2025-05-10 13:57:43	2025-05-10 06:50:34	100	End	1	train					0	\N	2026-01-21 13:31:53.941072	2026-01-21 13:31:53.941072	0
387	20250510_9528	uploads/20250510_9528/4YX0JXUILQ.mp4	2025-05-10 14:02:35	2025-05-10 06:46:10	100	End	1	train					0	\N	2026-01-21 13:31:53.942423	2026-01-21 13:31:53.942423	0
388	20250511_4737	uploads/20250511_4737/ZQ82A5TJ75.mov	2025-05-11 18:00:45	2025-05-11 10:26:44	100	End	1	train					0	\N	2026-01-21 13:31:53.943765	2026-01-21 13:31:53.943765	0
389	20250511_7477	uploads/20250511_7477/5G4571S7RR.mov	2025-05-11 18:02:11	2025-05-11 14:00:38	100	End	1	train					0	\N	2026-01-21 13:31:53.945106	2026-01-21 13:31:53.945106	0
390	20250512_1063	uploads/20250512_1063/AT5GSWHS3U.mov	2025-05-12 11:24:53	2025-05-12 03:43:21	100	End	1	train					0	\N	2026-01-21 13:31:53.946489	2026-01-21 13:31:53.946489	0
391	20250512_6152	uploads/20250512_6152/D4A6I3PBAH.mov	2025-05-12 14:44:04	2025-05-12 07:06:48	100	End	1	train					0	\N	2026-01-21 13:31:53.947871	2026-01-21 13:31:53.947871	0
392	20250512_7060	uploads/20250512_7060/CWCGF94SK5.mp4	2025-05-12 20:30:06	2025-05-12 12:44:08	100	End	1	train					0	\N	2026-01-21 13:31:53.949243	2026-01-21 13:31:53.949243	0
393	20250512_1121	uploads/20250512_1121/D7ESA2F9BI.mov	2025-05-12 23:07:31	2025-05-12 15:35:47	100	End	1	train					0	\N	2026-01-21 13:31:53.950615	2026-01-21 13:31:53.950615	0
394	20250512_1448	uploads/20250512_1448/Q0MBNXYEYL.mov	2025-05-12 23:08:09	2025-05-12 20:03:32	100	End	1	train					0	\N	2026-01-21 13:31:53.951977	2026-01-21 13:31:53.951977	0
395	20250512_5993	uploads/20250512_5993/ATHOJH517K.mov	2025-05-12 23:08:38	2025-05-12 15:51:15	100	End	1	train					0	\N	2026-01-21 13:31:53.953389	2026-01-21 13:31:53.953389	0
396	20250513_8724	uploads/20250513_8724/JV0697QBV4.mp4	2025-05-13 00:10:57	2025-05-12 16:28:25	100	End	1	train					0	\N	2026-01-21 13:31:53.95474	2026-01-21 13:31:53.95474	0
397	20250513_9233	uploads/20250513_9233/Y8H4S09V8X.mp4	2025-05-13 00:14:05	2025-05-12 16:47:29	100	End	1	train					0	\N	2026-01-21 13:31:53.956061	2026-01-21 13:31:53.956061	0
398	20250513_7819	uploads/20250513_7819/L7C3ECB32O.mp4	2025-05-13 02:59:40	2025-05-12 19:18:03	100	End	1	train					0	\N	2026-01-21 13:31:53.957423	2026-01-21 13:31:53.957423	0
399	20250513_7768	uploads/20250513_7768/ON5Z37HWUU.mp4	2025-05-13 09:09:49	2025-05-13 01:27:52	100	End	1	train					0	\N	2026-01-21 13:31:53.958775	2026-01-21 13:31:53.958775	0
400	20250514_5111	uploads/20250514_5111/OQP3N21LWO.mp4	2025-05-14 11:20:47	2025-05-14 03:41:12	100	End	1	train					0	\N	2026-01-21 13:31:53.960126	2026-01-21 13:31:53.960126	0
401	20250515_9622	uploads/20250515_9622/GHJNSDJTJM.mp4	2025-05-15 15:22:17	2025-06-03 07:50:12	100	End	1	train					0	\N	2026-01-21 13:31:53.961427	2026-01-21 13:31:53.961427	0
402	20250517_3796	uploads/20250517_3796/VPEFOOZGYI.mp4	2025-05-17 13:33:05	2025-06-03 07:27:46	100	End	1	train					0	\N	2026-01-21 13:31:53.96281	2026-01-21 13:31:53.96281	0
403	20250518_0857	uploads/20250518_0857/ZCM0D79JAS.mp4	2025-05-18 13:22:50	2025-05-18 05:55:36	100	End	1	train					0	\N	2026-01-21 13:31:53.964192	2026-01-21 13:31:53.964192	0
405	20250522_1314	uploads/20250522_1314/GE0WNUKF66.mp4	2025-05-22 15:24:35	2025-05-22 07:47:55	100	End	1	train					0	\N	2026-01-21 13:31:53.965462	2026-01-21 13:31:53.965462	0
407	20250523_4754	uploads/20250523_4754/K7JNEPSHE1.mp4	2025-05-23 15:43:34	2025-05-23 08:08:59	100	End	1	train					0	\N	2026-01-21 13:31:53.966824	2026-01-21 13:31:53.966824	0
414	20250529_3905	uploads/20250529_3905/BM1UA0OWL6.mov	2025-05-29 20:20:44	2025-05-29 13:21:49	100	End	1	train					0	\N	2026-01-21 13:31:53.968226	2026-01-21 13:31:53.968226	0
416	20250529_8687	uploads/20250529_8687/8PNA8TEVD4.mov	2025-05-29 20:21:17	2025-05-29 14:07:18	100	End	1	train					0	\N	2026-01-21 13:31:53.969989	2026-01-21 13:31:53.969989	0
417	20250529_0768	uploads/20250529_0768/QM1RFQOH6F.mov	2025-05-29 20:21:32	2025-05-29 14:27:31	100	End	1	train					0	\N	2026-01-21 13:31:53.972046	2026-01-21 13:31:53.972046	0
418	20250529_6757	uploads/20250529_6757/VAPKS9N7J7.mov	2025-05-29 20:21:45	2025-05-29 14:48:45	100	End	1	train					0	\N	2026-01-21 13:31:53.973633	2026-01-21 13:31:53.973633	0
426	20250601_8697	uploads/20250601_8697/YSK60MZJ2Y.mov	2025-06-01 22:20:02	2025-06-01 14:43:19	100	End	1	train					0	\N	2026-01-21 13:31:53.975128	2026-01-21 13:31:53.975128	0
427	20250601_3958	uploads/20250601_3958/CLXPPFU7AS.mov	2025-06-01 22:20:14	2025-06-01 14:56:54	100	End	1	train					0	\N	2026-01-21 13:31:53.976603	2026-01-21 13:31:53.976603	0
428	20250601_7582	uploads/20250601_7582/59IQ0MRIXH.mov	2025-06-01 22:20:25	2025-06-01 15:08:48	100	End	1	train					0	\N	2026-01-21 13:31:53.978026	2026-01-21 13:31:53.978026	0
429	20250601_4575	uploads/20250601_4575/NPI8C70T05.mov	2025-06-01 22:20:35	2025-06-01 15:21:48	100	End	1	train					0	\N	2026-01-21 13:31:53.97948	2026-01-21 13:31:53.97948	0
430	20250601_0762	uploads/20250601_0762/1SOKJCXFHU.mov	2025-06-01 22:20:48	2025-06-01 15:35:26	100	End	1	train					0	\N	2026-01-21 13:31:53.980863	2026-01-21 13:31:53.980863	0
431	20250601_4929	uploads/20250601_4929/MWC1ON7767.mov	2025-06-01 22:20:58	2025-06-01 15:49:34	100	End	1	train					0	\N	2026-01-21 13:31:53.982142	2026-01-21 13:31:53.982142	0
432	20250601_7951	uploads/20250601_7951/MELGKKGEH5.mov	2025-06-01 22:21:10	2025-06-01 16:02:27	100	End	1	train					0	\N	2026-01-21 13:31:53.983504	2026-01-21 13:31:53.983504	0
433	20250601_0869	uploads/20250601_0869/RSHWSZ0O7K.mov	2025-06-01 22:21:22	2025-06-01 16:14:54	100	End	1	train					0	\N	2026-01-21 13:31:53.984856	2026-01-21 13:31:53.984856	0
434	20250601_0316	uploads/20250601_0316/NF0JU8FI61.mov	2025-06-01 22:21:35	2025-06-01 16:26:05	100	End	1	train					0	\N	2026-01-21 13:31:53.986208	2026-01-21 13:31:53.986208	0
435	20250601_0537	uploads/20250601_0537/0762HLGZ70.mov	2025-06-01 22:21:50	2025-06-01 16:40:15	100	End	1	train					0	\N	2026-01-21 13:31:53.98759	2026-01-21 13:31:53.98759	0
436	20250601_3865	uploads/20250601_3865/HKU065JFNE.mov	2025-06-01 22:22:06	2025-06-01 16:53:08	100	End	1	train					0	\N	2026-01-21 13:31:53.988922	2026-01-21 13:31:53.988922	0
437	20250601_8679	uploads/20250601_8679/UWMHOX5NDB.mov	2025-06-01 22:22:18	2025-06-01 17:04:47	100	End	1	train					0	\N	2026-01-21 13:31:53.990263	2026-01-21 13:31:53.990263	0
438	20250601_7876	uploads/20250601_7876/XSFTZ3MFYH.mov	2025-06-01 22:22:30	2025-06-01 17:16:37	100	End	1	train					0	\N	2026-01-21 13:31:53.991594	2026-01-21 13:31:53.991594	0
440	20250601_6029	uploads/20250601_6029/WVTGWH86W3.mov	2025-06-01 22:22:52	2025-06-01 17:38:28	100	End	1	train					0	\N	2026-01-21 13:31:53.992925	2026-01-21 13:31:53.992925	0
441	20250601_0524	uploads/20250601_0524/0JXRD9A08J.mov	2025-06-01 22:23:09	2025-06-01 17:50:53	100	End	1	train					0	\N	2026-01-21 13:31:53.994267	2026-01-21 13:31:53.994267	0
442	20250601_2223	uploads/20250601_2223/DVO5U3BR3W.mov	2025-06-01 22:23:31	2025-06-01 18:01:10	100	End	1	train					0	\N	2026-01-21 13:31:53.995608	2026-01-21 13:31:53.995608	0
443	20250601_9106	uploads/20250601_9106/VNRYQP0ERR.mov	2025-06-01 22:23:45	2025-06-01 18:12:16	100	End	1	train					0	\N	2026-01-21 13:31:53.997011	2026-01-21 13:31:53.997011	0
444	20250601_2003	uploads/20250601_2003/EZLVM0XZF5.mov	2025-06-01 22:23:59	2025-06-01 18:23:06	100	End	1	train					0	\N	2026-01-21 13:31:53.998383	2026-01-21 13:31:53.998383	0
445	20250601_6170	uploads/20250601_6170/6TKN540Z6K.mov	2025-06-01 22:24:11	2025-06-01 18:33:21	100	End	1	train					0	\N	2026-01-21 13:31:53.999612	2026-01-21 13:31:53.999612	0
446	20250601_0888	uploads/20250601_0888/LBYWVD0KC8.mov	2025-06-01 22:24:23	2025-06-01 18:44:04	100	End	1	train					0	\N	2026-01-21 13:31:54.001028	2026-01-21 13:31:54.001028	0
447	20250601_3203	uploads/20250601_3203/0TF60Q80KI.mov	2025-06-01 22:24:37	2025-06-02 13:53:43	100	End	1	train					0	E1003	2026-01-21 13:31:54.002377	2026-01-21 13:31:54.002377	0
448	20250601_0926	uploads/20250601_0926/0IC66T1EO8.mov	2025-06-01 22:24:52	2025-06-01 19:10:37	100	End	1	train					0	\N	2026-01-21 13:31:54.003738	2026-01-21 13:31:54.003738	0
449	20250601_0669	uploads/20250601_0669/P08L482NTB.mov	2025-06-01 22:25:04	2025-06-01 19:21:03	100	End	1	train					0	\N	2026-01-21 13:31:54.005121	2026-01-21 13:31:54.005121	0
450	20250601_0400	uploads/20250601_0400/F2QGH0IIOY.mov	2025-06-01 22:25:16	2025-06-01 19:34:37	100	End	1	train					0	\N	2026-01-21 13:31:54.006463	2026-01-21 13:31:54.006463	0
451	20250601_4469	uploads/20250601_4469/ICQ252TIBY.mov	2025-06-01 22:25:27	2025-06-03 07:09:18	100	End	1	train					0	E1003	2026-01-21 13:31:54.007814	2026-01-21 13:31:54.007814	0
452	20250601_1632	uploads/20250601_1632/NM0AZIHSGW.mov	2025-06-01 22:25:39	2025-06-01 19:58:36	100	End	1	train					0	\N	2026-01-21 13:31:54.009166	2026-01-21 13:31:54.009166	0
453	20250601_2119	uploads/20250601_2119/4Q8D3EWZX6.mov	2025-06-01 22:25:51	2025-06-01 20:09:24	100	End	1	train					0	\N	2026-01-21 13:31:54.010364	2026-01-21 13:31:54.010364	0
454	20250601_1779	uploads/20250601_1779/KRUBGC4XIR.mov	2025-06-01 22:26:03	2025-06-01 20:19:44	100	End	1	train					0	\N	2026-01-21 13:31:54.011715	2026-01-21 13:31:54.011715	0
455	20250601_3343	uploads/20250601_3343/TV6P78VS0G.mov	2025-06-01 22:26:14	2025-06-01 20:30:27	100	End	1	train					0	\N	2026-01-21 13:31:54.013077	2026-01-21 13:31:54.013077	0
456	20250601_4824	uploads/20250601_4824/U0WNR0EU3V.mov	2025-06-01 22:26:27	2025-06-01 20:42:20	100	End	1	train					0	\N	2026-01-21 13:31:54.01448	2026-01-21 13:31:54.01448	0
457	20250601_2455	uploads/20250601_2455/PKYKPKX8Y0.mov	2025-06-01 22:26:41	2025-06-01 20:54:17	100	End	1	train					0	\N	2026-01-21 13:31:54.015781	2026-01-21 13:31:54.015781	0
458	20250601_1793	uploads/20250601_1793/LDNZNVELUI.mov	2025-06-01 22:26:58	2025-06-01 21:09:39	100	End	1	train					0	\N	2026-01-21 13:31:54.017174	2026-01-21 13:31:54.017174	0
460	20250604_4089	uploads/20250604_4089/Y3CJB4S15J.mp4	2025-06-04 12:54:49	2025-06-04 05:21:04	100	End	1	train					0	\N	2026-01-21 13:31:54.018556	2026-01-21 13:31:54.018556	0
461	20250604_9706	uploads/20250604_9706/TWGYNT72NJ.mp4	2025-06-04 14:39:31	2025-06-04 07:11:52	100	End	1	train					0	\N	2026-01-21 13:31:54.019918	2026-01-21 13:31:54.019918	0
462	20250604_6900	uploads/20250604_6900/URQLI0HDXR.mp4	2025-06-04 16:04:59	2025-06-04 08:39:57	100	End	1	train					0	\N	2026-01-21 13:31:54.021269	2026-01-21 13:31:54.021269	0
463	20250604_7605	uploads/20250604_7605/KYUEQV2CYB.mp4	2025-06-04 16:49:44	2025-06-04 09:09:54	100	End	1	train					0	\N	2026-01-21 13:31:54.022652	2026-01-21 13:31:54.022652	0
464	20250604_6747	uploads/20250604_6747/0NAK2NKBZ3.mp4	2025-06-04 19:53:55	2025-06-11 10:34:00	100	End	1	train					0	\N	2026-01-21 13:31:54.024055	2026-01-21 13:31:54.024055	0
467	20250616_6823	uploads/20250616_6823/DM7OVBITWY.MOV	2025-06-16 08:26:02	2025-06-16 01:01:20	100	End	1	train					0	\N	2026-01-21 13:31:54.025386	2026-01-21 13:31:54.025386	0
468	20250620_6897	uploads/20250620_6897/TFUW5CS0W8.mp4	2025-06-20 10:00:45	2025-06-20 02:29:36	100	End	1	train					0	\N	2026-01-21 13:31:54.026678	2026-01-21 13:31:54.026678	0
470	20250620_6467	uploads/20250620_6467/JT1O876FBL.mp4	2025-06-20 16:38:10	2025-06-20 09:25:20	100	End	1	train					0	\N	2026-01-21 13:31:54.02809	2026-01-21 13:31:54.02809	0
472	20250623_4962	uploads/20250623_4962/Z9OJK6CHU2.mp4	2025-06-23 14:30:09	2025-06-23 07:00:09	100	End	1	train					0	\N	2026-01-21 13:31:54.029421	2026-01-21 13:31:54.029421	0
473	20250623_8535	uploads/20250623_8535/V7K2QHLZHV.mp4	2025-06-23 17:25:52	2025-06-23 09:56:44	100	End	1	train					0	\N	2026-01-21 13:31:54.030752	2026-01-21 13:31:54.030752	0
474	20250623_0731	uploads/20250623_0731/FPTJAFETR4.mp4	2025-06-23 18:04:01	2025-06-23 10:35:38	100	End	1	train					0	\N	2026-01-21 13:31:54.0324	2026-01-21 13:31:54.0324	0
475	20250623_3296	uploads/20250623_3296/K2X7H37M4H.mp4	2025-06-23 20:45:43	2025-06-23 13:18:02	100	End	1	train					0	\N	2026-01-21 13:31:54.033752	2026-01-21 13:31:54.033752	0
479	20250624_9535	uploads/20250624_9535/STS0DADX8X.mp4	2025-06-24 11:07:16	2025-06-24 03:39:19	100	End	1	train					0	\N	2026-01-21 13:31:54.035114	2026-01-21 13:31:54.035114	0
481	20250624_4331	uploads/20250624_4331/6X67498JUN.mp4	2025-06-24 11:26:05	2025-06-24 04:11:32	100	End	1	train					0	\N	2026-01-21 13:31:54.036466	2026-01-21 13:31:54.036466	0
482	20250624_8364	uploads/20250624_8364/WDP5U98JPA.mp4	2025-06-24 11:34:16	2025-06-24 04:43:25	100	End	1	train					0	\N	2026-01-21 13:31:54.037828	2026-01-21 13:31:54.037828	0
483	20250624_5228	uploads/20250624_5228/9VE3PWDGD3.mp4	2025-06-24 11:37:09	2025-06-24 05:20:18	100	End	1	train					0	\N	2026-01-21 13:31:54.03922	2026-01-21 13:31:54.03922	0
484	20250624_7700	uploads/20250624_7700/ZL8QLLU0LF.mp4	2025-06-24 11:46:11	2025-06-24 05:56:34	100	End	1	train					0	\N	2026-01-21 13:31:54.040592	2026-01-21 13:31:54.040592	0
485	20250624_6682	uploads/20250624_6682/V0SH1HB1OX.MOV	2025-06-24 15:05:01	2025-06-24 07:38:26	100	End	1	train					0	\N	2026-01-21 13:31:54.041944	2026-01-21 13:31:54.041944	0
486	20250624_7220	uploads/20250624_7220/IZWIYSFVCV.MOV	2025-06-24 15:07:25	2025-06-24 07:54:03	100	End	1	train					0	\N	2026-01-21 13:31:54.043286	2026-01-21 13:31:54.043286	0
487	20250624_5188	uploads/20250624_5188/RWHEOZO41Y.mp4	2025-06-24 17:26:52	2025-06-24 09:58:31	100	End	1	train					0	\N	2026-01-21 13:31:54.044781	2026-01-21 13:31:54.044781	0
488	20250624_4053	uploads/20250624_4053/QZ8SQIRX2W.mp4	2025-06-24 17:27:34	2025-06-26 08:21:56	100	End	1	train					0	\N	2026-01-21 13:31:54.04605	2026-01-21 13:31:54.04605	0
489	20250624_0961	uploads/20250624_0961/EKKJQAI49V.mp4	2025-06-24 17:28:05	2025-06-24 10:30:07	100	End	1	train					0	\N	2026-01-21 13:31:54.047341	2026-01-21 13:31:54.047341	0
490	20250626_2969	uploads/20250626_2969/WG22P3N0BO.mov	2025-06-26 18:34:55	2025-12-30 10:17:25	100	End	1	train					0	\N	2026-01-21 13:31:54.048692	2026-01-21 13:31:54.048692	0
491	20250627_1220	uploads/20250627_1220/W9MSQOJRKR.mp4	2025-06-27 10:44:14	2025-06-27 03:07:09	100	End	1	train					0	\N	2026-01-21 13:31:54.049993	2026-01-21 13:31:54.049993	0
492	20250626_2969_6476	20250626_2969	2025-07-02 15:03:08	2025-07-02 07:51:22	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.051334	2026-01-21 13:31:54.051334	0
493	20250703_8869	uploads/20250703_8869/UQVDZTQN6F.mov	2025-07-03 17:37:01	2025-07-03 10:01:01	100	End	1	train					0	\N	2026-01-21 13:31:54.052686	2026-01-21 13:31:54.052686	0
494	20250717_9005	uploads/20250717_9005/BV9C9JCBI3.MOV	2025-07-17 15:27:18	2025-07-17 07:48:57	100	End	1	train					0	\N	2026-01-21 13:31:54.054038	2026-01-21 13:31:54.054038	0
495	20250718_2862	uploads/20250718_2862/LV7821HAR8.MOV	2025-07-18 17:51:14	2025-07-18 10:12:12	100	End	1	train					0	\N	2026-01-21 13:31:54.05542	2026-01-21 13:31:54.05542	0
496	20250721_2117	uploads/20250721_2117/E2C6P2R44O.mp4	2025-07-21 11:22:01	2025-07-21 03:44:52	100	End	1	train					0	\N	2026-01-21 13:31:54.056772	2026-01-21 13:31:54.056772	0
497	20250721_5152	uploads/20250721_5152/RTN0QL7ODY.MOV	2025-07-21 16:35:50	2025-07-21 08:51:29	100	End	1	train					0	\N	2026-01-21 13:31:54.058124	2026-01-21 13:31:54.058124	0
498	20250722_8972	uploads/20250722_8972/JJKKVPK2AI.MOV	2025-07-22 11:47:21	2025-07-22 04:03:47	100	End	1	train					0	\N	2026-01-21 13:31:54.059547	2026-01-21 13:31:54.059547	0
499	20250722_6844	uploads/20250722_6844/E4Z4GKAIE7.MOV	2025-07-22 11:50:04	2025-07-22 04:20:41	100	End	1	train					0	\N	2026-01-21 13:31:54.060909	2026-01-21 13:31:54.060909	0
500	20250722_8972_5936	20250722_8972	2025-07-22 12:09:28	2025-07-22 04:49:37	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.062291	2026-01-21 13:31:54.062291	0
501	20250722_6844_1317	20250722_6844	2025-07-22 12:56:15	2025-07-22 05:36:25	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.063713	2026-01-21 13:31:54.063713	0
502	20250728_2230	uploads/20250728_2230/WPZG5V3S23.MOV	2025-07-28 13:39:32	2025-07-28 06:00:14	100	End	1	train					0	\N	2026-01-21 13:31:54.065065	2026-01-21 13:31:54.065065	0
503	20250729_9938	uploads/20250729_9938/KCHON10H70.mov	2025-07-29 21:28:19	2025-07-29 13:49:36	100	End	1	train					0	\N	2026-01-21 13:31:54.066305	2026-01-21 13:31:54.066305	0
504	20250730_2523	uploads/20250730_2523/HUW6USV15O.mp4	2025-07-30 15:40:42	2025-07-30 08:02:48	100	End	1	train					0	\N	2026-01-21 13:31:54.067718	2026-01-21 13:31:54.067718	0
505	20250801_4151	uploads/20250801_4151/2Q0I45D6KD.mov	2025-08-01 22:15:50	2025-08-01 14:37:05	100	End	1	train					0	\N	2026-01-21 13:31:54.06909	2026-01-21 13:31:54.06909	0
506	20250804_7459	uploads/20250804_7459/3XUBCMRAN2.MOV	2025-08-04 16:07:26	2025-08-04 08:28:04	100	End	1	train					0	\N	2026-01-21 13:31:54.070432	2026-01-21 13:31:54.070432	0
507	20250806_4429	uploads/20250806_4429/DZY6LB2K59.mov	2025-08-06 16:41:26	2025-08-06 09:04:25	100	End	1	train					0	\N	2026-01-21 13:31:54.071773	2026-01-21 13:31:54.071773	0
508	20250807_4811	uploads/20250807_4811/19K1LWBXT5.MOV	2025-08-07 12:38:38	2025-08-07 04:59:21	100	End	1	train					0	\N	2026-01-21 13:31:54.073114	2026-01-21 13:31:54.073114	0
509	20250808_7482	uploads/20250808_7482/0G1Q9VVB1M.mov	2025-08-08 11:23:36	2025-08-08 03:44:12	100	End	1	train					0	\N	2026-01-21 13:31:54.074456	2026-01-21 13:31:54.074456	0
510	20250819_0869	uploads/20250819_0869/232X34UAC2.mov	2025-08-19 14:11:57	2025-08-19 08:29:36	100	End	1	train					0	\N	2026-01-21 13:31:54.075797	2026-01-21 13:31:54.075797	0
511	20250820_5435	uploads/20250820_5435/3F2ZMJS90M.MOV	2025-08-20 14:06:06	2025-08-20 06:20:34	100	End	1	train					0	\N	2026-01-21 13:31:54.077057	2026-01-21 13:31:54.077057	0
512	20250822_7257	uploads/20250822_7257/07CBP4SH93.mp4	2025-08-22 10:27:25	2025-08-22 02:46:05	100	End	1	train					0	\N	2026-01-21 13:31:54.078501	2026-01-21 13:31:54.078501	0
513	20250822_6946	uploads/20250822_6946/HE0RRPGII4.mp4	2025-08-22 10:28:46	2025-08-22 03:04:40	100	End	1	train					0	\N	2026-01-21 13:31:54.079831	2026-01-21 13:31:54.079831	0
514	20250822_9852	uploads/20250822_9852/5LV3486FGN.mp4	2025-08-22 10:30:12	2025-08-22 03:21:19	100	End	1	train					0	\N	2026-01-21 13:31:54.081183	2026-01-21 13:31:54.081183	0
517	20250825_7429	uploads/20250825_7429/SJZ1CXLFJ4.mov	2025-08-25 17:49:07	2025-08-25 10:13:23	100	End	1	train					0	\N	2026-01-21 13:31:54.082565	2026-01-21 13:31:54.082565	0
518	20250825_7429_6458	20250825_7429	2025-08-25 18:23:07	2025-08-25 11:05:30	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.083969	2026-01-21 13:31:54.083969	0
519	20250318_3130_6416	20250318_3130	2025-08-26 16:52:58	2025-08-26 09:34:32	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.0853	2026-01-21 13:31:54.0853	0
520	20250827_2746	uploads/20250827_2746/RQXGIT3L36.MOV	2025-08-27 17:02:09	2025-08-27 09:16:43	100	End	1	train					0	\N	2026-01-21 13:31:54.086662	2026-01-21 13:31:54.086662	0
521	20250828_0118	uploads/20250828_0118/3Y32MG2T60.mov	2025-08-28 18:30:49	2025-08-28 10:45:40	100	End	1	train					0	\N	2026-01-21 13:31:54.088004	2026-01-21 13:31:54.088004	0
522	20250829_8826	uploads/20250829_8826/YLNGCH6F0O.mov	2025-08-29 12:27:13	2025-08-29 04:41:58	100	End	1	train					0	\N	2026-01-21 13:31:54.089376	2026-01-21 13:31:54.089376	0
525	20250901_0070	uploads/20250901_0070/FG1UGOC61W.MOV	2025-09-01 18:17:46	2025-09-01 10:37:55	100	End	1	train					0	\N	2026-01-21 13:31:54.090728	2026-01-21 13:31:54.090728	0
526	20250904_7978	uploads/20250904_7978/JK4RU0R5A4.MOV	2025-09-04 13:09:15	2025-09-04 05:24:03	100	End	1	train					0	\N	2026-01-21 13:31:54.092209	2026-01-21 13:31:54.092209	0
527	20250916_7224	uploads/20250916_7224/QKBLQQD819.MOV	2025-09-16 11:03:27	2025-09-16 03:18:38	100	End	1	train					0	\N	2026-01-21 13:31:54.094619	2026-01-21 13:31:54.094619	0
528	20250916_9021	uploads/20250916_9021/GW5BL73LZ0.MOV	2025-09-16 15:03:53	2025-09-16 07:19:55	100	End	1	train					0	\N	2026-01-21 13:31:54.096453	2026-01-21 13:31:54.096453	0
529	20250916_4551	uploads/20250916_4551/0EKI1ECPOU.MOV	2025-09-16 17:34:29	2025-09-16 09:50:00	100	End	1	train					0	\N	2026-01-21 13:31:54.098286	2026-01-21 13:31:54.098286	0
530	20250828_0118_3226	20250828_0118	2025-09-18 10:41:18	2025-09-18 03:23:30	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.099996	2026-01-21 13:31:54.099996	0
531	20250918_3800	uploads/20250918_3800/MJWXWDLUAZ.mov	2025-09-18 15:35:46	2025-09-18 07:53:15	100	End	1	train					0	\N	2026-01-21 13:31:54.101613	2026-01-21 13:31:54.101613	0
532	20250918_3800_4883	20250918_3800	2025-09-18 16:58:08	2025-09-18 09:37:30	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.103139	2026-01-21 13:31:54.103139	0
533	20250919_1478	uploads/20250919_1478/09TZQEMHD2.MOV	2025-09-19 11:47:13	2025-09-19 04:02:14	100	End	1	train					0	\N	2026-01-21 13:31:54.104613	2026-01-21 13:31:54.104613	0
534	20250922_3549	uploads/20250922_3549/214K3XBOTZ.MOV	2025-09-22 11:26:54	2025-09-22 03:43:16	100	End	1	train					0	\N	2026-01-21 13:31:54.106036	2026-01-21 13:31:54.106036	0
535	20250922_4794	uploads/20250922_4794/EN904CJC9X.MOV	2025-09-22 14:30:23	2025-09-22 06:45:32	100	End	1	train					0	\N	2026-01-21 13:31:54.107439	2026-01-21 13:31:54.107439	0
536	20250923_5283	uploads/20250923_5283/ZMSNYWVD2W.MOV	2025-09-23 10:39:14	2025-09-23 02:49:26	100	End	1	train					0	\N	2026-01-21 13:31:54.108832	2026-01-21 13:31:54.108832	0
537	20250929_9539	uploads/20250929_9539/7K540AQ720.MOV	2025-09-29 15:07:09	2025-09-29 07:13:02	100	End	1	train					0	\N	2026-01-21 13:31:54.110235	2026-01-21 13:31:54.110235	0
538	20250930_6627	uploads/20250930_6627/01T7OXX9MU.mov	2025-09-30 17:31:08	2025-09-30 09:37:53	100	End	1	train					0	\N	2026-01-21 13:31:54.111965	2026-01-21 13:31:54.111965	0
539	20251001_9127	uploads/20251001_9127/J9PUHHEP2R.MOV	2025-10-01 10:37:15	2025-10-01 02:44:14	100	End	1	train					0	\N	2026-01-21 13:31:54.113337	2026-01-21 13:31:54.113337	0
540	20251005_3185	uploads/20251005_3185/8OVKFSCQO2.mov	2025-10-05 10:11:21	2025-11-10 06:21:26	100	End	1	train					0	\N	2026-01-21 13:31:54.11471	2026-01-21 13:31:54.11471	0
541	20251006_2078	uploads/20251006_2078/SND2PQRWZ3.MOV	2025-10-06 16:03:23	2025-10-06 08:09:20	100	End	1	train					0	\N	2026-01-21 13:31:54.115989	2026-01-21 13:31:54.115989	0
542	20251006_4385	uploads/20251006_4385/3UV9ZKFCC3.MOV	2025-10-06 16:12:45	2025-10-06 08:18:46	100	End	1	train					0	\N	2026-01-21 13:31:54.117669	2026-01-21 13:31:54.117669	0
543	20251008_6323	uploads/20251008_6323/ULE981GRCC.MOV	2025-10-08 17:02:07	2025-10-08 09:08:19	100	End	1	train					0	\N	2026-01-21 13:31:54.119266	2026-01-21 13:31:54.119266	0
544	20251010_1642	uploads/20251010_1642/LXPC50SS5T.MOV	2025-10-10 17:09:52	2025-10-10 09:16:05	100	End	1	train					0	\N	2026-01-21 13:31:54.120802	2026-01-21 13:31:54.120802	0
545	20251016_9329	uploads/20251016_9329/V1M6217ZBP.MOV	2025-10-16 09:57:03	2025-10-16 02:03:16	100	End	1	train					0	\N	2026-01-21 13:31:54.122267	2026-01-21 13:31:54.122267	0
546	20251023_7052	uploads/20251023_7052/9YTCQB22DF.MOV	2025-10-23 19:12:22	2025-10-23 11:18:51	100	End	1	train					0	\N	2026-01-21 13:31:54.123834	2026-01-21 13:31:54.123834	0
549	20251114_2578	uploads/20251114_2578/5R7MJGZK1O.MOV	2025-11-14 13:01:59	2025-11-14 05:08:03	100	End	1	train					0	\N	2026-01-21 13:31:54.125267	2026-01-21 13:31:54.125267	0
550	20251120_4891	uploads/20251120_4891/0FRP1WZXNF.MOV	2025-11-20 18:10:18	2025-11-20 10:16:11	100	End	1	train					0	\N	2026-01-21 13:31:54.126671	2026-01-21 13:31:54.126671	0
551	20251125_1224	uploads/20251125_1224/VRRBEL7EOA.MOV	2025-11-25 11:36:05	2025-11-25 03:41:55	100	End	1	train					0	\N	2026-01-21 13:31:54.128052	2026-01-21 13:31:54.128052	0
552	20251126_6701	uploads/20251126_6701/KLKNPVH917.MOV	2025-11-26 10:42:11	2025-11-26 02:48:49	100	End	1	train					0	\N	2026-01-21 13:31:54.129425	2026-01-21 13:31:54.129425	0
553	20251128_3161	uploads/20251128_3161/W7JHSWJ0VP.MOV	2025-11-28 23:07:56	2025-11-28 15:14:29	100	End	1	train					0	\N	2026-01-21 13:31:54.130797	2026-01-21 13:31:54.130797	0
554	20251129_3091	uploads/20251129_3091/GA2ESHDYAQ.MOV	2025-11-29 11:22:08	2025-12-12 10:24:24	100	End	1	train					0	\N	2026-01-21 13:31:54.132138	2026-01-21 13:31:54.132138	0
555	20250828_0118_9984	20250828_0118	2025-12-04 16:48:27	2025-12-11 03:17:45	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.133469	2026-01-21 13:31:54.133469	0
556	20251210_4487	uploads/20251210_4487/RRASKU74ZR.MOV	2025-12-10 16:32:05	2025-12-10 08:38:18	100	End	1	train					0	\N	2026-01-21 13:31:54.134842	2026-01-21 13:31:54.134842	0
557	20250624_7220_0229	20250624_7220	2025-12-11 14:53:10	2025-12-11 07:28:34	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.136224	2026-01-21 13:31:54.136224	0
558	20250620_6897_1510	20250620_6897	2025-12-11 15:44:19	2025-12-12 04:23:27	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.137627	2026-01-21 13:31:54.137627	0
559	20251006_2078_8961	20251006_2078	2025-12-15 20:30:11	2025-12-16 07:44:36	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.139009	2026-01-21 13:31:54.139009	0
560	20251216_0888	uploads/20251216_0888/1JHPNQ062O.mov	2025-12-16 11:38:12	2025-12-16 03:43:53	100	End	1	train					0	\N	2026-01-21 13:31:54.140371	2026-01-21 13:31:54.140371	0
561	20251216_8624	uploads/20251216_8624/XDPOXNG0Q5.mp4	2025-12-16 20:51:38	2025-12-16 12:59:49	100	End	1	train					0	\N	2026-01-21 13:31:54.141723	2026-01-21 13:31:54.141723	0
562	20251216_4713	uploads/20251216_4713/NPICVRQI5D.mov	2025-12-16 21:00:04	2025-12-16 13:11:04	100	End	1	train					0	\N	2026-01-21 13:31:54.143136	2026-01-21 13:31:54.143136	0
563	20251216_8624_1960	20251216_8624	2025-12-16 21:01:52	2025-12-16 13:48:15	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.144302	2026-01-21 13:31:54.144302	0
564	20251216_9176	uploads/20251216_9176/XXASB02EJI.mov	2025-12-16 21:07:55	2025-12-16 13:17:21	100	End	1	train					0	\N	2026-01-21 13:31:54.145665	2026-01-21 13:31:54.145665	0
565	20251217_8922	uploads/20251217_8922/86H51OGTZD.MOV	2025-12-17 15:13:02	2025-12-17 07:18:47	100	End	1	train					0	\N	2026-01-21 13:31:54.147027	2026-01-21 13:31:54.147027	0
566	20251217_6115	uploads/20251217_6115/QDCS1LIBMM.MOV	2025-12-17 15:14:01	2025-12-17 07:24:18	100	End	1	train					0	\N	2026-01-21 13:31:54.148379	2026-01-21 13:31:54.148379	0
568	20251219_8190	uploads/20251219_8190/VSD5QTA93K.MOV	2025-12-19 03:19:16	2025-12-19 02:39:21	100	End	1	train					0	\N	2026-01-21 13:31:54.149679	2026-01-21 13:31:54.149679	0
569	20251219_7364	uploads/20251219_7364/8JWIY2HRD6.mov	2025-12-19 21:57:56	2025-12-19 14:04:43	100	End	1	train					0	\N	2026-01-21 13:31:54.151031	2026-01-21 13:31:54.151031	0
570	20251219_7747	uploads/20251219_7747/H8G3U6ESN6.MOV	2025-12-19 23:21:57	2025-12-19 15:27:38	100	End	1	train					0	\N	2026-01-21 13:31:54.152383	2026-01-21 13:31:54.152383	0
571	20251220_8321	uploads/20251220_8321/DXTEOAX6XK.MOV	2025-12-20 06:59:31	2025-12-19 23:01:42	100	End	1	train					0	\N	2026-01-21 13:31:54.153663	2026-01-21 13:31:54.153663	0
572	20251220_8071	uploads/20251220_8071/FHMKB9JRMB.MOV	2025-12-20 07:26:32	2025-12-19 23:33:37	100	End	1	train					0	\N	2026-01-21 13:31:54.155024	2026-01-21 13:31:54.155024	0
573	20251220_1533	uploads/20251220_1533/J7UOHVBUC0.MOV	2025-12-20 07:29:43	2025-12-19 23:42:21	100	End	1	train					0	\N	2026-01-21 13:31:54.156397	2026-01-21 13:31:54.156397	0
574	20251220_4341	uploads/20251220_4341/Z1XNY0CBLS.MOV	2025-12-20 07:30:48	2025-12-19 23:40:32	100	End	1	train					0	\N	2026-01-21 13:31:54.157748	2026-01-21 13:31:54.157748	0
575	20251220_3186	uploads/20251220_3186/IWXAWX9I9H.MOV	2025-12-20 07:32:52	2025-12-19 23:47:06	100	End	1	train					0	\N	2026-01-21 13:31:54.15913	2026-01-21 13:31:54.15913	0
576	20251220_7963	uploads/20251220_7963/3PNXNED0II.MOV	2025-12-20 07:38:02	2025-12-19 23:52:25	100	End	1	train					0	\N	2026-01-21 13:31:54.160409	2026-01-21 13:31:54.160409	0
577	20251220_5495	uploads/20251220_5495/VMLDJ9VXZN.MOV	2025-12-20 07:38:09	2025-12-19 23:53:44	100	End	1	train					0	\N	2026-01-21 13:31:54.161783	2026-01-21 13:31:54.161783	0
578	20251220_6416	uploads/20251220_6416/J4EWOLMMDY.MOV	2025-12-20 07:50:37	2025-12-20 00:01:57	100	End	1	train					0	\N	2026-01-21 13:31:54.163155	2026-01-21 13:31:54.163155	0
579	20251220_3186_7761	20251220_3186	2025-12-22 00:17:37	\N	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.164568	2026-01-21 13:31:54.164568	0
580	20251220_8321_4704	20251220_8321	2025-12-22 23:30:41	\N	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.165899	2026-01-21 13:31:54.165899	0
581	20251230_7491	uploads/20251230_7491/30IYOQDIYH.MOV	2025-12-30 22:12:26	2025-12-30 14:18:05	100	End	1	train					0	\N	2026-01-21 13:31:54.167241	2026-01-21 13:31:54.167241	0
582	20251231_1873	uploads/20251231_1873/N0DJ0AXN3I.MOV	2025-12-31 10:33:13	2025-12-31 02:38:12	100	End	1	train					0	\N	2026-01-21 13:31:54.168613	2026-01-21 13:31:54.168613	0
583	20251231_0710	uploads/20251231_0710/26LCT3QZSO.MOV	2025-12-31 10:34:27	2025-12-31 02:43:06	100	End	1	train					0	\N	2026-01-21 13:31:54.169878	2026-01-21 13:31:54.169878	0
584	20251231_1235	uploads/20251231_1235/XG7EBRD4UQ.MOV	2025-12-31 10:35:38	2025-12-31 02:48:05	100	End	1	train					0	\N	2026-01-21 13:31:54.171235	2026-01-21 13:31:54.171235	0
585	20251231_7862	uploads/20251231_7862/2JEABPCON9.MOV	2025-12-31 10:36:49	2025-12-31 02:53:03	100	End	1	train					0	\N	2026-01-21 13:31:54.172576	2026-01-21 13:31:54.172576	0
586	20251231_9013	uploads/20251231_9013/094RXTRQ30.MOV	2025-12-31 10:38:18	2025-12-31 02:57:44	100	End	1	train					0	\N	2026-01-21 13:31:54.173948	2026-01-21 13:31:54.173948	0
587	20251231_1030	uploads/20251231_1030/8ZCLCWHE2C.MOV	2025-12-31 10:39:18	2025-12-31 03:02:18	100	End	1	train					0	\N	2026-01-21 13:31:54.17524	2026-01-21 13:31:54.17524	0
588	20251231_2334	uploads/20251231_2334/SS0LWO3VPV.MOV	2025-12-31 10:40:30	2025-12-31 03:05:19	100	End	1	train					0	\N	2026-01-21 13:31:54.17659	2026-01-21 13:31:54.17659	0
589	20251231_1797	uploads/20251231_1797/ZCUMOSPPWY.MOV	2025-12-31 10:41:26	2025-12-31 03:07:04	100	End	1	train					0	\N	2026-01-21 13:31:54.177993	2026-01-21 13:31:54.177993	0
590	20251231_2108	uploads/20251231_2108/5SW92P7PWB.MOV	2025-12-31 10:42:45	2025-12-31 03:10:58	100	End	1	train					0	\N	2026-01-21 13:31:54.179354	2026-01-21 13:31:54.179354	0
592	20251231_1466	uploads/20251231_1466/5V86CAT0EX.MOV	2025-12-31 11:10:07	2025-12-31 03:14:42	100	End	1	train					0	\N	2026-01-21 13:31:54.181843	2026-01-21 13:31:54.181843	0
593	20250626_2969_5602	20250626_2969	2025-12-31 15:46:03	2025-12-31 12:39:40	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.183196	2026-01-21 13:31:54.183196	0
594	20260105_90abc1a2ea0f11f0bab7507c6f574e05	uploads/20260105_90abc1a2ea0f11f0bab7507c6f574e05/VMXG29UNHK.mov	2026-01-05 16:21:44	2026-01-05 08:27:09	100	End	1	train					0	\N	2026-01-21 13:31:54.184567	2026-01-21 13:31:54.184567	1
595	20260105_6d0988d9ea1811f08d4a507c6f574e05	uploads/20260105_6d0988d9ea1811f08d4a507c6f574e05/L32JVUJWCT.MOV	2026-01-05 17:25:11	2026-01-05 09:31:38	100	End	1	train					0	\N	2026-01-21 13:31:54.185949	2026-01-21 13:31:54.185949	1
596	20260106_58d8afb3ead511f0bb05507c6f574e05	uploads/20260106_58d8afb3ead511f0bb05507c6f574e05/72WUEVE5RT.MOV	2026-01-06 15:57:35	2026-01-06 08:03:48	100	End	1	train					0	\N	2026-01-21 13:31:54.187301	2026-01-21 13:31:54.187301	1
597	20260106_541453d4eadf11f0acd9507c6f574e05	uploads/20260106_541453d4eadf11f0acd9507c6f574e05/R1GI3IF97Q.mov	2026-01-06 17:09:00	2026-01-06 09:16:01	100	End	1	train					0	\N	2026-01-21 13:31:54.188663	2026-01-21 13:31:54.188663	1
598	20260106_541453d4eadf11f0acd9507c6f574e05_7199	20260106_541453d4eadf11f0acd9507c6f574e05	2026-01-07 11:44:23	2026-01-07 10:36:23	100	End	1	nerfact					0	\N	2026-01-21 13:31:54.190036	2026-01-21 13:31:54.190036	1
599	20260108_0eceb2a2ec5f11f08804507c6f574e05	uploads/20260108_0eceb2a2ec5f11f08804507c6f574e05/MKUGONQSGU.MOV	2026-01-08 14:55:51	2026-01-08 07:00:50	100	End	1	train					0	\N	2026-01-21 13:31:54.191632	2026-01-21 13:31:54.191632	1
600	20260108_fc338ed2ec6211f0b70b507c6f574e05	uploads/20260108_fc338ed2ec6211f0b70b507c6f574e05/Z0LKT9UGPJ.MOV	2026-01-08 15:23:55	2026-01-08 07:28:30	100	End	1	train					0	\N	2026-01-21 13:31:54.193436	2026-01-21 13:31:54.193436	0
601	20260108_aa499ba5ec6611f085d0507c6f574e05	uploads/20260108_aa499ba5ec6611f085d0507c6f574e05/L8N8L48FSN.MOV	2026-01-08 15:50:16	2026-01-08 07:55:08	100	End	1	train					0	\N	2026-01-21 13:31:54.195083	2026-01-21 13:31:54.195083	0
602	20260108_043c0d33ec6e11f0afa4507c6f574e05	uploads/20260108_043c0d33ec6e11f0afa4507c6f574e05/IH65WC4FV6.mov	2026-01-08 16:42:52	2026-01-08 08:47:03	100	End	1	train					0	\N	2026-01-21 13:31:54.196619	2026-01-21 13:31:54.196619	0
603	20260108_05a1945dec9311f08480507c6f574e05	uploads/20260108_05a1945dec9311f08480507c6f574e05/FNVMI0CC8X.MOV	2026-01-08 21:07:48	2026-01-08 13:12:33	100	End	1	train					0	\N	2026-01-21 13:31:54.198115	2026-01-21 13:31:54.198115	0
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password_hash, created_at, updated_at) FROM stdin;
1	admin	240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9	2026-01-21 10:46:31.293954	2026-01-21 10:46:31.293954
\.


--
-- Name: export_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.export_id_seq', 1, false);


--
-- Name: gpuserver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.gpuserver_id_seq', 1, false);


--
-- Name: taskproject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.taskproject_id_seq', 616, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: export export_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.export
    ADD CONSTRAINT export_pkey PRIMARY KEY (id);


--
-- Name: gpuserver gpuserver_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpuserver
    ADD CONSTRAINT gpuserver_pkey PRIMARY KEY (id);


--
-- Name: taskproject taskproject_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taskproject
    ADD CONSTRAINT taskproject_pkey PRIMARY KEY (id);


--
-- Name: taskproject taskproject_project_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taskproject
    ADD CONSTRAINT taskproject_project_id_key UNIQUE (project_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: idx_export_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_export_project_id ON public.export USING btree (project_id);


--
-- Name: idx_gpuserver_node_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_gpuserver_node_type ON public.gpuserver USING btree (node_type);


--
-- Name: idx_gpuserver_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_gpuserver_status ON public.gpuserver USING btree (status);


--
-- Name: idx_taskproject_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taskproject_project_id ON public.taskproject USING btree (project_id);


--
-- Name: idx_taskproject_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_taskproject_status ON public.taskproject USING btree (status);


--
-- Name: idx_users_username; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_users_username ON public.users USING btree (username);


--
-- PostgreSQL database dump complete
--

\unrestrict BSk1RdtzK0GOZl5Q3w34DE6zRYYgxDbYiBcktqarWSop9EaVe3uHIZV2qsofC4t

