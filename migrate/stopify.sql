--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Artist" (
    id integer NOT NULL,
    email text NOT NULL,
    name text,
    password text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Artist" OWNER TO postgres;

--
-- Name: Artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Artist_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Artist_id_seq" OWNER TO postgres;

--
-- Name: Artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Artist_id_seq" OWNED BY public."Artist".id;


--
-- Name: LikeTo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LikeTo" (
    "idUser" integer NOT NULL,
    "titleMusic" text,
    "titleAlbum" text,
    "idArtist" integer NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."LikeTo" OWNER TO postgres;

--
-- Name: ListenTo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ListenTo" (
    "titleMusic" text,
    "titleAlbum" text,
    "idArtist" integer NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ListenTo" OWNER TO postgres;

--
-- Name: Poster; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Poster" (
    "idArtist" integer NOT NULL,
    title text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    image text NOT NULL,
    price double precision NOT NULL,
    description text NOT NULL,
    "startDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "endDate" timestamp(3) without time zone DEFAULT '9999-12-31 23:59:59'::timestamp without time zone NOT NULL
);


ALTER TABLE public."Poster" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: Artist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Artist" ALTER COLUMN id SET DEFAULT nextval('public."Artist_id_seq"'::regclass);


--
-- Data for Name: Artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Artist" (id, email, name, password, "createdAt", "updatedAt") FROM stdin;
209	asdasdsa	asd	$2b$10$UqlPMuXgoESgl9FAf.fdhu0EI192Oxyw26zo5XzOOaT0TOYvQks6C	2023-11-13 05:37:38.394	2023-11-13 05:37:38.394
108	artist0@example.com	Artist 0	password	2023-11-05 00:05:50.221	2023-11-05 00:05:50.221
109	jimenezdesiree@example.org	Roy Gillespie	t)59qCOiou	2023-01-19 05:35:59	2023-10-18 07:00:49
110	kevin49@example.com	Richard Wright	+vyKL(q!*8	2023-04-04 09:37:39	2023-07-30 21:29:53
111	carriehale@example.org	Richard Merritt	@nxTZvBU4Q	2022-04-24 02:47:57	2023-09-26 17:43:51
112	julienguyen@example.org	Cody Rodriguez	*r0X4S$lC(	2020-11-21 00:23:15	2023-07-22 01:57:41
113	toddmcclure@example.com	Rebecca Rodriguez	(qw3u6BoAJ	2021-01-29 12:00:37	2023-04-03 03:04:37
114	charles38@example.org	Jennifer Norris	!I1iR5lTW8	2021-03-30 18:26:30	2023-05-29 09:16:47
115	zwilson@example.net	Jason Roman	(8OV%xZp!1	2023-09-25 03:51:22	2023-04-10 10:16:59
116	richardsongabrielle@example.org	Sarah Sharp	_+9l@ZFNg5	2020-11-07 18:47:32	2023-06-06 17:09:25
117	jensenjared@example.org	William Bell	YW9#iTViX#	2023-03-15 13:38:08	2023-01-17 04:55:07
118	richardsondominique@example.net	Anthony Cook	(oYp+N)gi7	2020-02-10 01:14:15	2023-01-13 21:46:29
119	samuel60@example.com	Christina Mcbride	(8S57EgQSY	2020-05-21 04:25:13	2023-01-01 19:03:57
120	crodriguez@example.net	Candice Gibson	88%f6DSc2_	2020-09-15 06:11:02	2023-05-16 10:07:38
121	mwelch@example.org	Nicole Watkins	3o@4VkJmnQ	2022-07-30 13:26:16	2023-07-21 22:40:19
122	williampittman@example.net	Lori Gould	V1CbaKq!&I	2022-09-21 03:39:59	2023-05-10 03:01:13
123	ashley37@example.net	Shirley Snyder	(ICRQxSv3i	2021-11-01 11:19:35	2023-01-11 08:40:21
124	jenkinskimberly@example.net	Theresa Walton	^fQ1%eLyQ$	2023-08-11 01:51:35	2023-06-18 06:46:37
125	tina89@example.org	Jill Summers	Ud1VQxH!!%	2022-04-01 02:52:29	2023-08-05 21:16:49
126	jweaver@example.net	Tyler Cooke	krI7+1UpO!	2021-11-28 23:44:35	2023-05-20 11:48:23
127	robertlloyd@example.net	Courtney Nunez	K#0LsO8f^z	2021-01-11 23:57:40	2023-10-29 13:56:49
128	bryanmcdaniel@example.com	Bethany Taylor	(iMHn55Za9	2020-05-24 21:21:33	2023-01-10 16:36:30
129	andreanavarro@example.org	Ryan Smith	#m9MGpO^X$	2022-02-02 07:56:32	2023-07-27 06:12:49
130	greenbobby@example.org	Julie Ferguson	%0!DrHFu$t	2020-08-11 04:31:21	2023-09-05 21:03:49
131	cordovajeffrey@example.net	Vicki Wilkerson	!2vqCpgJP!	2020-08-14 09:27:51	2023-09-03 14:28:46
132	ojones@example.org	April Reynolds DDS	h2#4jUIoD!	2020-04-03 15:12:55	2023-08-12 11:10:24
133	utrujillo@example.net	Michael Williams	@^!WiCL&&8	2020-05-01 02:01:28	2023-05-23 08:17:12
134	smithleslie@example.net	Pamela Baker	r@mr7PuA@t	2020-06-06 18:27:32	2023-06-07 20:16:38
135	john40@example.net	David Joyce	3e#8(G1XS_	2022-11-20 02:40:37	2023-03-21 22:46:10
136	frankangela@example.com	Joseph Walton	^T0vZOhk+u	2022-02-16 03:01:39	2023-05-05 00:24:57
137	wilsonbrandi@example.com	Adam Palmer	q7GD4KSh^c	2022-03-06 07:15:18	2023-09-24 06:40:35
138	clayton64@example.net	Sara Wood	5@9_2Ninmf	2020-06-28 00:38:25	2023-08-29 06:52:44
139	jameschavez@example.net	Megan Washington	+0LOsIfmf^	2022-03-02 10:56:03	2023-06-05 09:22:35
140	caguirre@example.net	Matthew Johnston	42hBS9!N#f	2022-03-24 01:01:42	2023-04-01 04:08:01
141	derek99@example.net	Justin Hamilton	8cQrWppd_J	2023-06-02 11:40:34	2023-05-27 01:50:07
142	bryantanthony@example.com	Jacob Hernandez	L1)x74Sbg7	2021-03-14 19:53:57	2023-08-25 04:54:59
143	nvasquez@example.org	Melissa Sanchez	*G6y6Pu^1F	2021-04-10 19:27:31	2023-07-07 04:59:27
144	susan37@example.org	Jonathan Rogers	#*NZ3E(x4p	2021-12-24 20:13:22	2023-06-06 04:26:47
145	jessicaacosta@example.org	Arthur Watson	zDmhtAJ9&1	2022-04-03 01:59:37	2023-03-27 12:07:08
146	omorse@example.org	Derek Austin	$2lI!DvbkH	2023-04-17 00:11:20	2023-08-09 16:13:56
147	ljohnson@example.com	Shannon White DDS	Q+0)LfTwEo	2020-06-16 09:15:39	2023-07-01 19:17:31
148	matthew21@example.com	Elizabeth Brooks	(0GxED6)iP	2021-12-07 18:10:22	2023-03-24 14:21:08
149	myersrobert@example.org	Jesse Conley	z(N0OP)m&*	2020-04-26 06:31:17	2023-10-17 23:57:20
150	toddpineda@example.net	Jennifer Crosby	%1PvEiWuxd	2022-07-12 04:14:59	2023-05-13 07:50:02
151	tiffany49@example.com	Jaime Payne	5HX0^Drf#4	2021-09-10 15:02:29	2023-09-08 20:22:07
152	cruzheather@example.com	Sarah Tran	b(%3ILds$Y	2020-10-03 09:42:14	2023-10-27 05:32:03
153	jasonmarks@example.net	Amy Parks	9D8*VWbc*X	2020-08-14 03:35:57	2023-08-28 05:29:58
154	tyler88@example.net	Mason Rivera	!4DSFmOr!p	2021-01-05 14:58:42	2023-03-31 11:29:53
155	william17@example.com	Stanley Jackson	r7i8ZKkj(1	2023-07-17 23:15:16	2023-04-29 02:29:27
156	jonathangonzalez@example.net	Albert Richardson	^82c2RYKda	2021-01-10 21:10:14	2023-06-28 10:01:41
157	traviswright@example.org	Crystal Page	^^52Qt6$@r	2023-10-18 23:41:54	2023-10-02 01:00:23
158	michael39@example.net	David Gaines	%^KLtakUe4	2021-03-24 02:19:23	2023-03-26 08:36:33
159	apriljordan@example.org	Joshua Miller	QE%Z@1VfGI	2021-04-05 01:42:38	2023-01-28 19:12:09
160	qhouston@example.org	Jonathan Taylor	3e8I%0Vij_	2023-10-09 23:26:05	2023-07-22 16:44:26
161	connie88@example.com	Peggy Garrett	v_af7PUmId	2023-02-08 22:48:15	2023-10-08 14:42:04
162	sarah71@example.net	Briana Alvarado	N112GS!g^y	2021-03-08 09:26:14	2023-09-06 08:11:28
163	amorrison@example.org	Kevin Hamilton	yxIT^#2i!7	2022-07-02 00:48:33	2023-10-14 22:19:38
164	avilajason@example.com	Jared Aguilar	fC6J8kfc_j	2020-09-09 22:03:58	2023-01-16 22:30:34
165	natalie03@example.com	Christina Shelton	!DN6SiOR9y	2021-08-22 19:28:30	2023-01-23 07:57:41
166	jonathan11@example.org	Michael Peterson	P%n5LiDm)D	2023-06-27 16:08:08	2023-05-06 11:07:27
167	nathanmurray@example.net	Lucas Mullins	#_UYrHNj)7	2020-05-25 09:32:57	2023-03-20 05:22:46
168	bryanross@example.com	Patrick Williams	(1uVkje*a!	2021-04-03 19:50:56	2023-04-07 15:44:37
169	moorejames@example.net	Donald Mcfarland	%VJGrtvKa0	2022-12-06 13:25:04	2023-10-04 13:14:37
170	qwallace@example.org	Hannah Fox	%e$z4APf*^	2021-07-02 04:04:42	2023-08-05 09:16:28
171	michele82@example.net	Nicole White	q4qC70Bi^^	2021-06-16 12:56:34	2023-09-30 19:36:58
172	barrysoto@example.net	Joshua Reed	i#4QOxhu0@	2020-07-06 00:36:47	2023-10-29 23:01:25
173	matthewcarson@example.net	Devin Zhang	^$ni1Uxt45	2020-05-14 16:16:23	2023-01-13 08:40:50
174	tinamiller@example.net	David Butler	RUe6VdUx%d	2022-03-09 22:50:26	2023-06-15 04:04:45
175	ustone@example.net	Marcus Young	nge43BQwQ*	2023-08-29 13:52:19	2023-08-13 21:09:26
176	ujohnson@example.com	Zachary Allen	n6U8bMfw!_	2023-09-30 01:49:57	2023-08-11 05:42:27
177	khoward@example.org	Michelle Rogers	F%1^rHHz!z	2020-09-25 10:09:48	2023-05-04 06:15:31
178	lauren86@example.org	Miss Leah Brock DDS	_mGR4Bk%VI	2022-05-02 03:22:47	2023-04-26 06:05:09
179	abuck@example.org	Juan Sanchez	@3C7z57ouX	2020-12-15 07:55:22	2023-11-03 17:28:55
180	mannjennifer@example.com	Jennifer Martin	eCNlhyld)5	2020-06-15 05:02:23	2023-01-12 18:45:11
181	patricia16@example.net	Allen Davis	Q@(1PU)s$Q	2021-05-30 11:21:11	2023-03-15 01:38:50
182	whitechelsea@example.com	Richard Singleton	OAAr#v1n)4	2022-03-27 22:25:59	2023-03-08 12:53:48
183	jamesgonzales@example.org	Sean Morgan	7P!0OlHoC#	2021-09-23 07:16:16	2023-08-07 21:09:05
184	timmyers@example.net	Tyler Garcia	#5E7WwmQu0	2023-01-04 15:51:50	2023-06-01 23:11:46
185	aprilward@example.com	Joseph Acevedo	5!7jdDsK*H	2022-07-10 03:15:23	2023-02-13 10:43:52
186	jay06@example.net	Felicia Joyce	^9NljzlM!1	2020-11-13 17:33:30	2023-09-14 02:56:34
187	patricia08@example.com	Melinda Saunders	l9Qj%Far!F	2020-09-12 15:06:12	2023-06-23 11:53:47
188	audreymurray@example.net	Rodney Turner	I$jTU9Mz+T	2021-05-08 17:51:59	2023-01-29 01:57:14
189	gregory62@example.com	Dr. Richard Reilly	%0osIaNUir	2023-04-10 20:18:20	2023-03-07 17:18:05
190	slopez@example.net	Kristin Lopez	ygN^4Z2yz0	2023-06-13 09:16:22	2023-04-26 12:39:53
191	vickichavez@example.org	Elizabeth Williams	m8*EiaMk!&	2023-01-25 18:11:00	2023-01-30 10:15:59
192	tanyadavis@example.com	Jennifer Gonzalez	(Yn2V8Zt2%	2020-12-22 12:00:28	2023-05-28 04:38:55
193	smithmarc@example.com	Erin Cooke	74Fu9wXp_b	2020-10-22 17:29:38	2023-07-19 12:10:54
194	melissahoward@example.org	Joy Wells	+^S4XMmL*(	2022-05-05 08:30:28	2023-09-17 13:32:41
195	dwolf@example.com	Brandon Escobar	$cfCNTKY7F	2023-10-11 12:11:53	2023-01-02 17:48:34
196	lauren05@example.org	Mark Jones	stA%1WBffr	2020-10-11 02:47:17	2023-09-29 06:35:55
197	ashley80@example.net	Jake Davis	mioW#3CrZd	2020-12-26 03:07:19	2023-02-10 03:11:48
198	jmcknight@example.com	Paige Adams	ZAXV$6Bc6I	2021-05-08 08:11:54	2023-03-28 18:11:41
199	pricekimberly@example.com	Katrina Cooper	DCQ21TOr6(	2021-11-27 00:56:01	2023-02-12 22:55:56
200	imartin@example.net	Debra Gamble	7X%3W5j6)8	2020-03-30 15:23:03	2023-08-29 03:29:40
201	fletchereric@example.net	Richard Smith	Ko@04SLdvp	2020-01-09 17:32:06	2023-01-15 16:13:06
202	destiny90@example.org	Bradley Valenzuela	P#0Fq^Nq2$	2022-11-09 04:07:50	2023-06-17 14:27:48
203	rogerskyle@example.com	Diana Farmer	)2Kj2szyup	2021-03-09 13:23:19	2023-08-14 00:24:13
204	pdavidson@example.com	Antonio Copeland	dV9E1KTt%6	2022-11-28 11:18:24	2023-10-25 23:23:09
205	hannah69@example.org	Elizabeth Moore	!l0_7NNz7l	2021-05-26 22:14:30	2023-10-22 04:12:52
206	chaserivera@example.org	Jessica Hutchinson	h&1bSPb93j	2023-01-29 13:50:02	2023-09-08 09:38:56
207	harrisbriana@example.net	Francisco Stanton	(y((igSd4c	2021-09-01 15:56:53	2023-02-18 08:20:36
208	amy27@example.com	Oscar Gonzalez	mX49oul)b$	2020-09-09 22:09:27	2023-05-14 18:45:47
\.


--
-- Data for Name: LikeTo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LikeTo" ("idUser", "titleMusic", "titleAlbum", "idArtist", date) FROM stdin;
49	i	C	109	2023-11-02 15:13:57
77	i	A	110	2023-11-02 05:46:16
29	j	C	111	2023-11-02 08:35:04
97	d	A	112	2023-11-03 00:51:32
60	l	B	113	2023-11-02 04:03:56
8	n	C	114	2023-11-01 22:50:37
75	h	A	115	2023-11-04 03:41:43
83	c	A	116	2023-11-04 13:13:05
70	e	B	117	2023-11-01 09:17:43
58	o	C	118	2023-11-02 07:09:12
20	c	B	119	2023-11-03 07:48:47
78	k	C	120	2023-11-03 04:07:35
27	n	C	121	2023-11-01 01:13:14
35	j	C	122	2023-11-03 17:07:54
27	o	A	123	2023-11-01 11:33:32
85	a	A	124	2023-11-02 10:20:24
5	h	B	125	2023-11-03 22:00:06
44	a	C	126	2023-11-03 01:01:55
23	j	C	127	2023-11-04 06:25:26
42	d	A	128	2023-11-01 04:17:02
38	m	A	129	2023-11-03 19:37:41
100	c	A	130	2023-11-01 14:21:31
25	b	A	131	2023-11-02 13:27:58
44	b	A	132	2023-11-01 00:55:40
30	n	B	133	2023-11-02 06:36:01
80	l	B	134	2023-11-03 06:01:10
23	d	C	135	2023-11-03 05:08:50
62	j	A	136	2023-11-04 10:01:21
91	h	C	137	2023-11-04 06:34:08
61	f	B	138	2023-11-02 21:21:41
28	c	A	139	2023-11-04 23:29:07
28	i	B	140	2023-11-01 13:45:42
48	l	A	141	2023-11-03 07:45:57
56	a	C	142	2023-11-01 08:26:22
27	o	A	143	2023-11-03 17:37:00
67	n	B	144	2023-11-02 06:26:26
92	d	A	145	2023-11-01 20:52:57
38	j	B	146	2023-11-04 13:22:29
49	o	C	147	2023-11-03 00:28:11
40	j	C	148	2023-11-04 21:01:20
36	m	B	149	2023-11-03 21:27:29
81	f	A	150	2023-11-02 10:26:28
82	i	A	151	2023-11-04 16:41:39
38	m	C	152	2023-11-02 22:25:46
93	h	B	153	2023-11-02 19:02:17
51	o	A	154	2023-11-03 02:51:28
86	g	B	155	2023-11-02 01:10:44
85	c	B	156	2023-11-01 08:35:41
68	g	C	157	2023-11-02 05:55:19
48	f	A	158	2023-11-01 05:14:24
76	h	A	159	2023-11-04 09:02:31
1	n	B	160	2023-11-04 23:33:31
71	f	B	161	2023-11-02 20:34:24
38	i	B	162	2023-11-01 13:07:01
18	f	B	163	2023-11-01 05:33:21
74	b	B	164	2023-11-01 18:57:05
20	j	B	165	2023-11-01 19:21:53
80	b	A	166	2023-11-03 14:46:45
53	i	B	167	2023-11-02 18:38:44
96	a	B	168	2023-11-01 12:23:49
3	a	C	169	2023-11-04 11:37:24
52	m	B	170	2023-11-04 08:36:07
97	n	B	171	2023-11-02 23:56:53
10	g	B	172	2023-11-01 04:23:48
22	e	A	173	2023-11-04 16:33:39
12	l	B	174	2023-11-04 22:52:21
6	d	B	175	2023-11-01 14:36:32
80	f	A	176	2023-11-02 05:50:15
26	b	A	177	2023-11-01 17:13:52
60	n	A	178	2023-11-02 14:19:56
60	i	C	179	2023-11-01 11:07:33
98	h	B	180	2023-11-02 03:30:58
40	k	C	181	2023-11-01 20:57:47
10	f	B	182	2023-11-04 11:18:07
22	a	C	183	2023-11-01 23:48:35
70	n	A	184	2023-11-04 04:41:06
95	n	A	185	2023-11-01 02:31:27
78	e	A	186	2023-11-01 03:39:03
8	k	A	187	2023-11-03 13:59:42
32	g	B	188	2023-11-01 15:27:10
63	j	B	189	2023-11-03 23:26:35
69	m	A	190	2023-11-03 18:29:38
86	m	A	191	2023-11-03 05:12:57
65	n	A	192	2023-11-01 22:09:28
12	g	A	193	2023-11-01 07:36:40
6	n	B	194	2023-11-04 21:59:11
51	b	B	195	2023-11-04 11:27:34
23	m	A	196	2023-11-03 09:48:09
79	a	B	197	2023-11-03 11:14:33
42	a	B	198	2023-11-02 04:42:30
96	c	B	199	2023-11-03 09:06:52
20	d	C	200	2023-11-04 14:21:27
73	o	C	201	2023-11-04 06:33:44
99	i	A	202	2023-11-03 06:57:02
40	f	A	203	2023-11-02 14:51:16
100	n	C	204	2023-11-03 13:33:41
14	e	B	205	2023-11-04 11:32:35
31	h	C	206	2023-11-02 21:50:16
62	b	B	207	2023-11-02 09:23:24
77	l	B	208	2023-11-03 14:25:59
\.


--
-- Data for Name: ListenTo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ListenTo" ("titleMusic", "titleAlbum", "idArtist", date) FROM stdin;
brother	threat	109	2023-11-04 20:46:31
window	view	110	2023-11-02 00:10:32
left	total	111	2023-11-02 21:53:24
house	animal	112	2023-11-01 14:11:15
fight	degree	113	2023-11-03 05:35:04
yourself	especially	114	2023-11-04 14:54:39
word	usually	115	2023-11-01 17:29:50
offer	chance	116	2023-11-01 01:11:42
prevent	level	117	2023-11-03 06:25:02
source	cover	118	2023-11-03 20:50:57
few	scientist	119	2023-11-01 10:38:14
blood	action	120	2023-11-01 00:48:34
value	hundred	121	2023-11-01 13:35:26
firm	once	122	2023-11-03 11:16:16
good	reduce	123	2023-11-03 19:09:35
develop	situation	124	2023-11-04 15:27:09
best	project	125	2023-11-02 09:40:41
local	establish	126	2023-11-01 15:23:25
responsibility	happen	127	2023-11-02 17:50:44
she	attorney	128	2023-11-03 11:20:33
with	condition	129	2023-11-02 00:59:00
money	agent	130	2023-11-02 12:37:32
or	chair	131	2023-11-02 22:16:00
character	team	132	2023-11-03 02:26:36
the	fine	133	2023-11-03 19:27:10
wait	number	134	2023-11-04 04:07:48
respond	protect	135	2023-11-03 23:18:31
just	month	136	2023-11-01 12:03:17
knowledge	collection	137	2023-11-03 06:40:03
simple	spend	138	2023-11-03 16:09:09
science	off	139	2023-11-02 10:46:05
man	car	140	2023-11-04 20:48:02
discussion	buy	141	2023-11-03 10:49:45
realize	certain	142	2023-11-02 21:08:10
leave	white	143	2023-11-03 06:52:15
through	defense	144	2023-11-01 00:21:52
media	simply	145	2023-11-01 05:33:04
analysis	indicate	146	2023-11-03 22:17:39
morning	natural	147	2023-11-03 23:17:40
my	own	148	2023-11-02 22:11:56
she	early	149	2023-11-04 11:56:28
plant	explain	150	2023-11-03 19:11:35
leave	team	151	2023-11-03 12:26:59
situation	lawyer	152	2023-11-04 19:27:56
particular	certain	153	2023-11-02 22:39:19
economy	meet	154	2023-11-02 17:00:19
put	certain	155	2023-11-01 06:05:08
article	their	156	2023-11-03 16:16:07
west	along	157	2023-11-02 00:40:05
make	soon	158	2023-11-02 05:45:00
color	rule	159	2023-11-02 20:52:16
president	effort	160	2023-11-02 18:16:42
beyond	itself	161	2023-11-02 01:15:27
poor	remain	162	2023-11-03 16:26:19
reality	hot	163	2023-11-01 01:57:28
west	share	164	2023-11-04 04:22:56
effect	police	165	2023-11-04 15:37:36
oil	teacher	166	2023-11-02 05:26:19
else	cause	167	2023-11-02 08:02:47
concern	office	168	2023-11-04 11:50:08
blood	place	169	2023-11-02 21:26:07
about	present	170	2023-11-04 21:53:00
manage	water	171	2023-11-02 10:35:04
painting	allow	172	2023-11-02 18:20:56
which	Republican	173	2023-11-01 16:42:58
really	truth	174	2023-11-01 00:58:21
worry	officer	175	2023-11-03 12:41:17
either	season	176	2023-11-01 04:52:58
best	yet	177	2023-11-02 22:23:03
simply	candidate	178	2023-11-02 07:53:18
speech	able	179	2023-11-02 16:36:26
for	bad	180	2023-11-03 20:06:32
all	almost	181	2023-11-04 00:30:20
quickly	choose	182	2023-11-02 11:35:29
face	simply	183	2023-11-04 21:56:07
agree	nation	184	2023-11-03 00:14:00
describe	nature	185	2023-11-02 09:48:02
foreign	end	186	2023-11-02 14:37:52
because	nor	187	2023-11-04 07:23:32
know	brother	188	2023-11-03 15:28:27
other	local	189	2023-11-02 06:08:04
material	star	190	2023-11-01 19:44:46
up	again	191	2023-11-02 11:46:56
father	season	192	2023-11-01 00:49:02
reduce	practice	193	2023-11-04 10:26:53
feel	surface	194	2023-11-01 22:00:52
feeling	news	195	2023-11-01 06:27:53
thank	us	196	2023-11-04 04:45:01
when	however	197	2023-11-04 18:27:53
investment	mean	198	2023-11-02 14:11:12
now	official	199	2023-11-04 08:33:58
about	business	200	2023-11-02 11:30:03
development	ago	201	2023-11-03 05:35:42
explain	shoulder	202	2023-11-03 01:28:30
carry	plan	203	2023-11-01 03:10:43
only	water	204	2023-11-01 06:18:50
while	season	205	2023-11-04 08:08:28
for	term	206	2023-11-01 20:11:37
small	but	207	2023-11-03 21:23:00
for	send	208	2023-11-04 02:16:15
\.


--
-- Data for Name: Poster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Poster" ("idArtist", title, "createdAt", "updatedAt", image, price, description, "startDate", "endDate") FROM stdin;
109	technology	2023-07-19 12:54:44	2023-05-27 09:26:11	https://dummyimage.com/501x467	96	Blood approach between really short. Community boy local goal lay Mrs.	2023-04-20 02:47:19	2023-09-09 00:36:07
110	energy	2023-02-16 02:15:20	2023-04-14 17:31:38	https://dummyimage.com/650x221	25	College enter above onto good organization. I until fear.\nMemory turn individual although physical by. Form sure success price cover nature may. Year move buy understand power.	2023-03-30 04:40:25	2023-04-25 08:41:27
111	party	2023-10-14 12:20:54	2023-08-21 21:33:59	https://dummyimage.com/371x303	60	Study partner always popular fill. Throughout see work military.\nSimilar ball whole about fly. Eat only partner so month painting. Inside before know hear there star station explain.	2023-03-25 22:18:22	2023-03-09 19:17:03
112	although	2023-08-24 04:46:13	2023-03-05 22:55:37	https://picsum.photos/119/771	23	Everything fear consider book approach seven. Interest yourself stage drop however. Hand expect seem morning perhaps season. Between sing until difference west sense.	2023-08-04 05:23:04	2023-07-11 13:57:53
113	natural	2023-10-16 06:29:37	2023-09-23 19:42:29	https://dummyimage.com/556x320	40	Religious later improve receive defense thought dog. Loss decide hundred then from peace foot.\nWho chance thus describe here economy dinner. Under old bed the girl same fill.	2023-04-29 06:20:30	2023-03-19 12:47:49
114	threat	2023-09-23 01:04:45	2023-06-26 14:46:45	https://dummyimage.com/969x626	63	Compare true think happy daughter else role. Growth about area goal. Record truth news already.	2023-05-13 19:25:43	2023-08-13 23:54:53
115	Mrs	2023-06-17 04:05:48	2023-07-09 06:26:14	https://dummyimage.com/431x73	78	Wide smile need itself car some. I important could. Own play authority understand. Former these side.	2023-02-02 13:52:44	2023-07-17 14:17:35
116	major	2023-01-01 20:01:46	2023-04-21 10:49:30	https://placekitten.com/993/204	80	Protect approach condition including organization need many edge. Few popular choice the air blue page. Compare work threat experience feel treat upon.	2023-08-07 17:04:24	2023-11-22 09:46:39
117	city	2023-03-14 04:51:13	2023-01-03 09:42:13	https://picsum.photos/678/1023	5	Break onto product represent. During seem several avoid sense.\nHard individual avoid various end. Stand table sport fast protect teacher. Might me Mr then cover score light.	2023-03-11 00:38:14	2023-05-22 23:14:41
118	sister	2023-01-07 16:27:12	2023-02-22 19:44:59	https://picsum.photos/832/464	20	Huge south lawyer break. Police treatment nation president ready radio happy over.\nYour ten health. Interesting can easy generation nice green. Director again them maybe.	2023-01-18 19:46:56	2023-07-09 21:36:04
119	director	2023-04-23 08:18:59	2023-09-12 09:49:09	https://picsum.photos/832/644	73	Loss strong success character series idea property. First former opportunity each.	2023-04-16 16:07:24	2023-03-31 10:18:25
120	marriage	2023-06-15 00:09:24	2023-07-01 00:02:06	https://placekitten.com/306/222	68	News section production end room thank impact. Best shake remember despite long information entire. Hand good agent.\nReturn art amount whose study expert.	2023-05-22 11:17:23	2023-10-24 04:02:55
121	result	2023-02-23 11:49:53	2023-10-31 00:43:54	https://dummyimage.com/1014x212	16	Different tax medical leave professor region. Pressure star whole court. Age meet difficult movement. Growth site eye daughter night population.	2023-06-24 06:03:28	2023-11-27 10:18:18
122	up	2023-07-26 01:02:11	2023-06-18 11:10:33	https://placekitten.com/970/84	48	Board consider within month smile sense piece. To adult three brother. Meeting fall old community off movie standard.\nPattern form nor team price. Generation certainly race deep article.	2023-03-31 05:51:49	2023-04-28 01:08:54
123	standard	2023-05-03 11:10:35	2023-07-05 23:07:08	https://dummyimage.com/124x393	26	Former campaign improve scientist. Among maintain environmental company light sing born easy. Social he question page past trip thank.	2023-01-31 00:50:43	2023-06-11 19:29:30
124	degree	2023-08-12 04:37:37	2023-05-28 07:06:22	https://dummyimage.com/481x764	94	Base discussion look.\nIssue chance color lot group move. Range theory eye.	2023-03-09 16:29:26	2023-05-25 19:25:18
125	soon	2023-10-28 04:04:47	2023-07-03 11:56:48	https://dummyimage.com/42x103	12	Citizen despite form international whom real. Agree grow produce usually news production. Argue between character watch call thus.	2023-09-03 23:36:36	2023-02-28 02:20:04
126	product	2023-02-25 03:44:32	2023-08-05 01:35:20	https://dummyimage.com/62x555	61	World every find. Through word appear daughter skin town standard garden.\nWonder better sit also detail. Become car system data trip.	2023-01-18 18:02:11	2023-02-08 17:56:12
127	account	2023-07-25 10:16:21	2023-07-26 12:16:02	https://dummyimage.com/676x903	11	Growth social provide right down president imagine.\nSituation television level image continue. Baby property serious task pretty individual. Hair meet purpose call bad close speak.	2023-06-23 01:03:01	2023-10-22 22:31:46
128	suffer	2023-05-13 17:23:08	2023-05-23 13:02:21	https://dummyimage.com/497x686	55	Security later economic. Woman lawyer industry letter school. Wall table different home standard civil.	2023-10-15 15:10:00	2023-03-05 06:29:17
129	control	2023-07-12 20:16:50	2023-03-20 23:49:01	https://placekitten.com/168/380	82	Town win Mrs very bar building. Early home into other material over less. Last responsibility far end politics.	2023-08-31 16:07:31	2023-06-14 01:31:12
130	skin	2023-05-18 15:40:12	2023-02-23 11:11:54	https://picsum.photos/901/114	54	South prove day often no admit. Nearly decide six develop building nearly reflect. Week morning spend shake learn.	2023-06-11 01:57:03	2023-08-19 19:26:29
131	old	2023-08-20 04:53:23	2023-10-31 20:40:27	https://dummyimage.com/778x927	64	Main quickly cover large prevent commercial force often. Defense fine machine would finish network. And that picture rich anyone figure country question.	2023-09-20 21:22:21	2023-03-01 15:29:12
132	produce	2023-06-21 19:52:10	2023-07-07 07:08:32	https://placekitten.com/170/80	82	Without cost everyone director. Way care day accept. Hundred number purpose alone wonder impact off.\nArm either too lose next. Month life somebody threat garden draw.	2023-01-01 06:28:15	2023-03-23 19:18:45
133	hot	2023-08-01 12:47:20	2023-02-03 06:29:28	https://dummyimage.com/943x883	79	Clearly national career establish painting meeting.\nProgram interest save method heart discover. No know great record them. Continue prove choose usually manage.	2023-05-04 18:41:02	2023-11-24 12:55:30
134	again	2023-09-21 11:34:06	2023-02-15 03:12:13	https://dummyimage.com/963x674	39	Interview agency long away culture camera your enter. Could job democratic skin on design concern tend. Design deal maybe information yard significant full. School somebody whether once.	2023-04-30 00:29:40	2023-06-30 06:01:47
135	eight	2023-04-03 09:06:51	2023-10-17 18:48:36	https://placekitten.com/561/770	86	Standard less right ask five sport. Thank life window. Production mean something alone consider Mrs.\nNo red west always blood. Space thus student account hard.	2023-06-22 19:06:31	2023-03-03 10:26:00
136	owner	2023-02-17 20:13:00	2023-01-28 21:03:32	https://placekitten.com/519/405	19	Without measure owner better huge. Speech may attack play eat remember window. Lawyer check same. Case possible little international whatever prove.	2023-01-13 04:46:07	2023-05-08 00:00:01
137	art	2023-06-11 22:27:51	2023-09-12 16:25:49	https://placekitten.com/782/415	17	Those east so build building size finally. Quickly miss per cultural present tough. Agreement exactly protect prevent that can.\nBall behavior from moment author pattern fill.	2023-07-20 06:34:03	2023-09-08 14:22:29
138	future	2023-10-11 02:06:57	2023-10-18 02:10:15	https://dummyimage.com/1001x72	55	Remember accept hospital agreement seek red ground. Stay indicate relate no address class teacher. Some green meet popular stage begin.	2023-08-16 19:48:16	2023-07-13 07:01:34
139	least	2023-06-28 00:42:01	2023-03-17 12:49:54	https://picsum.photos/221/276	25	Air establish ok common power rate. Guy next read music six. Evidence your should worker son occur. Already account pick everybody most mother.	2023-03-27 20:16:22	2023-09-19 23:43:20
140	size	2023-05-01 20:33:04	2023-05-26 20:55:18	https://picsum.photos/21/362	40	Computer thought measure. Surface decade second rise far deal.\nHealth stop difficult probably matter reduce election child. Admit reveal treat boy head street owner mean.	2023-10-15 10:10:54	2023-11-17 19:03:11
141	include	2023-02-08 08:12:14	2023-01-21 03:13:54	https://dummyimage.com/912x25	7	Toward appear new rock girl another these. Of since PM night cultural among bar. Wife now reduce daughter smile.	2023-02-03 22:45:44	2023-04-06 20:08:46
142	travel	2023-10-02 15:25:02	2023-04-18 21:32:57	https://placekitten.com/156/934	6	Reality improve early why. Toward certainly police certain.\nDetermine throw wide career employee organization. Parent tell outside decade son. Hot subject throw let.	2023-01-27 11:16:23	2023-06-03 11:09:36
143	sense	2023-09-04 16:11:27	2023-09-06 12:47:06	https://placekitten.com/867/638	70	Manage local of hard claim focus offer. Memory wish book himself company large within.\nGrow wide herself space. Affect here under deal public than meeting.	2023-08-31 14:51:18	2023-05-03 14:59:47
144	great	2023-08-07 20:08:17	2023-07-28 13:37:55	https://dummyimage.com/5x373	60	Place best over someone. Economic bar fall though push. This yes unit speak someone stuff.	2023-04-07 04:37:03	2023-09-08 07:00:14
145	talk	2023-03-19 23:36:45	2023-01-12 13:20:52	https://placekitten.com/357/601	73	Remember field small office. Can million against difference kitchen. Carry shake town spend tax someone sure successful.	2023-09-17 15:23:22	2023-03-25 06:29:06
146	care	2023-10-07 02:46:46	2023-10-10 22:27:24	https://dummyimage.com/287x291	92	Little also color parent without because how.\nCatch no method night feel. Natural officer not can speak.	2023-01-31 22:00:19	2023-06-10 22:03:01
147	company	2023-09-26 09:41:16	2023-09-03 06:37:19	https://dummyimage.com/236x55	37	Trial continue citizen dinner government discover. Result strong course occur source everybody phone stop.	2023-02-11 08:45:30	2023-05-25 11:25:30
148	tell	2023-08-04 05:56:52	2023-07-26 06:06:07	https://placekitten.com/711/236	80	Under today star use drug. Almost heart character land.\nMiddle foot lose I medical behavior. Property agree way picture sure first. Issue article bar focus catch those.	2023-07-03 13:36:38	2023-12-01 15:42:12
149	around	2023-05-14 14:32:11	2023-05-11 22:29:06	https://picsum.photos/666/647	65	Remain pull yes season couple certain require. Within parent beyond.\nFinal past door energy truth work discover few. After happen hotel continue poor product have.\nFederal accept age.	2023-08-14 05:34:34	2023-02-04 10:35:29
150	you	2023-05-13 11:38:14	2023-07-18 22:09:03	https://placekitten.com/557/425	44	Wife tonight despite possible summer. Edge blood allow kitchen. Food back place will allow my scientist.\nRisk cultural enjoy. Hot under need computer tough development.	2023-09-27 09:26:05	2023-10-08 19:55:55
151	management	2023-06-13 22:54:23	2023-02-06 21:29:18	https://picsum.photos/301/758	99	Several style some option. Organization word figure majority wind word.\nJob possible church large action environment. Add stay board view spring. Local data message play fall ground.	2023-09-30 11:03:19	2023-03-31 16:09:36
152	as	2023-07-24 07:41:34	2023-09-07 09:15:33	https://picsum.photos/70/709	68	What something at deep American.\nThat happy kind tree. Guess which within contain. Ball show also here message every.	2023-02-15 23:49:40	2023-06-20 05:17:22
153	apply	2023-10-22 13:12:27	2023-04-05 19:29:27	https://dummyimage.com/997x810	76	Key door chair human. Simply about the star position.\nResearch sort light out everybody price few. Operation by blue better practice short far. Participant stay reflect do information until spend.	2023-09-22 12:49:17	2023-03-30 23:02:18
154	force	2023-10-02 02:51:26	2023-07-31 02:05:07	https://placekitten.com/803/264	61	Budget check case much ground management action large. You pull cut.\nDecision item yeah three. Number between girl together. Measure western such black Mrs force.	2023-06-26 23:06:02	2023-03-24 10:55:07
155	artist	2023-08-26 22:04:41	2023-03-24 16:51:24	https://picsum.photos/568/280	36	Alone gas blood we you hit. Get lot toward always where.\nMeasure finally win behind. Pick light as idea want forward certainly card.	2023-10-28 02:41:40	2023-06-05 11:54:53
156	society	2023-01-10 15:59:46	2023-10-28 19:58:16	https://picsum.photos/431/563	1	Believe in work contain network difference certain sometimes. Friend issue evening choose sort best idea.\nFund impact book until prove fire. Side anyone within let phone born opportunity.	2023-08-12 16:40:58	2023-06-10 13:24:12
157	accept	2023-03-02 21:51:41	2023-04-04 05:22:33	https://dummyimage.com/1006x528	33	Choice huge TV from every exist. Billion coach win suddenly moment game window. Police budget behind.\nWonder per bar pressure rest. Standard their seat less much middle and.	2023-06-04 05:57:10	2023-04-28 11:50:34
158	late	2023-10-02 08:35:07	2023-01-20 13:22:47	https://picsum.photos/704/754	94	Cover by season professional. Everything resource green under style school common. Great miss partner despite forward.	2023-05-30 03:41:00	2023-03-17 12:39:08
159	population	2023-03-20 07:56:05	2023-07-07 11:39:57	https://dummyimage.com/536x826	57	Wind college money politics. Know language radio just phone.\nTen pull assume final. Easy talk computer measure student statement later. Key worker spend can write.	2023-01-08 09:08:25	2023-04-27 05:10:36
160	catch	2023-03-29 12:05:22	2023-07-07 15:18:40	https://picsum.photos/993/776	64	I cover executive amount both. Plan film some agent gas. None capital federal election cause popular top all.\nKind most morning agreement stock benefit physical. Member partner must land learn.	2023-08-03 17:59:05	2023-11-22 15:17:43
161	pay	2023-06-26 12:12:50	2023-05-13 02:30:40	https://picsum.photos/438/576	85	Base physical image nature type follow. Worker soon strategy.	2023-04-17 01:31:50	2023-11-16 09:50:51
162	hour	2023-05-18 03:10:55	2023-04-07 21:16:22	https://picsum.photos/717/1020	58	Usually series now government. Plan move within even. Approach bed loss someone.\nWater score should suffer baby claim. Reach such fund garden yourself simply. Wear art major Republican.	2023-07-18 09:04:57	2023-02-12 05:20:25
163	certainly	2023-02-17 17:42:24	2023-05-13 20:48:07	https://dummyimage.com/386x512	92	Reveal national right cell apply tonight where. Test exist idea happen production understand.\nCheck form response do enjoy analysis. Natural keep window tend fall.	2023-03-01 07:37:50	2023-11-16 07:59:52
164	training	2023-06-07 19:42:20	2023-05-23 11:48:00	https://placekitten.com/235/764	18	Sort old large mother. Glass so your participant recently.\nRecently lose activity young visit. Affect serious gas successful according. Remember action type Republican federal teach difference.	2023-07-09 22:25:46	2023-08-17 12:38:46
165	the	2023-01-10 11:25:04	2023-05-20 16:27:39	https://picsum.photos/575/178	6	Mother top choice morning maybe. Market less fund.\nServe none threat red run become. Way the interview adult century support member would. Too although expect management detail.	2023-09-25 00:06:06	2023-06-16 02:55:55
166	most	2023-08-17 23:26:53	2023-04-01 23:02:31	https://dummyimage.com/374x511	47	Point difficult action history region task upon customer. Right identify pick leg truth travel. Budget professional consider ten.	2023-02-22 01:42:03	2023-04-28 17:23:16
167	off	2023-04-21 14:50:01	2023-03-18 08:41:37	https://placekitten.com/689/785	55	Today structure store special lawyer. Travel skin read show then control.\nKnowledge hair after over choose. Republican letter we among we argue season case.\nWide ago ago price provide.	2023-09-20 14:45:52	2023-05-08 17:00:08
168	become	2023-04-28 03:44:56	2023-10-23 05:21:29	https://placekitten.com/654/621	100	Prepare important seven try fill. Perhaps time group share head. Discuss guess here stop page.	2023-02-06 20:00:30	2023-05-05 16:05:33
169	project	2023-01-25 14:43:10	2023-02-23 09:08:58	https://dummyimage.com/479x345	85	Leader score if attack teach push them college. Especially yard station whose. College visit fall behavior. Share property campaign cost.	2023-09-13 09:44:34	2023-05-27 03:03:51
170	establish	2023-10-19 13:11:00	2023-03-15 21:02:57	https://dummyimage.com/265x582	98	Story example tax up pick. These peace now popular professional student. Artist hotel court war make.	2023-01-21 19:24:03	2023-03-19 13:25:38
171	center	2023-04-26 03:25:14	2023-05-21 01:06:53	https://picsum.photos/33/143	39	Later heart peace TV their stay. Will back central positive my toward. Fund city anyone plant nothing building method.	2023-03-16 12:54:06	2023-08-17 01:15:23
172	beat	2023-04-25 04:58:00	2023-01-20 13:05:39	https://placekitten.com/768/592	88	Thank claim trade. Movement action offer sit unit open. Information national require local old huge culture. One line night particular product environmental.	2023-05-13 12:15:31	2023-05-26 22:39:00
173	keep	2023-06-06 11:45:13	2023-08-27 08:38:39	https://placekitten.com/31/420	69	Speak what million prove Democrat media glass. Spend role blue degree. Weight human administration financial.	2023-06-28 03:17:24	2023-07-19 22:04:27
174	ability	2023-05-27 00:18:15	2023-09-23 05:36:12	https://placekitten.com/12/352	3	Office unit hospital score. Race field consumer wind.\nAttention able avoid meet. Market Democrat wait conference. Reason table heart sister lot once total.	2023-09-07 08:15:50	2023-12-01 18:01:18
175	radio	2023-04-14 15:14:00	2023-04-09 14:42:15	https://dummyimage.com/308x230	24	Option south turn scene ok environment. Feel soon issue job. Air behavior pay. Per something bit pick stage summer owner.\nPractice someone day majority. Into first could without seat.	2023-11-04 14:10:24	2023-12-04 13:20:25
176	cover	2023-03-30 13:34:31	2023-04-18 17:19:22	https://dummyimage.com/735x139	37	Three method determine main response fast prepare artist. Page we range expect point. Research successful your price.	2023-08-08 11:45:44	2023-06-11 01:10:10
177	her	2023-01-01 21:20:37	2023-01-08 23:16:08	https://placekitten.com/941/912	95	Field it director name real teacher. Learn address scientist by goal. Street white center tell.	2023-07-04 17:36:25	2023-11-25 22:56:45
178	most	2023-05-12 22:18:48	2023-05-09 02:35:41	https://picsum.photos/805/309	20	Sister participant allow. Experience send ready TV beat red two local.	2023-04-27 16:19:34	2023-10-16 23:57:35
179	actually	2023-06-21 18:15:24	2023-04-16 19:15:25	https://dummyimage.com/475x648	20	Usually car another pick very sometimes. South break international money consumer be. Most campaign think lose box research forward. Father bill maybe candidate score open.	2023-04-25 18:37:19	2023-06-24 07:10:28
180	team	2023-06-23 23:27:07	2023-09-04 12:18:40	https://picsum.photos/139/712	8	Hand operation method in picture. Mean challenge local card report analysis. Fund away seven reflect according pretty manage.\nTv if without. Pretty piece he represent already.	2023-04-21 17:14:04	2023-09-29 04:01:27
181	maybe	2023-01-22 11:31:33	2023-07-03 14:09:44	https://picsum.photos/62/861	59	Of teacher down over film. Group not over clear spring. Leave country prove long reveal reduce.\nBe carry story pick. Nice gas capital business room service.	2023-04-18 10:45:48	2023-09-10 03:18:48
182	upon	2023-03-22 09:58:22	2023-04-14 04:33:30	https://picsum.photos/841/391	15	Watch inside good story save including. After effect hair arm out ten require.	2023-06-26 03:21:46	2023-02-27 20:49:08
183	imagine	2023-02-25 13:27:59	2023-10-08 21:59:10	https://placekitten.com/700/303	68	Son safe also peace doctor front inside. Bag especially return finally especially. Movie true still worker particularly.	2023-07-01 06:46:13	2023-05-21 09:12:36
184	across	2023-06-13 03:55:30	2023-07-20 15:54:27	https://placekitten.com/191/75	86	Above go decide look. Player how a audience pass project fly. Quite list trade.\nMemory according wonder require language.	2023-01-31 04:33:37	2023-11-23 14:39:23
185	hope	2023-07-05 09:37:01	2023-02-24 17:33:57	https://placekitten.com/947/931	23	After probably light. Respond impact better image southern knowledge him. Quickly president protect tonight.	2023-04-18 08:05:47	2023-08-03 13:56:24
186	simply	2023-03-11 11:03:12	2023-06-08 12:32:57	https://placekitten.com/202/697	33	Picture choice program difficult. Worry quality fill son maybe score billion five. Coach my already letter myself skill effort audience. Growth however Republican.	2023-01-21 16:05:42	2023-06-20 22:45:48
187	maybe	2023-09-01 17:48:29	2023-02-05 23:35:03	https://picsum.photos/1004/247	47	Out general management picture. Expect activity apply at lay center. Goal grow perhaps then organization include for.\nPosition gun free. Say save day kitchen education cultural. Other blue cell.	2023-01-30 01:25:30	2023-09-05 07:20:50
188	section	2023-01-10 04:40:51	2023-06-07 12:14:40	https://placekitten.com/615/95	39	Against little receive song by. Wife standard light discussion scene run see ball. Security your case customer question. Themselves story his list among unit stay.	2023-05-28 05:26:01	2023-08-02 16:39:44
189	modern	2023-03-07 14:29:28	2023-11-01 09:27:22	https://picsum.photos/628/286	71	Bank opportunity reach thing.\nDuring represent water quickly. Unit picture letter collection reduce defense.	2023-06-17 00:54:19	2023-03-21 18:34:44
190	information	2023-01-26 19:07:51	2023-01-07 23:53:26	https://dummyimage.com/770x565	2	Onto control simply bar along order. Also know walk book law. It down true.	2023-04-02 03:02:22	2023-11-13 05:50:01
191	cell	2023-02-12 07:26:34	2023-05-04 04:08:08	https://placekitten.com/350/977	12	Capital region range serious. Month subject cup throughout.\nHe response field far everyone hear. Something for civil only face bring. Production find behind.	2023-09-19 18:34:35	2023-08-09 01:24:11
192	nothing	2023-05-16 23:58:47	2023-07-31 01:34:53	https://picsum.photos/491/224	95	Office carry work.\nAudience seek ready nor star land interest. Speech to force. Range recent describe lose stay.	2023-01-05 19:07:44	2023-07-14 04:24:14
193	analysis	2023-09-06 04:10:08	2023-01-30 01:04:29	https://dummyimage.com/183x87	7	Pretty response home option first city. Feel evening draw tax. Sometimes charge during view.\nLay economy cold. Structure participant majority court while wonder. Space contain by difference.	2023-02-05 16:02:45	2023-06-03 05:19:54
194	seven	2023-08-23 12:38:03	2023-03-04 22:02:02	https://placekitten.com/361/520	12	Behavior child avoid admit foreign project.\nAlready include she. Board Congress director wall stay allow challenge. Mission end win hot politics.	2023-02-19 07:36:36	2023-08-24 23:39:21
195	week	2023-04-19 15:21:41	2023-09-14 17:32:17	https://picsum.photos/946/496	100	Yard because off quality campaign. Keep speak indicate meeting Mrs eight various price. Imagine political magazine house house director.	2023-02-16 06:02:39	2023-08-29 18:41:48
196	most	2023-01-12 22:46:22	2023-07-18 15:48:55	https://picsum.photos/382/154	72	Kitchen various character cover. Report avoid site economy along western power control.\nOk often policy along. Room build could she.	2023-03-28 08:23:52	2023-04-14 12:04:58
197	determine	2023-02-11 06:04:27	2023-09-01 21:51:06	https://placekitten.com/642/227	5	Court beat bring drop together rate shoulder. President model sea require fill positive fill apply. Mean sea old like.\nReligious me draw keep not miss firm society. Nice continue example cause.	2023-02-18 01:52:27	2023-06-02 22:09:39
198	seven	2023-07-20 04:54:00	2023-10-19 05:57:07	https://dummyimage.com/94x85	47	They bag painting instead end heavy money. Like threat left stuff use set. Town material others down do author miss.	2023-08-06 08:34:04	2023-06-26 06:05:09
199	suffer	2023-04-15 07:06:31	2023-05-12 18:01:19	https://picsum.photos/507/913	28	Suffer among follow entire capital must. Challenge week under require general.\nTwo light whether TV score car nor. Try defense write instead.	2023-06-25 15:35:01	2023-04-26 19:25:34
200	player	2023-07-17 09:11:36	2023-07-05 10:26:04	https://picsum.photos/952/71	46	Front begin would condition detail. Prevent left table interest method.\nReduce radio lose thousand song.\nUnderstand nice wrong difference behavior. Decade after relationship study support someone.	2023-01-16 20:52:03	2023-09-18 12:07:51
201	step	2023-07-06 00:02:16	2023-08-15 20:20:16	https://dummyimage.com/784x418	67	Peace street pattern history movie avoid development. Stay between all response. Since security guy thing establish cause. Appear should six seat class choose where any.	2023-06-03 08:19:51	2023-04-18 05:10:42
202	morning	2023-08-18 10:08:31	2023-08-08 01:04:28	https://picsum.photos/159/274	2	Reality put people listen college must concern. Picture institution watch upon agent. Wife strategy style few determine behavior.	2023-09-17 01:59:10	2023-03-27 01:02:42
203	camera	2023-03-24 01:14:03	2023-04-02 13:40:44	https://placekitten.com/729/554	17	Perhaps season hold today company.\nDecide art ago sure leader red. Fly close wife defense soldier yes mission. Task in bit song attack director.	2023-04-13 01:32:20	2023-08-12 22:37:13
204	public	2023-09-23 21:35:28	2023-06-01 06:11:46	https://dummyimage.com/497x360	92	Since live experience ever billion story. Final increase nice mission. Detail side physical race responsibility seven anything ahead.	2023-01-06 04:02:59	2023-08-06 13:22:20
205	since	2023-03-22 04:07:21	2023-08-26 20:55:21	https://placekitten.com/553/438	56	Be PM draw recent stock. Wish fall head day involve view child family. Entire parent project. Easy skill soon movement near address rate sometimes.	2023-08-24 16:42:31	2023-09-08 11:33:20
206	series	2023-11-04 20:22:58	2023-05-16 19:33:57	https://picsum.photos/870/516	77	Cost power ready brother either voice box president. How recognize offer book. Truth under majority manage sister.\nRed three husband course decide any. Unit official section just free.	2023-10-22 07:10:40	2023-08-15 22:58:31
207	baby	2023-09-22 04:14:49	2023-04-22 09:07:10	https://placekitten.com/804/406	53	Official security major in. Face test shoulder. Themselves politics population rule.	2023-10-31 15:22:58	2023-04-22 14:34:35
208	else	2023-02-13 17:06:55	2023-10-09 07:25:00	https://placekitten.com/800/211	19	Tv tonight establish accept professional. Least majority price decision position stage. Other keep may just leave in.	2023-09-18 10:47:46	2023-02-14 01:13:42
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
17b5c32e-497a-488c-8fb4-6e524e91fe8d	e3cfa97ee5f02297fe674b89967403f932de63c55298d8a62bd1a4ce5ed59093	2023-11-04 23:31:20.949531+07	20231104163120_	\N	\N	2023-11-04 23:31:20.922201+07	1
\.


--
-- Name: Artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Artist_id_seq"', 209, true);


--
-- Name: Artist Artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Artist"
    ADD CONSTRAINT "Artist_pkey" PRIMARY KEY (id);


--
-- Name: LikeTo LikeTo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LikeTo"
    ADD CONSTRAINT "LikeTo_pkey" PRIMARY KEY ("idUser", "idArtist");


--
-- Name: ListenTo ListenTo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ListenTo"
    ADD CONSTRAINT "ListenTo_pkey" PRIMARY KEY ("idArtist");


--
-- Name: Poster Poster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Poster"
    ADD CONSTRAINT "Poster_pkey" PRIMARY KEY ("idArtist");


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Artist_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Artist_email_key" ON public."Artist" USING btree (email);


--
-- Name: LikeTo LikeTo_idArtist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LikeTo"
    ADD CONSTRAINT "LikeTo_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES public."Artist"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ListenTo ListenTo_idArtist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ListenTo"
    ADD CONSTRAINT "ListenTo_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES public."Artist"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Poster Poster_idArtist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Poster"
    ADD CONSTRAINT "Poster_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES public."Artist"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

