--
-- PostgreSQL database dump
--

-- Dumped from database version 13.14 (Raspbian 13.14-0+deb11u1)
-- Dumped by pg_dump version 13.14 (Raspbian 13.14-0+deb11u1)

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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    name character varying(80) NOT NULL,
    category_order integer NOT NULL,
    fully_studied boolean,
    id integer NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson (
    id integer NOT NULL,
    person character varying(8) NOT NULL,
    lesson_date date NOT NULL,
    notes character varying(1000) NOT NULL,
    lesson_title character varying(264)
);


ALTER TABLE public.lesson OWNER TO postgres;

--
-- Name: lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lesson_id_seq OWNER TO postgres;

--
-- Name: lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_id_seq OWNED BY public.lesson.id;


--
-- Name: vocabulary; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.vocabulary (
    dutch text,
    english text,
    notes text,
    pronunciationlink text,
    seen boolean DEFAULT false,
    mastered boolean DEFAULT false,
    id integer NOT NULL,
    set_name character varying(80),
    created_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    de_het character varying(3)
);


ALTER TABLE public.vocabulary OWNER TO pi;

--
-- Name: vocabulary_id_seq; Type: SEQUENCE; Schema: public; Owner: pi
--

CREATE SEQUENCE public.vocabulary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vocabulary_id_seq OWNER TO pi;

--
-- Name: vocabulary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi
--

ALTER SEQUENCE public.vocabulary_id_seq OWNED BY public.vocabulary.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: lesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson ALTER COLUMN id SET DEFAULT nextval('public.lesson_id_seq'::regclass);


--
-- Name: vocabulary id; Type: DEFAULT; Schema: public; Owner: pi
--

ALTER TABLE ONLY public.vocabulary ALTER COLUMN id SET DEFAULT nextval('public.vocabulary_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (name, category_order, fully_studied, id) FROM stdin;
traffic/buildings	6	f	5
numbers/counting	7	f	6
common verbs (1)	8	f	7
common adjectives (1)	9	f	8
weekdays/months/seasons	10	f	9
prepositions	11	f	10
hobbies	12	f	11
Amsterdam	13	f	12
household	14	f	13
body	15	f	14
clothes	16	f	15
common verbs (2)	17	f	16
job hunting/business	18	f	17
family	19	f	18
animals (1)	20	f	19
football	21	f	20
common verbs (3)	22	f	21
weather	23	f	22
common adjectives (2)	24	f	23
doctor	25	f	24
geography	26	f	25
moving/immigration	27	f	26
moods/emotions	28	f	27
cooking	29	f	28
fruits/veggies	30	f	29
common verbs (4)	31	f	30
tools/materials	32	f	31
adverbs	33	f	32
colors/shapes	34	f	33
common adjectives (3)	35	f	34
celebrations/holidays	36	f	35
animals (2)	37	f	36
common adjectives (4)	38	f	37
misc. words (1)	39	f	38
misc. words (2)	40	f	39
dutch symbols	41	f	40
grammar	42	f	41
nature	43	f	42
time	44	f	43
introductory	1	t	44
UvA A2 Course	45	f	45
pronouns/thanking	2	t	1
food/drink	4	t	3
professions	3	t	2
question words	5	t	4
\.


--
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson (id, person, lesson_date, notes, lesson_title) FROM stdin;
2	rachel	2022-11-22	rachel nov 22 notes	\N
3	john	2022-11-16	small words notes	Small Words/Concepts Review
1	john	2022-11-24	Testing\nTesting\nTesting\nTesting Testing2\\n\nTesting	Pub Quiz
4	john	2022-11-09	<p class="c4"><span class="c3">Test Sheet</span></p><ul class="c0 lst-kix_wy5eji99qfml-0 start"><li class="c4 c5 li-bullet-0"><span class="c2">Testing</span></li><li class="c4 c5 li-bullet-0"><span class="c2">Testing2</span></li></ul><p class="c1"><span class="c2"></span></p><p class="c1"><span class="c6"></span></p><ul class="c0 lst-kix_vsky5at4erd8-0 start"><li class="c4 c5 li-bullet-0"><span class="c8">Testing 3</span></li></ul>	\N
\.


--
-- Data for Name: vocabulary; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.vocabulary (dutch, english, notes, pronunciationlink, seen, mastered, id, set_name, created_date, de_het) FROM stdin;
bang	afraid	\N	https://forvo.com/word/bang/#nl	f	t	1804	moods/emotions	2023-09-27 14:59:57.873874+01	\N
vroeg	early	\N	https://forvo.com/word/vroeg/#nl	t	f	1692	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
welke dag (van de week)?	which day of the week	\N	#	f	t	1303	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
de kampioen	the champion	\N	https://forvo.com/word/kampioen/#nl	t	f	1624	football	2023-09-27 14:59:57.873874+01	\N
rit	ride	n/a	https://forvo.com/word/rit/#nl	t	f	508	\N	2023-09-27 14:59:57.873874+01	\N
jullie	you (all)	\N	https://forvo.com/word/jullie/#nl	f	t	1125	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
ontwikkelen	to develop	\N	https://forvo.com/word/ontwikkelen/#nl	t	f	1894	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
januari	January	\N	https://forvo.com/word/januari/#nl	f	t	1313	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
bodem	soil	n/a	https://forvo.com/word/bodem/#nl	t	f	739	nature	2023-09-27 14:59:57.873874+01	\N
serveren	to serve	verb	https://forvo.com/word/serveren/#nl	t	f	1005	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
de buren	the neighbours	\N	https://forvo.com/word/buren/#nl	t	f	1777	moving/immigration	2023-09-27 14:59:57.873874+01	\N
de politieman/de agent	the police officer	\N	https://forvo.com/word/politieman/#nl	t	f	1141	professions	2023-09-27 14:59:57.873874+01	\N
vies	dirty, disgusting	\N	https://forvo.com/word/vies/#nl	f	t	1277	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
hij	he	\N	https://forvo.com/word/hij/#nl	f	t	1120	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
de voetballer	the football player	\N	https://forvo.com/word/voetballer/#nl	f	t	1129	professions	2023-09-27 14:59:57.873874+01	\N
dik	thick, fat	\N	https://forvo.com/word/dik/#nl	f	f	1985	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
set	set	n/a	https://forvo.com/word/set/#nl	f	t	53	\N	2023-09-27 14:59:57.873874+01	\N
de trein	the train	\N	https://forvo.com/word/trein/#nl	f	f	1202	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
het politiebureau	the police station	\N	https://forvo.com/word/politiebureau/#nl	f	t	1218	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de provincie	the province	\N	https://forvo.com/word/provincie/#nl	f	f	1741	geography	2023-09-27 14:59:57.873874+01	\N
welkom	welcome	\N	https://forvo.com/word/welkom/#nl	f	t	2108	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
het concert	the concert	\N	https://forvo.com/word/concert/#nl	f	f	1392	Amsterdam	2023-09-27 14:59:57.873874+01	\N
het schaap	the sheep	\N	https://forvo.com/word/schaap/#nl	f	f	2031	animals (1)	2023-09-27 14:59:57.873874+01	\N
noord	north	\N	https://forvo.com/word/noord/#nl	f	f	2076	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
hoed	hat	n/a	https://forvo.com/word/hoed/#nl	f	f	954	\N	2023-09-27 14:59:57.873874+01	\N
exacte	exact	n/a	https://forvo.com/word/exacte/#nl	f	t	608	\N	2023-09-27 14:59:57.873874+01	\N
naast	next to	\N	https://forvo.com/word/naast/#nl	f	f	1335	prepositions	2023-09-27 14:59:57.873874+01	\N
de boom	the tree	\N	https://forvo.com/word/boom/#nl	f	f	2111	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
het park	the park	\N	https://forvo.com/word/park/#nl	f	f	1405	Amsterdam	2023-09-27 14:59:57.873874+01	\N
rood	red	\N	https://forvo.com/word/rood/#nl	f	f	1968	colors/shapes	2023-09-27 14:59:57.873874+01	\N
heel	whole, very, quite	\N	https://forvo.com/word/heel/#nl	f	f	1695	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
soldaat	soldier	n/a	https://forvo.com/word/soldaat/#nl	f	t	759	\N	2023-09-27 14:59:57.873874+01	\N
de oliebol	Dutch fritter with raisins	\N	https://forvo.com/word/oliebol/#nl	f	t	2009	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
werelddeel	continent	n/a	https://forvo.com/word/werelddeel/#nl	t	f	1001	geography	2023-09-27 14:59:57.873874+01	\N
de koelkast	the fridge	\N	https://forvo.com/word/koelkast/#nl	f	t	1419	household	2023-09-27 14:59:57.873874+01	\N
overschakelen	to switch over		https://forvo.com/word/overschakelen/#nl	f	f	2209		2023-09-27 14:59:57.873874+01	\N
best	best	\N	https://forvo.com/word/best/#nl	f	t	1688	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
nul	zero	\N	https://forvo.com/word/nul/#nl	f	t	1222	numbers/counting	2023-09-27 14:59:57.873874+01	\N
ronde	round	n/a	https://forvo.com/word/ronde/#nl	f	t	116	\N	2023-09-27 14:59:57.873874+01	\N
zeggen	to say	\N	https://forvo.com/word/zeggen/#nl	f	t	1270	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
zes	six	\N	https://forvo.com/word/zes/#nl	f	t	1228	numbers/counting	2023-09-27 14:59:57.873874+01	\N
genoeg	enough	\N	https://forvo.com/word/genoeg/#nl	f	t	1954	adverbs	2023-09-27 14:59:57.873874+01	\N
de sok	the sock (short)	\N	https://forvo.com/word/sok/#nl	f	t	1469	clothes	2023-09-27 14:59:57.873874+01	\N
de borst	the chest, the breast	\N	https://forvo.com/word/borst/#nl	f	t	1456	body	2023-09-27 14:59:57.873874+01	\N
de coffeeshop	bar where soft drugs is sold	\N	https://forvo.com/word/coffeeshop/#nl	f	t	1400	Amsterdam	2023-09-27 14:59:57.873874+01	\N
in orde	fine / alright	"ben je in orde?"		f	f	2266	phrase	2023-11-30 15:13:14.177227+00	\N
het einde	the end	\N	https://forvo.com/word/einde/#nl	f	t	2092	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
het europees kampioenschap (ek)	the european championship	\N	#	t	f	1626	football	2023-09-27 14:59:57.873874+01	\N
het uur	the hour		https://forvo.com/word/uur/#nl	f	t	1050	time	2023-09-27 14:59:57.873874+01	\N
serieus	serious	\N	https://forvo.com/word/serieus/#nl	f	t	1819	moods/emotions	2023-09-27 14:59:57.873874+01	\N
het water	the water	\N	https://forvo.com/word/water/#nl	f	t	1163	food/drink	2023-09-27 14:59:57.873874+01	\N
droog	dry	\N	https://forvo.com/word/droog/#nl	f	t	2056	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
papier	paper	n/a	https://forvo.com/word/papier/#nl	f	t	286	tools/materials	2023-09-27 14:59:57.873874+01	\N
slim	clever	\N	https://forvo.com/word/slim/#nl	f	t	2061	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
schoon	clean	\N	https://forvo.com/word/schoon/#nl	f	t	1278	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
de	the	\N	https://forvo.com/word/de/#nl	f	t	1082	introductory	2023-09-27 14:59:57.873874+01	\N
snel	fast/quick	\N	https://forvo.com/word/snel/#nl	f	t	1291	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
snelheid	speed	n/a	https://forvo.com/word/snelheid/#nl	f	t	672	\N	2023-09-27 14:59:57.873874+01	\N
het concertgebouw	the Concertgebouw	\N	https://forvo.com/word/concertgebouw/#nl	f	t	1394	Amsterdam	2023-09-27 14:59:57.873874+01	\N
toevoegen	add	n/a	https://forvo.com/word/toevoegen/#nl	f	t	69	\N	2023-09-27 14:59:57.873874+01	\N
zijn	his/are/be	\N	https://forvo.com/word/zijn/#nl	f	t	2116	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
de hagelslag	the chocolate sprinkles	\N	https://forvo.com/word/hagelslag/#nl	f	t	1154	food/drink	2023-09-27 14:59:57.873874+01	\N
week	week	\N	https://forvo.com/word/week/#nl	f	t	1301	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
(het)zelfde	same	\N	https://forvo.com/word/zelfde/#nl	t	t	1993	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
de worst	the sausage	\N	https://forvo.com/word/worst/#nl	f	t	1856	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
het gras	the grass	\N	https://forvo.com/word/gras/#nl	f	t	2110	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
spoed	urgent	\N	https://forvo.com/word/spoed/#nl	t	t	1728	doctor	2023-09-27 14:59:57.873874+01	\N
douchen	to share	n/a	https://forvo.com/word/douchen/#nl	f	f	2155	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
stofzuigen	to vacuum	n/a	https://forvo.com/word/stofzuigen/#nl	f	f	2156	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
spons	sponge	n/a	https://forvo.com/word/spons/#nl	f	f	2157	household	2023-09-27 14:59:57.873874+01	\N
nerveus	anxious	n/a	https://forvo.com/word/nerveus/#nl	f	f	2158	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
vliegtuig	plane	n/a	https://forvo.com/word/vliegtuig/#nl	f	f	376	moving/immigration	2023-09-27 14:59:57.873874+01	\N
diep	deep	n/a	https://forvo.com/word/diep/#nl	f	f	2159	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
wachtkamer	waiting room	n/a	https://forvo.com/word/wachtkamer/#nl	f	f	2160	doctor	2023-09-27 14:59:57.873874+01	\N
duizend	thousand	\N	https://forvo.com/word/duizend/#nl	f	f	1245	numbers/counting	2023-09-27 14:59:57.873874+01	\N
april	April	\N	https://forvo.com/word/april/#nl	f	f	1316	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
tapijt	carpet	n/a	https://forvo.com/word/tapijt/#nl	f	f	2162	household	2023-09-27 14:59:57.873874+01	\N
vuil	dirty	n/a	https://forvo.com/word/vuil/#nl	f	f	2163	household	2023-09-27 14:59:57.873874+01	\N
kok	cook	n/a	https://forvo.com/word/kok/#nl	f	f	720	cooking	2023-09-27 14:59:57.873874+01	\N
meer	more/lake	n/a	https://forvo.com/word/meer/#nl	f	f	1963	adverbs	2023-09-27 14:59:57.873874+01	\N
grillen	to grill	n/a	https://forvo.com/word/grillen/#nl	f	f	2165	cooking	2023-09-27 14:59:57.873874+01	\N
enkel	ankle	n/a	https://forvo.com/word/enkel/#nl	f	f	2167	body	2023-09-27 14:59:57.873874+01	\N
haan	rooster	n/a	https://forvo.com/word/haan/#nl	f	f	2168	animals (2)	2023-09-27 14:59:57.873874+01	\N
afstandsbediening	remote control	n/a	https://forvo.com/word/afstandsbediening/#nl	f	f	2169	household	2023-09-27 14:59:57.873874+01	\N
benzene	gas/petrol	n/a	https://forvo.com/word/benzene/#nl	t	t	2164	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
zien	to see	\N	https://forvo.com/word/zien/#nl	t	t	1261	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
baden	to bathe	n/a	https://forvo.com/word/baden/#nl	f	t	2161	household	2023-09-27 14:59:57.873874+01	\N
zich	them/her/his/itself	reflexive pronoun	https://forvo.com/word/zich/	f	f	2210		2023-09-27 14:59:57.873874+01	\N
bekend	famous		#	f	f	2267		2023-11-30 15:14:17.709082+00	\N
beloven	to promise	UvA A2 Course		f	f	2270	UvA A2 Course	2024-03-11 17:23:54.567243+00	\N
voetpad	sidewalk	n/a	https://forvo.com/word/voetpad/#nl	f	t	2166	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
hoog	high, tall	\N	https://forvo.com/word/hoog/#nl	f	t	1298	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
deur	door	n/a	https://forvo.com/word/deur/#nl	t	f	325	household	2023-09-27 14:59:57.873874+01	\N
toch	(loosely) though/anyway/afterall		https://forvo.com/word/toch/	f	f	2211		2023-09-27 14:59:57.873874+01	\N
scheidbaar werkwoord	separable verb		#	f	f	2268	grammar	2023-11-30 15:15:12.089177+00	\N
afspreken	to meet/schedule		#	f	f	2269		2023-11-30 15:15:41.47022+00	\N
de ring	the ring, the ring road	\N	https://forvo.com/word/ring/#nl	f	t	1399	Amsterdam	2023-09-27 14:59:57.873874+01	\N
de huisarts	the general practitioner	\N	https://forvo.com/word/huisarts/#nl	t	t	1723	doctor	2023-09-27 14:59:57.873874+01	\N
stel	imagine/propose/suggest	n/a	https://forvo.com/word/stel/#nl	f	f	795	\N	2023-09-27 14:59:57.873874+01	\N
openbaar	public	UvA A2 Course		f	f	2272	UvA A2 Course	2024-03-11 17:25:36.883822+00	\N
vervoer	transport	UvA A2 Course		f	f	2273	UvA A2 Course	2024-03-11 17:25:59.699391+00	\N
nogal	rather/quite	UvA A2 Course		f	f	2275	UvA A2 Course	2024-03-11 17:26:48.545675+00	\N
afvallen	to lose weight	UvA A2 Course		f	f	2276	UvA A2 Course	2024-03-11 17:27:13.110626+00	\N
gewicht verliezen	to lose weight (weight loss)	UvA A2 Course		f	f	2277	UvA A2 Course	2024-03-11 17:27:41.415102+00	\N
opgetreden	occurred	UvA A2 Course		f	f	2278	UvA A2 Course	2024-03-11 17:28:10.560948+00	\N
voorstel	to propose, introduce	UvA A2 Course		f	f	2271	UvA A2 Course	2024-03-11 17:25:11.838923+00	\N
ervaren	experienced / to experience	UvA A2 Course also		f	f	2274	UvA B1A Course CH4	2024-03-11 17:26:25.632092+00	\N
zal niet	won’t	n/a	#	f	t	753	\N	2023-09-27 14:59:57.873874+01	\N
vervolgens	next/then/subsequently		https://forvo.com/word/vervolgens/	f	f	2212		2023-09-27 14:59:57.873874+01	\N
de komkommer	the cucumber	\N	https://forvo.com/word/komkommer/#nl	t	t	1859	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
beterschap	get better	UvA A2 Course		f	f	2279	UvA A2 Course	2024-03-11 17:28:45.023393+00	\N
groeien	to grow	\N	https://forvo.com/word/groeien/#nl	f	f	1649	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
regenachtig	rainy	UvA A2 Course		f	f	2280	UvA A2 Course	2024-03-11 17:29:04.998362+00	\N
zich inschrijven	to enroll	UvA A2 Course		f	f	2281	UvA A2 Course	2024-03-11 17:29:34.97065+00	\N
het bedrag	the amount	UvA A2 Course		f	f	2283	UvA A2 Course	2024-03-11 17:30:13.959401+00	\N
onbeperkt	unlimited	UvA A2 Course		f	f	2284	UvA A2 Course	2024-03-11 17:30:29.8609+00	\N
de aanbieding	the offer	UvA A2 Course		f	f	2285	UvA A2 Course	2024-03-11 17:30:56.471355+00	\N
verbeteren	to improve	UvA A2 Course		f	f	2286	UvA A2 Course	2024-03-11 17:31:46.301505+00	\N
de spieren	the muscles	UvA A2 Course		f	f	2287	UvA A2 Course	2024-03-11 17:32:04.131032+00	\N
versterken	to strengthen	UvA A2 Course		f	f	2288	UvA A2 Course	2024-03-11 17:32:19.82872+00	\N
verliezen	to lose	UvA A2 Course	https://forvo.com/word/verliezen/#nl	f	f	1510	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
van plan zijn	to intend to	UvA A2 Course		f	f	2289	UvA A2 Course	2024-03-11 17:33:03.229932+00	\N
derde	third	n/a	https://forvo.com/word/derde/#nl	f	t	715	numbers/counting	2023-09-27 14:59:57.873874+01	\N
coat	coat	n/a	https://forvo.com/word/coat/#nl	f	t	932	clothes	2023-09-27 14:59:57.873874+01	\N
hield	held	UvA A2 Course		f	f	2375		2024-03-28 18:35:40.947187+00	\N
geschreven	written	n/a	https://forvo.com/word/geschreven/#nl	f	t	574	\N	2023-09-27 14:59:57.873874+01	\N
de pyjama	the pyjamas	\N	https://forvo.com/word/pyjama/#nl	f	t	1482	clothes	2023-09-27 14:59:57.873874+01	\N
een hekel hebben aan	cannot stand/to dislike or hate		#	f	f	2380	UvA B1A Course CH1	2024-06-28 20:21:09.472412+01	\N
benieuwd naar	curious about		#	f	f	2381	UvA B1A Course CH1	2024-06-28 20:21:31.024812+01	\N
sturen naar / aan	to send to		#	f	f	2382	UvA B1A Course CH1	2024-06-28 20:21:55.1321+01	\N
onderzoek doen naar	to do research on		#	f	f	2383	UvA B1A Course CH1	2024-06-28 20:22:25.165857+01	\N
zich ergeren aan	to get annoyed by		#	f	f	2384	UvA B1A Course CH1	2024-06-28 20:22:42.689318+01	\N
stilstaan bij	to stop to think about/stand still		#	f	f	2385	UvA B1A Course CH1	2024-06-28 20:23:03.959078+01	\N
meekrijgen	to be given (as a gift)		#	f	f	2386	UvA B1A Course CH1	2024-06-28 20:23:24.046777+01	\N
verwerking in	to showcase in/to process or use in		#	f	f	2387	UvA B1A Course CH1	2024-06-28 20:23:41.253588+01	\N
verwarren	to confuse	verb	#	f	f	2388	UvA B1A Course CH1	2024-06-28 20:24:04.935732+01	\N
draaien om	to revolve around			f	f	2477	UvA B1A Course CH2	2024-07-12 20:41:38.208033+01	\N
de band	tire, band, connection	UvA A2 Course	https://forvo.com/word/band/#nl	f	t	393	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
plaatsvinden	to take place			f	f	2478	UvA B1A Course CH2	2024-07-12 20:42:37.579034+01	\N
het kwade	the bad			f	f	2479	UvA B1A Course CH3	2024-07-12 20:42:57.261673+01	\N
overwinnen	to overcome/triumph			f	f	2480	UvA B1A Course CH3	2024-07-12 20:43:17.183091+01	\N
afsteken	to let off			f	f	2481	UvA B1A Course CH3	2024-07-12 20:43:31.168096+01	\N
opzeggen	to cancel, to read out/recite	UvA A2 Course		f	f	2282	UvA A2 Course	2024-03-11 17:29:51.808477+00	\N
trekken door	to push/travel			f	f	2519	UvA B1A Course CH4	2024-07-13 12:09:32.346826+01	\N
beleven	to experience			f	f	2520	UvA B1A Course CH4	2024-07-13 13:31:18.116998+01	\N
aanspreken	to appeal			f	f	2521	UvA B1A Course CH4	2024-07-13 13:31:30.306859+01	\N
vanzelfsprekend	obvious			f	f	2522	UvA B1A Course CH4	2024-07-13 13:32:32.242257+01	\N
ontbreken (aan)	to miss/lack			f	f	2523	UvA B1A Course CH4	2024-07-13 13:32:46.733187+01	\N
fijne	fine	n/a	https://forvo.com/word/fijne/#nl	t	f	405	\N	2023-09-27 14:59:57.873874+01	\N
roeren	to stir		https://forvo.com/word/roeren/	f	f	2213		2023-09-27 14:59:57.873874+01	\N
kwalijk	malicious/ill/evil		https://forvo.com/word/kwalijk/	f	f	2214		2023-09-27 14:59:57.873874+01	\N
ontzettend	very/extremely/incredibly		https://forvo.com/word/ontzettend/	f	f	2215		2023-09-27 14:59:57.873874+01	\N
aantrekkelijk	attractive	UvA A2 Course		f	f	2290	UvA A2 Course	2024-03-11 17:33:33.379299+00	\N
krachttraining	weight training	UvA A2 Course		f	f	2291	UvA A2 Course	2024-03-11 17:33:49.245863+00	\N
de manier	the way/manner/method	UvA A2 Course	https://forvo.com/word/manier/#nl	f	f	158	\N	2023-09-27 14:59:57.873874+01	\N
tussen	between	\N	https://forvo.com/word/tussen/#nl	f	t	1340	prepositions	2023-09-27 14:59:57.873874+01	\N
medereizegers	fellow travelers	UvA A2 Course		f	f	2376		2024-03-28 18:36:29.945721+00	\N
spontaan	spontaneous	UvA A2 Course		f	f	2377		2024-03-28 18:36:54.980229+00	\N
tekenen	to draw	verb		f	f	2389	UvA B1A Course CH1	2024-06-28 20:25:07.031363+01	\N
schilderen	to paint	verb		f	f	2390	UvA B1A Course CH1	2024-06-28 20:25:53.112944+01	\N
schreeuwen	to shout	verb		f	f	2391	UvA B1A Course CH1	2024-06-28 20:26:12.177109+01	\N
fluisteren	to whisper	verb		f	f	2392	UvA B1A Course CH1	2024-06-28 20:26:25.506038+01	\N
uitkomen	to come true/to reveal or end up at	verb		f	f	2393	UvA B1A Course CH1	2024-06-28 20:27:47.257397+01	\N
bewaren	to keep	verb		f	f	2394	UvA B1A Course CH1	2024-06-28 20:28:00.965358+01	\N
afsteken	to let off			f	f	2482	UvA B1A Course CH3	2024-07-12 20:43:46.445426+01	\N
versieren	to decorate			f	f	2483	UvA B1A Course CH3	2024-07-12 20:43:59.419321+01	\N
de stoep	the pavement			f	f	2484	UvA B1A Course CH3	2024-07-12 20:44:17.73237+01	\N
het optreden	the performance			f	f	2485	UvA B1A Course CH3	2024-07-12 20:45:06.135186+01	\N
markeren	to mark			f	f	2486	UvA B1A Course CH3	2024-07-12 20:45:33.738854+01	\N
de overvloed	the abundance			f	f	2487	UvA B1A Course CH3	2024-07-12 20:45:46.571148+01	\N
de gelegenheid	the opportunity			f	f	2488	UvA B1A Course CH3	2024-07-12 20:46:02.265197+01	\N
de bloemenkrans	flower garland			f	f	2489	UvA B1A Course CH3	2024-07-12 20:46:20.958177+01	\N
de meiboom	the may pole			f	f	2490	UvA B1A Course CH3	2024-07-12 20:46:32.132624+01	\N
knapperig	crunchy			f	f	2491	UvA B1A Course CH3	2024-07-12 20:46:44.370856+01	\N
plaatselijk	local			f	f	2492	UvA B1A Course CH3	2024-07-12 20:46:56.620641+01	\N
pekelen	to pickle			f	f	2493	UvA B1A Course CH3	2024-07-12 20:47:08.718338+01	\N
terechtkunnen	to stay at			f	f	2494	UvA B1A Course CH3	2024-07-12 20:47:33.853679+01	\N
met z'n dertigen	with 30 of us	phrase		f	f	2495	UvA B1A Course CH3	2024-07-12 20:47:51.364023+01	\N
allerleukste	the best thing/nicest/best			f	f	2496	UvA B1A Course CH3	2024-07-12 20:48:09.719315+01	\N
het beginsel	the principle (value)			f	f	2497	UvA B1A Course CH3	2024-07-12 20:48:47.283653+01	\N
de kom	the bowl			f	f	2498	UvA B1A Course CH3	2024-07-12 20:49:00.429274+01	\N
verven	to paint			f	f	2499	UvA B1A Course CH3	2024-07-12 20:49:11.101987+01	\N
uitkijken naar	to look forward to			f	f	2500	UvA B1A Course CH3	2024-07-12 20:49:25.893841+01	\N
voornamelijk	mainly			f	f	2501	UvA B1A Course CH3	2024-07-12 20:50:22.860174+01	\N
het familielied	the family relative			f	f	2502	UvA B1A Course CH3	2024-07-12 20:50:41.039305+01	\N
de bedrijfskunde	business administration			f	f	2503	UvA B1A Course CH3	2024-07-12 20:50:58.943001+01	\N
uitschelden	to call names/scold/tell off			f	f	2504	UvA B1A Course CH3	2024-07-12 20:51:20.558824+01	\N
verplichten	to oblige			f	f	2505	UvA B1A Course CH3	2024-07-12 20:51:31.665221+01	\N
doorbrengen	to spend (time)			f	f	2506	UvA B1A Course CH3	2024-07-12 20:51:45.924677+01	\N
uitgebreid	elaborate/extensive			f	f	2507	UvA B1A Course CH3	2024-07-12 20:52:07.932535+01	\N
ervan	of it/them			f	f	2508	UvA B1A Course CH3	2024-07-12 20:52:49.386857+01	\N
voortkomen uit	to originate from			f	f	2509	UvA B1A Course CH3	2024-07-12 20:53:03.083309+01	\N
waarin	in which			f	f	2510	UvA B1A Course CH3	2024-07-12 20:53:16.429513+01	\N
het voorhoofd	the forehead			f	f	2511	UvA B1A Course CH3	2024-07-12 20:53:48.507481+01	\N
rijgen	to thread			f	f	2512	UvA B1A Course CH3	2024-07-12 20:54:17.310511+01	\N
de bestemming	destination			f	f	2524	UvA B1A Course CH4	2024-07-13 14:19:32.520954+01	\N
zwerven	to wander			f	f	2525	UvA B1A Course CH4	2024-07-13 14:19:56.260736+01	\N
zelden	rarely			f	f	2526	UvA B1A Course CH4	2024-07-13 14:20:11.83628+01	\N
zeer	ache (noun), very (adv.), painful (adj.)	\N	https://forvo.com/word/zeer/#nl	f	f	1721	doctor	2023-09-27 14:59:57.873874+01	\N
regelmatig	regular/ly	UvA A2 Course		f	f	2292	UvA A2 Course	2024-03-11 17:35:48.652975+00	\N
wat stom	how stupid	UvA A2 Course		f	f	2378		2024-03-28 18:45:37.174899+00	\N
ernstig	seriously			f	f	2395	UvA B1A Course CH1	2024-06-28 20:30:33.116476+01	\N
vrolijk	cheerful/happy			f	f	2396	UvA B1A Course CH1	2024-06-28 20:30:57.214514+01	\N
vooral	especially			f	f	2397	UvA B1A Course CH1	2024-06-28 20:31:42.405575+01	\N
zelfs	even	adverb	https://forvo.com/word/zelfs/#nl	f	f	2398	UvA B1A Course CH1	2024-06-28 20:32:18.327721+01	\N
bescheiden	modest			f	f	2399	UvA B1A Course CH1	2024-06-28 20:32:30.733975+01	\N
voorlopig	for now			f	f	2400	UvA B1A Course CH1	2024-06-28 20:33:21.180692+01	\N
dierbaar	beloved (items), (items) held dear			f	f	2401	UvA B1A Course CH1	2024-06-28 20:33:40.15198+01	\N
dierbaar	beloved (items), (items) held dear			f	f	2402	UvA B1A Course CH1	2024-06-28 20:33:55.968961+01	\N
daarvan	of this			f	f	2403	UvA B1A Course CH1	2024-06-28 20:34:09.547508+01	\N
beleefd	polite			f	f	2404	UvA B1A Course CH1	2024-06-28 20:34:24.501641+01	\N
merken van	as you can see/to notice			f	f	2405	UvA B1A Course CH1	2024-06-28 20:34:45.068652+01	\N
trots op	proud of			f	f	2406	UvA B1A Course CH1	2024-06-28 20:34:57.570755+01	\N
zorgen voor	to take care of/to care for			f	f	2407	UvA B1A Course CH1	2024-06-28 20:35:08.956317+01	\N
de held	the hero			f	f	2408	UvA B1A Course CH1	2024-06-28 20:35:22.212943+01	\N
de oplossing	the solution			f	f	2409	UvA B1A Course CH1	2024-06-28 20:36:00.893409+01	\N
de draad	the thread/wire/string			f	f	2513	UvA B1A Course CH3	2024-07-12 20:55:52.727142+01	\N
het hoofdkussen	the pillow			f	f	2514	UvA B1A Course CH3	2024-07-12 20:56:18.930509+01	\N
de jongeren	the young people			f	f	2515	UvA B1A Course CH3	2024-07-12 20:56:35.698277+01	\N
langskomen	to come over/pass by			f	f	2516	UvA B1A Course CH3	2024-07-12 20:56:55.281981+01	\N
besluiten	to decide			f	f	2517	UvA B1A Course CH3	2024-07-12 20:57:05.694492+01	\N
kletsmomentje	chit-chat			f	f	2518	UvA B1A Course CH3	2024-07-12 20:57:21.956739+01	\N
eindigen (met)	to end (with)			f	f	2527	UvA B1A Course CH4	2024-07-13 14:20:47.325414+01	\N
de heide	heather/heath			f	f	2528	UvA B1A Course CH4	2024-07-13 14:21:02.686333+01	\N
bloeien	to bloom			f	f	2529	UvA B1A Course CH4	2024-07-13 14:21:20.507563+01	\N
dankbaar	thankful/grateful		https://forvo.com/word/dankbaar/	f	f	2217		2023-09-27 14:59:57.873874+01	\N
orde (in)	fine/alright			f	f	2218		2023-09-27 14:59:57.873874+01	\N
ingaan	to enter	UvA A2 Course		f	f	2293	UvA A2 Course	2024-03-11 17:36:19.325351+00	\N
het muntgeld	the cash	UvA A2 Course		f	f	2294	UvA A2 Course	2024-03-11 17:36:39.034226+00	\N
laden	to load	UvA A2 Course		f	f	2295	UvA A2 Course	2024-03-11 17:36:51.603736+00	\N
zo'n	"such a", "about"	UvA A2 Course		f	f	2296	UvA A2 Course	2024-03-11 17:37:11.444404+00	\N
jeuk	itch	UvA A2 Course		f	f	2297	UvA A2 Course	2024-03-11 17:37:53.467517+00	\N
schuur	shed	UvA A2 Course		f	f	2298	UvA A2 Course	2024-03-11 17:38:07.715633+00	\N
de bult	the bump	UvA A2 Course		f	f	2299	UvA A2 Course	2024-03-11 17:38:27.750871+00	\N
de beurt	the turn/move (your)	UvA A2 Course		f	f	2300	UvA A2 Course	2024-03-11 17:38:48.411236+00	\N
de keel	the throat	UvA A2 Course		f	f	2301	UvA A2 Course	2024-03-11 17:39:07.587013+00	\N
afgesproken	agreed (ment)	UvA A2 Course		f	f	2303	UvA A2 Course	2024-03-11 17:40:18.201196+00	\N
het vuilnis	the trash	UvA A2 Course		f	f	2304	UvA A2 Course	2024-03-11 17:40:32.705759+00	\N
fris(se)	fresh	UvA A2 Course		f	f	2305	UvA A2 Course	2024-03-11 17:40:50.334282+00	\N
in verband met	in relation to	UvA A2 Course		f	f	2306	UvA A2 Course	2024-03-11 17:41:25.223812+00	\N
verband	link	UvA A2 Course		f	f	2307	UvA A2 Course	2024-03-11 17:41:37.958158+00	\N
staking	strike (labor)	UvA A2 Course		f	f	2308	UvA A2 Course	2024-03-11 17:41:54.8171+00	\N
storing	failure/malfunction	UvA A2 Course		f	f	2309	UvA A2 Course	2024-03-11 17:42:14.23641+00	\N
kijkwijzer	ratings	UvA A2 Course		f	f	2379		2024-03-28 19:19:58.541968+00	\N
klinkt goed	sounds good		#	f	t	2219		2023-09-27 14:59:57.873874+01	\N
indrukwekkend	impressive	UvA A2 Course, UvA B1A Course CH1		f	f	2302	UvA A2 Course	2024-03-11 17:39:51.874269+00	\N
de tekening	the drawing			f	f	2411	UvA B1A Course CH1	2024-06-28 20:36:36.20422+01	\N
de spullen	the things			f	f	2412	UvA B1A Course CH1	2024-06-28 20:36:48.154955+01	\N
de eigenschap	the characteristic			f	f	2413	UvA B1A Course CH1	2024-06-28 20:37:01.889836+01	\N
de herinnering aan	memory of			f	f	2414	UvA B1A Course CH1	2024-06-28 20:37:19.25724+01	\N
de rammelaar	the rattle			f	f	2415	UvA B1A Course CH1	2024-06-28 20:37:31.314966+01	\N
de schijf	the disk			f	f	2416	UvA B1A Course CH1	2024-06-28 20:37:43.541888+01	\N
het horloge	the watch			f	f	2417	UvA B1A Course CH1	2024-06-28 20:37:56.481779+01	\N
het tijdschrijft	the magazine			f	f	2418	UvA B1A Course CH1	2024-06-28 20:38:10.505402+01	\N
het lawaii	the noise			f	f	2419	UvA B1A Course CH1	2024-06-28 20:38:23.241193+01	\N
het bezit	the possession			f	f	2420	UvA B1A Course CH1	2024-06-28 20:38:36.745886+01	\N
zich aanmelden voor	to sign up for			f	f	2421	UvA B1A Course CH2	2024-06-28 20:39:57.319898+01	\N
zich houden aan	to stick to			f	f	2422	UvA B1A Course CH2	2024-06-28 20:40:10.189552+01	\N
twijfelen (aan/over/tussen)	to be unsure/have doubts about			f	f	2423	UvA B1A Course CH2	2024-06-28 20:40:34.787369+01	\N
verwennen	to spoil	verb		f	f	2425	UvA B1A Course CH2	2024-06-28 20:41:05.397156+01	\N
opleveren	to count for, to produce or yield	verb		f	f	2424	UvA B1A Course CH2	2024-06-28 20:40:52.509037+01	\N
afhangen van	to depend upon	het hangt er ... van		f	f	2426	UvA B1A Course CH2	2024-06-28 20:41:51.422976+01	\N
bewegen	to exercise/move	verb		f	f	2427	UvA B1A Course CH2	2024-06-28 20:42:24.608466+01	\N
verbranden	to burn	verb		f	f	2428	UvA B1A Course CH2	2024-06-28 20:43:03.331156+01	\N
kauwen op	to chew on	verb		f	f	2429	UvA B1A Course CH2	2024-06-28 20:43:14.027939+01	\N
gillen	to scream/yell	verb		f	f	2430	UvA B1A Course CH2	2024-06-28 20:43:26.416313+01	\N
blijken uit	something shows that...			f	f	2431	UvA B1A Course CH2	2024-06-28 20:43:43.724273+01	\N
noemen	to call/name			f	f	2432	UvA B1A Course CH2	2024-06-28 20:43:56.510687+01	\N
pakken	to grab	verb		f	f	2433	UvA B1A Course CH2	2024-06-28 20:44:07.539895+01	\N
voorverpakt	pre-packaged			f	f	2434	UvA B1A Course CH2	2024-06-28 20:44:24.736932+01	\N
schelen	to save/to differ			f	f	2435	UvA B1A Course CH2	2024-06-28 20:44:38.505936+01	\N
smaken naar	to taste of			f	f	2436	UvA B1A Course CH2	2024-06-28 20:44:51.202406+01	\N
het verzoekt	the request			f	f	2437	UvA B1A Course CH2	2024-06-28 20:45:08.574181+01	\N
het onderwerp	the subject/topic			f	f	2438	UvA B1A Course CH2	2024-06-28 20:45:26.457974+01	\N
het geslacht	the sex			f	f	2439	UvA B1A Course CH2	2024-06-28 20:45:46.797419+01	\N
het kenmerk	the characteristic			f	f	2440	UvA B1A Course CH2	2024-06-28 20:45:59.89373+01	\N
het schap	the shelf			f	f	2441	UvA B1A Course CH2	2024-06-28 20:46:13.674604+01	\N
de levenstijl	the lifestyle			f	f	2442	UvA B1A Course CH2	2024-06-28 20:46:30.19654+01	\N
de voeding	nutrition			f	f	2443	UvA B1A Course CH2	2024-06-28 20:46:40.762131+01	\N
de geneeskundestudent	medical student			f	f	2444	UvA B1A Course CH2	2024-06-28 20:46:56.207523+01	\N
de voedingsdeskundige	the nutritionist			f	f	2445	UvA B1A Course CH2	2024-06-28 20:47:13.077392+01	\N
de sportliefhebber	the sports enthusiast			f	f	2446	UvA B1A Course CH2	2024-06-28 20:47:36.649286+01	\N
de kennis	the acquiatance, knowledge/expertise			f	f	2447	UvA B1A Course CH2	2024-06-28 20:48:09.493014+01	\N
de volwassene	the adult			f	f	2448	UvA B1A Course CH2	2024-06-28 20:48:25.201905+01	\N
de tegenslag	setback			f	f	2530	UvA B1A Course CH4	2024-07-13 14:22:20.102796+01	\N
de tocht	the trip/tour			f	f	2531	UvA B1A Course CH4	2024-07-13 14:22:37.961064+01	\N
sowieso	anyways/in any case			f	f	2532	UvA B1A Course CH4	2024-07-13 14:22:54.849307+01	\N
opvangen	to deal with (iets)			f	f	2533	UvA B1A Course CH4	2024-07-13 14:23:11.216014+01	\N
schuilen (voor)	to shelter (from)			f	f	2534	UvA B1A Course CH4	2024-07-13 14:23:44.087564+01	\N
druipen	to be soaked			f	f	2535	UvA B1A Course CH4	2024-07-13 14:23:58.606784+01	\N
het gaat erom	what matters			f	f	2536	UvA B1A Course CH4	2024-07-13 14:24:18.381367+01	\N
de duisternis	the darkness			f	f	2537	UvA B1A Course CH4	2024-07-13 14:25:18.238605+01	\N
de kanotocht	the canoe trip			f	f	2538	UvA B1A Course CH4	2024-07-13 14:25:54.225916+01	\N
waarbij	in which			f	f	2539	UvA B1A Course CH4	2024-07-13 14:26:08.475531+01	\N
optillen	to lift / pick up		https://forvo.com/word/optillen/	f	f	2220		2023-09-27 14:59:57.873874+01	\N
je hoeft niet	you don't have to	phrase	#	f	f	2221	phrases	2023-09-27 14:59:57.873874+01	\N
treurig	sad		https://forvo.com/word/treurig/	f	f	2223		2023-09-27 14:59:57.873874+01	\N
schulden	debts		https://forvo.com/word/schulden/	f	f	2224		2023-09-27 14:59:57.873874+01	\N
werkzaamheden	(active) work	UvA A2 Course		f	f	2310	UvA A2 Course	2024-03-11 17:42:47.683731+00	\N
vertaging	delay	UvA A2 Course		f	f	2311	UvA A2 Course	2024-03-11 17:43:03.318288+00	\N
de richtlijn	the guideline			f	f	2449	UvA B1A Course CH2	2024-06-28 20:49:17.0514+01	\N
de aandacht	the attention			f	f	2450	UvA B1A Course CH2	2024-06-28 20:49:29.746021+01	\N
de tentamenweek	the exam week			f	f	2451	UvA B1A Course CH2	2024-06-28 20:49:44.814067+01	\N
gemiddeld	on average			f	f	2452	UvA B1A Course CH2	2024-06-28 20:49:56.745829+01	\N
ten minste	at least			f	f	2453	UvA B1A Course CH2	2024-06-28 20:50:14.237113+01	\N
matig	moderate/medium			f	f	2454	UvA B1A Course CH2	2024-06-28 20:50:37.679453+01	\N
af en toe	every now and then			f	f	2455	UvA B1A Course CH2	2024-06-28 20:50:50.89713+01	\N
tegenwoordig	nowadays			f	f	2456	UvA B1A Course CH2	2024-06-28 20:51:10.566798+01	\N
stevig	at a fast pace, solid			f	f	2457	UvA B1A Course CH2	2024-06-28 20:51:24.877378+01	\N
luidruchtig	noisy			f	f	2458	UvA B1A Course CH2	2024-06-28 20:51:36.463864+01	\N
steeds (minder)	less and less			f	f	2459	UvA B1A Course CH2	2024-06-28 20:51:47.263903+01	\N
elders	elsewhere			f	f	2460	UvA B1A Course CH2	2024-06-28 20:51:56.881426+01	\N
anderhalf	1 and a half (1.5)			f	f	2461	UvA B1A Course CH2	2024-06-28 20:52:14.701132+01	\N
uitwisselingprogramma	exchange program			f	f	2462	UvA B1A Course CH3	2024-06-28 20:52:32.236309+01	\N
verwachten	to expect	\N	https://forvo.com/word/verwachten/#nl	f	f	1901	UvA B1A Course CH4	2023-09-27 14:59:57.873874+01	\N
voordeel	advantage			f	f	2540	UvA B1A Course CH4	2024-07-13 14:29:26.256985+01	\N
de bekende	the acquaintance (noun), recognised/famous (adj.)	\N	https://forvo.com/word/bekende/#nl	f	f	1559	family	2023-09-27 14:59:57.873874+01	\N
de musicus	the musician		https://forvo.com/word/musicus/	f	f	2225		2023-09-27 14:59:57.873874+01	\N
de componist	the composer		https://forvo.com/word/componist	f	f	2226		2023-09-27 14:59:57.873874+01	\N
uitgeroepen	proclaimed/exclaimed		https://forvo.com/word/uitgeroepen/	f	f	2227		2023-09-27 14:59:57.873874+01	\N
verdiende	to earn/deserve		https://forvo.com/word/verdiende	f	f	2228		2023-09-27 14:59:57.873874+01	\N
het verkeer	the traffic	UvA A2 Course		f	f	2312	UvA A2 Course	2024-03-11 17:43:38.256135+00	\N
tochtig	drafty	UvA A2 Course		f	f	2313	UvA A2 Course	2024-03-11 17:44:09.994566+00	\N
de mening	the opinion	UvA A2 Course		f	f	2314	UvA A2 Course	2024-03-11 17:44:27.023431+00	\N
behoorlijk	proper/quite/fairly			f	f	2463	UvA B1A Course CH3	2024-06-28 20:53:13.717048+01	\N
levendig	lively			f	f	2464	UvA B1A Course CH3	2024-06-28 20:53:26.30321+01	\N
snikheet	boiling hot			f	f	2465	UvA B1A Course CH3	2024-06-28 20:53:36.298643+01	\N
tegelijkertijd	at the same time			f	f	2466	UvA B1A Course CH3	2024-06-28 20:53:49.523185+01	\N
afstandelijk	distant/aloof			f	f	2467	UvA B1A Course CH3	2024-06-28 20:54:00.905107+01	\N
verderop	further down			f	f	2468	UvA B1A Course CH3	2024-06-28 20:54:10.153894+01	\N
zomaar	just like that			f	f	2469	UvA B1A Course CH3	2024-06-28 20:54:18.836447+01	\N
kussen	to kiss	verb		f	f	2470	UvA B1A Course CH3	2024-06-28 20:54:29.414896+01	\N
omkeren	to reverse	verb		f	f	2471	UvA B1A Course CH3	2024-06-28 20:54:41.16886+01	\N
de afstand	the distance			f	f	2472	UvA B1A Course CH3	2024-06-28 20:54:52.582146+01	\N
de heimwee	homesickness			f	f	2473	UvA B1A Course CH3	2024-06-28 20:55:09.013483+01	\N
de omstandigheid	the circumstance			f	f	2474	UvA B1A Course CH3	2024-06-28 20:55:25.62838+01	\N
de onbekende	the stranger			f	f	2475	UvA B1A Course CH3	2024-06-28 20:55:38.66206+01	\N
de kroeg	the pub			f	f	2476	UvA B1A Course CH3	2024-06-28 20:55:49.599908+01	\N
scheidbaar	separable		https://forvo.com/word/scheidbaar	f	f	2229		2023-09-27 14:59:57.873874+01	\N
klagen	to complain	UvA A2 Course		f	f	2315	UvA A2 Course	2024-03-11 17:45:12.97204+00	\N
zeuren	to whine	UvA A2 Course		f	f	2316	UvA A2 Course	2024-03-11 17:45:33.843505+00	\N
steunen	to support		https://forvo.com/word/steunen	f	f	2230		2023-09-27 14:59:57.873874+01	\N
uitdagen	to challenge	UvA A2 Course		f	f	2317	UvA A2 Course	2024-03-11 17:47:00.801112+00	\N
Bijvoeglijk Naamwoord	adjective	grammar	#	f	f	2232		2023-09-27 14:59:57.873874+01	\N
de richting	the direction (of)	UvA A2 Course		f	f	2318	UvA A2 Course	2024-03-11 17:47:35.485622+00	\N
gebaar	gesture		https://forvo.com/word/gebaar	f	f	2233		2023-09-27 14:59:57.873874+01	\N
ongeveer	roughly		https://forvo.com/word/ongeveer	f	f	2234		2023-09-27 14:59:57.873874+01	\N
prachtig	lovely/wonderful/beautiful/amazing		https://forvo.com/word/prachtig	f	f	2235		2023-09-27 14:59:57.873874+01	\N
de afslag	the exit	UvA A2 Course		f	f	2319	UvA A2 Course	2024-03-11 17:48:17.228311+00	\N
de rotonde	the roundabout	UvA A2 Course		f	f	2320	UvA A2 Course	2024-03-11 17:48:40.94939+00	\N
alvast	already/in advance		https://forvo.com/word/alvast	f	f	2236		2023-09-27 14:59:57.873874+01	\N
de verdieping	story/floor (building)	UvA A2 Course		f	f	2321	UvA A2 Course	2024-03-11 17:49:21.979635+00	\N
bezig	busy		https://forvo.com/word/bezig	f	f	2237		2023-09-27 14:59:57.873874+01	\N
goed bezig	good job	phrase	#	f	f	2238	phrases	2023-09-27 14:59:57.873874+01	\N
ophalen	to pick up		https://forvo.com/word/ophalen	f	f	2239		2023-09-27 14:59:57.873874+01	\N
het is goed zo	it is good to go	phrase for tipping	#	f	f	2242	phrases	2023-09-27 14:59:57.873874+01	\N
laat de rest maar zitten	nevermind the rest	phrase for tipping	#	f	f	2241	phrases	2023-09-27 14:59:57.873874+01	\N
Maak er maar € ... van	Let's make it ... €	phrase for tipping	#	f	f	2243	phrases	2023-09-27 14:59:57.873874+01	\N
De soort	A kind of		#	f	f	2244		2023-09-27 14:59:57.873874+01	\N
de beoordelen	review/opinion		https://forvo.com/word/beoordelen/	f	f	2246		2023-09-27 14:59:57.873874+01	\N
de gangen	the courses (food)		https://forvo.com/word/gangen	f	f	2247		2023-09-27 14:59:57.873874+01	\N
het strookje	the strip		https://forvo.com/word/strookje	f	f	2248		2023-09-27 14:59:57.873874+01	\N
de fooi	the tip		https://forvo.com/word/fooi	f	t	2245		2023-09-27 14:59:57.873874+01	\N
de trap	the stairs	UvA A2 Course		f	f	2322	UvA A2 Course	2024-03-11 17:49:52.607589+00	\N
wijzen	to indicate/point out	UvA A2 Course		f	f	2323	UvA A2 Course	2024-03-11 17:50:10.652894+00	\N
het toetje	dessert		https://forvo.com/word/toetje	f	f	2240		2023-09-27 14:59:57.873874+01	\N
daarop	there-on		https://forvo.com/word/daarop	f	f	2249		2023-09-27 14:59:57.873874+01	\N
passend	appropriate		https://forvo.com/word/passend	f	f	2250		2023-09-27 14:59:57.873874+01	\N
de plattegrond	the map	UvA A2 Course		f	f	2324	UvA A2 Course	2024-03-11 17:50:57.213331+00	\N
dapper	brave	UvA A2 Course		f	f	2325	UvA A2 Course	2024-03-11 17:51:14.993632+00	\N
moedig	brave	UvA A2 Course		f	f	2326	UvA A2 Course	2024-03-11 17:51:22.54657+00	\N
woedend	furious	UvA A2 Course		f	f	2327	UvA A2 Course	2024-03-11 17:51:39.345577+00	\N
energiek	energetic	UvA A2 Course		f	f	2328	UvA A2 Course	2024-03-11 17:51:57.234522+00	\N
tentoonstelling	exhibition	UvA A2 Course		f	f	2329	UvA A2 Course	2024-03-11 17:52:14.902077+00	\N
aanbevelen	to recommend	UvA A2 Course		f	f	2330	UvA A2 Course	2024-03-11 17:52:43.125942+00	\N
niets bijzonders	nothing special	UvA A2 Course		f	f	2331	UvA A2 Course	2024-03-11 17:52:59.926248+00	\N
de portier	the doorman	UvA A2 Course		f	f	2332	UvA A2 Course	2024-03-11 17:53:19.830776+00	\N
wat voor	what kind of	phrase	#	f	f	2252	phrases	2023-09-27 14:59:57.873874+01	\N
het model	the style		https://forvo.com/word/model	f	f	2253		2023-09-27 14:59:57.873874+01	\N
allebei	both		https://forvo.com/word/allebei	f	f	2255		2023-09-27 14:59:57.873874+01	\N
herkennen	to recognize	UvA A2 Course		f	f	2333	UvA A2 Course	2024-03-11 17:54:18.049153+00	\N
toevallig	coincidence	UvA A2 Course		f	f	2334	UvA A2 Course	2024-03-11 17:54:44.10743+00	\N
bijbaantje	side job	UvA A2 Course		f	f	2335	UvA A2 Course	2024-03-11 17:55:09.855724+00	\N
logopedie	speech therapy	UvA A2 Course		f	f	2336	UvA A2 Course	2024-03-11 17:55:28.161884+00	\N
stelde	stated (posited)	UvA A2 Course		f	f	2337	UvA A2 Course	2024-03-11 17:56:08.979607+00	\N
het merk	the brand	UvA A2 Course	https://forvo.com/word/merk	f	f	2254		2023-09-27 14:59:57.873874+01	\N
de maat	the size		https://forvo.com/word/maat	f	t	2251		2023-09-27 14:59:57.873874+01	\N
wijd	wide		https://forvo.com/word/wijd	f	f	2256		2023-09-27 14:59:57.873874+01	\N
eventueel	if necessary		https://forvo.com/word/eventueel	f	f	2257		2023-09-27 14:59:57.873874+01	\N
ruilen	to exchange		https://forvo.com/word/ruilen	f	f	2258		2023-09-27 14:59:57.873874+01	\N
staat me het beste	suits me best	phrase	#	f	f	2259	phrases	2023-09-27 14:59:57.873874+01	\N
blaft	barks	UvA A2 Course		f	f	2338	UvA A2 Course	2024-03-11 17:56:47.968224+00	\N
schattig	cute	UvA A2 Course		f	f	2339	UvA A2 Course	2024-03-11 17:57:07.102926+00	\N
onderwijs	education	UvA A2 Course		f	f	2340	UvA A2 Course	2024-03-11 17:57:25.562894+00	\N
benieuwd	curious	UvA A2 Course		f	f	2341	UvA A2 Course	2024-03-11 17:57:38.592239+00	\N
nieuwsgierig	curious/nosy	UvA A2 Course		f	f	2342	UvA A2 Course	2024-03-11 17:57:59.096274+00	\N
geduld	patience	UvA A2 Course		f	f	2343	UvA A2 Course	2024-03-11 17:58:17.783411+00	\N
waarderen	to appreciate/value	UvA A2 Course also 		f	f	2344	UvA B1A Course CH4	2024-03-11 17:58:35.07826+00	\N
vervolg	continuation		https://forvo.com/word/vervolg	f	f	2260		2023-09-27 14:59:57.873874+01	\N
effen	solid colored		https://forvo.com/word/effen	f	f	2261		2023-09-27 14:59:57.873874+01	\N
geruit	checkered		https://forvo.com/word/geruit	f	f	2262		2023-09-27 14:59:57.873874+01	\N
gebloemd	flowered		https://forvo.com/word/gebloemd	f	f	2263		2023-09-27 14:59:57.873874+01	\N
gestreept	striped		https://forvo.com/word/gestreept	f	t	2264		2023-09-27 14:59:57.873874+01	\N
hoeven	to need to/have to	UvA A2 Course		f	f	2345	UvA A2 Course	2024-03-11 17:59:05.219482+00	\N
lijken	to seem/appear	UvA A2 Course	https://forvo.com/word/lijken/#nl	f	t	1640	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
regende	rained	UvA A2 Course		f	f	2346	UvA A2 Course	2024-03-11 17:59:53.560867+00	\N
wegglijden	to slip	UvA A2 Course		f	f	2347	UvA A2 Course	2024-03-11 18:00:35.042576+00	\N
de mankeren	the limp	UvA A2 Course		f	f	2348	UvA A2 Course	2024-03-11 18:01:06.762474+00	\N
het stuur	the handlebar	UvA A2 Course		f	f	2349	UvA A2 Course	2024-03-11 18:01:38.502773+00	\N
het zadel	the saddle	UvA A2 Course		f	f	2350	UvA A2 Course	2024-03-11 18:01:47.754919+00	\N
scheef	crooked (broken)	UvA A2 Course		f	f	2351	UvA A2 Course	2024-03-11 18:02:06.515186+00	\N
de trapper	the pedal	UvA A2 Course		f	f	2352	UvA A2 Course	2024-03-11 18:02:19.788527+00	\N
verstaan	to understand	UvA A2 Course		f	f	2353	UvA A2 Course	2024-03-11 18:02:50.322888+00	\N
de rem	the brake	UvA A2 Course		f	f	2354	UvA A2 Course	2024-03-11 18:03:04.006019+00	\N
uitdrukkingen	the expressions/phrases	UvA A2 Course		f	f	2355	UvA A2 Course	2024-03-11 18:03:31.586913+00	\N
krabben	to scratch	UvA A2 Course		f	f	2356	UvA A2 Course	2024-03-11 18:03:49.80047+00	\N
zalf	salve/ointment	UvA A2 Course		f	f	2357	UvA A2 Course	2024-03-11 18:04:00.083721+00	\N
de emmer	the bucket	UvA A2 Course		f	f	2358	UvA A2 Course	2024-03-11 18:04:13.402183+00	\N
verschrijkkelijk	outrageous	UvA A2 Course		f	f	2359	UvA A2 Course	2024-03-11 18:04:28.514525+00	\N
het wiel	the wheel	UvA A2 Course	https://forvo.com/word/wiel/#nl	f	t	357	\N	2023-09-27 14:59:57.873874+01	\N
mogelijkheden	possibilities	UvA A2 Course		f	f	2360	UvA A2 Course	2024-03-11 18:05:16.42622+00	\N
raden	to recommend	UvA A2 Course		f	f	2361	UvA A2 Course	2024-03-11 18:05:53.578093+00	\N
wissel	to change/swap/exchange	UvA A2 Course		f	f	2362	UvA A2 Course	2024-03-11 18:08:30.763161+00	\N
de sperzieboon	the green bean	UvA A2 Course		f	f	2363	UvA A2 Course	2024-03-11 18:08:43.540817+00	\N
prettig	enjoyable/pleasant/nice	UvA A2 Course		f	f	2364	UvA A2 Course	2024-03-11 18:09:09.862913+00	\N
doe de groeten aan	give my regards to	UvA A2 Course		f	f	2365	UvA A2 Course	2024-03-11 18:10:06.093073+00	\N
hartstikke	very/heartily	UvA A2 Course		f	f	2366	UvA A2 Course	2024-03-11 18:10:43.822418+00	\N
rangtelwoorden	ordinal numbers	UvA A2 Course		f	f	2367	UvA A2 Course	2024-03-11 18:11:09.06595+00	\N
overmorgen	the day after tomorrow	UvA A2 Course		f	f	2368	UvA A2 Course	2024-03-11 18:11:39.372127+00	\N
eergisteren	the day before yesterday	UvA A2 Course		f	f	2369	UvA A2 Course	2024-03-11 18:11:51.04037+00	\N
de zwager	the brother in law	UvA A2 Course		f	f	2370	UvA A2 Course	2024-03-11 18:12:20.512155+00	\N
de schoonzus	the sister in law	UvA A2 Course		f	f	2371	UvA A2 Course	2024-03-11 18:12:34.666932+00	\N
de afscheid	the farewell/goodbye	UvA A2 Course		f	f	2372	UvA A2 Course	2024-03-11 18:12:55.712581+00	\N
begroeten	to greet	UvA A2 Course		f	f	2373	UvA A2 Course	2024-03-11 18:13:19.663238+00	\N
vorige	previous	UvA A2 Course		f	t	2374	UvA A2 Course	2024-03-11 18:13:39.167985+00	\N
bewolkt	cloudy	\N	https://forvo.com/word/bewolkt/#nl	f	t	1680	weather	2023-09-27 14:59:57.873874+01	\N
kwart over drie	quarter past three		#	t	f	1055	time	2023-09-27 14:59:57.873874+01	\N
één	one	n/a	https://forvo.com/word/een/#nl	f	t	15	numbers/counting	2023-09-27 14:59:57.873874+01	\N
veranderen	to change	\N	https://forvo.com/word/veranderen/#nl	f	t	1519	job hunting/business	2023-09-27 14:59:57.873874+01	\N
zou	would/might	n/a	https://forvo.com/word/zou/#nl	f	f	164	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
beneden	down, downstairs	\N	https://forvo.com/word/beneden/#nl	f	f	1336	prepositions	2023-09-27 14:59:57.873874+01	\N
de haan	the cockerel	\N	https://forvo.com/word/haan/#nl	f	f	1580	animals (1)	2023-09-27 14:59:57.873874+01	\N
het ontbijt	the breakfast	\N	https://forvo.com/word/ontbijt/#nl	f	f	1821	cooking	2023-09-27 14:59:57.873874+01	\N
tegengesteld	opposite	n/a	https://forvo.com/word/tegengesteld/#nl	t	f	964	\N	2023-09-27 14:59:57.873874+01	\N
zicht	sight	n/a	https://forvo.com/word/zicht/#nl	f	t	825	\N	2023-09-27 14:59:57.873874+01	\N
houden van	to love	\N	#	f	t	1505	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
de neef	the cousin, the nephew	\N	https://forvo.com/word/neef/#nl	f	f	1552	family	2023-09-27 14:59:57.873874+01	\N
tolk	interpreter	noun	https://forvo.com/word/tolk/#nl	f	f	1006	\N	2023-09-27 14:59:57.873874+01	\N
laten vallen	drop	n/a	#	f	f	540	\N	2023-09-27 14:59:57.873874+01	\N
zeil	sail	n/a	https://forvo.com/word/zeil/#nl	f	f	550	Amsterdam	2023-09-27 14:59:57.873874+01	\N
doet	does	n/a	https://forvo.com/word/doet/#nl	f	f	52	\N	2023-09-27 14:59:57.873874+01	\N
kinderen	children	n/a	https://forvo.com/word/kinderen/#nl	f	t	280	family	2023-09-27 14:59:57.873874+01	\N
druk	busy/crowded	\N	https://forvo.com/word/druk/#nl	f	f	2062	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
pers	press	n/a	https://forvo.com/word/pers/#nl	f	f	245	\N	2023-09-27 14:59:57.873874+01	\N
verhogen	raise	n/a	https://forvo.com/word/verhogen/#nl	f	f	708	\N	2023-09-27 14:59:57.873874+01	\N
hopen	hope	n/a	https://forvo.com/word/hopen/#nl	f	t	596	\N	2023-09-27 14:59:57.873874+01	\N
twee uur	two o’clock		#	f	t	1049	time	2023-09-27 14:59:57.873874+01	\N
het bed	the bed	\N	https://forvo.com/word/bed/#nl	t	f	1424	household	2023-09-27 14:59:57.873874+01	\N
zoutig	salty	\N	https://forvo.com/word/zout/#nl	f	f	1832	cooking	2023-09-27 14:59:57.873874+01	\N
jullie / uw (plural)	your	\N	https://forvo.com/word/jullie/#nl	f	f	2118	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
winnen	to win	\N	https://forvo.com/word/winnen/#nl	f	f	1511	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
maken	to make	\N	https://forvo.com/word/maken/#nl	f	f	1512	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
tennissen	to play tennis	\N	https://forvo.com/word/tennissen/#nl	f	f	1368	hobbies	2023-09-27 14:59:57.873874+01	\N
de scheidsrechter	the referee	\N	https://forvo.com/word/scheidsrechter/#nl	f	f	1607	football	2023-09-27 14:59:57.873874+01	\N
trompet	trumpet	\N	https://forvo.com/word/trompet/#nl	f	f	2154	hobbies	2023-09-27 14:59:57.873874+01	\N
wave	wave	n/a	https://forvo.com/word/wave/#nl	t	f	539	\N	2023-09-27 14:59:57.873874+01	\N
had	had	n/a	https://forvo.com/word/had/#nl	f	t	29	\N	2023-09-27 14:59:57.873874+01	\N
de vogel	the bird	\N	https://forvo.com/word/vogel/#nl	f	f	1581	animals (1)	2023-09-27 14:59:57.873874+01	\N
onderdeel	element	n/a	https://forvo.com/word/onderdeel/#nl	f	f	771	\N	2023-09-27 14:59:57.873874+01	\N
ijsvrij	a day off for skating	\N	https://forvo.com/word/ijsvrij/#nl	f	f	2015	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
vier	four	\N	https://forvo.com/word/vier/#nl	f	f	1226	numbers/counting	2023-09-27 14:59:57.873874+01	\N
het bos	the forest	\N	https://forvo.com/word/bos/#nl	f	f	1406	Amsterdam	2023-09-27 14:59:57.873874+01	\N
uit eten gaan	to go out for dinner	\N	#	f	f	1371	hobbies	2023-09-27 14:59:57.873874+01	\N
koud	cold	\N	https://forvo.com/word/koud/#nl	f	f	1294	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
warm	warm	\N	https://forvo.com/word/warm/#nl	f	f	1295	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
haast	hurry	n/a	https://forvo.com/word/haast/#nl	f	f	829	\N	2023-09-27 14:59:57.873874+01	\N
rol	roll	n/a	https://forvo.com/word/rol/#nl	f	f	740	\N	2023-09-27 14:59:57.873874+01	\N
vrij	free, pretty	\N	https://forvo.com/word/vrij/#nl	f	f	1694	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
de pruim	the plum	\N	https://forvo.com/word/pruim/#nl	f	f	1876	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
saai	boring	\N	https://forvo.com/word/saai/#nl	f	t	1283	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
vijftig	fifty	\N	https://forvo.com/word/vijftig/#nl	f	t	1242	numbers/counting	2023-09-27 14:59:57.873874+01	\N
november	November	\N	https://forvo.com/word/november/#nl	f	t	1323	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
Oud en Nieuw	New year’s eve and New year’s day	\N	#	f	t	2011	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
rijk	rich	\N	https://forvo.com/word/rijk/#nl	f	t	1285	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
de kleren	the clothes	\N	https://forvo.com/word/kleren/#nl	f	f	1460	clothes	2023-09-27 14:59:57.873874+01	\N
bespreken	discuss	n/a	https://forvo.com/word/bespreken/#nl	f	f	922	\N	2023-09-27 14:59:57.873874+01	\N
de vork	the fork	\N	https://forvo.com/word/vork/#nl	f	f	1841	cooking	2023-09-27 14:59:57.873874+01	\N
interessant	interesting	\N	https://forvo.com/word/interessant/#nl	f	f	1282	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
vriendelijk	friendly	\N	https://forvo.com/word/vriendelijk/#nl	f	f	1815	moods/emotions	2023-09-27 14:59:57.873874+01	\N
zij/ze	she/they	\N	https://forvo.com/word/zij/#nl	f	f	1121	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
depressief	depressive	\N	https://forvo.com/word/depressief/#nl	f	f	1802	moods/emotions	2023-09-27 14:59:57.873874+01	\N
kant	side	n/a	https://forvo.com/word/kant/#nl	f	f	198	\N	2023-09-27 14:59:57.873874+01	\N
het bestek	the cutlery	\N	https://forvo.com/word/bestek/#nl	f	f	1840	cooking	2023-09-27 14:59:57.873874+01	\N
net	just	\N	https://forvo.com/word/net/#nl	f	f	1945	adverbs	2023-09-27 14:59:57.873874+01	\N
augustus	august	\N	https://forvo.com/word/augustus/#nl	f	f	1320	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
klok	clock	n/a	https://forvo.com/word/klok/#nl	f	f	832	time	2023-09-27 14:59:57.873874+01	\N
de garage	the garage	\N	https://forvo.com/word/garage/#nl	f	t	1429	household	2023-09-27 14:59:57.873874+01	\N
de koorts	the fever	\N	https://forvo.com/word/koorts/#nl	f	t	1715	doctor	2023-09-27 14:59:57.873874+01	\N
vervelend	annoying	UvA A2 Course	https://forvo.com/word/vervelend/#nl	f	f	1797	moods/emotions	2023-09-27 14:59:57.873874+01	\N
het vakantiegeld	the vacation bonus	\N	https://forvo.com/word/vakantiegeld/#nl	f	t	1533	job hunting/business	2023-09-27 14:59:57.873874+01	\N
het gevoel	the feeling	\N	https://forvo.com/word/gevoelens/#nl	f	f	1793	moods/emotions	2023-09-27 14:59:57.873874+01	\N
feit	fact	n/a	https://forvo.com/word/feit/#nl	f	f	450	\N	2023-09-27 14:59:57.873874+01	\N
graden	degrees	\N	https://forvo.com/word/graden/#nl	f	f	1665	weather	2023-09-27 14:59:57.873874+01	\N
de tram	the tram	\N	https://forvo.com/word/tram/#nl	f	f	1203	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
wanneer	when	\N	https://forvo.com/word/wanneer/#nl	f	f	1184	question words	2023-09-27 14:59:57.873874+01	\N
de, het snoep	the sweets	\N	https://forvo.com/word/snoep/#nl	f	f	1173	food/drink	2023-09-27 14:59:57.873874+01	\N
kamer	room	n/a	https://forvo.com/word/kamer/#nl	f	f	257	household	2023-09-27 14:59:57.873874+01	\N
‘s avonds	in the evening		#	f	f	1073	time	2023-09-27 14:59:57.873874+01	\N
teleurgesteld	disappointed	\N	https://forvo.com/word/teleurgesteld/#nl	f	f	1796	moods/emotions	2023-09-27 14:59:57.873874+01	\N
huren	to rent	\N	https://forvo.com/word/huren/#nl	f	f	1770	moving/immigration	2023-09-27 14:59:57.873874+01	\N
verkouden zijn	to have a cold	\N	https://forvo.com/word/verkouden/#nl	f	f	1714	doctor	2023-09-27 14:59:57.873874+01	\N
de tuin	the garden	\N	https://forvo.com/word/tuin/#nl	f	f	1430	household	2023-09-27 14:59:57.873874+01	\N
de zolder	the attic	\N	https://forvo.com/word/zolder/#nl	f	f	1431	household	2023-09-27 14:59:57.873874+01	\N
meest	most	\N	https://forvo.com/word/meest/#nl	f	f	2075	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
de duin	the dune	\N	https://forvo.com/word/duin/#nl	f	f	1761	geography	2023-09-27 14:59:57.873874+01	\N
de tunnel	the tunnel	\N	https://forvo.com/word/tunnel/#nl	f	f	1762	geography	2023-09-27 14:59:57.873874+01	\N
lied	song	n/a	https://forvo.com/word/lied/#nl	f	f	323	\N	2023-09-27 14:59:57.873874+01	\N
de das	the scarf	\N	https://forvo.com/word/das/#nl	f	f	1486	clothes	2023-09-27 14:59:57.873874+01	\N
het kleinkind	the grandchild	\N	https://forvo.com/word/kleinkind/#nl	f	f	1555	family	2023-09-27 14:59:57.873874+01	\N
kwaad	furious	\N	https://forvo.com/word/kwaad/#nl	f	f	1801	moods/emotions	2023-09-27 14:59:57.873874+01	\N
muziek	music	n/a	https://forvo.com/word/muziek/#nl	f	f	289	\N	2023-09-27 14:59:57.873874+01	\N
inch	inch	n/a	https://forvo.com/word/inch/#nl	f	f	352	\N	2023-09-27 14:59:57.873874+01	\N
alleen	alone	\N	https://forvo.com/word/alleen/#nl	f	f	1950	adverbs	2023-09-27 14:59:57.873874+01	\N
strijd	fight	n/a	https://forvo.com/word/strijd/#nl	t	f	745	\N	2023-09-27 14:59:57.873874+01	\N
acht	eight	\N	https://forvo.com/word/acht/#nl	f	t	1230	numbers/counting	2023-09-27 14:59:57.873874+01	\N
verzonden	sent	n/a	https://forvo.com/word/verzonden/#nl	f	t	641	\N	2023-09-27 14:59:57.873874+01	\N
industrie	industry	n/a	https://forvo.com/word/industrie/#nl	f	t	743	job hunting/business	2023-09-27 14:59:57.873874+01	\N
ook	also, too	\N	https://forvo.com/word/ook/#nl	t	t	1962	adverbs	2023-09-27 14:59:57.873874+01	\N
nooit	never	\N	https://forvo.com/word/nooit/#nl	f	t	1958	adverbs	2023-09-27 14:59:57.873874+01	\N
square	square	n/a	https://forvo.com/word/square/#nl	f	t	515	colors/shapes	2023-09-27 14:59:57.873874+01	\N
de natuur	the nature	\N	https://forvo.com/word/natuur/#nl	f	t	1758	geography	2023-09-27 14:59:57.873874+01	\N
opgewekt	cheerful	\N	https://forvo.com/word/opgewekt/#nl	f	f	1808	moods/emotions	2023-09-27 14:59:57.873874+01	\N
stem	voice	n/a	https://forvo.com/word/stem/#nl	f	f	501	\N	2023-09-27 14:59:57.873874+01	\N
orgel	organ	n/a	https://forvo.com/word/orgel/#nl	f	f	674	body	2023-09-27 14:59:57.873874+01	\N
seizoen	season	n/a	https://forvo.com/word/seizoen/#nl	f	f	908	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
tellen	count	n/a	https://forvo.com/word/tellen/#nl	f	f	514	numbers/counting	2023-09-27 14:59:57.873874+01	\N
de ober	the waiter	\N	https://forvo.com/word/ober/#nl	f	f	1140	professions	2023-09-27 14:59:57.873874+01	\N
orde	order	n/a	https://forvo.com/word/orde/#nl	f	f	339	\N	2023-09-27 14:59:57.873874+01	\N
door	through/by	\N	https://forvo.com/word/door/#nl	f	f	1952	adverbs	2023-09-27 14:59:57.873874+01	\N
uitnodigen	to invite	\N	https://forvo.com/word/uitnodigen/#nl	f	f	2016	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
het kanaal	the channel	\N	https://forvo.com/word/kanaal/#nl	f	f	1756	geography	2023-09-27 14:59:57.873874+01	\N
besteden	spend	n/a	https://forvo.com/word/besteden/#nl	f	f	862	\N	2023-09-27 14:59:57.873874+01	\N
ontvangen	to receive	\N	https://forvo.com/word/ontvangen/#nl	f	f	2019	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
de geboorte	the birth	\N	https://forvo.com/word/geboorte/#nl	f	f	2020	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
moderne	modern	n/a	https://forvo.com/word/moderne/#nl	f	f	770	\N	2023-09-27 14:59:57.873874+01	\N
nu	now	\N	https://forvo.com/word/nu/#nl	f	f	1960	adverbs	2023-09-27 14:59:57.873874+01	\N
soms	sometimes	\N	https://forvo.com/word/soms/#nl	f	f	1961	adverbs	2023-09-27 14:59:57.873874+01	\N
voeten	feet	n/a	https://forvo.com/word/voeten/#nl	f	f	299	body	2023-09-27 14:59:57.873874+01	\N
mooi weer	nice weather	\N	#	f	f	1661	weather	2023-09-27 14:59:57.873874+01	\N
de vrije trap	the free kick	\N	#	t	f	1620	football	2023-09-27 14:59:57.873874+01	\N
taal	language	n/a	https://forvo.com/word/taal/#nl	f	f	400	grammar	2023-09-27 14:59:57.873874+01	\N
en	and	\N	https://forvo.com/word/en/#nl	f	f	1117	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
het T-shirt	the T-shirt	\N	#	f	t	1474	clothes	2023-09-27 14:59:57.873874+01	\N
in de richting van	toward	n/a	#	f	f	481	\N	2023-09-27 14:59:57.873874+01	\N
hit	hit	n/a	https://forvo.com/word/hit/#nl	f	f	772	\N	2023-09-27 14:59:57.873874+01	\N
de reiskosten	the travel expenses	\N	https://forvo.com/word/reiskosten/#nl	f	f	1536	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de gemeente	the municipality	\N	https://forvo.com/word/gemeente/#nl	f	f	1747	geography	2023-09-27 14:59:57.873874+01	\N
de kakkerlak	the cockroach	noun, insect	https://forvo.com/word/kakkerlak/#nl	f	f	1002	animals (2)	2023-09-27 14:59:57.873874+01	\N
mensen	people	n/a	https://forvo.com/word/mensen/#nl	f	f	187	\N	2023-09-27 14:59:57.873874+01	\N
voorzitter	president (position)	noun	https://forvo.com/word/voorzitter/#nl	t	f	1023	\N	2023-09-27 14:59:57.873874+01	\N
radio In	radio	n/a	#	f	t	785	\N	2023-09-27 14:59:57.873874+01	\N
het gemeentehuis	the town hall	\N	https://forvo.com/word/gemeentehuis/#nl	f	t	1748	geography	2023-09-27 14:59:57.873874+01	\N
wie	who	\N	https://forvo.com/word/wie/#nl	f	f	1174	question words	2023-09-27 14:59:57.873874+01	\N
goedenavond	good evening	\N	https://forvo.com/word/goedenavond/#nl	f	f	1097	introductory	2023-09-27 14:59:57.873874+01	\N
bank	bank	n/a	https://forvo.com/word/bank/#nl	f	f	647	\N	2023-09-27 14:59:57.873874+01	\N
aanbod	offer	n/a	https://forvo.com/word/aanbod/#nl	f	f	874	\N	2023-09-27 14:59:57.873874+01	\N
zelfstandig naamwoord	noun	n/a	https://forvo.com/word/zelfstandig/#nl	f	f	419	grammar	2023-09-27 14:59:57.873874+01	\N
klinker	vowel	n/a	https://forvo.com/word/klinker/#nl	f	f	480	grammar	2023-09-27 14:59:57.873874+01	\N
waren	were	n/a	https://forvo.com/word/waren/#nl	f	f	40	\N	2023-09-27 14:59:57.873874+01	\N
kunst	art	\N	https://forvo.com/word/kunst/#nl	f	f	1376	hobbies	2023-09-27 14:59:57.873874+01	\N
het mes	the knife	\N	https://forvo.com/word/mes/#nl	f	f	1842	cooking	2023-09-27 14:59:57.873874+01	\N
de lepel	the spoon	\N	https://forvo.com/word/lepel/#nl	f	f	1843	cooking	2023-09-27 14:59:57.873874+01	\N
de werkvergunning	the working permit	\N	https://forvo.com/word/werkvergunning/#nl	f	f	1786	moving/immigration	2023-09-27 14:59:57.873874+01	\N
werking	effect	n/a	https://forvo.com/word/werking/#nl	f	f	790	\N	2023-09-27 14:59:57.873874+01	\N
noodzakelijk	necessary	n/a	https://forvo.com/word/noodzakelijk/#nl	f	f	803	\N	2023-09-27 14:59:57.873874+01	\N
ontmoeten	to meet	\N	https://forvo.com/word/ontmoeten/#nl	f	f	1646	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
doorgaan	to continue	\N	https://forvo.com/word/doorgaan/#nl	f	f	1647	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
de pan	the pan	\N	https://forvo.com/word/pan/#nl	f	f	1837	cooking	2023-09-27 14:59:57.873874+01	\N
verschijnen	appear	n/a	https://forvo.com/word/verschijnen/#nl	f	f	492	\N	2023-09-27 14:59:57.873874+01	\N
gestegen	rose	n/a	https://forvo.com/word/gestegen/#nl	f	f	850	\N	2023-09-27 14:59:57.873874+01	\N
gwe	utility bills	\N	https://forvo.com/word/gwe/#nl	f	f	1774	moving/immigration	2023-09-27 14:59:57.873874+01	\N
de kont	the ass	\N	https://forvo.com/word/kont/#nl	f	f	1455	body	2023-09-27 14:59:57.873874+01	\N
verschrikkelijk	terrible	\N	https://forvo.com/word/verschrikkelijk/#nl	f	f	2068	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
dal	valley	n/a	https://forvo.com/word/dal/#nl	f	f	947	nature	2023-09-27 14:59:57.873874+01	\N
dag	day	\N	https://forvo.com/word/dag/#nl	f	f	1098	introductory	2023-09-27 14:59:57.873874+01	\N
goedendag	good day !	\N	https://forvo.com/word/goedendag/#nl	f	f	1099	introductory	2023-09-27 14:59:57.873874+01	\N
tot ziens	see you	\N	https://forvo.com/word/ziens/#nl	f	f	1100	introductory	2023-09-27 14:59:57.873874+01	\N
het goud	the gold	\N	https://forvo.com/word/goud/#nl	f	f	1927	tools/materials	2023-09-27 14:59:57.873874+01	\N
(twaalf uur ‘s) middags	noon		#	f	f	1076	time	2023-09-27 14:59:57.873874+01	\N
de hond	the dog	\N	https://forvo.com/word/hond/#nl	f	f	1569	animals (1)	2023-09-27 14:59:57.873874+01	\N
oorlog	war	n/a	https://forvo.com/word/oorlog/#nl	f	f	482	\N	2023-09-27 14:59:57.873874+01	\N
dienen	serve	n/a	https://forvo.com/word/dienen/#nl	f	f	491	\N	2023-09-27 14:59:57.873874+01	\N
kwam	came	n/a	https://forvo.com/word/kwam/#nl	f	f	119	\N	2023-09-27 14:59:57.873874+01	\N
het duurt drie uur	it takes three hours		#	f	f	1064	time	2023-09-27 14:59:57.873874+01	\N
dragen	to carry/bear/wear	n/a	https://forvo.com/word/dragen/#nl	f	f	253	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
bevatten	contain	n/a	https://forvo.com/word/bevatten/#nl	f	f	429	\N	2023-09-27 14:59:57.873874+01	\N
reeks	range	n/a	https://forvo.com/word/reeks/#nl	f	f	891	\N	2023-09-27 14:59:57.873874+01	\N
lucht	air	n/a	https://forvo.com/word/lucht/#nl	f	f	56	nature	2023-09-27 14:59:57.873874+01	\N
de vader	the father	\N	https://forvo.com/word/vader/#nl	f	f	1542	family	2023-09-27 14:59:57.873874+01	\N
aangelegenheid	matter	n/a	https://forvo.com/word/aangelegenheid/#nl	f	f	529	\N	2023-09-27 14:59:57.873874+01	\N
vreemde valuta	foreign exchange		https://forvo.com/word/valuta/#nl	f	f	1003	\N	2023-09-27 14:59:57.873874+01	\N
vertellen	to tell	\N	https://forvo.com/word/vertellen/#nl	f	f	1638	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
de duif	the pigeon	\N	https://forvo.com/word/duif/#nl	f	f	1587	animals (1)	2023-09-27 14:59:57.873874+01	\N
de vis	the fish	\N	https://forvo.com/word/vis/#nl	f	f	1588	animals (1)	2023-09-27 14:59:57.873874+01	\N
brak	broke	n/a	https://forvo.com/word/brak/#nl	f	f	655	\N	2023-09-27 14:59:57.873874+01	\N
wakker	awake	\N	https://forvo.com/word/wakker/#nl	f	f	2074	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
experiment	experiment	n/a	https://forvo.com/word/experiment/#nl	f	f	689	\N	2023-09-27 14:59:57.873874+01	\N
nieuwe	new	n/a	https://forvo.com/word/nieuwe/#nl	f	f	103	\N	2023-09-27 14:59:57.873874+01	\N
zin	sentence	n/a	https://forvo.com/word/zin/#nl	f	f	132	grammar	2023-09-27 14:59:57.873874+01	\N
sneeuwen	to snow	\N	https://forvo.com/word/sneeuwen/#nl	f	f	1671	weather	2023-09-27 14:59:57.873874+01	\N
doos	box	n/a	https://forvo.com/word/doos/#nl	f	f	418	\N	2023-09-27 14:59:57.873874+01	\N
verhuizen	to move	\N	https://forvo.com/word/verhuizen/#nl	f	f	1769	moving/immigration	2023-09-27 14:59:57.873874+01	\N
dans	dance	n/a	https://forvo.com/word/dans/#nl	f	f	545	\N	2023-09-27 14:59:57.873874+01	\N
vrijdag	Friday	\N	https://forvo.com/word/vrijdag/#nl	f	f	1308	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
groen	green	\N	https://forvo.com/word/groen/#nl	f	f	1972	colors/shapes	2023-09-27 14:59:57.873874+01	\N
elke	every	n/a	https://forvo.com/word/elke/#nl	f	f	121	\N	2023-09-27 14:59:57.873874+01	\N
normaal	usually	\N	https://forvo.com/word/normaal/#nl	f	f	1957	adverbs	2023-09-27 14:59:57.873874+01	\N
vader	father	n/a	https://forvo.com/word/vader/#nl	f	f	101	family	2023-09-27 14:59:57.873874+01	\N
station	station	n/a	https://forvo.com/word/station/#nl	f	f	868	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de leerling	the scholar	\N	https://forvo.com/word/leerling/#nl	f	f	1132	professions	2023-09-27 14:59:57.873874+01	\N
de broek	the pants	\N	https://forvo.com/word/broek/#nl	f	t	1463	clothes	2023-09-27 14:59:57.873874+01	\N
kantoor	office	n/a	https://forvo.com/word/kantoor/#nl	f	t	604	job hunting/business	2023-09-27 14:59:57.873874+01	\N
vijftien	fifteen	\N	https://forvo.com/word/vijftien/#nl	f	t	1237	numbers/counting	2023-09-27 14:59:57.873874+01	\N
zuurstof	oxygen	n/a	https://forvo.com/word/zuurstof/#nl	t	f	902	tools/materials	2023-09-27 14:59:57.873874+01	\N
schip	ship	n/a	https://forvo.com/word/schip/#nl	f	t	335	Amsterdam	2023-09-27 14:59:57.873874+01	\N
hart	heart	n/a	https://forvo.com/word/hart/#nl	f	t	541	\N	2023-09-27 14:59:57.873874+01	\N
de belasting	the tax	\N	https://forvo.com/word/belasting/#nl	t	f	1532	job hunting/business	2023-09-27 14:59:57.873874+01	\N
breed	wide	\N	https://forvo.com/word/breed/#nl	t	f	1987	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
dank	thank	n/a	https://forvo.com/word/dank/#nl	f	t	912	\N	2023-09-27 14:59:57.873874+01	\N
mei	may	\N	https://forvo.com/word/mei/#nl	f	t	1317	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
avond	evening	\N	https://forvo.com/word/avond/#nl	f	t	1096	introductory	2023-09-27 14:59:57.873874+01	\N
segmenten	segment	n/a	https://forvo.com/word/segmenten/#nl	t	t	875	\N	2023-09-27 14:59:57.873874+01	\N
jij/je/u	you	\N	https://forvo.com/word/jij/#nl	f	t	1118	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
uit	out	n/a	https://forvo.com/word/uit/#nl	f	t	38	\N	2023-09-27 14:59:57.873874+01	\N
het insect	the insect	\N	https://forvo.com/word/insect/#nl	f	t	1590	animals (1)	2023-09-27 14:59:57.873874+01	\N
bos	forest	n/a	https://forvo.com/word/bos/#nl	f	t	553	nature	2023-09-27 14:59:57.873874+01	\N
slapen	to sleep	\N	https://forvo.com/word/slapen/#nl	f	t	1265	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
paragraaf	paragraph	n/a	https://forvo.com/word/paragraaf/#nl	f	t	714	grammar	2023-09-27 14:59:57.873874+01	\N
netto	net	\N	https://forvo.com/word/netto/#nl	f	t	1531	job hunting/business	2023-09-27 14:59:57.873874+01	\N
tot	until	\N	https://forvo.com/word/tot/#nl	f	t	1101	introductory	2023-09-27 14:59:57.873874+01	\N
het vierkant	the square	\N	https://forvo.com/word/vierkant/#nl	f	f	1969	colors/shapes	2023-09-27 14:59:57.873874+01	\N
materiaal	material	n/a	https://forvo.com/word/materiaal/#nl	f	f	551	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
maart	march	\N	https://forvo.com/word/maart/#nl	f	f	1315	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
berg	mountain	n/a	https://forvo.com/word/berg/#nl	f	f	262	geography	2023-09-27 14:59:57.873874+01	\N
omvatten	include	n/a	https://forvo.com/word/omvatten/#nl	f	f	532	\N	2023-09-27 14:59:57.873874+01	\N
kloof	divide	n/a	https://forvo.com/word/kloof/#nl	f	f	533	\N	2023-09-27 14:59:57.873874+01	\N
het paard	the horse	\N	https://forvo.com/word/paard/#nl	f	f	1576	animals (1)	2023-09-27 14:59:57.873874+01	\N
de ambulance	the ambulance	\N	https://forvo.com/word/ambulance/#nl	f	f	1729	doctor	2023-09-27 14:59:57.873874+01	\N
wortel	root	n/a	https://forvo.com/word/wortel/#nl	f	f	706	nature	2023-09-27 14:59:57.873874+01	\N
de stroopwafel	the syrup waffle	\N	https://forvo.com/word/stroopwafel/#nl	f	f	1171	food/drink	2023-09-27 14:59:57.873874+01	\N
de hoofdstad	the capital	\N	https://forvo.com/word/hoofdstad/#nl	f	f	1744	geography	2023-09-27 14:59:57.873874+01	\N
de elleboog	the elbow	\N	https://forvo.com/word/elleboog/#nl	f	f	1445	body	2023-09-27 14:59:57.873874+01	\N
het haar	the hair	\N	https://forvo.com/word/haar/#nl	f	f	1443	body	2023-09-27 14:59:57.873874+01	\N
de kous	the sock (long)	\N	https://forvo.com/word/kous/#nl	f	f	1470	clothes	2023-09-27 14:59:57.873874+01	\N
de dam	the dam	\N	https://forvo.com/word/dam/#nl	f	f	1759	geography	2023-09-27 14:59:57.873874+01	\N
twee	two	\N	https://forvo.com/word/twee/#nl	f	f	1224	numbers/counting	2023-09-27 14:59:57.873874+01	\N
de smaak	the taste	\N	https://forvo.com/word/smaak/#nl	f	f	1830	cooking	2023-09-27 14:59:57.873874+01	\N
de verblijfsvergunning	the residence permit	\N	https://forvo.com/word/verblijfsvergunning/#nl	f	f	1785	moving/immigration	2023-09-27 14:59:57.873874+01	\N
spoedig	soon	n/a	https://forvo.com/word/spoedig/#nl	f	f	316	\N	2023-09-27 14:59:57.873874+01	\N
verliefd	in love	\N	https://forvo.com/word/verliefd/#nl	f	f	1562	family	2023-09-27 14:59:57.873874+01	\N
verstuiken	to sprain	verb	https://forvo.com/word/verstuiken/#nl	f	f	1022	\N	2023-09-27 14:59:57.873874+01	\N
motor	engine	n/a	https://forvo.com/word/motor/#nl	f	f	546	\N	2023-09-27 14:59:57.873874+01	\N
huidig	current	\N	https://forvo.com/word/huidig/#nl	f	f	1705	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
vinden	to find, to think (have an opinion)	\N	https://forvo.com/word/vinden/#nl	f	f	1630	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
serveerster	waitress	\N	https://forvo.com/word/serveerster/#nl	f	f	2149	professions	2023-09-27 14:59:57.873874+01	\N
over	over/about	\N	https://forvo.com/word/over/#nl	f	f	1343	prepositions	2023-09-27 14:59:57.873874+01	\N
moeten	must / have to / should	\N	https://forvo.com/word/moeten/#nl	f	f	2096	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
venster	window	n/a	https://forvo.com/word/venster/#nl	f	f	556	household	2023-09-27 14:59:57.873874+01	\N
de arm	the arm	\N	https://forvo.com/word/arm/#nl	f	f	1444	body	2023-09-27 14:59:57.873874+01	\N
oceaan	ocean	n/a	https://forvo.com/word/oceaan/#nl	f	f	439	nature	2023-09-27 14:59:57.873874+01	\N
proberen	to try	\N	https://forvo.com/word/proberen/#nl	f	f	1639	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
bruin	brown	\N	https://forvo.com/word/bruin/#nl	f	f	1982	colors/shapes	2023-09-27 14:59:57.873874+01	\N
het kwartier	the quarter		https://forvo.com/word/kwartier/#nl	f	f	1054	time	2023-09-27 14:59:57.873874+01	\N
glimlach	smile	n/a	https://forvo.com/word/glimlach/#nl	f	f	698	\N	2023-09-27 14:59:57.873874+01	\N
de brug	the bridge	\N	https://forvo.com/word/brug/#nl	f	f	1397	Amsterdam	2023-09-27 14:59:57.873874+01	\N
het papier	the paper	\N	https://forvo.com/word/papier/#nl	f	f	1923	tools/materials	2023-09-27 14:59:57.873874+01	\N
dubbel	double	\N	https://forvo.com/word/dubbel/#nl	f	f	1691	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
de snor	the moustache	\N	https://forvo.com/word/snor/#nl	f	f	1458	body	2023-09-27 14:59:57.873874+01	\N
de paashaas	the Easter bunny	\N	https://forvo.com/word/paashaas/#nl	f	f	2013	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
het salaris	the salary	\N	https://forvo.com/word/salaris/#nl	f	f	1529	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de kok	the cook	\N	https://forvo.com/word/kok/#nl	f	f	1826	cooking	2023-09-27 14:59:57.873874+01	\N
de vesting	the fortress	\N	https://forvo.com/word/vesting/#nl	f	f	1751	geography	2023-09-27 14:59:57.873874+01	\N
angst	fear	n/a	https://forvo.com/word/angst/#nl	f	f	824	moods/emotions	2023-09-27 14:59:57.873874+01	\N
view	view	n/a	https://forvo.com/word/view/#nl	f	f	750	\N	2023-09-27 14:59:57.873874+01	\N
hear	hear	n/a	https://forvo.com/word/hear/#nl	f	f	266	\N	2023-09-27 14:59:57.873874+01	\N
worden	to become	\N	https://forvo.com/word/worden/#nl	f	f	1249	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
indien	if	n/a	https://forvo.com/word/indien/#nl	f	f	45	\N	2023-09-27 14:59:57.873874+01	\N
schijnen	to shine	\N	https://forvo.com/word/schijnen/#nl	f	f	1667	weather	2023-09-27 14:59:57.873874+01	\N
de neerslag	the precipitation	\N	https://forvo.com/word/neerslag/#nl	f	f	1669	weather	2023-09-27 14:59:57.873874+01	\N
de taal	the language	\N	https://forvo.com/word/taal/#nl	f	f	1363	hobbies	2023-09-27 14:59:57.873874+01	\N
verrast	surprised	\N	https://forvo.com/word/verrast/#nl	f	f	1811	moods/emotions	2023-09-27 14:59:57.873874+01	\N
wel	(confirmative)	\N	https://forvo.com/word/wel/#nl	f	f	1112	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
ouder	parent	n/a	https://forvo.com/word/ouder/#nl	f	f	854	family	2023-09-27 14:59:57.873874+01	\N
pak	suit	n/a	https://forvo.com/word/pak/#nl	f	f	847	clothes	2023-09-27 14:59:57.873874+01	\N
de apotheek	the pharmacy	\N	https://forvo.com/word/apotheek/#nl	f	f	1215	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
het zwembad	the swimming pool	\N	https://forvo.com/word/zwembad/#nl	f	f	1216	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de mond	the mouth	\N	https://forvo.com/word/mond/#nl	f	f	1436	body	2023-09-27 14:59:57.873874+01	\N
veld	field	n/a	https://forvo.com/word/veld/#nl	f	f	420	\N	2023-09-27 14:59:57.873874+01	\N
eerlijk	fair	n/a	https://forvo.com/word/eerlijk/#nl	f	f	646	\N	2023-09-27 14:59:57.873874+01	\N
stromen	flow	n/a	https://forvo.com/word/stromen/#nl	f	f	645	\N	2023-09-27 14:59:57.873874+01	\N
de behandeling	the treatment	\N	https://forvo.com/word/behandeling/#nl	f	f	1722	doctor	2023-09-27 14:59:57.873874+01	\N
de klok	the clock	noun	https://forvo.com/word/klok/#nl	f	f	1048	time	2023-09-27 14:59:57.873874+01	\N
toen	at that time (past)	\N	https://forvo.com/word/toen/#nl	f	f	1186	question words	2023-09-27 14:59:57.873874+01	\N
gedaan	done	n/a	https://forvo.com/word/gedaan/#nl	t	f	425	\N	2023-09-27 14:59:57.873874+01	\N
idee	idea	n/a	https://forvo.com/word/idee/#nl	f	t	260	\N	2023-09-27 14:59:57.873874+01	\N
de blouse (bloes)	the blouse, the shirt	\N	https://forvo.com/word/blouse/#nl	f	f	1477	clothes	2023-09-27 14:59:57.873874+01	\N
het visum	the visa	\N	https://forvo.com/word/visum/#nl	t	f	1782	moving/immigration	2023-09-27 14:59:57.873874+01	\N
wallen	fortified walls	\N	https://forvo.com/word/wallen/#nl	f	t	1752	geography	2023-09-27 14:59:57.873874+01	\N
de hamster	the hamster	\N	https://forvo.com/word/hamster/#nl	f	t	2029	animals (1)	2023-09-27 14:59:57.873874+01	\N
lopen	to walk, to run	\N	https://forvo.com/word/lopen/#nl	f	t	1247	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
schoen	shoe	n/a	https://forvo.com/word/schoen/#nl	f	t	966	clothes	2023-09-27 14:59:57.873874+01	\N
de metro	the metro	\N	https://forvo.com/word/metro/#nl	f	t	1205	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
ver	far	n/a	https://forvo.com/word/ver/#nl	f	t	237	\N	2023-09-27 14:59:57.873874+01	\N
de pindakaas	the peanut butter	\N	https://forvo.com/word/pindakaas/#nl	f	t	1155	food/drink	2023-09-27 14:59:57.873874+01	\N
de plaats	place/stead	n/a	https://forvo.com/word/plaats/#nl	f	f	108	geography	2023-09-27 14:59:57.873874+01	\N
terwijl	while	\N	https://forvo.com/word/terwijl/#nl	f	f	1187	question words	2023-09-27 14:59:57.873874+01	\N
rond	around	\N	https://forvo.com/word/rond/#nl	f	f	1348	prepositions	2023-09-27 14:59:57.873874+01	\N
morgen	morning/tomorrow	\N	https://forvo.com/word/morgen/#nl	f	f	1093	introductory	2023-09-27 14:59:57.873874+01	\N
gedachte	thought	n/a	https://forvo.com/word/gedachte/#nl	f	f	227	\N	2023-09-27 14:59:57.873874+01	\N
de onderbroek	the undershorts	\N	https://forvo.com/word/onderbroek/#nl	f	f	1483	clothes	2023-09-27 14:59:57.873874+01	\N
de bh	the bra	\N	https://forvo.com/word/bh/#nl	f	f	1484	clothes	2023-09-27 14:59:57.873874+01	\N
leven	life	n/a	https://forvo.com/word/leven/#nl	f	f	249	\N	2023-09-27 14:59:57.873874+01	\N
in staat	able	n/a	#	f	f	423	\N	2023-09-27 14:59:57.873874+01	\N
vordering	claim	n/a	https://forvo.com/word/vordering/#nl	f	f	1000	\N	2023-09-27 14:59:57.873874+01	\N
was	was	n/a	https://forvo.com/word/was/#nl	f	f	7	\N	2023-09-27 14:59:57.873874+01	\N
vergelijken	to compare	\N	https://forvo.com/word/vergelijken/#nl	f	f	1896	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
de schoen	the shoe	\N	https://forvo.com/word/schoen/#nl	f	f	1471	clothes	2023-09-27 14:59:57.873874+01	\N
geval	case	n/a	https://forvo.com/word/geval/#nl	f	f	656	\N	2023-09-27 14:59:57.873874+01	\N
toetreden tot	join	n/a	https://forvo.com/word/toetreden/#nl	f	f	618	\N	2023-09-27 14:59:57.873874+01	\N
buis	tube	n/a	https://forvo.com/word/buis/#nl	f	f	820	\N	2023-09-27 14:59:57.873874+01	\N
gekocht	bought	n/a	https://forvo.com/word/gekocht/#nl	f	f	929	\N	2023-09-27 14:59:57.873874+01	\N
hier	here	\N	https://forvo.com/word/hier/#nl	f	f	1182	question words	2023-09-27 14:59:57.873874+01	\N
schoppen	to kick	\N	https://forvo.com/word/schoppen/#nl	f	f	1613	football	2023-09-27 14:59:57.873874+01	\N
het raam	the window	\N	https://forvo.com/word/raam/#nl	f	f	1409	household	2023-09-27 14:59:57.873874+01	\N
duidelijk	clear	\N	https://forvo.com/word/duidelijk/#nl	f	f	1700	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
roep	call	n/a	https://forvo.com/word/roep/#nl	f	f	193	\N	2023-09-27 14:59:57.873874+01	\N
boord	board	n/a	https://forvo.com/word/boord/#nl	f	f	570	\N	2023-09-27 14:59:57.873874+01	\N
springen	jump	n/a	https://forvo.com/word/springen/#nl	f	f	701	\N	2023-09-27 14:59:57.873874+01	\N
de ziektekostenverzekering	the health insurance	\N	https://forvo.com/word/ziektekostenverzekering/#nl	f	f	1736	doctor	2023-09-27 14:59:57.873874+01	\N
sommige	some	n/a	https://forvo.com/word/sommige/#nl	f	f	24	\N	2023-09-27 14:59:57.873874+01	\N
sterk	strong	\N	https://forvo.com/word/sterk/#nl	f	f	2070	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
het paleis	the palace	\N	https://forvo.com/word/paleis/#nl	f	f	1388	Amsterdam	2023-09-27 14:59:57.873874+01	\N
pont	the ferry	\N	https://forvo.com/word/pont/#nl	f	f	1389	Amsterdam	2023-09-27 14:59:57.873874+01	\N
reizen	to travel	\N	https://forvo.com/word/reizen/#nl	f	f	1356	hobbies	2023-09-27 14:59:57.873874+01	\N
dus	so/thus	\N	https://forvo.com/word/dus/#nl	f	f	1953	adverbs	2023-09-27 14:59:57.873874+01	\N
bijten	to bite	\N	https://forvo.com/word/bijten/#nl	f	f	1907	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
uitvinden	invent	n/a	https://forvo.com/word/uitvinden/#nl	f	f	971	\N	2023-09-27 14:59:57.873874+01	\N
bepalen	determine	n/a	https://forvo.com/word/bepalen/#nl	f	f	974	\N	2023-09-27 14:59:57.873874+01	\N
hij is jarig	it’s his birthday	\N	https://forvo.com/word/jarig/#nl	f	f	1379	hobbies	2023-09-27 14:59:57.873874+01	\N
eerste	first	n/a	https://forvo.com/word/eerste/#nl	f	f	194	numbers/counting	2023-09-27 14:59:57.873874+01	\N
verwijzen	to refer	\N	https://forvo.com/word/verwijzen/#nl	f	f	1732	doctor	2023-09-27 14:59:57.873874+01	\N
het onderzoek	the check-up	\N	https://forvo.com/word/onderzoek/#nl	f	f	1733	doctor	2023-09-27 14:59:57.873874+01	\N
doen	to do	\N	https://forvo.com/word/doen/#nl	f	f	1487	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
binnen	inside	\N	https://forvo.com/word/binnen/#nl	f	f	1345	prepositions	2023-09-27 14:59:57.873874+01	\N
sprak	spoke	n/a	https://forvo.com/word/sprak/#nl	f	f	786	\N	2023-09-27 14:59:57.873874+01	\N
toonhoogte	pitch	n/a	https://forvo.com/word/toonhoogte/#nl	f	f	931	\N	2023-09-27 14:59:57.873874+01	\N
bereiden	prepare	n/a	https://forvo.com/word/bereiden/#nl	f	f	995	\N	2023-09-27 14:59:57.873874+01	\N
verleden	past	n/a	https://forvo.com/word/verleden/#nl	f	f	585	\N	2023-09-27 14:59:57.873874+01	\N
de ezel	the donkey	\N	https://forvo.com/word/ezel/#nl	f	f	1578	animals (1)	2023-09-27 14:59:57.873874+01	\N
glans	shine	n/a	https://forvo.com/word/glans/#nl	f	f	985	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
de verzekering	the insurance	\N	https://forvo.com/word/verzekering/#nl	f	f	1735	doctor	2023-09-27 14:59:57.873874+01	\N
de douche	the shower	\N	https://forvo.com/word/douche/#nl	f	f	1426	household	2023-09-27 14:59:57.873874+01	\N
de kaars	the candle	\N	https://forvo.com/word/kaars/#nl	f	f	2024	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
terug	back	\N	https://forvo.com/word/terug/#nl	f	f	1966	adverbs	2023-09-27 14:59:57.873874+01	\N
donderdag	Thursday	\N	https://forvo.com/word/donderdag/#nl	f	t	1307	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
het middageten/de lunch	the lunch	\N	https://forvo.com/word/middageten/#nl	f	t	1823	cooking	2023-09-27 14:59:57.873874+01	\N
zelf	self	n/a	https://forvo.com/word/zelf/#nl	f	t	99	\N	2023-09-27 14:59:57.873874+01	\N
de kip	the chicken	\N	https://forvo.com/word/kip/#nl	f	t	1579	animals (1)	2023-09-27 14:59:57.873874+01	\N
de feestdag	the public holiday	\N	https://forvo.com/word/feestdag/#nl	f	t	1999	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
totaal	total	n/a	https://forvo.com/word/totaal/#nl	f	t	944	\N	2023-09-27 14:59:57.873874+01	\N
half een	half past twelve		#	f	t	1053	time	2023-09-27 14:59:57.873874+01	\N
kijken	to look/to watch	\N	https://forvo.com/word/kijken/#nl	f	t	1262	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
leeg	empty	\N	https://forvo.com/word/leeg/#nl	f	t	1698	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
aanraken	to touch	n/a	https://forvo.com/word/aanraken/#nl	f	f	629	\N	2023-09-27 14:59:57.873874+01	\N
spel	game	n/a	https://forvo.com/word/spel/#nl	f	t	385	\N	2023-09-27 14:59:57.873874+01	\N
straight/recht	straight	n/a	https://forvo.com/word/straight/#nl	f	t	667	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
oor	ear	n/a	https://forvo.com/word/oor/#nl	t	t	652	body	2023-09-27 14:59:57.873874+01	\N
selecteren	select	n/a	https://forvo.com/word/selecteren/#nl	t	t	989	\N	2023-09-27 14:59:57.873874+01	\N
de soep	the soup	\N	https://forvo.com/word/soep/#nl	f	t	1863	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
klasse	class	n/a	https://forvo.com/word/klasse/#nl	t	f	330	\N	2023-09-27 14:59:57.873874+01	\N
het feest	the party	\N	https://forvo.com/word/feest/#nl	f	t	1997	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
deal	deal	n/a	https://forvo.com/word/deal/#nl	f	t	961	\N	2023-09-27 14:59:57.873874+01	\N
de hoed	the hat	\N	https://forvo.com/word/hoed/#nl	f	t	1485	clothes	2023-09-27 14:59:57.873874+01	\N
Show	show	n/a	https://forvo.com/word/Show/#nl	f	t	120	\N	2023-09-27 14:59:57.873874+01	\N
beginnen	to begin	\N	https://forvo.com/word/beginnen/#nl	f	t	1488	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
kon	could	n/a	https://forvo.com/word/kon/#nl	f	t	179	\N	2023-09-27 14:59:57.873874+01	\N
oude	old	n/a	https://forvo.com/word/oude/#nl	f	t	148	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
het medicijn	the medication	\N	https://forvo.com/word/medicijn/#nl	f	t	1737	doctor	2023-09-27 14:59:57.873874+01	\N
het hoofd	the head	\N	https://forvo.com/word/hoofd/#nl	f	t	1434	body	2023-09-27 14:59:57.873874+01	\N
bereiken	to reach	UvA A2 Course/UvA B1A Course CH1	https://forvo.com/word/bereiken/#nl	t	f	467	\N	2023-09-27 14:59:57.873874+01	\N
sympathiek	sympathetic	\N	https://forvo.com/word/sympathiek/#nl	f	f	1817	moods/emotions	2023-09-27 14:59:57.873874+01	\N
geleid	led	n/a	https://forvo.com/word/geleid/#nl	f	f	930	\N	2023-09-27 14:59:57.873874+01	\N
de bes	the berry	\N	https://forvo.com/word/bes/#nl	f	f	1879	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
het bericht	the message	\N	https://forvo.com/word/bericht/#nl	f	f	1658	weather	2023-09-27 14:59:57.873874+01	\N
de aardappeleter	the potato-eater	\N	https://forvo.com/word/aardappeleter/#nl	f	f	1160	food/drink	2023-09-27 14:59:57.873874+01	\N
Overleg	talk	n/a	https://forvo.com/word/Overleg/#nl	f	f	314	\N	2023-09-27 14:59:57.873874+01	\N
de tand	the tooth	\N	https://forvo.com/word/tand/#nl	f	f	1437	body	2023-09-27 14:59:57.873874+01	\N
wonen	to live	\N	https://forvo.com/word/wonen/#nl	f	f	1387	Amsterdam	2023-09-27 14:59:57.873874+01	\N
bij	at, near	\N	https://forvo.com/word/bij/#nl	f	f	1344	prepositions	2023-09-27 14:59:57.873874+01	\N
volgende	next	\N	https://forvo.com/word/volgende/#nl	f	f	1973	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
blauw	blue	\N	https://forvo.com/word/blauw/#nl	f	f	1974	colors/shapes	2023-09-27 14:59:57.873874+01	\N
geel	yellow	\N	https://forvo.com/word/geel/#nl	f	f	1975	colors/shapes	2023-09-27 14:59:57.873874+01	\N
vertrekken	to leave	\N	https://forvo.com/word/vertrekken/#nl	f	f	1899	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
nam	took	n/a	https://forvo.com/word/nam/#nl	f	f	254	\N	2023-09-27 14:59:57.873874+01	\N
natie	nation	n/a	https://forvo.com/word/natie/#nl	f	f	669	\N	2023-09-27 14:59:57.873874+01	\N
het rijbewijs	the driving license	\N	https://forvo.com/word/rijbewijs/#nl	f	f	1784	moving/immigration	2023-09-27 14:59:57.873874+01	\N
Zwarte Piet	(Black Pete)	\N	#	f	f	2003	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
kans	chance	n/a	https://forvo.com/word/kans/#nl	f	f	980	\N	2023-09-27 14:59:57.873874+01	\N
zijde	silk	noun	https://forvo.com/word/zijde/#nl	f	f	1017	\N	2023-09-27 14:59:57.873874+01	\N
leugen	lie	n/a	https://forvo.com/word/leugen/#nl	f	f	746	\N	2023-09-27 14:59:57.873874+01	\N
het slot	the lock	\N	https://forvo.com/word/slot/#nl	f	f	1917	tools/materials	2023-09-27 14:59:57.873874+01	\N
geheel	whole	n/a	https://forvo.com/word/geheel/#nl	f	f	349	\N	2023-09-27 14:59:57.873874+01	\N
snijden	to cut	\N	https://forvo.com/word/snijden/#nl	f	f	1496	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
vallen	to fall	\N	https://forvo.com/word/vallen/#nl	f	f	1498	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
bijzonder	special/particular	\N	https://forvo.com/word/bijzonder/#nl	f	f	2058	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
verdrietig	sad	\N	https://forvo.com/word/verdrietig/#nl	f	f	1799	moods/emotions	2023-09-27 14:59:57.873874+01	\N
het humeur	the mood	\N	https://forvo.com/word/humeur/#nl	f	f	1792	moods/emotions	2023-09-27 14:59:57.873874+01	\N
wat	what	\N	https://forvo.com/word/wat/#nl	f	f	1175	question words	2023-09-27 14:59:57.873874+01	\N
het huisdier	the pet	\N	https://forvo.com/word/huisdier/#nl	f	f	1568	animals (1)	2023-09-27 14:59:57.873874+01	\N
studie	study	n/a	https://forvo.com/word/studie/#nl	f	f	212	\N	2023-09-27 14:59:57.873874+01	\N
de zonnebril	the sunglasses	\N	https://forvo.com/word/zonnebril/#nl	f	f	1441	body	2023-09-27 14:59:57.873874+01	\N
belangrijkste	main	n/a	https://forvo.com/word/belangrijkste/#nl	f	f	274	\N	2023-09-27 14:59:57.873874+01	\N
de ooievaar	the stork	\N	https://forvo.com/word/ooievaar/#nl	f	f	1585	animals (1)	2023-09-27 14:59:57.873874+01	\N
sinds	since	\N	https://forvo.com/word/sinds/#nl	f	f	1349	prepositions	2023-09-27 14:59:57.873874+01	\N
de schaduw	the shadow / shade	\N	https://forvo.com/word/schaduw/#nl	f	f	2095	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
uitgeven	to spend	\N	https://forvo.com/word/uitgeven/#nl	f	f	1648	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
integreren	to integrate (in practice)	\N	https://forvo.com/word/integreren/#nl	f	f	1788	moving/immigration	2023-09-27 14:59:57.873874+01	\N
momenteel	moment	n/a	https://forvo.com/word/momenteel/#nl	f	f	661	\N	2023-09-27 14:59:57.873874+01	\N
de boterham	the slice of bread	\N	https://forvo.com/word/boterham/#nl	f	f	1152	food/drink	2023-09-27 14:59:57.873874+01	\N
been	leg	n/a	https://forvo.com/word/been/#nl	f	f	563	body	2023-09-27 14:59:57.873874+01	\N
problemen	trouble	n/a	https://forvo.com/word/problemen/#nl	f	f	612	\N	2023-09-27 14:59:57.873874+01	\N
hoe laat?	how late?	question	#	f	f	1046	time	2023-09-27 14:59:57.873874+01	\N
luisteren	to listen	\N	https://forvo.com/word/luisteren/#nl	f	f	1260	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
uitgeschakeld	off	n/a	https://forvo.com/word/uitgeschakeld/#nl	f	f	86	\N	2023-09-27 14:59:57.873874+01	\N
pick	pick	n/a	https://forvo.com/word/pick/#nl	f	f	512	\N	2023-09-27 14:59:57.873874+01	\N
wiens	whose	n/a	https://forvo.com/word/wiens/#nl	f	f	777	\N	2023-09-27 14:59:57.873874+01	\N
krijgen	to get, to receive	\N	https://forvo.com/word/krijgen/#nl	f	f	1254	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
eten	to eat	\N	https://forvo.com/word/eten/#nl	f	f	1255	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
break	break	n/a	https://forvo.com/word/break/#nl	f	f	621	\N	2023-09-27 14:59:57.873874+01	\N
de rondvaart	the canal cruise	\N	https://forvo.com/word/rondvaart/#nl	f	f	1390	Amsterdam	2023-09-27 14:59:57.873874+01	\N
vangst	catch	n/a	https://forvo.com/word/vangst/#nl	f	f	566	\N	2023-09-27 14:59:57.873874+01	\N
kiezen	to choose	\N	https://forvo.com/word/kiezen/#nl	f	f	1887	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
eet smakelijk / smakelijk eten	enjoy your meal	\N	https://forvo.com/word/smakelijk/#nl	f	f	1849	cooking	2023-09-27 14:59:57.873874+01	\N
begrijpen	to understand	\N	https://forvo.com/word/begrijpen/#nl	f	f	1888	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
trouwen	to marry	\N	https://forvo.com/word/trouwen/#nl	f	f	1564	family	2023-09-27 14:59:57.873874+01	\N
rekken	stretch	n/a	https://forvo.com/word/rekken/#nl	f	f	983	\N	2023-09-27 14:59:57.873874+01	\N
de supermarkt	the supermarket	\N	https://forvo.com/word/supermarkt/#nl	f	f	1213	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
minuscuul	tiny	n/a	https://forvo.com/word/minuscuul/#nl	f	f	683	\N	2023-09-27 14:59:57.873874+01	\N
moet	must	n/a	https://forvo.com/word/moet/#nl	f	t	73	\N	2023-09-27 14:59:57.873874+01	\N
licht	light	\N	https://forvo.com/word/licht/#nl	t	f	1287	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
de ui	the onion	\N	https://forvo.com/word/ui/#nl	t	f	1861	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
geloven	to believe	\N	https://forvo.com/word/geloven/#nl	t	f	1489	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
enthousiast	enthusiastic	\N	https://forvo.com/word/enthousiast/#nl	t	f	1812	moods/emotions	2023-09-27 14:59:57.873874+01	\N
het hout	the wood	\N	https://forvo.com/word/hout/#nl	t	f	1929	tools/materials	2023-09-27 14:59:57.873874+01	\N
vandaag	today	\N	https://forvo.com/word/vandaag/#nl	f	t	1662	weather	2023-09-27 14:59:57.873874+01	\N
voelen	to feel, to touch	\N	https://forvo.com/word/voelen/#nl	f	t	1499	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
het paspoort	the passport	\N	https://forvo.com/word/paspoort/#nl	f	t	1779	moving/immigration	2023-09-27 14:59:57.873874+01	\N
molecuul	molecule	n/a	https://forvo.com/word/molecuul/#nl	f	t	988	nature	2023-09-27 14:59:57.873874+01	\N
vergissen	to be mistaken	UvA A2 Course	https://forvo.com/word/vergissen/#nl	f	f	1897	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
miljoen	million	\N	https://forvo.com/word/miljoen/#nl	f	t	1246	numbers/counting	2023-09-27 14:59:57.873874+01	\N
drie	three	\N	https://forvo.com/word/drie/#nl	f	t	1225	numbers/counting	2023-09-27 14:59:57.873874+01	\N
de rivier	the river	\N	https://forvo.com/word/rivier/#nl	f	t	1757	geography	2023-09-27 14:59:57.873874+01	\N
honderd	hundred	\N	https://forvo.com/word/honderd/#nl	f	t	1243	numbers/counting	2023-09-27 14:59:57.873874+01	\N
ik begrijp het niet	I don’t understand	\N	#	f	t	1889	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
aarde	earth	n/a	https://forvo.com/word/aarde/#nl	f	f	100	nature	2023-09-27 14:59:57.873874+01	\N
vergadering	meeting	\N	https://forvo.com/word/vergadering/#nl	f	f	2141	job hunting/business	2023-09-27 14:59:57.873874+01	\N
het stadion	the stadium	\N	https://forvo.com/word/stadion/#nl	f	f	1401	Amsterdam	2023-09-27 14:59:57.873874+01	\N
het gerecht	the dish	\N	https://forvo.com/word/gerecht/#nl	f	f	1827	cooking	2023-09-27 14:59:57.873874+01	\N
de oom	the uncle	\N	https://forvo.com/word/oom/#nl	f	f	1551	family	2023-09-27 14:59:57.873874+01	\N
katoen	cotton	n/a	https://forvo.com/word/katoen/#nl	f	f	972	tools/materials	2023-09-27 14:59:57.873874+01	\N
gelijkaardige	similar	n/a	https://forvo.com/word/gelijkaardige/#nl	f	f	924	\N	2023-09-27 14:59:57.873874+01	\N
gezicht	face	n/a	https://forvo.com/word/gezicht/#nl	f	f	272	body	2023-09-27 14:59:57.873874+01	\N
wetenschap	science	n/a	https://forvo.com/word/wetenschap/#nl	f	f	255	\N	2023-09-27 14:59:57.873874+01	\N
het hart	the heart	\N	https://forvo.com/word/hart/#nl	f	f	1459	body	2023-09-27 14:59:57.873874+01	\N
de kleding	the clothing	\N	https://forvo.com/word/kleding/#nl	f	f	1461	clothes	2023-09-27 14:59:57.873874+01	\N
de kledingwinkel	the clothes shop	\N	https://forvo.com/word/kledingwinkel/#nl	f	f	1462	clothes	2023-09-27 14:59:57.873874+01	\N
hill	hill	n/a	https://forvo.com/word/hill/#nl	f	f	725	nature	2023-09-27 14:59:57.873874+01	\N
het ei	the egg	\N	https://forvo.com/word/ei/#nl	f	f	1862	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
begin	start	n/a	https://forvo.com/word/begin/#nl	f	f	233	\N	2023-09-27 14:59:57.873874+01	\N
neus	nose	n/a	https://forvo.com/word/neus/#nl	f	f	997	body	2023-09-27 14:59:57.873874+01	\N
arm	arm	n/a	https://forvo.com/word/arm/#nl	f	f	548	body	2023-09-27 14:59:57.873874+01	\N
speciaal	special	\N	https://forvo.com/word/speciaal/#nl	f	f	1699	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
zwart	black	\N	https://forvo.com/word/zwart/#nl	f	f	1979	colors/shapes	2023-09-27 14:59:57.873874+01	\N
grijs	grey	\N	https://forvo.com/word/grijs/#nl	f	f	1981	colors/shapes	2023-09-27 14:59:57.873874+01	\N
gemaakt	made	n/a	https://forvo.com/word/gemaakt/#nl	f	f	109	\N	2023-09-27 14:59:57.873874+01	\N
arts	doctor	n/a	https://forvo.com/word/arts/#nl	f	f	765	professions	2023-09-27 14:59:57.873874+01	\N
wensen	wish	n/a	https://forvo.com/word/wensen/#nl	f	f	568	\N	2023-09-27 14:59:57.873874+01	\N
roze	pink	\N	https://forvo.com/word/roze/#nl	f	f	1983	colors/shapes	2023-09-27 14:59:57.873874+01	\N
het kantoor	the office	\N	https://forvo.com/word/kantoor/#nl	f	f	1211	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
punaises	thumbtacks	noun	https://forvo.com/word/punaises/#nl	f	f	1027	tools/materials	2023-09-27 14:59:57.873874+01	\N
jonge	young	n/a	https://forvo.com/word/jonge/#nl	f	f	306	\N	2023-09-27 14:59:57.873874+01	\N
voorkomen	occur	n/a	https://forvo.com/word/voorkomen/#nl	f	f	887	\N	2023-09-27 14:59:57.873874+01	\N
diepe	deep	n/a	https://forvo.com/word/diepe/#nl	f	f	364	\N	2023-09-27 14:59:57.873874+01	\N
het idee	the idea	\N	https://forvo.com/word/idee/#nl	f	f	2132	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
al, reeds	already	\N	https://forvo.com/word/al/#nl	f	f	1944	adverbs	2023-09-27 14:59:57.873874+01	\N
verloren	lost	n/a	https://forvo.com/word/verloren/#nl	f	f	636	\N	2023-09-27 14:59:57.873874+01	\N
rustig	quiet	n/a	https://forvo.com/word/rustig/#nl	f	f	681	\N	2023-09-27 14:59:57.873874+01	\N
zoals	like	n/a	https://forvo.com/word/zoals/#nl	f	f	165	\N	2023-09-27 14:59:57.873874+01	\N
de identiteitskaart	the identity card	\N	https://forvo.com/word/identiteitskaart/#nl	f	f	1783	moving/immigration	2023-09-27 14:59:57.873874+01	\N
het bad	the bath tub	\N	https://forvo.com/word/bad/#nl	f	f	1427	household	2023-09-27 14:59:57.873874+01	\N
levering	supply	n/a	https://forvo.com/word/levering/#nl	f	f	776	\N	2023-09-27 14:59:57.873874+01	\N
mij	me	n/a	https://forvo.com/word/mij/#nl	f	f	123	\N	2023-09-27 14:59:57.873874+01	\N
graad	degree	n/a	https://forvo.com/word/graad/#nl	f	f	880	\N	2023-09-27 14:59:57.873874+01	\N
geven	to give, indicate	\N	https://forvo.com/word/geven/#nl	f	f	1637	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
na	after	\N	https://forvo.com/word/na/#nl	f	f	1352	prepositions	2023-09-27 14:59:57.873874+01	\N
hoeveel	how much	\N	https://forvo.com/word/hoeveel/#nl	f	f	1190	question words	2023-09-27 14:59:57.873874+01	\N
het hert	the deer	\N	https://forvo.com/word/hert/#nl	f	f	1589	animals (1)	2023-09-27 14:59:57.873874+01	\N
de boot	the boat	\N	https://forvo.com/word/boot/#nl	f	f	1206	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de zaak	the company	\N	https://forvo.com/word/zaak/#nl	f	f	1528	job hunting/business	2023-09-27 14:59:57.873874+01	\N
tafel	table	n/a	https://forvo.com/word/tafel/#nl	f	f	473	household	2023-09-27 14:59:57.873874+01	\N
afwerking	finish	n/a	https://forvo.com/word/afwerking/#nl	f	f	594	\N	2023-09-27 14:59:57.873874+01	\N
vorm	shape/form	n/a	https://forvo.com/word/vorm/#nl	f	f	386	colors/shapes	2023-09-27 14:59:57.873874+01	\N
regel	rule	n/a	https://forvo.com/word/regel/#nl	f	f	496	\N	2023-09-27 14:59:57.873874+01	\N
het paasei	the Easter egg	\N	https://forvo.com/word/paasei/#nl	f	f	2014	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
het weerbericht	the weather forecast	\N	https://forvo.com/word/weerbericht/#nl	f	f	1657	weather	2023-09-27 14:59:57.873874+01	\N
lekker weer, hè	nice weather isn’t it?	\N	#	f	f	1659	weather	2023-09-27 14:59:57.873874+01	\N
tweehonderd	two hundred	\N	https://forvo.com/word/tweehonderd/#nl	f	f	1244	numbers/counting	2023-09-27 14:59:57.873874+01	\N
zullen	will	\N	https://forvo.com/word/zullen/#nl	f	t	1906	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
Amsterdam	Amsterdam	\N	https://forvo.com/word/Amsterdam/#nl	f	t	1383	Amsterdam	2023-09-27 14:59:57.873874+01	\N
blad	sheet	n/a	https://forvo.com/word/blad/#nl	t	f	857	\N	2023-09-27 14:59:57.873874+01	\N
laten zien	to show	\N	https://forvo.com/word/laten/#nl	t	f	1641	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
stoom	steam	n/a	https://forvo.com/word/stoom/#nl	t	t	892	tools/materials	2023-09-27 14:59:57.873874+01	\N
zeker	(for) sure	\N	https://forvo.com/word/zeker/#nl	f	t	1660	weather	2023-09-27 14:59:57.873874+01	\N
twaalf	twelve	\N	https://forvo.com/word/twaalf/#nl	t	t	1234	numbers/counting	2023-09-27 14:59:57.873874+01	\N
schilderij	(a) painting	\N	https://forvo.com/word/schilderij/#nl	t	f	2151	hobbies	2023-09-27 14:59:57.873874+01	\N
de kameel	the camel	\N	https://forvo.com/word/kameel/#nl	t	f	2052	animals (2)	2023-09-27 14:59:57.873874+01	\N
de leeftijd	the age	\N	https://forvo.com/word/leeftijd/#nl	f	t	2125	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
de verrassing	surprise	noun	https://forvo.com/word/verrassing/#nl	f	f	1029	moods/emotions	2023-09-27 14:59:57.873874+01	\N
buiten	outside	\N	https://forvo.com/word/buiten/#nl	f	t	1346	prepositions	2023-09-27 14:59:57.873874+01	\N
het geld	the money	\N	https://forvo.com/word/geld/#nl	f	t	2105	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
luid	loud	n/a	https://forvo.com/word/luid/#nl	f	t	663	\N	2023-09-27 14:59:57.873874+01	\N
in	in	\N	https://forvo.com/word/in/#nl	f	t	1332	prepositions	2023-09-27 14:59:57.873874+01	\N
straat	street	n/a	https://forvo.com/word/straat/#nl	f	t	351	\N	2023-09-27 14:59:57.873874+01	\N
het dorp	the village	\N	https://forvo.com/word/dorp/#nl	f	t	1745	geography	2023-09-27 14:59:57.873874+01	\N
zachte	gentle/soft	n/a	https://forvo.com/word/zachte/#nl	f	t	799	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
ging	went	n/a	https://forvo.com/word/ging/#nl	t	t	83	\N	2023-09-27 14:59:57.873874+01	\N
de kamer	the room	\N	https://forvo.com/word/kamer/#nl	f	t	1420	household	2023-09-27 14:59:57.873874+01	\N
figuur	figure	n/a	https://forvo.com/word/figuur/#nl	f	t	416	\N	2023-09-27 14:59:57.873874+01	\N
afbeelding	picture/image	n/a	https://forvo.com/word/afbeelding/#nl	f	t	89	\N	2023-09-27 14:59:57.873874+01	\N
toets	test	n/a	https://forvo.com/word/toets/#nl	f	f	370	\N	2023-09-27 14:59:57.873874+01	\N
rij	row	n/a	https://forvo.com/word/rij/#nl	f	f	606	\N	2023-09-27 14:59:57.873874+01	\N
tijdens	during	n/a	https://forvo.com/word/tijdens/#nl	f	f	457	\N	2023-09-27 14:59:57.873874+01	\N
dun	thin	\N	https://forvo.com/word/dun/#nl	f	f	1986	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
waarnemen	observe	n/a	https://forvo.com/word/waarnemen/#nl	f	f	665	\N	2023-09-27 14:59:57.873874+01	\N
natuur	nature	n/a	https://forvo.com/word/natuur/#nl	f	f	890	nature	2023-09-27 14:59:57.873874+01	\N
uitschakelen	to turn off	\N	https://forvo.com/word/uitschakelen/#nl	f	f	2148	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
de kleur	the colour	\N	https://forvo.com/word/kleur/#nl	f	f	1967	colors/shapes	2023-09-27 14:59:57.873874+01	\N
juist	correct	\N	https://forvo.com/word/juist/#nl	f	f	1707	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
pagina	page	n/a	https://forvo.com/word/pagina/#nl	f	f	205	\N	2023-09-27 14:59:57.873874+01	\N
regio	region	n/a	https://forvo.com/word/regio/#nl	f	f	521	\N	2023-09-27 14:59:57.873874+01	\N
de boer	the farmer	\N	https://forvo.com/word/boer/#nl	f	f	1136	professions	2023-09-27 14:59:57.873874+01	\N
de visser	the fisherman	\N	https://forvo.com/word/visser/#nl	f	f	1137	professions	2023-09-27 14:59:57.873874+01	\N
de advocaat	the lawyer	\N	https://forvo.com/word/advocaat/#nl	f	f	1138	professions	2023-09-27 14:59:57.873874+01	\N
de dokter	the doctor	\N	https://forvo.com/word/dokter/#nl	f	f	1139	professions	2023-09-27 14:59:57.873874+01	\N
vertelde	told	n/a	https://forvo.com/word/vertelde/#nl	f	f	344	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
de knoflook	the garlic	\N	https://forvo.com/word/knoflook/#nl	f	f	1857	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
de sla	the lettuce	\N	https://forvo.com/word/sla/#nl	f	f	1858	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
de sinaasappel	the orange	\N	https://forvo.com/word/sinaasappel/#nl	f	f	1873	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
de afspraak	the appointment	\N	https://forvo.com/word/afspraak/#nl	f	f	1730	doctor	2023-09-27 14:59:57.873874+01	\N
de verwijsbrief	the referral letter	\N	https://forvo.com/word/verwijsbrief/#nl	f	f	1731	doctor	2023-09-27 14:59:57.873874+01	\N
december	December	\N	https://forvo.com/word/december/#nl	f	f	1324	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
herfst	autumn	\N	https://forvo.com/word/herfst/#nl	f	f	1328	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
naar	to	\N	https://forvo.com/word/naar/#nl	f	f	1331	prepositions	2023-09-27 14:59:57.873874+01	\N
beschermen	protect	n/a	https://forvo.com/word/beschermen/#nl	f	f	767	\N	2023-09-27 14:59:57.873874+01	\N
achter	behind	\N	https://forvo.com/word/achter/#nl	f	f	1334	prepositions	2023-09-27 14:59:57.873874+01	\N
zielig	pathetic	\N	https://forvo.com/word/zielig/#nl	f	f	1818	moods/emotions	2023-09-27 14:59:57.873874+01	\N
eenzame	lone	n/a	https://forvo.com/word/eenzame/#nl	f	f	562	\N	2023-09-27 14:59:57.873874+01	\N
schelp	shell	n/a	https://forvo.com/word/schelp/#nl	f	f	900	\N	2023-09-27 14:59:57.873874+01	\N
van	from/of	\N	https://forvo.com/word/van/#nl	f	f	1330	prepositions	2023-09-27 14:59:57.873874+01	\N
de opa	the grandfather	\N	https://forvo.com/word/opa/#nl	f	f	1548	family	2023-09-27 14:59:57.873874+01	\N
het pensioen	the pension	\N	https://forvo.com/word/pensioen/#nl	f	f	1535	job hunting/business	2023-09-27 14:59:57.873874+01	\N
tijd	time	n/a	https://forvo.com/word/tijd/#nl	f	f	44	time	2023-09-27 14:59:57.873874+01	\N
de verjaardag	the birthday	\N	https://forvo.com/word/verjaardag/#nl	f	f	2022	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
uitgaan	to go out	\N	https://forvo.com/word/uitgaan/#nl	f	f	1372	hobbies	2023-09-27 14:59:57.873874+01	\N
beschikbaar	available	\N	https://forvo.com/word/beschikbaar/#nl	f	f	1702	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
waarschijnlijk	probable	\N	https://forvo.com/word/waarschijnlijk/#nl	f	f	1703	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
schaal	scale	n/a	https://forvo.com/word/schaal/#nl	f	f	662	\N	2023-09-27 14:59:57.873874+01	\N
staal	steel	n/a	https://forvo.com/word/staal/#nl	f	f	921	tools/materials	2023-09-27 14:59:57.873874+01	\N
langzaam	slow	n/a	https://forvo.com/word/langzaam/#nl	f	f	486	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
de vinger	the finger	\N	https://forvo.com/word/vinger/#nl	f	f	1447	body	2023-09-27 14:59:57.873874+01	\N
de lucht	the air	\N	https://forvo.com/word/lucht/#nl	f	f	1931	tools/materials	2023-09-27 14:59:57.873874+01	\N
het doelpunt	the goal	\N	https://forvo.com/word/doelpunt/#nl	f	f	1598	football	2023-09-27 14:59:57.873874+01	\N
de universiteit	the university	\N	https://forvo.com/word/universiteit/#nl	f	f	1221	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de wal	the shore	\N	https://forvo.com/word/wal/#nl	f	f	1753	geography	2023-09-27 14:59:57.873874+01	\N
de EHBO, de eerste hulp	the first aid	\N	https://forvo.com/word/EHBO/#nl	f	f	1726	doctor	2023-09-27 14:59:57.873874+01	\N
planten	plant	n/a	https://forvo.com/word/planten/#nl	f	f	215	\N	2023-09-27 14:59:57.873874+01	\N
antwoorden	to answer/reply	\N	https://forvo.com/word/antwoorden/#nl	f	f	1252	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
de kruk	the stool	\N	https://forvo.com/word/kruk/#nl	f	f	1411	household	2023-09-27 14:59:57.873874+01	\N
voedsel	food	n/a	https://forvo.com/word/voedsel/#nl	f	f	217	food/drink	2023-09-27 14:59:57.873874+01	\N
alstublieft	here you are	\N	https://forvo.com/word/alstublieft/#nl	f	f	1104	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
de slang	the snake	\N	https://forvo.com/word/slang/#nl	f	f	2050	animals (2)	2023-09-27 14:59:57.873874+01	\N
het geluid	the sound	\N	https://forvo.com/word/geluid/#nl	f	f	2133	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
trein	train	n/a	https://forvo.com/word/trein/#nl	f	f	559	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de oma	the grandmother	\N	https://forvo.com/word/oma/#nl	f	f	1549	family	2023-09-27 14:59:57.873874+01	\N
daar, er	there	\N	https://forvo.com/word/daar/#nl	f	f	1183	question words	2023-09-27 14:59:57.873874+01	\N
de stoel	the chair	\N	https://forvo.com/word/stoel/#nl	f	f	1410	household	2023-09-27 14:59:57.873874+01	\N
de abrikoos	the apricot	\N	https://forvo.com/word/abrikoos/#nl	f	f	1872	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
het cadeau	the present	\N	https://forvo.com/word/cadeau/#nl	f	f	2026	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
verandering	change	n/a	https://forvo.com/word/verandering/#nl	t	f	82	\N	2023-09-27 14:59:57.873874+01	\N
twintig	twenty	\N	https://forvo.com/word/twintig/#nl	t	f	1238	numbers/counting	2023-09-27 14:59:57.873874+01	\N
verder	further	\N	https://forvo.com/word/verder/#nl	t	f	1965	adverbs	2023-09-27 14:59:57.873874+01	\N
veel	lot/much/many	n/a	https://forvo.com/word/veel/#nl	f	t	688	adverbs	2023-09-27 14:59:57.873874+01	\N
zomer	summer	\N	https://forvo.com/word/zomer/#nl	f	t	1327	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
kort	short	\N	https://forvo.com/word/kort/#nl	f	t	1684	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
met	with	\N	https://forvo.com/word/met/#nl	f	t	1329	prepositions	2023-09-27 14:59:57.873874+01	\N
het huurcontract	the rental contract	\N	https://forvo.com/word/huurcontract/#nl	f	t	1772	moving/immigration	2023-09-27 14:59:57.873874+01	\N
donker	dark	\N	https://forvo.com/word/donker/#nl	f	t	1286	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
passen	to fit/to conform/to try on	n/a	https://forvo.com/word/passen/#nl	t	f	644	\N	2023-09-27 14:59:57.873874+01	\N
tong	tongue	\N	https://forvo.com/word/tong/#nl	t	t	2142	body	2023-09-27 14:59:57.873874+01	\N
leiden	to lead	\N	https://forvo.com/word/leiden/#nl	f	t	2101	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
de klomp	the wooden shoe	\N	https://forvo.com/word/klomp/#nl	f	t	1472	clothes	2023-09-27 14:59:57.873874+01	\N
baas	boss	\N	https://forvo.com/word/baas/#nl	f	t	2146	job hunting/business	2023-09-27 14:59:57.873874+01	\N
nat	wet	\N	https://forvo.com/word/nat/#nl	f	f	2055	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
de melk	the milk	\N	https://forvo.com/word/melk/#nl	f	f	1156	food/drink	2023-09-27 14:59:57.873874+01	\N
de collega	the colleague	\N	https://forvo.com/word/collega/#nl	f	f	1539	job hunting/business	2023-09-27 14:59:57.873874+01	\N
ontspannen	relaxed	\N	https://forvo.com/word/ontspannen/#nl	f	f	1813	moods/emotions	2023-09-27 14:59:57.873874+01	\N
zacht	soft, slow	\N	https://forvo.com/word/zacht/#nl	f	f	1290	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
bruto	gross	\N	https://forvo.com/word/bruto/#nl	f	f	1530	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de baard	the beard	\N	https://forvo.com/word/baard/#nl	f	f	1457	body	2023-09-27 14:59:57.873874+01	\N
stoel	chair	n/a	https://forvo.com/word/stoel/#nl	f	f	754	household	2023-09-27 14:59:57.873874+01	\N
wereld	world	n/a	https://forvo.com/word/wereld/#nl	f	f	96	\N	2023-09-27 14:59:57.873874+01	\N
kosten	to cost	\N	https://forvo.com/word/kosten/#nl	f	f	2099	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
groeide	grew	n/a	https://forvo.com/word/groeide/#nl	f	f	630	\N	2023-09-27 14:59:57.873874+01	\N
beslissen	to decide	\N	https://forvo.com/word/beslissen/#nl	f	f	1497	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
stap	step	n/a	https://forvo.com/word/stap/#nl	f	f	461	\N	2023-09-27 14:59:57.873874+01	\N
de plank	the plank	\N	https://forvo.com/word/plank/#nl	f	f	1930	tools/materials	2023-09-27 14:59:57.873874+01	\N
Kerstmis	Christmas	\N	https://forvo.com/word/Kerstmis/#nl	f	f	2005	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
suiker	sugar	n/a	https://forvo.com/word/suiker/#nl	f	f	903	food/drink	2023-09-27 14:59:57.873874+01	\N
geweest	been	n/a	https://forvo.com/word/geweest/#nl	f	f	199	\N	2023-09-27 14:59:57.873874+01	\N
gratis	free	n/a	https://forvo.com/word/gratis/#nl	f	f	441	\N	2023-09-27 14:59:57.873874+01	\N
oog	eye	n/a	https://forvo.com/word/oog/#nl	f	f	223	body	2023-09-27 14:59:57.873874+01	\N
eten & drinken	food & drinks	\N	#	f	f	1148	food/drink	2023-09-27 14:59:57.873874+01	\N
jouw / je / uw	your	\N	https://forvo.com/word/jouw/#nl	f	f	2114	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
deas	dollar	n/a	https://forvo.com/word/deas/#nl	f	f	822	\N	2023-09-27 14:59:57.873874+01	\N
soort	type/kind	n/a	https://forvo.com/word/soort/#nl	f	f	730	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
woede	anger	n/a	https://forvo.com/word/woede/#nl	f	f	999	\N	2023-09-27 14:59:57.873874+01	\N
vijand	enemy	n/a	https://forvo.com/word/vijand/#nl	f	f	884	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
zat	sat	n/a	https://forvo.com/word/zat/#nl	f	f	573	\N	2023-09-27 14:59:57.873874+01	\N
eerder	rather	n/a	https://forvo.com/word/eerder/#nl	f	f	810	\N	2023-09-27 14:59:57.873874+01	\N
achtervoegsel	suffix	n/a	https://forvo.com/word/achtervoegsel/#nl	f	f	915	grammar	2023-09-27 14:59:57.873874+01	\N
oorzaak	cause	n/a	https://forvo.com/word/oorzaak/#nl	f	f	141	\N	2023-09-27 14:59:57.873874+01	\N
de benzine	the petrol	\N	https://forvo.com/word/benzine/#nl	f	f	1925	tools/materials	2023-09-27 14:59:57.873874+01	\N
cijfer	numeral	n/a	https://forvo.com/word/cijfer/#nl	f	f	329	numbers/counting	2023-09-27 14:59:57.873874+01	\N
het beest	the animal, the beast	\N	https://forvo.com/word/beest/#nl	f	f	2027	animals (2)	2023-09-27 14:59:57.873874+01	\N
termijn	term	n/a	https://forvo.com/word/termijn/#nl	f	f	963	\N	2023-09-27 14:59:57.873874+01	\N
team	team	n/a	https://forvo.com/word/team/#nl	f	f	633	\N	2023-09-27 14:59:57.873874+01	\N
verloofd	to be engaged	\N	https://forvo.com/word/verloofd/#nl	f	f	1563	family	2023-09-27 14:59:57.873874+01	\N
het, de colbert	the suit jacket	\N	https://forvo.com/word/colbert/#nl	f	f	1479	clothes	2023-09-27 14:59:57.873874+01	\N
kust	coast	n/a	https://forvo.com/word/kust/#nl	f	f	733	nature	2023-09-27 14:59:57.873874+01	\N
dood	dead/death	\N	https://forvo.com/word/dood/#nl	f	f	2087	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
beweging	motion	n/a	https://forvo.com/word/beweging/#nl	f	f	893	\N	2023-09-27 14:59:57.873874+01	\N
de bril	the glasses	\N	https://forvo.com/word/bril/#nl	f	f	1440	body	2023-09-27 14:59:57.873874+01	\N
zorg	care	n/a	https://forvo.com/word/zorg/#nl	f	f	300	\N	2023-09-27 14:59:57.873874+01	\N
de appel	the apple	\N	https://forvo.com/word/appel/#nl	f	f	1868	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
het ijzer	the iron	\N	https://forvo.com/word/ijzer/#nl	f	f	1932	tools/materials	2023-09-27 14:59:57.873874+01	\N
het staal	the steel	\N	https://forvo.com/word/staal/#nl	f	f	1933	tools/materials	2023-09-27 14:59:57.873874+01	\N
zonnen	to sunbathe	\N	https://forvo.com/word/zonnen/#nl	f	f	1360	hobbies	2023-09-27 14:59:57.873874+01	\N
het pretpark	the theme park	\N	https://forvo.com/word/pretpark/#nl	f	f	1361	hobbies	2023-09-27 14:59:57.873874+01	\N
tuinieren	gardening	\N	https://forvo.com/word/tuinieren/#nl	f	f	1362	hobbies	2023-09-27 14:59:57.873874+01	\N
gebruikelijke	usual	n/a	https://forvo.com/word/gebruikelijke/#nl	f	f	305	\N	2023-09-27 14:59:57.873874+01	\N
romantisch	romantic	\N	https://forvo.com/word/romantisch/#nl	f	f	1814	moods/emotions	2023-09-27 14:59:57.873874+01	\N
lijst	list	n/a	https://forvo.com/word/lijst/#nl	f	f	311	\N	2023-09-27 14:59:57.873874+01	\N
dansen	to dance	\N	https://forvo.com/word/dansen/#nl	f	t	1381	hobbies	2023-09-27 14:59:57.873874+01	\N
het been	the leg	\N	https://forvo.com/word/been/#nl	f	t	1448	body	2023-09-27 14:59:57.873874+01	\N
de zak	the bag	\N	https://forvo.com/word/zak/#nl	f	t	2004	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
hoe lang?	how long?		#	f	t	1063	time	2023-09-27 14:59:57.873874+01	\N
het	the, it	\N	https://forvo.com/word/het/#nl	t	f	1083	introductory	2023-09-27 14:59:57.873874+01	\N
zoeken	to search	\N	https://forvo.com/word/zoeken/#nl	f	t	1905	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
de twaalfde man	the fans	\N	#	t	f	1609	football	2023-09-27 14:59:57.873874+01	\N
noch	nor	n/a	https://forvo.com/word/noch/#nl	t	f	948	\N	2023-09-27 14:59:57.873874+01	\N
drankje	drink	n/a	https://forvo.com/word/drankje/#nl	f	t	886	food/drink	2023-09-27 14:59:57.873874+01	\N
staat	state	n/a	https://forvo.com/word/staat/#nl	f	t	221	\N	2023-09-27 14:59:57.873874+01	\N
positie	position	n/a	https://forvo.com/word/positie/#nl	f	t	547	\N	2023-09-27 14:59:57.873874+01	\N
ooit	ever	\N	https://forvo.com/word/ooit/#nl	t	t	1959	adverbs	2023-09-27 14:59:57.873874+01	\N
het land	the country	\N	https://forvo.com/word/land/#nl	f	t	1740	geography	2023-09-27 14:59:57.873874+01	\N
goedkoop	cheap	\N	https://forvo.com/word/goedkoop/#nl	f	t	1297	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
de koffie	the coffee	\N	https://forvo.com/word/koffie/#nl	f	t	1157	food/drink	2023-09-27 14:59:57.873874+01	\N
mark	mark	n/a	https://forvo.com/word/mark/#nl	f	t	292	\N	2023-09-27 14:59:57.873874+01	\N
reisbureau	travel agency	noun	https://forvo.com/word/reisbureau/#nl	t	f	1008	\N	2023-09-27 14:59:57.873874+01	\N
magneet	magnet	n/a	https://forvo.com/word/magneet/#nl	f	t	910	tools/materials	2023-09-27 14:59:57.873874+01	\N
lijn	line	n/a	https://forvo.com/word/lijn/#nl	f	t	138	\N	2023-09-27 14:59:57.873874+01	\N
voorbeeld	example	n/a	https://forvo.com/word/voorbeeld/#nl	f	t	284	grammar	2023-09-27 14:59:57.873874+01	\N
de knie	the knee	\N	https://forvo.com/word/knie/#nl	f	t	1449	body	2023-09-27 14:59:57.873874+01	\N
éénentwintig	twenty one	\N	https://forvo.com/word/éénentwintig/#nl	f	t	1239	numbers/counting	2023-09-27 14:59:57.873874+01	\N
end	end	n/a	https://forvo.com/word/end/#nl	f	t	61	\N	2023-09-27 14:59:57.873874+01	\N
aanbieden	to offer	UvA A2 Course	https://forvo.com/word/aanbieden/#nl	f	f	1650	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
lieve	dear	UvA A2 Course	https://forvo.com/word/lieve/#nl	f	f	883	\N	2023-09-27 14:59:57.873874+01	\N
draaien	to turn	\N	https://forvo.com/word/draaien/#nl	t	t	2098	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
het bloed	the blood	\N	https://forvo.com/word/bloed/#nl	f	f	2086	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
lang	long	\N	https://forvo.com/word/lang/#nl	f	f	1685	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
half vier	half past three		#	f	f	1052	time	2023-09-27 14:59:57.873874+01	\N
decennium	decade	noun	https://forvo.com/word/decennium/#nl	f	f	1042	time	2023-09-27 14:59:57.873874+01	\N
de aardappel	the potato	\N	https://forvo.com/word/aardappel/#nl	f	f	1159	food/drink	2023-09-27 14:59:57.873874+01	\N
wachten	to wait	\N	https://forvo.com/word/wachten/#nl	f	f	1273	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
op te lossen	solve	n/a	https://forvo.com/word/lossen/#nl	f	f	709	\N	2023-09-27 14:59:57.873874+01	\N
het platteland	the countryside	\N	https://forvo.com/word/platteland/#nl	f	f	1749	geography	2023-09-27 14:59:57.873874+01	\N
de huur	the rent	\N	https://forvo.com/word/huur/#nl	f	f	1773	moving/immigration	2023-09-27 14:59:57.873874+01	\N
cursus	course	n/a	https://forvo.com/word/cursus/#nl	f	f	355	\N	2023-09-27 14:59:57.873874+01	\N
het sollicitatiegesprek	the job interview	\N	https://forvo.com/word/sollicitatiegesprek/#nl	f	f	1526	job hunting/business	2023-09-27 14:59:57.873874+01	\N
pose	pose	n/a	https://forvo.com/word/pose/#nl	f	f	321	\N	2023-09-27 14:59:57.873874+01	\N
heldere	bright	n/a	https://forvo.com/word/heldere/#nl	f	f	588	\N	2023-09-27 14:59:57.873874+01	\N
de wc	the toilet	\N	https://forvo.com/word/wc/#nl	f	f	1416	household	2023-09-27 14:59:57.873874+01	\N
het fornuis	the cooker	\N	https://forvo.com/word/fornuis/#nl	f	f	1418	household	2023-09-27 14:59:57.873874+01	\N
lengte	length	n/a	https://forvo.com/word/lengte/#nl	f	f	517	\N	2023-09-27 14:59:57.873874+01	\N
ongeduldig	impatient	\N	https://forvo.com/word/ongeduldig/#nl	f	f	1805	moods/emotions	2023-09-27 14:59:57.873874+01	\N
tevreden	satisfied	\N	https://forvo.com/word/tevreden/#nl	f	f	1809	moods/emotions	2023-09-27 14:59:57.873874+01	\N
ontevreden	dissatisfied	\N	https://forvo.com/word/ontevreden/#nl	f	f	1810	moods/emotions	2023-09-27 14:59:57.873874+01	\N
partij	party	n/a	https://forvo.com/word/partij/#nl	f	f	775	\N	2023-09-27 14:59:57.873874+01	\N
dank je wel	thank you	\N	https://forvo.com/word/dankjewel/#nl	f	f	1107	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
de temperatuur	the temperature	\N	https://forvo.com/word/temperatuur/#nl	f	f	1663	weather	2023-09-27 14:59:57.873874+01	\N
de thermometer	the thermometer	\N	https://forvo.com/word/thermometer/#nl	f	f	1664	weather	2023-09-27 14:59:57.873874+01	\N
quotiënt	quotient	n/a	https://forvo.com/word/quotiënt/#nl	f	f	898	\N	2023-09-27 14:59:57.873874+01	\N
dan	then/than	\N	https://forvo.com/word/dan/#nl	f	f	1185	question words	2023-09-27 14:59:57.873874+01	\N
het recept	the prescription	\N	https://forvo.com/word/recept/#nl	f	f	1738	doctor	2023-09-27 14:59:57.873874+01	\N
het bord	the plate	\N	https://forvo.com/word/bord/#nl	f	f	1844	cooking	2023-09-27 14:59:57.873874+01	\N
finale	final	n/a	https://forvo.com/word/finale/#nl	f	f	433	\N	2023-09-27 14:59:57.873874+01	\N
regen	rain	n/a	https://forvo.com/word/regen/#nl	f	f	495	weather	2023-09-27 14:59:57.873874+01	\N
de driehoek	the triangle	\N	https://forvo.com/word/driehoek/#nl	f	f	1971	colors/shapes	2023-09-27 14:59:57.873874+01	\N
de tafel	the table	\N	https://forvo.com/word/tafel/#nl	f	f	1412	household	2023-09-27 14:59:57.873874+01	\N
onthouden	remember	n/a	https://forvo.com/word/onthouden/#nl	f	f	460	\N	2023-09-27 14:59:57.873874+01	\N
verschillen	differ	n/a	https://forvo.com/word/verschillen/#nl	f	f	139	\N	2023-09-27 14:59:57.873874+01	\N
schoonheid	beauty	n/a	https://forvo.com/word/schoonheid/#nl	f	f	426	\N	2023-09-27 14:59:57.873874+01	\N
het n2-examen	the exam for Dutch as a second language	\N	https://forvo.com/word/n2-examen/#nl	f	f	1789	moving/immigration	2023-09-27 14:59:57.873874+01	\N
ons / onze	our	\N	https://forvo.com/word/onze/#nl	f	f	2117	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
heet	hot	\N	https://forvo.com/word/heet/#nl	f	f	2103	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
de markt	the market	\N	https://forvo.com/word/markt/#nl	f	f	2104	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
bril	glasses	\N	https://forvo.com/word/bril/#nl	f	f	2144	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
dronken zijn	being drunk	\N	https://forvo.com/word/dronken/#nl	f	f	1374	hobbies	2023-09-27 14:59:57.873874+01	\N
bijvoorbeeld	for example	\N	https://forvo.com/word/bijvoorbeeld/#nl	f	f	1956	adverbs	2023-09-27 14:59:57.873874+01	\N
de hand	the hand	\N	https://forvo.com/word/hand/#nl	f	f	1446	body	2023-09-27 14:59:57.873874+01	\N
gebied	area	n/a	https://forvo.com/word/gebied/#nl	f	f	336	\N	2023-09-27 14:59:57.873874+01	\N
de winter	winter	\N	https://forvo.com/word/winter/#nl	f	f	1325	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
de tomaat	the tomato	\N	https://forvo.com/word/tomaat/#nl	f	f	1860	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
gunst	favor	n/a	https://forvo.com/word/gunst/#nl	f	f	859	\N	2023-09-27 14:59:57.873874+01	\N
het leger	the army	\N	https://forvo.com/word/leger/#nl	f	f	2082	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
de oefening	the exercise	\N	https://forvo.com/word/oefening/#nl	f	f	2083	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
metalen	metal	n/a	https://forvo.com/word/metalen/#nl	f	f	710	tools/materials	2023-09-27 14:59:57.873874+01	\N
verre	distant	n/a	https://forvo.com/word/verre/#nl	f	f	396	\N	2023-09-27 14:59:57.873874+01	\N
vouw	crease	n/a	https://forvo.com/word/vouw/#nl	f	f	699	\N	2023-09-27 14:59:57.873874+01	\N
de rode kaart	the red card	\N	#	f	f	1619	football	2023-09-27 14:59:57.873874+01	\N
spoor	rail/track	n/a	https://forvo.com/word/spoor/#nl	f	f	794	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de suiker	the sugar	\N	https://forvo.com/word/suiker/#nl	f	f	1867	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
de badkamer	the bathroom	\N	https://forvo.com/word/badkamer/#nl	f	f	1425	household	2023-09-27 14:59:57.873874+01	\N
ja	yes	\N	https://forvo.com/word/ja/#nl	f	f	1108	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
de geur	the smell	\N	https://forvo.com/word/geur/#nl	f	f	1836	cooking	2023-09-27 14:59:57.873874+01	\N
kookplaten	ring	n/a	https://forvo.com/word/kookplaten/#nl	f	f	779	\N	2023-09-27 14:59:57.873874+01	\N
het midden	the middle	\N	https://forvo.com/word/midden/#nl	t	f	1341	prepositions	2023-09-27 14:59:57.873874+01	\N
nee	no	\N	https://forvo.com/word/nee/#nl	f	t	1109	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
werk	job/work	n/a	https://forvo.com/word/werk/#nl	f	t	581	job hunting/business	2023-09-27 14:59:57.873874+01	\N
drukke	busy	n/a	https://forvo.com/word/drukke/#nl	f	t	369	\N	2023-09-27 14:59:57.873874+01	\N
(zich) ziek melden	to report oneself ill	\N	#	t	f	1712	doctor	2023-09-27 14:59:57.873874+01	\N
ran	ran	n/a	https://forvo.com/word/ran/#nl	f	t	383	\N	2023-09-27 14:59:57.873874+01	\N
de bakker	the baker	\N	https://forvo.com/word/bakker/#nl	f	t	1134	professions	2023-09-27 14:59:57.873874+01	\N
de polder	the polder	\N	https://forvo.com/word/polder/#nl	f	t	1750	geography	2023-09-27 14:59:57.873874+01	\N
willen	to want	\N	https://forvo.com/word/willen/#nl	f	t	1635	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
spraak	speech	n/a	https://forvo.com/word/spraak/#nl	t	t	889	\N	2023-09-27 14:59:57.873874+01	\N
plek	spot	n/a	https://forvo.com/word/plek/#nl	f	t	845	\N	2023-09-27 14:59:57.873874+01	\N
meten	measure	n/a	https://forvo.com/word/meten/#nl	f	t	324	\N	2023-09-27 14:59:57.873874+01	\N
de keuken	the kitchen	\N	https://forvo.com/word/keuken/#nl	f	t	1417	household	2023-09-27 14:59:57.873874+01	\N
maandag	Monday	\N	https://forvo.com/word/maandag/#nl	f	t	1304	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
yard	yard	n/a	https://forvo.com/word/yard/#nl	f	t	623	household	2023-09-27 14:59:57.873874+01	\N
gehoord	heard	n/a	https://forvo.com/word/gehoord/#nl	f	t	452	\N	2023-09-27 14:59:57.873874+01	\N
vullen	to fill	n/a	https://forvo.com/word/vullen/#nl	f	f	397	UvA B1A Course CH4	2023-09-27 14:59:57.873874+01	\N
de lamp	the lamp	\N	https://forvo.com/word/lamp/#nl	f	f	1413	household	2023-09-27 14:59:57.873874+01	\N
hockeyen	to play hockey	\N	https://forvo.com/word/hockeyen/#nl	f	f	1369	hobbies	2023-09-27 14:59:57.873874+01	\N
divisie	division	n/a	https://forvo.com/word/divisie/#nl	f	f	856	\N	2023-09-27 14:59:57.873874+01	\N
vrouw	wife, woman	n/a	https://forvo.com/word/vrouw/#nl	f	f	965	family	2023-09-27 14:59:57.873874+01	\N
daarom	that’s why	\N	https://forvo.com/word/daarom/#nl	f	f	1192	question words	2023-09-27 14:59:57.873874+01	\N
vestigen	settle	n/a	https://forvo.com/word/vestigen/#nl	f	f	524	\N	2023-09-27 14:59:57.873874+01	\N
buurman	neighbor	n/a	https://forvo.com/word/buurman/#nl	f	f	807	\N	2023-09-27 14:59:57.873874+01	\N
controle	control	n/a	https://forvo.com/word/controle/#nl	f	f	650	\N	2023-09-27 14:59:57.873874+01	\N
de rust	half time	\N	https://forvo.com/word/rust/#nl	f	f	1611	football	2023-09-27 14:59:57.873874+01	\N
de hoer	the prostitute	\N	https://forvo.com/word/hoer/#nl	f	f	1404	Amsterdam	2023-09-27 14:59:57.873874+01	\N
ding	thing	n/a	https://forvo.com/word/ding/#nl	f	f	171	\N	2023-09-27 14:59:57.873874+01	\N
de griep	the flu	\N	https://forvo.com/word/griep/#nl	f	f	1713	doctor	2023-09-27 14:59:57.873874+01	\N
het fietspad	the bicycle track	\N	https://forvo.com/word/fietspad/#nl	f	f	1396	Amsterdam	2023-09-27 14:59:57.873874+01	\N
wedstrijd	match	n/a	https://forvo.com/word/wedstrijd/#nl	f	f	914	\N	2023-09-27 14:59:57.873874+01	\N
de verkering	the relationship (love)	\N	https://forvo.com/word/verkering/#nl	f	f	1561	family	2023-09-27 14:59:57.873874+01	\N
de bij	the bee	\N	https://forvo.com/word/bij/#nl	f	f	1592	animals (1)	2023-09-27 14:59:57.873874+01	\N
de vlinder	the butterfly	\N	https://forvo.com/word/vlinder/#nl	f	f	1593	animals (1)	2023-09-27 14:59:57.873874+01	\N
de spin	the spider	\N	https://forvo.com/word/spin/#nl	f	f	1594	animals (1)	2023-09-27 14:59:57.873874+01	\N
koord	string	n/a	https://forvo.com/word/koord/#nl	f	f	815	tools/materials	2023-09-27 14:59:57.873874+01	\N
de voetbal	the football	\N	https://forvo.com/word/voetbal/#nl	f	f	1595	football	2023-09-27 14:59:57.873874+01	\N
vertrouwen	to trust	\N	https://forvo.com/word/vertrouwen/#nl	f	f	1900	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
de maaltijd	the meal	\N	https://forvo.com/word/maaltijd/#nl	f	f	1820	cooking	2023-09-27 14:59:57.873874+01	\N
elementaire	basic	n/a	https://forvo.com/word/elementaire/#nl	f	f	945	\N	2023-09-27 14:59:57.873874+01	\N
of	or/whether	\N	https://forvo.com/word/of/#nl	f	f	1116	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
het grachtenpand	the canal house	\N	https://forvo.com/word/grachtenpand/#nl	f	f	1385	Amsterdam	2023-09-27 14:59:57.873874+01	\N
drinken	to drink	\N	https://forvo.com/word/drinken/#nl	f	f	1256	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
horen	to hear	\N	https://forvo.com/word/horen/#nl	f	f	1259	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
de vriendin	the (girl) friend	\N	https://forvo.com/word/vriendin/#nl	f	f	1557	family	2023-09-27 14:59:57.873874+01	\N
de klasgenoot	the classmate	\N	https://forvo.com/word/klasgenoot/#nl	f	f	1560	family	2023-09-27 14:59:57.873874+01	\N
plat, flat	flat	\N	https://forvo.com/word/plat/#nl	f	f	1984	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
ruiken	to smell	\N	https://forvo.com/word/ruiken/#nl	f	f	2100	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
kwart voor zeven ‘s ochtends	quarter to seven am		#	f	f	1074	time	2023-09-27 14:59:57.873874+01	\N
de strafschop	the penalty	\N	https://forvo.com/word/strafschop/#nl	f	f	1621	football	2023-09-27 14:59:57.873874+01	\N
decimaal	decimal	n/a	https://forvo.com/word/decimaal/#nl	f	f	651	numbers/counting	2023-09-27 14:59:57.873874+01	\N
de broer	the brother	\N	https://forvo.com/word/broer/#nl	f	f	1546	family	2023-09-27 14:59:57.873874+01	\N
de streek	the region	\N	https://forvo.com/word/streek/#nl	f	f	1742	geography	2023-09-27 14:59:57.873874+01	\N
winkel	store/shop	n/a	https://forvo.com/word/winkel/#nl	f	f	557	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
stappen	to go out (and drink)	\N	https://forvo.com/word/stappen/#nl	f	f	1373	hobbies	2023-09-27 14:59:57.873874+01	\N
rechtstreeks	direct	n/a	https://forvo.com/word/rechtstreeks/#nl	f	f	320	\N	2023-09-27 14:59:57.873874+01	\N
win	win	n/a	https://forvo.com/word/win/#nl	f	f	938	\N	2023-09-27 14:59:57.873874+01	\N
ijzer	iron	n/a	https://forvo.com/word/ijzer/#nl	f	f	692	tools/materials	2023-09-27 14:59:57.873874+01	\N
huid	skin	n/a	https://forvo.com/word/huid/#nl	f	f	697	body	2023-09-27 14:59:57.873874+01	\N
resultaat	result	n/a	https://forvo.com/word/resultaat/#nl	f	f	723	\N	2023-09-27 14:59:57.873874+01	\N
de vertegenwoordiger	the representative	\N	https://forvo.com/word/vertegenwoordiger/#nl	f	f	1147	professions	2023-09-27 14:59:57.873874+01	\N
het (onder)hemd	the undershirt	\N	https://forvo.com/word/onderhemd/#nl	f	f	1475	clothes	2023-09-27 14:59:57.873874+01	\N
vereisen	require	n/a	https://forvo.com/word/vereisen/#nl	f	f	993	\N	2023-09-27 14:59:57.873874+01	\N
dame	lady	n/a	https://forvo.com/word/dame/#nl	f	f	622	\N	2023-09-27 14:59:57.873874+01	\N
passeren	pass	n/a	https://forvo.com/word/passeren/#nl	f	f	346	\N	2023-09-27 14:59:57.873874+01	\N
de mug	the mosquito	\N	https://forvo.com/word/mug/#nl	f	f	2036	animals (2)	2023-09-27 14:59:57.873874+01	\N
meester	master	n/a	https://forvo.com/word/meester/#nl	f	f	852	\N	2023-09-27 14:59:57.873874+01	\N
fractie	fraction	n/a	https://forvo.com/word/fractie/#nl	f	f	552	\N	2023-09-27 14:59:57.873874+01	\N
deze	these, this	\N	https://forvo.com/word/deze/#nl	f	f	1179	question words	2023-09-27 14:59:57.873874+01	\N
kolonie	colony	n/a	https://forvo.com/word/kolonie/#nl	f	f	831	\N	2023-09-27 14:59:57.873874+01	\N
dak	the roof	\N	https://forvo.com/word/dak/#nl	f	f	2102	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
werken	to work/operate	\N	https://forvo.com/word/werken/#nl	f	f	1272	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
de friet	the French fries	\N	https://forvo.com/word/friet/#nl	t	f	1166	food/drink	2023-09-27 14:59:57.873874+01	\N
hoe	how	\N	https://forvo.com/word/hoe/#nl	f	t	1188	question words	2023-09-27 14:59:57.873874+01	\N
papa/dad	dad	\N	https://forvo.com/word/papa/#nl	t	f	1543	family	2023-09-27 14:59:57.873874+01	\N
gehouden	kept/held	n/a	https://forvo.com/word/gehouden/#nl	t	f	577	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
de brief	the letter	\N	https://forvo.com/word/brief/#nl	f	t	1520	job hunting/business	2023-09-27 14:59:57.873874+01	\N
het vlees	the meat	\N	https://forvo.com/word/vlees/#nl	f	t	1164	food/drink	2023-09-27 14:59:57.873874+01	\N
gaan	to go	\N	https://forvo.com/word/gaan/#nl	f	t	1250	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
de stad	the city	\N	https://forvo.com/word/stad/#nl	f	t	1743	geography	2023-09-27 14:59:57.873874+01	\N
glas	glass	n/a	https://forvo.com/word/glas/#nl	f	t	578	tools/materials	2023-09-27 14:59:57.873874+01	\N
waarom	why	\N	https://forvo.com/word/waarom/#nl	f	t	1191	question words	2023-09-27 14:59:57.873874+01	\N
laag	low	\N	https://forvo.com/word/laag/#nl	t	t	1299	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
oranje	orange	\N	https://forvo.com/word/oranje/#nl	f	t	1977	colors/shapes	2023-09-27 14:59:57.873874+01	\N
boven	above, top, up, upstairs	\N	https://forvo.com/word/boven/#nl	f	t	1337	prepositions	2023-09-27 14:59:57.873874+01	\N
de fiets	the bicycle	\N	https://forvo.com/word/fiets/#nl	f	t	1300	dutch symbols	2023-09-27 14:59:57.873874+01	\N
vragen	to ask	\N	https://forvo.com/word/vragen/#nl	f	t	1251	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
zwaar	heavy	\N	https://forvo.com/word/zwaar/#nl	f	t	1288	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
praten	to talk	\N	https://forvo.com/word/praten/#nl	f	t	1269	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
lente/voorjaar	spring	UvA A2 Course	https://forvo.com/word/lente/#nl	f	f	1326	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
vieren	to celebrate	\N	https://forvo.com/word/vieren/#nl	f	t	1998	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
waaien	to blow	\N	https://forvo.com/word/waaien/#nl	f	f	1674	UvA B1A Course CH4	2023-09-27 14:59:57.873874+01	\N
de halte	the stopping place	\N	https://forvo.com/word/halte/#nl	f	f	1204	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
menigte	crowd	n/a	https://forvo.com/word/menigte/#nl	f	f	811	\N	2023-09-27 14:59:57.873874+01	\N
haten	to hate	\N	https://forvo.com/word/haten/#nl	f	f	1885	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
delen	to share	\N	https://forvo.com/word/delen/#nl	f	f	1886	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
natuurlijk	of course	\N	https://forvo.com/word/natuurlijk/#nl	f	f	1942	adverbs	2023-09-27 14:59:57.873874+01	\N
specerij	spice	\N	https://forvo.com/word/specerij/#nl	f	f	2152	food/drink	2023-09-27 14:59:57.873874+01	\N
naar beneden	down	n/a	https://forvo.com/word/beneden/#nl	f	f	197	\N	2023-09-27 14:59:57.873874+01	\N
toelaten	allow	n/a	https://forvo.com/word/toelaten/#nl	f	f	842	\N	2023-09-27 14:59:57.873874+01	\N
gooien	throw	n/a	https://forvo.com/word/gooien/#nl	f	f	984	\N	2023-09-27 14:59:57.873874+01	\N
wat voor weer wordt het?	what will be the weather?	\N	#	f	f	1656	weather	2023-09-27 14:59:57.873874+01	\N
staan	to stand	\N	https://forvo.com/word/staan/#nl	f	f	1644	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
de graad	the degree	\N	https://forvo.com/word/graad/#nl	f	f	1666	weather	2023-09-27 14:59:57.873874+01	\N
de stof	the material	\N	https://forvo.com/word/stof/#nl	f	f	1936	tools/materials	2023-09-27 14:59:57.873874+01	\N
de aarde	the earth	\N	https://forvo.com/word/aarde/#nl	f	f	1937	tools/materials	2023-09-27 14:59:57.873874+01	\N
iets	something	\N	https://forvo.com/word/iets/#nl	f	f	1938	adverbs	2023-09-27 14:59:57.873874+01	\N
groep	group	n/a	https://forvo.com/word/groep/#nl	f	f	287	\N	2023-09-27 14:59:57.873874+01	\N
ei	egg	n/a	https://forvo.com/word/ei/#nl	f	f	507	food/drink	2023-09-27 14:59:57.873874+01	\N
ontslaan	to fire	\N	https://forvo.com/word/ontslaan/#nl	f	f	1541	job hunting/business	2023-09-27 14:59:57.873874+01	\N
stroom	stream	n/a	https://forvo.com/word/stroom/#nl	f	f	823	\N	2023-09-27 14:59:57.873874+01	\N
oost(en)	east	\N	https://forvo.com/word/oost/#nl	f	f	2077	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
de stropdas	the tie	\N	https://forvo.com/word/stropdas/#nl	f	f	1480	clothes	2023-09-27 14:59:57.873874+01	\N
oever	shore	n/a	https://forvo.com/word/oever/#nl	f	f	855	nature	2023-09-27 14:59:57.873874+01	\N
stof	dust/substance	noun	https://forvo.com/word/stof/#nl	f	f	1009	household	2023-09-27 14:59:57.873874+01	\N
wit	white	\N	https://forvo.com/word/wit/#nl	f	f	1978	colors/shapes	2023-09-27 14:59:57.873874+01	\N
elk	each	\N	https://forvo.com/word/elk/#nl	f	f	1991	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
beroemd	famous	\N	https://forvo.com/word/beroemd/#nl	f	f	2065	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
kamperen	to camp out	\N	https://forvo.com/word/kamperen/#nl	f	f	1358	hobbies	2023-09-27 14:59:57.873874+01	\N
het strand	the beach	\N	https://forvo.com/word/strand/#nl	f	f	1359	hobbies	2023-09-27 14:59:57.873874+01	\N
de snelweg	the highway	\N	https://forvo.com/word/snelweg/#nl	f	f	1199	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
hardlopen	to run	\N	https://forvo.com/word/hardlopen/#nl	f	f	1366	hobbies	2023-09-27 14:59:57.873874+01	\N
missen	to miss	n/a	https://forvo.com/word/miss/#nl	f	f	389	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
volgen	to follow	\N	https://forvo.com/word/volgen/#nl	f	f	1500	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
gebruikelijk/gemeenschappelijke	common	\N	https://forvo.com/word/gebruikelijk/#nl	f	f	2059	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
geen	no / none	\N	https://forvo.com/word/geen/#nl	f	f	2121	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
het verschil	the difference	\N	https://forvo.com/word/verschil/#nl	f	f	2124	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
bedoelen	to mean	\N	https://forvo.com/word/bedoelen/#nl	f	f	1631	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
nemen	to take	\N	https://forvo.com/word/nemen/#nl	f	f	1633	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
auto	car	n/a	https://forvo.com/word/auto/#nl	f	f	298	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
stok	stick	n/a	https://forvo.com/word/stok/#nl	f	f	694	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
weg	road	n/a	https://forvo.com/word/weg/#nl	f	f	493	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
warmte	heat	n/a	https://forvo.com/word/warmte/#nl	f	f	391	\N	2023-09-27 14:59:57.873874+01	\N
ijs	ice	n/a	https://forvo.com/word/ijs/#nl	f	f	528	nature	2023-09-27 14:59:57.873874+01	\N
broer	brother	n/a	https://forvo.com/word/broer/#nl	f	f	506	family	2023-09-27 14:59:57.873874+01	\N
lol	fun	n/a	https://forvo.com/word/lol/#nl	f	f	587	\N	2023-09-27 14:59:57.873874+01	\N
vijg	fig	n/a	https://forvo.com/word/vijg/#nl	f	f	917	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
bedden	bed	n/a	https://forvo.com/word/bedden/#nl	f	f	505	household	2023-09-27 14:59:57.873874+01	\N
geld	money	n/a	https://forvo.com/word/geld/#nl	f	f	490	\N	2023-09-27 14:59:57.873874+01	\N
seconde	second	noun	https://forvo.com/word/seconde/#nl	f	f	1044	time	2023-09-27 14:59:57.873874+01	\N
het pak	the suit	\N	https://forvo.com/word/pak/#nl	f	f	1478	clothes	2023-09-27 14:59:57.873874+01	\N
leren	to learn, to teach	\N	https://forvo.com/word/leren/#nl	f	f	1264	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
Pasen	Easter	\N	https://forvo.com/word/Pasen/#nl	f	f	2012	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
zus	sister	n/a	https://forvo.com/word/zus/#nl	f	f	920	family	2023-09-27 14:59:57.873874+01	\N
sense	sense	n/a	https://forvo.com/word/sense/#nl	t	f	751	\N	2023-09-27 14:59:57.873874+01	\N
kind	child	n/a	https://forvo.com/word/kind/#nl	f	t	666	family	2023-09-27 14:59:57.873874+01	\N
genieten (van)	to enjoy	\N	https://forvo.com/word/genieten/#nl	f	f	1891	UvA B1A Course CH4	2023-09-27 14:59:57.873874+01	\N
driehoek	triangle	n/a	https://forvo.com/word/driehoek/#nl	f	t	827	colors/shapes	2023-09-27 14:59:57.873874+01	\N
cirkel	circle	n/a	https://forvo.com/word/cirkel/#nl	f	t	530	colors/shapes	2023-09-27 14:59:57.873874+01	\N
de donder	the thunder	\N	https://forvo.com/word/donder/#nl	f	t	1678	weather	2023-09-27 14:59:57.873874+01	\N
kreeg	got	n/a	https://forvo.com/word/kreeg/#nl	t	f	282	\N	2023-09-27 14:59:57.873874+01	\N
vol/volledige	full	\N	https://forvo.com/word/vol/#nl	f	t	1697	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
de kop	the head	\N	https://forvo.com/word/kop/#nl	t	f	1435	body	2023-09-27 14:59:57.873874+01	\N
het stof	the dust	\N	https://forvo.com/word/stof/#nl	f	t	1935	tools/materials	2023-09-27 14:59:57.873874+01	\N
vijf voor half zeven	twenty five past six		#	f	t	1059	time	2023-09-27 14:59:57.873874+01	\N
gebeuren	to happen	UvA A2 Course	https://forvo.com/word/gebeuren/#nl	f	f	1501	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
de maand	the month	\N	https://forvo.com/word/maand/#nl	f	t	1311	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
hebben	to have	\N	https://forvo.com/word/hebben/#nl	f	t	1248	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
de student	the student	\N	https://forvo.com/word/student/#nl	f	t	1131	professions	2023-09-27 14:59:57.873874+01	\N
herinneren	to remember	UvA A2 Course	https://forvo.com/word/herinneren/#nl	f	t	1651	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
glad	slippery	UvA A2 Course	https://forvo.com/word/glad/#nl	f	f	2064	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
systeem	system	n/a	https://forvo.com/word/systeem/#nl	f	t	368	\N	2023-09-27 14:59:57.873874+01	\N
melk	milk	n/a	https://forvo.com/word/melk/#nl	f	t	671	food/drink	2023-09-27 14:59:57.873874+01	\N
de wolk	the cloud	\N	https://forvo.com/word/wolk/#nl	f	t	1679	weather	2023-09-27 14:59:57.873874+01	\N
planeet	planet	n/a	https://forvo.com/word/planeet/#nl	f	f	828	nature	2023-09-27 14:59:57.873874+01	\N
de kast	the closet	\N	https://forvo.com/word/kast/#nl	f	f	1415	household	2023-09-27 14:59:57.873874+01	\N
anamnese	medical history	\N	https://forvo.com/word/anamnese/#nl	f	f	2145	doctor	2023-09-27 14:59:57.873874+01	\N
lief	lovely, sweet	\N	https://forvo.com/word/lief/#nl	f	f	1292	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
immigreren	to immigrate	\N	https://forvo.com/word/immigreren/#nl	f	f	1766	moving/immigration	2023-09-27 14:59:57.873874+01	\N
de kerstman	Santa Claus	\N	https://forvo.com/word/kerstman/#nl	f	f	2007	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
paar	pair	n/a	https://forvo.com/word/paar/#nl	f	f	531	\N	2023-09-27 14:59:57.873874+01	\N
zwak	weak	\N	https://forvo.com/word/zwak/#nl	f	f	2071	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
het spreekuur	the consultation hours	\N	https://forvo.com/word/spreekuur/#nl	f	f	1725	doctor	2023-09-27 14:59:57.873874+01	\N
de eekhoorn	the squirrel	\N	https://forvo.com/word/eekhoorn/#nl	f	f	2039	animals (1)	2023-09-27 14:59:57.873874+01	\N
het schot	the shot	\N	https://forvo.com/word/schot/#nl	f	f	1614	football	2023-09-27 14:59:57.873874+01	\N
de redding	the save	\N	https://forvo.com/word/redding/#nl	f	f	1615	football	2023-09-27 14:59:57.873874+01	\N
redden	to save	\N	https://forvo.com/word/redden/#nl	f	f	1616	football	2023-09-27 14:59:57.873874+01	\N
de voorzet	the assist	\N	https://forvo.com/word/voorzet/#nl	f	f	1617	football	2023-09-27 14:59:57.873874+01	\N
echt	real	\N	https://forvo.com/word/echt/#nl	f	f	1696	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
lettergreep	syllable	n/a	https://forvo.com/word/lettergreep/#nl	f	f	534	grammar	2023-09-27 14:59:57.873874+01	\N
persoon	person	n/a	https://forvo.com/word/persoon/#nl	f	f	489	\N	2023-09-27 14:59:57.873874+01	\N
huis	house	n/a	https://forvo.com/word/huis/#nl	f	f	88	household	2023-09-27 14:59:57.873874+01	\N
duw	push	n/a	https://forvo.com/word/duw/#nl	f	f	712	\N	2023-09-27 14:59:57.873874+01	\N
de nicht	the cousin, the niece	\N	https://forvo.com/word/nicht/#nl	f	f	1553	family	2023-09-27 14:59:57.873874+01	\N
frietje met	French fries with mayonnaise	\N	https://forvo.com/word/frietje/#nl	f	f	1167	food/drink	2023-09-27 14:59:57.873874+01	\N
de frikandel	Dutch meat sausage	\N	https://forvo.com/word/frikandel/#nl	f	f	1168	food/drink	2023-09-27 14:59:57.873874+01	\N
de leeuw	the lion	\N	https://forvo.com/word/leeuw/#nl	f	f	2054	animals (2)	2023-09-27 14:59:57.873874+01	\N
gezond	healthy	\N	https://forvo.com/word/gezond/#nl	f	f	1710	doctor	2023-09-27 14:59:57.873874+01	\N
de opleiding	the education	\N	https://forvo.com/word/opleiding/#nl	f	f	1523	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de ervaring	the experience	\N	https://forvo.com/word/ervaring/#nl	f	f	1524	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de aanval	the attack	\N	https://forvo.com/word/aanval/#nl	f	f	2085	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
de wortel	the carrot	\N	https://forvo.com/word/wortel/#nl	f	f	1851	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
veilig	safe	\N	https://forvo.com/word/veilig/#nl	f	f	2080	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
gevaarlijk	dangerous	\N	https://forvo.com/word/gevaarlijk/#nl	f	f	2081	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
de supporter	the fan	\N	https://forvo.com/word/supporter/#nl	f	f	1608	football	2023-09-27 14:59:57.873874+01	\N
de steen	the stone	\N	https://forvo.com/word/steen/#nl	f	f	1934	tools/materials	2023-09-27 14:59:57.873874+01	\N
zaterdag	Saturday	\N	https://forvo.com/word/zaterdag/#nl	f	f	1309	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
de rekenmachine	the calculator	\N	https://forvo.com/word/rekenmachine/#nl	f	f	1915	tools/materials	2023-09-27 14:59:57.873874+01	\N
de peer	the pear	\N	https://forvo.com/word/peer/#nl	f	f	1869	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
de banaan	the banana	\N	https://forvo.com/word/banaan/#nl	f	f	1870	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
vrije tijd	leisure time	\N	#	f	f	1354	hobbies	2023-09-27 14:59:57.873874+01	\N
dichtbij	nearby	\N	https://forvo.com/word/dichtbij/#nl	f	f	2129	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
het eiland	the island	\N	https://forvo.com/word/eiland/#nl	f	f	1398	Amsterdam	2023-09-27 14:59:57.873874+01	\N
het gesprek	the conversation, the interview	\N	https://forvo.com/word/gesprek/#nl	f	f	1525	job hunting/business	2023-09-27 14:59:57.873874+01	\N
om tien uur	at ten o’clock		#	f	f	1051	time	2023-09-27 14:59:57.873874+01	\N
links	left	\N	https://forvo.com/word/links/#nl	f	f	1114	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
een	a/an/any	\N	https://forvo.com/word/een/#nl	f	f	1081	introductory	2023-09-27 14:59:57.873874+01	\N
het nieuws	the news	\N	https://forvo.com/word/nieuws/#nl	f	f	2088	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
de krant	the newspaper	\N	https://forvo.com/word/krant/#nl	f	f	2089	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
nacht	night	n/a	https://forvo.com/word/nacht/#nl	f	f	247	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
origineel	original	n/a	https://forvo.com/word/origineel/#nl	f	f	866	\N	2023-09-27 14:59:57.873874+01	\N
kwart voor zeven	quarter to seven		#	f	f	1056	time	2023-09-27 14:59:57.873874+01	\N
de ochtend, de morgen	the morning		https://forvo.com/word/ochtend/#nl	f	f	1068	time	2023-09-27 14:59:57.873874+01	\N
de beer	the bear	\N	https://forvo.com/word/beer/#nl	f	f	2047	animals (2)	2023-09-27 14:59:57.873874+01	\N
ik	I	\N	https://forvo.com/word/ik/#nl	f	f	1078	introductory	2023-09-27 14:59:57.873874+01	\N
ik ben	I am	\N	https://forvo.com/word/ben/#nl	f	f	1080	introductory	2023-09-27 14:59:57.873874+01	\N
twintig voor vijf	twenty to five		#	f	f	1062	time	2023-09-27 14:59:57.873874+01	\N
toekomst	the future	\N	https://forvo.com/word/toekomst/#nl	f	f	2091	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
Oudjaar	New year’s eve	\N	https://forvo.com/word/Oudjaar/#nl	f	f	2008	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
van twee uur tot vijf uur	from two till five o’clock		#	f	f	1065	time	2023-09-27 14:59:57.873874+01	\N
voeren	enter	n/a	https://forvo.com/word/voeren/#nl	f	f	835	\N	2023-09-27 14:59:57.873874+01	\N
minder	less	\N	https://forvo.com/word/minder/#nl	f	f	1964	adverbs	2023-09-27 14:59:57.873874+01	\N
sectie	section	n/a	https://forvo.com/word/sectie/#nl	t	f	677	grammar	2023-09-27 14:59:57.873874+01	\N
de olifant	the elephant	\N	https://forvo.com/word/olifant/#nl	f	t	2046	animals (2)	2023-09-27 14:59:57.873874+01	\N
ik heet	my name is	\N	https://forvo.com/word/heet/#nl	f	t	1079	introductory	2023-09-27 14:59:57.873874+01	\N
de verkoper/verkoopster	the salesman/saleswoman	\N	https://forvo.com/word/verkoper/#nl	f	f	1146	professions	2023-09-27 14:59:57.873874+01	\N
stout	naughty	\N	https://forvo.com/word/stout/#nl	t	f	1293	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
samen	together	\N	https://forvo.com/word/samen/#nl	f	t	2128	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
niveau	level	n/a	https://forvo.com/word/niveau/#nl	t	f	979	\N	2023-09-27 14:59:57.873874+01	\N
muur	wall	n/a	https://forvo.com/word/muur/#nl	f	t	565	household	2023-09-27 14:59:57.873874+01	\N
de bank	the couch	\N	https://forvo.com/word/bank/#nl	f	t	1422	household	2023-09-27 14:59:57.873874+01	\N
tanden	teeth	n/a	https://forvo.com/word/tanden/#nl	f	t	899	body	2023-09-27 14:59:57.873874+01	\N
de vlag	the flag	\N	https://forvo.com/word/vlag/#nl	f	t	2090	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
gras	grass	n/a	https://forvo.com/word/gras/#nl	f	t	579	nature	2023-09-27 14:59:57.873874+01	\N
iedereen	everybody	\N	https://forvo.com/word/iedereen/#nl	f	t	2127	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
bloed	blood	n/a	https://forvo.com/word/bloed/#nl	f	t	628	body	2023-09-27 14:59:57.873874+01	\N
zuid(en)	south	\N	https://forvo.com/word/zuid/#nl	t	t	2078	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
land	land/country	n/a	https://forvo.com/word/land/#nl	f	t	71	geography	2023-09-27 14:59:57.873874+01	\N
vriend	friend	n/a	https://forvo.com/word/vriend/#nl	f	f	258	\N	2023-09-27 14:59:57.873874+01	\N
de jongen	the boy	\N	https://forvo.com/word/jongen/#nl	f	t	1086	introductory	2023-09-27 14:59:57.873874+01	\N
als	if, as	\N	https://forvo.com/word/als/#nl	f	t	2123	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
de moeder	the mother	\N	https://forvo.com/word/moeder/#nl	t	f	1544	family	2023-09-27 14:59:57.873874+01	\N
de machine	the machine	\N	https://forvo.com/word/machine/#nl	f	f	1914	tools/materials	2023-09-27 14:59:57.873874+01	\N
laten	to leave, let	\N	https://forvo.com/word/laten/#nl	f	f	1509	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
misverstand	misunderstanding	noun	https://forvo.com/word/misverstand/#nl	f	f	1028	\N	2023-09-27 14:59:57.873874+01	\N
zinsnede	phrase	n/a	https://forvo.com/word/zinsnede/#nl	f	f	735	grammar	2023-09-27 14:59:57.873874+01	\N
de bijkeuken	the scullery	\N	https://forvo.com/word/bijkeuken/#nl	f	f	1428	household	2023-09-27 14:59:57.873874+01	\N
gedragen	to behave	\N	https://forvo.com/word/gedragen/#nl	f	f	1884	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
kalm	calm	\N	https://forvo.com/word/kalm/#nl	f	f	2143	moods/emotions	2023-09-27 14:59:57.873874+01	\N
aardrijkskunde	geography	\N	https://forvo.com/word/aardrijkskunde/#nl	f	f	1739	geography	2023-09-27 14:59:57.873874+01	\N
de minuut	the minute		https://forvo.com/word/minuut/#nl	f	f	1057	time	2023-09-27 14:59:57.873874+01	\N
het varken	the pig	\N	https://forvo.com/word/varken/#nl	f	f	1577	animals (1)	2023-09-27 14:59:57.873874+01	\N
de reiskostenvergoeding	the compensation for travel expenses	\N	https://forvo.com/word/reiskostenvergoeding/#nl	f	f	1538	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de hobby	the hobby	\N	https://forvo.com/word/hobby/#nl	f	f	1355	hobbies	2023-09-27 14:59:57.873874+01	\N
de vakantie	the holiday	\N	https://forvo.com/word/vakantie/#nl	f	f	1357	hobbies	2023-09-27 14:59:57.873874+01	\N
artikel	product	n/a	https://forvo.com/word/artikel/#nl	f	f	326	job hunting/business	2023-09-27 14:59:57.873874+01	\N
gesneden	cut	n/a	https://forvo.com/word/gesneden/#nl	f	f	268	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
het ijs	the ice	\N	https://forvo.com/word/ijs/#nl	f	f	1682	weather	2023-09-27 14:59:57.873874+01	\N
niet	not, don't	\N	https://forvo.com/word/niet/#nl	f	f	1110	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
verslaan	beat	n/a	https://forvo.com/word/verslaan/#nl	f	f	747	\N	2023-09-27 14:59:57.873874+01	\N
vilt	felt	n/a	https://forvo.com/word/vilt/#nl	f	f	535	\N	2023-09-27 14:59:57.873874+01	\N
dikke	thick	n/a	https://forvo.com/word/dikke/#nl	f	f	758	\N	2023-09-27 14:59:57.873874+01	\N
eiland	island	n/a	https://forvo.com/word/eiland/#nl	f	f	366	nature	2023-09-27 14:59:57.873874+01	\N
voet	foot	n/a	https://forvo.com/word/voet/#nl	f	f	367	body	2023-09-27 14:59:57.873874+01	\N
belangrijk	important	\N	https://forvo.com/word/belangrijk/#nl	f	f	1686	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
beter	better	\N	https://forvo.com/word/beter/#nl	f	f	1687	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
de nacht	the night		https://forvo.com/word/nacht/#nl	f	f	1066	time	2023-09-27 14:59:57.873874+01	\N
heeft	has	n/a	https://forvo.com/word/heeft/#nl	f	f	175	\N	2023-09-27 14:59:57.873874+01	\N
deel	part	n/a	https://forvo.com/word/deel/#nl	f	f	105	\N	2023-09-27 14:59:57.873874+01	\N
grootte	size	n/a	https://forvo.com/word/grootte/#nl	f	f	522	\N	2023-09-27 14:59:57.873874+01	\N
zei	said	n/a	https://forvo.com/word/zei/#nl	f	f	48	\N	2023-09-27 14:59:57.873874+01	\N
de man	the man	\N	https://forvo.com/word/man/#nl	f	f	1084	introductory	2023-09-27 14:59:57.873874+01	\N
het meisje	the girl	\N	https://forvo.com/word/meisje/#nl	f	f	1087	introductory	2023-09-27 14:59:57.873874+01	\N
variëren	vary	n/a	https://forvo.com/word/variëren/#nl	f	f	523	\N	2023-09-27 14:59:57.873874+01	\N
aftrekken	subtract	n/a	https://forvo.com/word/aftrekken/#nl	f	f	958	\N	2023-09-27 14:59:57.873874+01	\N
streken	pranks	noun	https://forvo.com/word/streken/#nl	f	f	1026	\N	2023-09-27 14:59:57.873874+01	\N
hard	hard, fast	\N	https://forvo.com/word/hard/#nl	f	f	1289	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
de strik	the bow	\N	https://forvo.com/word/strik/#nl	f	f	1481	clothes	2023-09-27 14:59:57.873874+01	\N
de krokodil	the crocodile	\N	https://forvo.com/word/krokodil/#nl	f	f	2051	animals (2)	2023-09-27 14:59:57.873874+01	\N
het oor	the ear	\N	https://forvo.com/word/oor/#nl	f	f	1438	body	2023-09-27 14:59:57.873874+01	\N
reusachtig	huge	n/a	https://forvo.com/word/reusachtig/#nl	f	f	919	\N	2023-09-27 14:59:57.873874+01	\N
bar	bar	n/a	https://forvo.com/word/bar/#nl	f	f	873	\N	2023-09-27 14:59:57.873874+01	\N
afvragen	wonder	n/a	https://forvo.com/word/afvragen/#nl	f	f	379	\N	2023-09-27 14:59:57.873874+01	\N
gelijk	equal/equate	\N	https://forvo.com/word/gelijk/#nl	f	f	1992	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
het onweer	the thunderstorm	\N	https://forvo.com/word/onweer/#nl	f	f	1676	weather	2023-09-27 14:59:57.873874+01	\N
tegen	against	\N	https://forvo.com/word/tegen/#nl	f	f	1347	prepositions	2023-09-27 14:59:57.873874+01	\N
geschiedenis	history	n/a	https://forvo.com/word/geschiedenis/#nl	f	f	789	\N	2023-09-27 14:59:57.873874+01	\N
makkelijk	easy	\N	https://forvo.com/word/makkelijk/#nl	f	f	1995	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
ruimte	space	n/a	https://forvo.com/word/ruimte/#nl	f	f	451	\N	2023-09-27 14:59:57.873874+01	\N
man	man/husband	n/a	https://forvo.com/word/man/#nl	f	f	117	\N	2023-09-27 14:59:57.873874+01	\N
de vrouw	the woman	\N	https://forvo.com/word/vrouw/#nl	f	t	1085	introductory	2023-09-27 14:59:57.873874+01	\N
de storm	the storm	\N	https://forvo.com/word/storm/#nl	f	t	1675	weather	2023-09-27 14:59:57.873874+01	\N
de framboos	the raspberry	\N	https://forvo.com/word/framboos/#nl	f	t	1878	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
het woord	the word	\N	https://forvo.com/word/woord/#nl	f	t	2139	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
pand	property	n/a	https://forvo.com/word/pand/#nl	t	f	986	household	2023-09-27 14:59:57.873874+01	\N
welke	which	\N	https://forvo.com/word/welke/#nl	f	t	1178	question words	2023-09-27 14:59:57.873874+01	\N
de doelverdediger	the goalkeeper	\N	https://forvo.com/word/doelverdediger/#nl	t	f	1606	football	2023-09-27 14:59:57.873874+01	\N
de makelaar	the real estate agent	\N	https://forvo.com/word/makelaar/#nl	f	t	1771	moving/immigration	2023-09-27 14:59:57.873874+01	\N
vet	fat/greasy	n/a	https://forvo.com/word/vet/#nl	f	t	864	\N	2023-09-27 14:59:57.873874+01	\N
in verwachting	expecting (a baby)	\N	https://forvo.com/word/verwachting/#nl	t	f	1902	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
werkwoord	verb	n/a	https://forvo.com/word/werkwoord/#nl	f	t	469	grammar	2023-09-27 14:59:57.873874+01	\N
natuurlijke	natural	n/a	https://forvo.com/word/natuurlijke/#nl	t	t	749	nature	2023-09-27 14:59:57.873874+01	\N
wassen	to wash	\N	https://forvo.com/word/wassen/#nl	f	t	1883	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
de middag	the afternoon		https://forvo.com/word/middag/#nl	t	t	1070	time	2023-09-27 14:59:57.873874+01	\N
dertien	thirteen	\N	https://forvo.com/word/dertien/#nl	f	t	1235	numbers/counting	2023-09-27 14:59:57.873874+01	\N
ontwerp	design	n/a	https://forvo.com/word/ontwerp/#nl	f	t	686	\N	2023-09-27 14:59:57.873874+01	\N
meisje	girl	n/a	https://forvo.com/word/meisje/#nl	f	t	304	\N	2023-09-27 14:59:57.873874+01	\N
zwanger	pregnant	\N	https://forvo.com/word/zwanger/#nl	f	t	1903	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
boot	boat	n/a	https://forvo.com/word/boot/#nl	f	t	372	Amsterdam	2023-09-27 14:59:57.873874+01	\N
bepaalde	certain	UvA A2 Course	https://forvo.com/word/bepaalde/#nl	f	f	406	\N	2023-09-27 14:59:57.873874+01	\N
procent	cent	n/a	https://forvo.com/word/procent/#nl	f	t	631	\N	2023-09-27 14:59:57.873874+01	\N
maar	but	\N	https://forvo.com/word/maar/#nl	f	t	1195	question words	2023-09-27 14:59:57.873874+01	\N
medeklinker	consonant	n/a	https://forvo.com/word/medeklinker/#nl	f	f	668	grammar	2023-09-27 14:59:57.873874+01	\N
rest	rest	n/a	https://forvo.com/word/rest/#nl	f	f	421	\N	2023-09-27 14:59:57.873874+01	\N
moeder	mother	n/a	https://forvo.com/word/moeder/#nl	f	f	95	family	2023-09-27 14:59:57.873874+01	\N
begon	began	n/a	https://forvo.com/word/begon/#nl	f	f	259	\N	2023-09-27 14:59:57.873874+01	\N
gewoon	usual, just	\N	https://forvo.com/word/gewoon/#nl	f	f	2122	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
vinger	finger	n/a	https://forvo.com/word/vinger/#nl	f	f	742	body	2023-09-27 14:59:57.873874+01	\N
de naturalisatie	the naturalisation	\N	https://forvo.com/word/naturalisatie/#nl	f	f	1790	moving/immigration	2023-09-27 14:59:57.873874+01	\N
bedrijf	company	n/a	https://forvo.com/word/bedrijf/#nl	f	f	957	job hunting/business	2023-09-27 14:59:57.873874+01	\N
gaf	gave	n/a	https://forvo.com/word/gaf/#nl	f	f	434	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
bot	bone	n/a	https://forvo.com/word/bot/#nl	f	f	793	body	2023-09-27 14:59:57.873874+01	\N
onrustig	restless	\N	https://forvo.com/word/onrustig/#nl	f	f	1803	moods/emotions	2023-09-27 14:59:57.873874+01	\N
gevonden	found	n/a	https://forvo.com/word/gevonden/#nl	f	f	208	\N	2023-09-27 14:59:57.873874+01	\N
houden	to hold, to keep	\N	https://forvo.com/word/houden/#nl	f	f	1504	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
aannemen	to hire	\N	https://forvo.com/word/aannemen/#nl	f	f	1540	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de fles	the bottle	\N	https://forvo.com/word/fles/#nl	f	f	1847	cooking	2023-09-27 14:59:57.873874+01	\N
edge	edge	n/a	https://forvo.com/word/edge/#nl	f	f	582	\N	2023-09-27 14:59:57.873874+01	\N
hun	their	\N	https://forvo.com/word/hun/#nl	f	f	2120	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
hoek	corner	n/a	https://forvo.com/word/hoek/#nl	f	f	774	\N	2023-09-27 14:59:57.873874+01	\N
methode	method	n/a	https://forvo.com/word/methode/#nl	f	f	673	\N	2023-09-27 14:59:57.873874+01	\N
regeren	govern	n/a	https://forvo.com/word/regeren/#nl	f	f	497	\N	2023-09-27 14:59:57.873874+01	\N
kennisgeving	notice	n/a	https://forvo.com/word/kennisgeving/#nl	f	f	500	\N	2023-09-27 14:59:57.873874+01	\N
hunt	hunt	n/a	https://forvo.com/word/hunt/#nl	f	f	503	\N	2023-09-27 14:59:57.873874+01	\N
zout	salt	n/a	https://forvo.com/word/zout/#nl	f	f	996	food/drink	2023-09-27 14:59:57.873874+01	\N
de tante	the aunt	\N	https://forvo.com/word/tante/#nl	f	f	1550	family	2023-09-27 14:59:57.873874+01	\N
grond	ground	n/a	https://forvo.com/word/grond/#nl	f	f	465	nature	2023-09-27 14:59:57.873874+01	\N
voorzichtig	careful	\N	https://forvo.com/word/voorzichtig/#nl	f	f	2069	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
aandeel	share	n/a	https://forvo.com/word/aandeel/#nl	f	f	867	\N	2023-09-27 14:59:57.873874+01	\N
millennium	millennium	noun	https://forvo.com/word/millennium/#nl	f	f	1043	time	2023-09-27 14:59:57.873874+01	\N
voorzijde	front	n/a	https://forvo.com/word/voorzijde/#nl	f	f	430	\N	2023-09-27 14:59:57.873874+01	\N
ochtend	morning	n/a	https://forvo.com/word/ochtend/#nl	f	f	476	time	2023-09-27 14:59:57.873874+01	\N
slecht weer	bad weather	\N	#	f	f	1668	weather	2023-09-27 14:59:57.873874+01	\N
vijf voor acht	five to eight		#	f	f	1060	time	2023-09-27 14:59:57.873874+01	\N
het huis	the house	\N	https://forvo.com/word/huis/#nl	f	f	1088	introductory	2023-09-27 14:59:57.873874+01	\N
hallo	hello	\N	https://forvo.com/word/hallo/#nl	f	f	1089	introductory	2023-09-27 14:59:57.873874+01	\N
hoi	hi	\N	https://forvo.com/word/hoi/#nl	f	f	1090	introductory	2023-09-27 14:59:57.873874+01	\N
de wolf	the wolf	\N	https://forvo.com/word/wolf/#nl	f	f	2048	animals (2)	2023-09-27 14:59:57.873874+01	\N
de giraffe	the giraffe	\N	https://forvo.com/word/giraffe/#nl	f	f	2049	animals (2)	2023-09-27 14:59:57.873874+01	\N
goedemorgen	good morning	\N	https://forvo.com/word/goedemorgen/#nl	f	f	1095	introductory	2023-09-27 14:59:57.873874+01	\N
slip	slip	n/a	https://forvo.com/word/slip/#nl	f	f	937	\N	2023-09-27 14:59:57.873874+01	\N
helpen	to help	\N	https://forvo.com/word/helpen/#nl	f	f	1503	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
zaad	seed	n/a	https://forvo.com/word/zaad/#nl	f	f	616	nature	2023-09-27 14:59:57.873874+01	\N
dit	this	\N	https://forvo.com/word/dit/#nl	f	f	1177	question words	2023-09-27 14:59:57.873874+01	\N
kapitein	captain	n/a	https://forvo.com/word/kapitein/#nl	f	f	801	\N	2023-09-27 14:59:57.873874+01	\N
vervelen	to annoy	\N	https://forvo.com/word/vervelen/#nl	f	f	1798	moods/emotions	2023-09-27 14:59:57.873874+01	\N
de wallen	the red light district	\N	https://forvo.com/word/wallen/#nl	f	f	1403	Amsterdam	2023-09-27 14:59:57.873874+01	\N
apparaat	machine	n/a	https://forvo.com/word/apparaat/#nl	f	f	412	\N	2023-09-27 14:59:57.873874+01	\N
de dagen van de week	the days of the week	\N	#	f	f	1302	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
denk	guess	n/a	https://forvo.com/word/denk/#nl	f	f	802	\N	2023-09-27 14:59:57.873874+01	\N
instemmen	agree	n/a	https://forvo.com/word/instemmen/#nl	f	f	797	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
reisleider	guide		https://forvo.com/word/reisleider/#nl	f	f	1004	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
het elftal	the football team	\N	https://forvo.com/word/elftal/#nl	f	f	1599	football	2023-09-27 14:59:57.873874+01	\N
bitter	bitter	\N	https://forvo.com/word/bitter/#nl	f	f	1834	cooking	2023-09-27 14:59:57.873874+01	\N
schouder	shoulder	n/a	https://forvo.com/word/schouder/#nl	f	f	967	body	2023-09-27 14:59:57.873874+01	\N
de allochtoon	the immigrant	\N	https://forvo.com/word/allochtoon/#nl	f	f	1768	moving/immigration	2023-09-27 14:59:57.873874+01	\N
hemel	sky	n/a	https://forvo.com/word/hemel/#nl	f	f	569	nature	2023-09-27 14:59:57.873874+01	\N
maïs	corn	n/a	https://forvo.com/word/maïs/#nl	t	f	812	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
de televisie	the television	\N	https://forvo.com/word/televisie/#nl	f	t	1414	household	2023-09-27 14:59:57.873874+01	\N
aan	to	n/a	https://forvo.com/word/aan/#nl	f	f	32	prepositions	2023-09-27 14:59:57.873874+01	\N
moeilijk	difficult	\N	https://forvo.com/word/moeilijk/#nl	f	t	1996	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
minste	least	n/a	https://forvo.com/word/minste/#nl	t	f	611	\N	2023-09-27 14:59:57.873874+01	\N
het cv (curriculum vitae)	the resume	\N	#	f	t	1522	job hunting/business	2023-09-27 14:59:57.873874+01	\N
post	post	n/a	https://forvo.com/word/post/#nl	f	t	861	\N	2023-09-27 14:59:57.873874+01	\N
act	act	n/a	https://forvo.com/word/act/#nl	t	f	78	\N	2023-09-27 14:59:57.873874+01	\N
zand	sand	n/a	https://forvo.com/word/zand/#nl	f	t	738	nature	2023-09-27 14:59:57.873874+01	\N
sneeuw	snow	n/a	https://forvo.com/word/sneeuw/#nl	f	t	392	nature	2023-09-27 14:59:57.873874+01	\N
mijl	mile	n/a	https://forvo.com/word/mijl/#nl	t	f	296	\N	2023-09-27 14:59:57.873874+01	\N
kennen	to know (familiarity)	\N	https://forvo.com/word/kennen/#nl	f	t	1507	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
succes	success	n/a	https://forvo.com/word/succes/#nl	f	t	956	\N	2023-09-27 14:59:57.873874+01	\N
duur	expensive	\N	https://forvo.com/word/duur/#nl	t	t	1296	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
het instrument	the tool, the (musical) instrument	\N	https://forvo.com/word/instrument/#nl	f	t	1910	tools/materials	2023-09-27 14:59:57.873874+01	\N
het meer	the lake	\N	https://forvo.com/word/meer/#nl	f	t	1755	geography	2023-09-27 14:59:57.873874+01	\N
slecht	bad	\N	https://forvo.com/word/slecht/#nl	f	t	1092	introductory	2023-09-27 14:59:57.873874+01	\N
oversteken	to cross over	UvA A2 Course	https://forvo.com/word/oversteken/#nl	f	f	230	\N	2023-09-27 14:59:57.873874+01	\N
de tweede helft	the second half	\N	#	f	t	1612	football	2023-09-27 14:59:57.873874+01	\N
het weer	the weather	\N	https://forvo.com/word/weer/#nl	f	t	1655	weather	2023-09-27 14:59:57.873874+01	\N
eenmaal	once, just/simply	n/a	https://forvo.com/word/eenmaal/#nl	f	f	264	UvA B1A Course CH4	2023-09-27 14:59:57.873874+01	\N
hoewel	though	n/a	https://forvo.com/word/hoewel/#nl	f	f	312	\N	2023-09-27 14:59:57.873874+01	\N
goed	good/well	\N	https://forvo.com/word/goed/#nl	f	f	1091	introductory	2023-09-27 14:59:57.873874+01	\N
haar	her/hair	\N	https://forvo.com/word/haar/#nl	f	f	2115	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
vooruit	forward	n/a	https://forvo.com/word/vooruit/#nl	f	f	923	adverbs	2023-09-27 14:59:57.873874+01	\N
verrassen	to surprise	\N	https://forvo.com/word/verrassen/#nl	f	f	2025	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
onmiddellijke	instant	n/a	https://forvo.com/word/onmiddellijke/#nl	f	f	878	\N	2023-09-27 14:59:57.873874+01	\N
hen	them	n/a	https://forvo.com/word/hen/#nl	f	f	162	\N	2023-09-27 14:59:57.873874+01	\N
geleden	ago	n/a	https://forvo.com/word/geleden/#nl	f	f	382	time	2023-09-27 14:59:57.873874+01	\N
even	just (as)	\N	https://forvo.com/word/even/#nl	f	f	1949	adverbs	2023-09-27 14:59:57.873874+01	\N
mannen	men	n/a	https://forvo.com/word/mannen/#nl	f	f	81	\N	2023-09-27 14:59:57.873874+01	\N
spelen	to play	\N	https://forvo.com/word/spelen/#nl	f	f	1642	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
voorwaarde	condition	n/a	https://forvo.com/word/voorwaarde/#nl	f	f	941	\N	2023-09-27 14:59:57.873874+01	\N
voer	feed	n/a	https://forvo.com/word/voer/#nl	f	f	942	\N	2023-09-27 14:59:57.873874+01	\N
familie	family	n/a	https://forvo.com/word/familie/#nl	f	f	319	family	2023-09-27 14:59:57.873874+01	\N
kopie	copy	n/a	https://forvo.com/word/kopie/#nl	f	f	734	\N	2023-09-27 14:59:57.873874+01	\N
de hei	the moor	\N	https://forvo.com/word/hei/#nl	f	f	1765	geography	2023-09-27 14:59:57.873874+01	\N
vaak	often	\N	https://forvo.com/word/vaak/#nl	f	f	2130	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
de grap	the joke	\N	https://forvo.com/word/grap/#nl	f	f	2131	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
laatst	last	\N	https://forvo.com/word/laatst/#nl	f	f	2107	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
het wereldkampioenschap (wk)	the world cup	\N	https://forvo.com/word/wereldkampioenschap/#nl	f	f	1628	football	2023-09-27 14:59:57.873874+01	\N
geur	smell	n/a	https://forvo.com/word/geur/#nl	f	f	946	\N	2023-09-27 14:59:57.873874+01	\N
vers	fresh	\N	https://forvo.com/word/vers/#nl	f	f	1850	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
pittig	spicy	\N	https://forvo.com/word/pittig/#nl	f	f	1835	cooking	2023-09-27 14:59:57.873874+01	\N
wij/we	we	\N	https://forvo.com/word/we/#nl	f	f	1124	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
cel	cell	n/a	https://forvo.com/word/cel/#nl	f	f	509	\N	2023-09-27 14:59:57.873874+01	\N
solliciteren	to apply for	\N	https://forvo.com/word/solliciteren/#nl	f	f	1513	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de sollicitatie	the application	\N	https://forvo.com/word/sollicitatie/#nl	f	f	1514	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de vacature	the vacancy	\N	https://forvo.com/word/vacature/#nl	f	f	1515	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de advertentie	the advertisement	\N	https://forvo.com/word/advertentie/#nl	f	f	1516	job hunting/business	2023-09-27 14:59:57.873874+01	\N
het werk	the work	\N	https://forvo.com/word/werk/#nl	f	f	1517	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de baan	the job	\N	https://forvo.com/word/baan/#nl	f	f	1518	job hunting/business	2023-09-27 14:59:57.873874+01	\N
lezen	to read	\N	https://forvo.com/word/lezen/#nl	f	f	1266	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
schrijven	to write	\N	https://forvo.com/word/schrijven/#nl	f	f	1267	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
enige	only	\N	https://forvo.com/word/enige/#nl	f	f	1689	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
de jurk	the dress	\N	https://forvo.com/word/jurk/#nl	f	f	1468	clothes	2023-09-27 14:59:57.873874+01	\N
veertig	forty	\N	https://forvo.com/word/veertig/#nl	f	f	1241	numbers/counting	2023-09-27 14:59:57.873874+01	\N
de aap	the monkey	\N	https://forvo.com/word/aap/#nl	f	f	2045	animals (2)	2023-09-27 14:59:57.873874+01	\N
veertien	fourteen	\N	https://forvo.com/word/veertien/#nl	f	f	1236	numbers/counting	2023-09-27 14:59:57.873874+01	\N
pas	only	\N	https://forvo.com/word/pas/#nl	f	f	1946	adverbs	2023-09-27 14:59:57.873874+01	\N
aanwezig	present	n/a	https://forvo.com/word/aanwezig/#nl	f	f	543	\N	2023-09-27 14:59:57.873874+01	\N
de rijst	the rice	\N	https://forvo.com/word/rijst/#nl	f	f	1864	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
het zout	the salt	\N	https://forvo.com/word/zout/#nl	f	f	1866	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
vermenigvuldigen	multiply	n/a	https://forvo.com/word/vermenigvuldigen/#nl	f	f	353	numbers/counting	2023-09-27 14:59:57.873874+01	\N
aanmelden	log	n/a	https://forvo.com/word/aanmelden/#nl	f	f	896	\N	2023-09-27 14:59:57.873874+01	\N
juli	July	\N	https://forvo.com/word/juli/#nl	f	f	1319	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
de bruiloft	the wedding	\N	https://forvo.com/word/bruiloft/#nl	f	f	2021	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
het bezoek	the visit/visitors	\N	https://forvo.com/word/bezoek/#nl	f	f	2017	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
de erwt	the pea	\N	https://forvo.com/word/erwt/#nl	f	f	1853	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
de spinazie	the spinach	\N	https://forvo.com/word/spinazie/#nl	f	f	1854	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
de boerenkool	the kale	\N	https://forvo.com/word/boerenkool/#nl	f	f	1855	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
oppervlak	surface	n/a	https://forvo.com/word/oppervlak/#nl	f	f	363	\N	2023-09-27 14:59:57.873874+01	\N
bezoek	visit	n/a	https://forvo.com/word/bezoek/#nl	f	f	584	\N	2023-09-27 14:59:57.873874+01	\N
vloer	floor	n/a	https://forvo.com/word/vloer/#nl	f	f	721	\N	2023-09-27 14:59:57.873874+01	\N
zon	sun	n/a	https://forvo.com/word/zon/#nl	f	f	218	nature	2023-09-27 14:59:57.873874+01	\N
stond	stood	n/a	https://forvo.com/word/stond/#nl	f	f	428	\N	2023-09-27 14:59:57.873874+01	\N
betekende	meant	n/a	https://forvo.com/word/betekende/#nl	f	f	897	\N	2023-09-27 14:59:57.873874+01	\N
de tulp	the tulip	\N	https://forvo.com/word/tulp/#nl	f	f	1280	dutch symbols	2023-09-27 14:59:57.873874+01	\N
melodie	melody	n/a	https://forvo.com/word/melodie/#nl	f	f	602	\N	2023-09-27 14:59:57.873874+01	\N
meer dan	over	n/a	#	f	f	189	prepositions	2023-09-27 14:59:57.873874+01	\N
chief	chief	n/a	https://forvo.com/word/chief/#nl	f	f	830	\N	2023-09-27 14:59:57.873874+01	\N
woordenboek	dictionary	n/a	https://forvo.com/word/woordenboek/#nl	f	f	670	grammar	2023-09-27 14:59:57.873874+01	\N
dertig	thirty	\N	https://forvo.com/word/dertig/#nl	f	t	1240	numbers/counting	2023-09-27 14:59:57.873874+01	\N
de peper	the pepper	\N	https://forvo.com/word/peper/#nl	f	t	1865	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
brood	bread	n/a	https://forvo.com/word/brood/#nl	f	t	870	food/drink	2023-09-27 14:59:57.873874+01	\N
vraag	question	n/a	https://forvo.com/word/vraag/#nl	f	t	332	\N	2023-09-27 14:59:57.873874+01	\N
mooi	beautiful	\N	https://forvo.com/word/mooi/#nl	f	t	1279	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
het ziekenhuis	the hospital	\N	https://forvo.com/word/ziekenhuis/#nl	f	t	1214	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
lelijk	ugly	\N	https://forvo.com/word/lelijk/#nl	f	t	1281	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
vijf over half vier	twenty five to four		#	f	t	1061	time	2023-09-27 14:59:57.873874+01	\N
gebruiken	to use	\N	https://forvo.com/word/gebruiken/#nl	f	t	1636	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
boek	book	n/a	https://forvo.com/word/boek/#nl	f	t	252	\N	2023-09-27 14:59:57.873874+01	\N
zilver	silver	n/a	https://forvo.com/word/zilver/#nl	f	t	911	tools/materials	2023-09-27 14:59:57.873874+01	\N
iemand	somebody	\N	https://forvo.com/word/iemand/#nl	f	t	2126	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
erg	very, bad/awful	\N	https://forvo.com/word/erg/#nl	f	f	1948	adverbs	2023-09-27 14:59:57.873874+01	\N
aardig	friendly	\N	https://forvo.com/word/aardig/#nl	f	f	1816	moods/emotions	2023-09-27 14:59:57.873874+01	\N
de slak	the snail	\N	https://forvo.com/word/slak/#nl	f	f	2038	animals (2)	2023-09-27 14:59:57.873874+01	\N
de dolfijn	the dolphin	\N	https://forvo.com/word/dolfijn/#nl	f	f	2040	animals (2)	2023-09-27 14:59:57.873874+01	\N
de zeehond	the seal	\N	https://forvo.com/word/zeehond/#nl	f	f	2041	animals (2)	2023-09-27 14:59:57.873874+01	\N
wandelen	to go for a walk	\N	https://forvo.com/word/wandelen/#nl	f	f	1367	hobbies	2023-09-27 14:59:57.873874+01	\N
centrum	center	n/a	https://forvo.com/word/centrum/#nl	f	f	487	\N	2023-09-27 14:59:57.873874+01	\N
betekenen	mean	n/a	https://forvo.com/word/betekenen/#nl	f	f	143	\N	2023-09-27 14:59:57.873874+01	\N
afvalzak	sick bag	noun	https://forvo.com/word/afvalzak/#nl	f	f	1025	\N	2023-09-27 14:59:57.873874+01	\N
wild	wild	\N	https://forvo.com/word/wild/#nl	f	f	2034	animals (2)	2023-09-27 14:59:57.873874+01	\N
de brandstof	the fuel	\N	https://forvo.com/word/brandstof/#nl	f	f	1926	tools/materials	2023-09-27 14:59:57.873874+01	\N
de voet	the foot	\N	https://forvo.com/word/voet/#nl	f	f	1450	body	2023-09-27 14:59:57.873874+01	\N
de tijger	the tiger	\N	https://forvo.com/word/tijger/#nl	f	f	2053	animals (2)	2023-09-27 14:59:57.873874+01	\N
apart	separate	n/a	https://forvo.com/word/apart/#nl	f	f	763	\N	2023-09-27 14:59:57.873874+01	\N
doei	bye	\N	https://forvo.com/word/doei/#nl	f	f	1102	introductory	2023-09-27 14:59:57.873874+01	\N
klaar	ready	\N	https://forvo.com/word/klaar/#nl	f	f	1708	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
het vliegveld	the airport	\N	https://forvo.com/word/vliegveld/#nl	f	f	1208	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
jaar	year	n/a	https://forvo.com/word/jaar/#nl	f	f	118	time	2023-09-27 14:59:57.873874+01	\N
bevolken	populate	n/a	https://forvo.com/word/bevolken/#nl	f	f	881	\N	2023-09-27 14:59:57.873874+01	\N
bell	bell	n/a	https://forvo.com/word/bell/#nl	f	f	816	tools/materials	2023-09-27 14:59:57.873874+01	\N
slaaf	slave	n/a	https://forvo.com/word/slaaf/#nl	f	f	876	\N	2023-09-27 14:59:57.873874+01	\N
vriezen	to freeze	\N	https://forvo.com/word/vriezen/#nl	f	f	1681	weather	2023-09-27 14:59:57.873874+01	\N
sleutel	key	n/a	https://forvo.com/word/sleutel/#nl	f	f	691	\N	2023-09-27 14:59:57.873874+01	\N
reis	trip	n/a	https://forvo.com/word/reis/#nl	f	f	603	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de rok	the skirt	\N	https://forvo.com/word/rok/#nl	f	f	1467	clothes	2023-09-27 14:59:57.873874+01	\N
de avond	the evening		https://forvo.com/word/avond/#nl	f	f	1072	time	2023-09-27 14:59:57.873874+01	\N
spreken	to speak	\N	https://forvo.com/word/spreken/#nl	f	f	1268	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
minuut	minute	n/a	https://forvo.com/word/minuut/#nl	f	f	442	time	2023-09-27 14:59:57.873874+01	\N
waar	where	\N	https://forvo.com/word/waar/#nl	f	f	1181	question words	2023-09-27 14:59:57.873874+01	\N
geopend	open	n/a	https://forvo.com/word/geopend/#nl	f	f	275	\N	2023-09-27 14:59:57.873874+01	\N
de mier	the ant	\N	https://forvo.com/word/mier/#nl	f	f	2035	animals (2)	2023-09-27 14:59:57.873874+01	\N
zingen	to sing	\N	https://forvo.com/word/zingen/#nl	f	f	1380	hobbies	2023-09-27 14:59:57.873874+01	\N
het nummer	the number / the song	\N	https://forvo.com/word/nummer/#nl	f	f	2135	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
tuin	garden	n/a	https://forvo.com/word/tuin/#nl	f	f	639	household	2023-09-27 14:59:57.873874+01	\N
meervoud	plural	n/a	https://forvo.com/word/meervoud/#nl	f	f	998	grammar	2023-09-27 14:59:57.873874+01	\N
het museum	the museum	\N	https://forvo.com/word/museum/#nl	f	f	1391	Amsterdam	2023-09-27 14:59:57.873874+01	\N
grand	grand	n/a	https://forvo.com/word/grand/#nl	f	f	536	\N	2023-09-27 14:59:57.873874+01	\N
onderstrepen	to underline	verb	https://forvo.com/word/onderstrepen/#nl	f	f	1014	grammar	2023-09-27 14:59:57.873874+01	\N
woord	word	n/a	https://forvo.com/word/woord/#nl	f	f	21	\N	2023-09-27 14:59:57.873874+01	\N
afdrukken	print	n/a	https://forvo.com/word/afdrukken/#nl	f	f	843	\N	2023-09-27 14:59:57.873874+01	\N
zonder	without	\N	https://forvo.com/word/zonder/#nl	f	f	1350	prepositions	2023-09-27 14:59:57.873874+01	\N
kopen	to buy	\N	https://forvo.com/word/kopen/#nl	f	f	1253	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
de gracht	the canal	\N	https://forvo.com/word/gracht/#nl	f	f	1384	Amsterdam	2023-09-27 14:59:57.873874+01	\N
de auto van de zaak	the company car	\N	#	f	f	1534	job hunting/business	2023-09-27 14:59:57.873874+01	\N
weer	again	n/a	https://forvo.com/word/weer/#nl	f	f	92	adverbs	2023-09-27 14:59:57.873874+01	\N
bal	ball	n/a	https://forvo.com/word/bal/#nl	f	f	537	football	2023-09-27 14:59:57.873874+01	\N
doden	kill	n/a	https://forvo.com/word/doden/#nl	f	f	658	\N	2023-09-27 14:59:57.873874+01	\N
geluidsoverlast	noise	n/a	https://forvo.com/word/geluidsoverlast/#nl	f	f	978	\N	2023-09-27 14:59:57.873874+01	\N
aantal	number	n/a	https://forvo.com/word/aantal/#nl	f	f	183	numbers/counting	2023-09-27 14:59:57.873874+01	\N
de wijn	the wine	\N	https://forvo.com/word/wijn/#nl	f	f	1162	food/drink	2023-09-27 14:59:57.873874+01	\N
honger hebben	to be hungry	\N	https://forvo.com/word/honger/#nl	f	f	1828	cooking	2023-09-27 14:59:57.873874+01	\N
winkelen	to go shopping	\N	https://forvo.com/word/winkelen/#nl	f	f	1382	hobbies	2023-09-27 14:59:57.873874+01	\N
zitje	seat	n/a	https://forvo.com/word/zitje/#nl	f	f	950	\N	2023-09-27 14:59:57.873874+01	\N
de vergoeding	the compensation	\N	https://forvo.com/word/vergoeding/#nl	f	f	1537	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de riem	the belt	\N	https://forvo.com/word/riem/#nl	f	f	1473	clothes	2023-09-27 14:59:57.873874+01	\N
de spits	the striker	\N	https://forvo.com/word/spits/#nl	f	f	1602	football	2023-09-27 14:59:57.873874+01	\N
de verdediger	the defender	\N	https://forvo.com/word/verdediger/#nl	f	f	1604	football	2023-09-27 14:59:57.873874+01	\N
zee	sea	n/a	https://forvo.com/word/zee/#nl	f	t	238	nature	2023-09-27 14:59:57.873874+01	\N
huilen	to cry	\N	https://forvo.com/word/huilen/#nl	t	f	1892	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
wist	knew	n/a	https://forvo.com/word/wist/#nl	t	f	345	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
toon	tone	n/a	https://forvo.com/word/toon/#nl	t	f	617	\N	2023-09-27 14:59:57.873874+01	\N
de haven	the port	\N	https://forvo.com/word/haven/#nl	f	t	1209	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de middenvelder	the midfielder	\N	https://forvo.com/word/middenvelder/#nl	t	f	1603	football	2023-09-27 14:59:57.873874+01	\N
woensdag	Wednesday	\N	https://forvo.com/word/woensdag/#nl	f	t	1306	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
lezing	lecture	noun	https://forvo.com/word/lezing/#nl	t	f	1010	\N	2023-09-27 14:59:57.873874+01	\N
‘s ochtends / ‘s morgens	in the morning		#	f	t	1069	time	2023-09-27 14:59:57.873874+01	\N
middernacht	midnight		https://forvo.com/word/middernacht/#nl	t	f	1075	time	2023-09-27 14:59:57.873874+01	\N
slaap	sleep	n/a	https://forvo.com/word/slaap/#nl	f	t	560	\N	2023-09-27 14:59:57.873874+01	\N
de gezondheid	the health	\N	https://forvo.com/word/gezondheid/#nl	f	t	1709	doctor	2023-09-27 14:59:57.873874+01	\N
pistool	gun	n/a	https://forvo.com/word/pistool/#nl	f	t	841	\N	2023-09-27 14:59:57.873874+01	\N
Sinterklaas	(Sinterklaas)	\N	https://forvo.com/word/Sinterklaas/#nl	f	t	2002	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
paars	purple	\N	https://forvo.com/word/paars/#nl	f	t	1976	colors/shapes	2023-09-27 14:59:57.873874+01	\N
blokkeren	block	n/a	https://forvo.com/word/blokkeren/#nl	f	t	952	\N	2023-09-27 14:59:57.873874+01	\N
de keeper	the goalkeeper	\N	https://forvo.com/word/keeper/#nl	f	t	1605	football	2023-09-27 14:59:57.873874+01	\N
de muziek	the music	\N	https://forvo.com/word/muziek/#nl	f	t	2134	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
nodig hebben	to need	\N	https://forvo.com/word/nodig/#nl	f	t	1629	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
dinsdag	Tuesday	\N	https://forvo.com/word/dinsdag/#nl	f	t	1305	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
kleding	dress	n/a	https://forvo.com/word/kleding/#nl	f	f	678	clothes	2023-09-27 14:59:57.873874+01	\N
de haas	the hare	\N	https://forvo.com/word/haas/#nl	f	f	1573	animals (1)	2023-09-27 14:59:57.873874+01	\N
emigreren	to emigrate	\N	https://forvo.com/word/emigreren/#nl	f	f	1767	moving/immigration	2023-09-27 14:59:57.873874+01	\N
komen	to come	\N	https://forvo.com/word/komen/#nl	f	f	1634	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
zoon	son	n/a	https://forvo.com/word/zoon/#nl	f	f	659	family	2023-09-27 14:59:57.873874+01	\N
betalen	to pay	\N	https://forvo.com/word/betalen/#nl	f	f	1645	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
rijden	to drive	\N	https://forvo.com/word/rijden/#nl	f	f	1257	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
opnemen	record	n/a	https://forvo.com/word/opnemen/#nl	f	f	371	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
uur	hour	n/a	https://forvo.com/word/uur/#nl	f	f	454	time	2023-09-27 14:59:57.873874+01	\N
verhuizing	move	n/a	https://forvo.com/word/verhuizing/#nl	f	f	145	moving/immigration	2023-09-27 14:59:57.873874+01	\N
schreef	wrote	n/a	https://forvo.com/word/schreef/#nl	f	f	615	\N	2023-09-27 14:59:57.873874+01	\N
het overhemd	the shirt	\N	https://forvo.com/word/overhemd/#nl	f	f	1476	clothes	2023-09-27 14:59:57.873874+01	\N
de naam	the name	\N	https://forvo.com/word/naam/#nl	f	f	2136	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
het boek	the book	\N	https://forvo.com/word/boek/#nl	f	f	2137	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
de sporthal	the sports hall	\N	https://forvo.com/word/sporthal/#nl	f	f	1217	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
plotseling	sudden	n/a	https://forvo.com/word/plotseling/#nl	f	f	513	\N	2023-09-27 14:59:57.873874+01	\N
de geit	the goat	noun	https://forvo.com/word/geit/#nl	f	f	1012	animals (2)	2023-09-27 14:59:57.873874+01	\N
king	king	n/a	https://forvo.com/word/king/#nl	f	f	350	\N	2023-09-27 14:59:57.873874+01	\N
het hoofdkantoor	the head office	\N	https://forvo.com/word/hoofdkantoor/#nl	f	f	1402	Amsterdam	2023-09-27 14:59:57.873874+01	\N
de slager	the butcher	\N	https://forvo.com/word/slager/#nl	f	f	1135	professions	2023-09-27 14:59:57.873874+01	\N
spreiding	spread	n/a	https://forvo.com/word/spreiding/#nl	f	f	968	\N	2023-09-27 14:59:57.873874+01	\N
dergelijke	such	n/a	https://forvo.com/word/dergelijke/#nl	f	f	76	\N	2023-09-27 14:59:57.873874+01	\N
lenen	to borrow	\N	https://forvo.com/word/lenen/#nl	f	f	1492	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
het gebouw	the building	\N	https://forvo.com/word/gebouw/#nl	f	f	1393	Amsterdam	2023-09-27 14:59:57.873874+01	\N
het kind	the child	\N	https://forvo.com/word/kind/#nl	f	f	1554	family	2023-09-27 14:59:57.873874+01	\N
de patiënt	the patient	\N	https://forvo.com/word/patiënt/#nl	f	f	1724	doctor	2023-09-27 14:59:57.873874+01	\N
pad	path	n/a	https://forvo.com/word/pad/#nl	f	f	894	\N	2023-09-27 14:59:57.873874+01	\N
boos	angry	\N	https://forvo.com/word/boos/#nl	f	f	1800	moods/emotions	2023-09-27 14:59:57.873874+01	\N
wrijven	rub	n/a	https://forvo.com/word/wrijven/#nl	f	f	819	\N	2023-09-27 14:59:57.873874+01	\N
geboren	born	n/a	https://forvo.com/word/geboren/#nl	f	f	973	\N	2023-09-27 14:59:57.873874+01	\N
de schaar	the scissors	\N	https://forvo.com/word/schaar/#nl	f	f	1911	tools/materials	2023-09-27 14:59:57.873874+01	\N
knippen	to cut (with scissors)	\N	https://forvo.com/word/knippen/#nl	f	f	1912	tools/materials	2023-09-27 14:59:57.873874+01	\N
gedicht	poem	n/a	https://forvo.com/word/gedicht/#nl	f	f	814	\N	2023-09-27 14:59:57.873874+01	\N
een verjaardag vieren	to celebrate a birthday	\N	#	f	f	1378	hobbies	2023-09-27 14:59:57.873874+01	\N
onderzijde	bottom	n/a	https://forvo.com/word/onderzijde/#nl	f	f	690	\N	2023-09-27 14:59:57.873874+01	\N
proces	process	n/a	https://forvo.com/word/proces/#nl	f	f	760	\N	2023-09-27 14:59:57.873874+01	\N
waarde	value	n/a	https://forvo.com/word/waarde/#nl	f	f	744	\N	2023-09-27 14:59:57.873874+01	\N
zal	shall/will	n/a	https://forvo.com/word/zal/#nl	f	f	716	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
arm, slechte	poor	\N	https://forvo.com/word/arm/#nl	f	f	1284	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
weten	to know (factually)	\N	https://forvo.com/word/weten/#nl	f	f	1263	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
afdekking	cover	n/a	https://forvo.com/word/afdekking/#nl	f	f	216	\N	2023-09-27 14:59:57.873874+01	\N
de zwaan	the swan	\N	https://forvo.com/word/zwaan/#nl	f	f	1583	animals (1)	2023-09-27 14:59:57.873874+01	\N
dromen	to dream	\N	https://forvo.com/word/dromen/#nl	f	f	1890	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
naam	name	n/a	https://forvo.com/word/naam/#nl	f	f	127	\N	2023-09-27 14:59:57.873874+01	\N
trek	pull	n/a	https://forvo.com/word/trek/#nl	f	f	498	\N	2023-09-27 14:59:57.873874+01	\N
om	at	\N	https://forvo.com/word/om/#nl	f	f	1353	prepositions	2023-09-27 14:59:57.873874+01	\N
de sollicitatiebrief	the application letter	\N	https://forvo.com/word/sollicitatiebrief/#nl	f	f	1521	job hunting/business	2023-09-27 14:59:57.873874+01	\N
mond	mouth	n/a	https://forvo.com/word/mond/#nl	f	f	607	body	2023-09-27 14:59:57.873874+01	\N
omdat	because	\N	https://forvo.com/word/omdat/#nl	f	f	1194	question words	2023-09-27 14:59:57.873874+01	\N
behalve	except	\N	https://forvo.com/word/behalve/#nl	f	f	1196	question words	2023-09-27 14:59:57.873874+01	\N
smal	narrow	\N	https://forvo.com/word/smal/#nl	f	f	1988	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
beide	both	\N	https://forvo.com/word/beide/#nl	f	f	1989	common adjectives (3)	2023-09-27 14:59:57.873874+01	\N
boom	tree	n/a	https://forvo.com/word/boom/#nl	f	f	229	nature	2023-09-27 14:59:57.873874+01	\N
portemonnee	wallet	\N	https://forvo.com/word/portemonnee/#nl	f	f	2153	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
vleugel	wing	n/a	https://forvo.com/word/vleugel/#nl	f	f	805	\N	2023-09-27 14:59:57.873874+01	\N
de VVE-bijdrage	communal costs	\N	#	f	f	1775	moving/immigration	2023-09-27 14:59:57.873874+01	\N
ster	the star	\N	https://forvo.com/word/ster/#nl	f	f	2094	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
rekenen	charge	n/a	https://forvo.com/word/rekenen/#nl	t	f	871	\N	2023-09-27 14:59:57.873874+01	\N
oktober	October	\N	https://forvo.com/word/oktober/#nl	t	f	1322	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
ben	am	n/a	https://forvo.com/word/ben/#nl	f	t	542	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
produceren	produce	n/a	https://forvo.com/word/produceren/#nl	f	t	449	\N	2023-09-27 14:59:57.873874+01	\N
tweede	second	n/a	https://forvo.com/word/tweede/#nl	f	t	301	numbers/counting	2023-09-27 14:59:57.873874+01	\N
uitleggen	to explain	verb	https://forvo.com/word/uitleggen/#nl	t	f	1016	\N	2023-09-27 14:59:57.873874+01	\N
klinken	sound	n/a	https://forvo.com/word/klinken/#nl	t	f	184	\N	2023-09-27 14:59:57.873874+01	\N
september	September	\N	https://forvo.com/word/september/#nl	f	t	1321	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
de gans	the goose	\N	https://forvo.com/word/gans/#nl	f	t	1584	animals (1)	2023-09-27 14:59:57.873874+01	\N
hout	wood	n/a	https://forvo.com/word/hout/#nl	t	t	273	tools/materials	2023-09-27 14:59:57.873874+01	\N
de thee	the tea	\N	https://forvo.com/word/thee/#nl	f	t	1158	food/drink	2023-09-27 14:59:57.873874+01	\N
quart	quart	n/a	https://forvo.com/word/quart/#nl	f	t	975	\N	2023-09-27 14:59:57.873874+01	\N
de zee	the sea	\N	https://forvo.com/word/zee/#nl	f	t	1754	geography	2023-09-27 14:59:57.873874+01	\N
karakter	character	n/a	https://forvo.com/word/karakter/#nl	f	t	780	\N	2023-09-27 14:59:57.873874+01	\N
de les	the lesson	\N	https://forvo.com/word/les/#nl	f	t	2138	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
alle	all	n/a	https://forvo.com/word/alle/#nl	f	t	152	\N	2023-09-27 14:59:57.873874+01	\N
het gezicht	the face	\N	https://forvo.com/word/gezicht/#nl	f	t	1990	colors/shapes	2023-09-27 14:59:57.873874+01	\N
halen	to pick up	\N	https://forvo.com/word/halen/#nl	f	t	1491	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
het vliegtuig	the airplane	\N	https://forvo.com/word/vliegtuig/#nl	f	t	1207	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de gele kaart	the yellow card	\N	#	f	f	1618	football	2023-09-27 14:59:57.873874+01	\N
kan	can/may	n/a	https://forvo.com/word/kan/#nl	f	t	37	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
de taart	the pie	\N	https://forvo.com/word/taart/#nl	f	t	2023	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
compleet	complete	\N	https://forvo.com/word/compleet/#nl	f	t	2073	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
grafiek	chart	n/a	https://forvo.com/word/grafiek/#nl	f	f	953	\N	2023-09-27 14:59:57.873874+01	\N
liefde	love	n/a	https://forvo.com/word/liefde/#nl	f	f	488	\N	2023-09-27 14:59:57.873874+01	\N
brede	broad	n/a	https://forvo.com/word/brede/#nl	f	f	994	\N	2023-09-27 14:59:57.873874+01	\N
gereedschap	tool	n/a	https://forvo.com/word/gereedschap/#nl	f	f	943	tools/materials	2023-09-27 14:59:57.873874+01	\N
verscheidene	several	n/a	https://forvo.com/word/verscheidene/#nl	f	f	479	\N	2023-09-27 14:59:57.873874+01	\N
weg	gone	n/a	https://forvo.com/word/weg/#nl	f	f	600	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
kolom	column	n/a	https://forvo.com/word/column/#nl	f	f	987	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
de vleermuis	the bat	n/a	https://forvo.com/word/vleermuis/#nl	f	f	809	animals (2)	2023-09-27 14:59:57.873874+01	\N
de perzik	the peach	\N	https://forvo.com/word/perzik/#nl	f	f	1871	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
gescheiden zijn	to be divorced	\N	https://forvo.com/word/gescheiden/#nl	f	f	1566	family	2023-09-27 14:59:57.873874+01	\N
het dier	the animal	\N	https://forvo.com/word/dier/#nl	f	f	1567	animals (1)	2023-09-27 14:59:57.873874+01	\N
west	west	\N	https://forvo.com/word/west/#nl	f	f	2079	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
touw	rope	n/a	https://forvo.com/word/touw/#nl	f	f	936	tools/materials	2023-09-27 14:59:57.873874+01	\N
de walvis	the whale	\N	https://forvo.com/word/walvis/#nl	f	f	2042	animals (2)	2023-09-27 14:59:57.873874+01	\N
weinig	little, few	n/a	https://forvo.com/word/weinig/#nl	f	f	114	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
zakenreis	business trip	noun	https://forvo.com/word/zakenreis/#nl	f	f	1021	job hunting/business	2023-09-27 14:59:57.873874+01	\N
boerderij	farm	n/a	https://forvo.com/word/boerderij/#nl	f	f	231	\N	2023-09-27 14:59:57.873874+01	\N
elf	eleven	\N	https://forvo.com/word/elf/#nl	f	f	1233	numbers/counting	2023-09-27 14:59:57.873874+01	\N
misschien	maybe/perhaps	\N	https://forvo.com/word/misschien/#nl	f	f	1113	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
het oog	the eye	\N	https://forvo.com/word/oog/#nl	f	f	1439	body	2023-09-27 14:59:57.873874+01	\N
plannen	plan	n/a	https://forvo.com/word/plannen/#nl	f	f	415	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
rechts	right	\N	https://forvo.com/word/rechts/#nl	f	f	1115	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
de boon	the bean	\N	https://forvo.com/word/boon/#nl	f	f	1852	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
de telefoon	the telephone	\N	https://forvo.com/word/telefoon/#nl	f	f	1920	tools/materials	2023-09-27 14:59:57.873874+01	\N
de eend	the duck	\N	https://forvo.com/word/eend/#nl	f	f	1582	animals (1)	2023-09-27 14:59:57.873874+01	\N
vertegenwoordigen	represent	n/a	https://forvo.com/word/vertegenwoordigen/#nl	f	f	518	\N	2023-09-27 14:59:57.873874+01	\N
omhoog	up	n/a	https://forvo.com/word/omhoog/#nl	f	f	155	\N	2023-09-27 14:59:57.873874+01	\N
beschrijven	describe	n/a	https://forvo.com/word/beschrijven/#nl	f	f	719	\N	2023-09-27 14:59:57.873874+01	\N
het kopje	the cup	\N	https://forvo.com/word/kopje/#nl	f	f	1846	cooking	2023-09-27 14:59:57.873874+01	\N
‘s middags	in the afternoon		#	f	f	1071	time	2023-09-27 14:59:57.873874+01	\N
ander	other	\N	https://forvo.com/word/ander/#nl	f	f	1683	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
nek	neck	n/a	https://forvo.com/word/nek/#nl	f	f	901	body	2023-09-27 14:59:57.873874+01	\N
stropdas	tie	n/a	https://forvo.com/word/stropdas/#nl	f	f	834	job hunting/business	2023-09-27 14:59:57.873874+01	\N
blijven	to stay/continue	\N	https://forvo.com/word/blijven/#nl	f	f	1654	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
menselijk	human	n/a	https://forvo.com/word/menselijk/#nl	f	f	788	\N	2023-09-27 14:59:57.873874+01	\N
de citroen	the lemon	\N	https://forvo.com/word/citroen/#nl	f	f	1875	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
het gereedschap	the tools	\N	https://forvo.com/word/gereedschap/#nl	f	f	1909	tools/materials	2023-09-27 14:59:57.873874+01	\N
tak	branch	n/a	https://forvo.com/word/tak/#nl	f	f	913	\N	2023-09-27 14:59:57.873874+01	\N
lichaam	body	n/a	https://forvo.com/word/lichaam/#nl	f	f	317	body	2023-09-27 14:59:57.873874+01	\N
inschrijven	to subscribe	\N	https://forvo.com/word/inschrijven/#nl	f	f	1778	moving/immigration	2023-09-27 14:59:57.873874+01	\N
de winkel	the shop	\N	https://forvo.com/word/winkel/#nl	f	f	1212	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
het doel	the goal	\N	https://forvo.com/word/doel/#nl	f	f	1597	football	2023-09-27 14:59:57.873874+01	\N
verkopen	to sell	\N	https://forvo.com/word/verkopen/#nl	f	f	1898	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
happy	happy	n/a	https://forvo.com/word/happy/#nl	f	f	595	\N	2023-09-27 14:59:57.873874+01	\N
de woning	the house	\N	https://forvo.com/word/woning/#nl	f	f	1407	household	2023-09-27 14:59:57.873874+01	\N
goud	gold	n/a	https://forvo.com/word/goud/#nl	f	f	374	colors/shapes	2023-09-27 14:59:57.873874+01	\N
reden	reason	n/a	https://forvo.com/word/reden/#nl	f	f	516	\N	2023-09-27 14:59:57.873874+01	\N
zondag	Sunday	\N	https://forvo.com/word/zondag/#nl	f	f	1310	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
viel	fell	n/a	https://forvo.com/word/viel/#nl	f	f	643	\N	2023-09-27 14:59:57.873874+01	\N
eenheid	unit	n/a	https://forvo.com/word/eenheid/#nl	f	f	402	\N	2023-09-27 14:59:57.873874+01	\N
rente	interest	n/a	https://forvo.com/word/rente/#nl	f	f	466	\N	2023-09-27 14:59:57.873874+01	\N
duizelig	dizzy	\N	https://forvo.com/word/duizelig/#nl	f	f	1718	doctor	2023-09-27 14:59:57.873874+01	\N
de kikker	the frog	\N	https://forvo.com/word/kikker/#nl	f	t	2037	animals (2)	2023-09-27 14:59:57.873874+01	\N
het station	the railway station	\N	https://forvo.com/word/station/#nl	t	f	1210	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
dat	that	\N	https://forvo.com/word/dat/#nl	t	f	1176	question words	2023-09-27 14:59:57.873874+01	\N
verkeerd/mis	wrong	\N	https://forvo.com/word/verkeerd/#nl	t	f	1706	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
hagelen	to hail	\N	https://forvo.com/word/hagelen/#nl	t	f	1672	weather	2023-09-27 14:59:57.873874+01	\N
onder	below/under, among	\N	https://forvo.com/word/onder/#nl	f	t	1338	prepositions	2023-09-27 14:59:57.873874+01	\N
koken	to cook	\N	https://forvo.com/word/koken/#nl	f	t	1825	cooking	2023-09-27 14:59:57.873874+01	\N
de wind	the wind	\N	https://forvo.com/word/wind/#nl	f	t	1673	weather	2023-09-27 14:59:57.873874+01	\N
spijkerbroek	jeans	noun	https://forvo.com/word/spijkerbroek/#nl	f	t	1019	clothes	2023-09-27 14:59:57.873874+01	\N
de woonkamer	the living room	\N	https://forvo.com/word/woonkamer/#nl	f	t	1421	household	2023-09-27 14:59:57.873874+01	\N
mengen	to mix	n/a	https://forvo.com/word/mengen/#nl	f	t	632	\N	2023-09-27 14:59:57.873874+01	\N
de groente	the vegetables	\N	https://forvo.com/word/groente/#nl	f	t	1149	food/drink	2023-09-27 14:59:57.873874+01	\N
de schouder	the shoulder	\N	https://forvo.com/word/schouder/#nl	t	f	1454	body	2023-09-27 14:59:57.873874+01	\N
de haai	the shark	\N	https://forvo.com/word/haai/#nl	f	t	2043	animals (2)	2023-09-27 14:59:57.873874+01	\N
vaardigheid	skill	n/a	https://forvo.com/word/vaardigheid/#nl	t	t	906	\N	2023-09-27 14:59:57.873874+01	\N
sturen	send	n/a	https://forvo.com/word/sturen/#nl	f	t	839	\N	2023-09-27 14:59:57.873874+01	\N
alsjeblieft	here you are, please	\N	https://forvo.com/word/alsjeblieft/#nl	f	t	1103	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
niets	nothing	\N	https://forvo.com/word/niets/#nl	f	t	1939	adverbs	2023-09-27 14:59:57.873874+01	\N
het glas	the glass	\N	https://forvo.com/word/glas/#nl	f	t	1845	cooking	2023-09-27 14:59:57.873874+01	\N
laat	late	\N	https://forvo.com/word/laat/#nl	f	t	1693	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
vlakte	plain	n/a	https://forvo.com/word/vlakte/#nl	f	f	303	\N	2023-09-27 14:59:57.873874+01	\N
onduidelijk	unclear	\N	https://forvo.com/word/onduidelijk/#nl	f	f	1701	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
stil	quiet/silent	\N	https://forvo.com/word/stil/#nl	f	f	2067	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
de meloen	the melon	\N	https://forvo.com/word/meloen/#nl	f	f	1877	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
op	at, on top	\N	https://forvo.com/word/op/#nl	f	f	1339	prepositions	2023-09-27 14:59:57.873874+01	\N
die	that, those, which, who	\N	https://forvo.com/word/die/#nl	f	f	1180	question words	2023-09-27 14:59:57.873874+01	\N
nog	still/yet	\N	https://forvo.com/word/nog/#nl	f	f	1947	adverbs	2023-09-27 14:59:57.873874+01	\N
elektrische	electric	n/a	https://forvo.com/word/elektrische/#nl	f	f	791	nature	2023-09-27 14:59:57.873874+01	\N
zaag	saw	n/a	https://forvo.com/word/zaag/#nl	f	f	236	\N	2023-09-27 14:59:57.873874+01	\N
de kat	the cat	\N	https://forvo.com/word/kat/#nl	f	f	1570	animals (1)	2023-09-27 14:59:57.873874+01	\N
bijna	almost	\N	https://forvo.com/word/bijna/#nl	f	f	1955	adverbs	2023-09-27 14:59:57.873874+01	\N
zuur	acid	\N	https://forvo.com/word/zuur/#nl	f	f	1833	cooking	2023-09-27 14:59:57.873874+01	\N
de computer	the computer	\N	https://forvo.com/word/computer/#nl	f	f	1916	tools/materials	2023-09-27 14:59:57.873874+01	\N
(enkel)voudige	single	\N	https://forvo.com/word/enkel/#nl	f	f	1690	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
het voetbal	football (soccer)	\N	https://forvo.com/word/voetbal/#nl	f	f	1596	football	2023-09-27 14:59:57.873874+01	\N
weer	weather	n/a	https://forvo.com/word/weer/#nl	f	f	590	weather	2023-09-27 14:59:57.873874+01	\N
noot	note	n/a	https://forvo.com/word/noot/#nl	f	f	413	\N	2023-09-27 14:59:57.873874+01	\N
rots	rock	n/a	https://forvo.com/word/rots/#nl	f	f	338	tools/materials	2023-09-27 14:59:57.873874+01	\N
vijf	five	\N	https://forvo.com/word/vijf/#nl	f	f	1227	numbers/counting	2023-09-27 14:59:57.873874+01	\N
deed	did	n/a	https://forvo.com/word/deed/#nl	f	f	182	\N	2023-09-27 14:59:57.873874+01	\N
periode	period	n/a	https://forvo.com/word/periode/#nl	f	f	783	time	2023-09-27 14:59:57.873874+01	\N
de deur	the door	\N	https://forvo.com/word/deur/#nl	f	f	1408	household	2023-09-27 14:59:57.873874+01	\N
de kroket	Dutch fried ragout bar	\N	https://forvo.com/word/kroket/#nl	f	f	1169	food/drink	2023-09-27 14:59:57.873874+01	\N
helft	half	n/a	https://forvo.com/word/helft/#nl	f	f	337	\N	2023-09-27 14:59:57.873874+01	\N
het fruit	the fruits	\N	https://forvo.com/word/fruit/#nl	f	f	1150	food/drink	2023-09-27 14:59:57.873874+01	\N
eeuw	century	n/a	https://forvo.com/word/eeuw/#nl	f	f	728	time	2023-09-27 14:59:57.873874+01	\N
vloeistof	liquid	n/a	https://forvo.com/word/vloeistof/#nl	f	f	895	tools/materials	2023-09-27 14:59:57.873874+01	\N
besparen	save	n/a	https://forvo.com/word/besparen/#nl	f	f	649	\N	2023-09-27 14:59:57.873874+01	\N
de aardbei	the strawberry	\N	https://forvo.com/word/aardbei/#nl	f	f	1881	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
lachen	to laugh	\N	https://forvo.com/word/lachen/#nl	f	f	1882	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
suggereren	suggest	n/a	https://forvo.com/word/suggereren/#nl	f	f	619	\N	2023-09-27 14:59:57.873874+01	\N
regelen	arrange	n/a	https://forvo.com/word/regelen/#nl	f	f	969	\N	2023-09-27 14:59:57.873874+01	\N
bloem	flower	n/a	https://forvo.com/word/bloem/#nl	f	f	597	nature	2023-09-27 14:59:57.873874+01	\N
sluiten	to close	\N	https://forvo.com/word/sluiten/#nl	f	f	1495	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
ruziemaken	to argue	verb	https://forvo.com/word/ruziemaken/#nl	f	f	1030	\N	2023-09-27 14:59:57.873874+01	\N
steen	stone	n/a	https://forvo.com/word/steen/#nl	f	f	682	\N	2023-09-27 14:59:57.873874+01	\N
de rug	the spine	\N	https://forvo.com/word/rug/#nl	f	f	1452	body	2023-09-27 14:59:57.873874+01	\N
vergeten	to forget	\N	https://forvo.com/word/vergeten/#nl	f	f	1258	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
stuk	piece	n/a	https://forvo.com/word/stuk/#nl	f	f	343	\N	2023-09-27 14:59:57.873874+01	\N
ware	TRUE	n/a	https://forvo.com/word/ware/#nl	f	f	456	\N	2023-09-27 14:59:57.873874+01	\N
massa	mass	n/a	https://forvo.com/word/massa/#nl	f	f	933	\N	2023-09-27 14:59:57.873874+01	\N
stop	stop	n/a	https://forvo.com/word/stop/#nl	f	f	263	\N	2023-09-27 14:59:57.873874+01	\N
de bibliotheek	the library	\N	https://forvo.com/word/bibliotheek/#nl	f	f	1219	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
de school	the school	\N	https://forvo.com/word/school/#nl	f	f	1220	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
temperatuur	temperature	n/a	https://forvo.com/word/temperatuur/#nl	f	f	741	weather	2023-09-27 14:59:57.873874+01	\N
ras	race	n/a	https://forvo.com/word/ras/#nl	f	f	555	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
de inburgering	the assimilation (formal)	\N	https://forvo.com/word/inburgering/#nl	f	f	1787	moving/immigration	2023-09-27 14:59:57.873874+01	\N
ofwel	either	n/a	https://forvo.com/word/ofwel/#nl	f	f	722	\N	2023-09-27 14:59:57.873874+01	\N
zitten	to sit	\N	https://forvo.com/word/zitten/#nl	f	t	1643	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
kunnen	to can	\N	https://forvo.com/word/kunnen/#nl	t	f	1494	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
de buik	the belly, the stomach	\N	https://forvo.com/word/buik/#nl	t	f	1453	body	2023-09-27 14:59:57.873874+01	\N
de kerstboom	the Christmas tree	\N	https://forvo.com/word/kerstboom/#nl	t	f	2006	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
de bliksem	lightning	noun	https://forvo.com/word/bliksem/#nl	f	f	1011	nature	2023-09-27 14:59:57.873874+01	\N
zetten	to put	\N	https://forvo.com/word/zetten/#nl	f	t	2097	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
gas	gas	n/a	https://forvo.com/word/gas/#nl	f	t	589	nature	2023-09-27 14:59:57.873874+01	\N
dorst hebben	to be thirsty	\N	https://forvo.com/word/dorst/#nl	f	t	1829	cooking	2023-09-27 14:59:57.873874+01	\N
blij	happy/glad	\N	https://forvo.com/word/blij/#nl	f	t	1806	moods/emotions	2023-09-27 14:59:57.873874+01	\N
de cirkel/kring	the circle	\N	https://forvo.com/word/cirkel/#nl	f	f	1970	colors/shapes	2023-09-27 14:59:57.873874+01	\N
de hoekschop	the corner kick	\N	https://forvo.com/word/hoekschop/#nl	t	f	1622	football	2023-09-27 14:59:57.873874+01	\N
zwemmen	swim	n/a	https://forvo.com/word/zwemmen/#nl	f	t	962	\N	2023-09-27 14:59:57.873874+01	\N
een taal leren	to learn a language	\N	#	f	t	1364	hobbies	2023-09-27 14:59:57.873874+01	\N
zeven	seven	\N	https://forvo.com/word/zeven/#nl	f	t	1229	numbers/counting	2023-09-27 14:59:57.873874+01	\N
mama	mom	\N	https://forvo.com/word/mama/#nl	f	t	1545	family	2023-09-27 14:59:57.873874+01	\N
rivier	river	n/a	https://forvo.com/word/rivier/#nl	f	t	297	nature	2023-09-27 14:59:57.873874+01	\N
zoet	sweet	\N	https://forvo.com/word/zoet/#nl	f	t	1831	cooking	2023-09-27 14:59:57.873874+01	\N
de pijn	the ache	\N	https://forvo.com/word/pijn/#nl	f	t	1720	doctor	2023-09-27 14:59:57.873874+01	\N
het bedrijf	the company	\N	https://forvo.com/word/bedrijf/#nl	f	t	1527	job hunting/business	2023-09-27 14:59:57.873874+01	\N
de kers	the cherry	\N	https://forvo.com/word/kers/#nl	f	t	1880	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
evenement	event	n/a	https://forvo.com/word/evenement/#nl	f	t	959	\N	2023-09-27 14:59:57.873874+01	\N
de praktijk	the practice	UvA A2 Course	https://forvo.com/word/praktijk/#nl	f	f	762	\N	2023-09-27 14:59:57.873874+01	\N
de oorlog	the war	\N	https://forvo.com/word/oorlog/#nl	f	t	2084	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
de dijk	the dike	\N	https://forvo.com/word/dijk/#nl	f	t	1760	geography	2023-09-27 14:59:57.873874+01	\N
oefening	exercise	n/a	https://forvo.com/word/oefening/#nl	f	t	564	\N	2023-09-27 14:59:57.873874+01	\N
ontdekken	to discover	\N	https://forvo.com/word/ontdekken/#nl	f	t	1893	UvA B1A Course CH4	2023-09-27 14:59:57.873874+01	\N
de maan	the moon	\N	https://forvo.com/word/maan/#nl	f	f	1312	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
de boekhouder	the accountant	\N	https://forvo.com/word/boekhouder/#nl	f	f	1145	professions	2023-09-27 14:59:57.873874+01	\N
de mus	the sparrow	\N	https://forvo.com/word/mus/#nl	f	f	1586	animals (1)	2023-09-27 14:59:57.873874+01	\N
zich legitimeren	to identify oneself	\N	https://forvo.com/word/legitimeren/#nl	f	f	1781	moving/immigration	2023-09-27 14:59:57.873874+01	\N
alles	everything	\N	https://forvo.com/word/alles/#nl	f	f	1940	adverbs	2023-09-27 14:59:57.873874+01	\N
februari	February	\N	https://forvo.com/word/februari/#nl	f	f	1314	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
de vergiftiging	the poisoning	\N	https://forvo.com/word/vergiftiging/#nl	f	f	1719	doctor	2023-09-27 14:59:57.873874+01	\N
de goudvis	the goldfish	\N	https://forvo.com/word/goudvis/#nl	f	f	2030	animals (2)	2023-09-27 14:59:57.873874+01	\N
bieden	provide	n/a	https://forvo.com/word/bieden/#nl	f	f	796	\N	2023-09-27 14:59:57.873874+01	\N
lui	lazy	\N	https://forvo.com/word/lui/#nl	f	f	2066	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
lekker	tasty	\N	https://forvo.com/word/lekker/#nl	f	f	1276	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
zo	like this	\N	https://forvo.com/word/zo/#nl	f	f	1189	question words	2023-09-27 14:59:57.873874+01	\N
patroon	pattern	n/a	https://forvo.com/word/patroon/#nl	f	f	485	\N	2023-09-27 14:59:57.873874+01	\N
de bus	the bus	\N	https://forvo.com/word/bus/#nl	f	f	1201	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
eigen	own	\N	https://forvo.com/word/eigen/#nl	f	f	2112	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
mijn	my	\N	https://forvo.com/word/mijn/#nl	f	f	2113	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
de dierentuin	the zoo	\N	https://forvo.com/word/dierentuin/#nl	f	f	2044	animals (2)	2023-09-27 14:59:57.873874+01	\N
de woonboot	the house boat	\N	https://forvo.com/word/woonboot/#nl	f	f	1386	Amsterdam	2023-09-27 14:59:57.873874+01	\N
schommelstoel	rocking chair	noun	https://forvo.com/word/schommelstoel/#nl	f	f	1018	household	2023-09-27 14:59:57.873874+01	\N
partituur	score	n/a	https://forvo.com/word/partituur/#nl	f	f	927	\N	2023-09-27 14:59:57.873874+01	\N
wimper	eyelash	\N	https://forvo.com/word/wimper/#nl	f	f	2140	body	2023-09-27 14:59:57.873874+01	\N
aansluiten	connect	n/a	https://forvo.com/word/aansluiten/#nl	f	f	860	\N	2023-09-27 14:59:57.873874+01	\N
Nieuwjaar	New year	\N	https://forvo.com/word/Nieuwjaar/#nl	f	f	2010	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
leerling	student	n/a	https://forvo.com/word/leerling/#nl	f	f	773	\N	2023-09-27 14:59:57.873874+01	\N
wolk	cloud	n/a	https://forvo.com/word/wolk/#nl	f	f	679	nature	2023-09-27 14:59:57.873874+01	\N
wind	wind	n/a	https://forvo.com/word/wind/#nl	f	f	331	nature	2023-09-27 14:59:57.873874+01	\N
want	because	\N	https://forvo.com/word/want/#nl	f	f	1193	question words	2023-09-27 14:59:57.873874+01	\N
de zus	the sister	\N	https://forvo.com/word/zus/#nl	f	f	1547	family	2023-09-27 14:59:57.873874+01	\N
punt	point	n/a	https://forvo.com/word/punt/#nl	f	f	94	\N	2023-09-27 14:59:57.873874+01	\N
controleren	check	n/a	https://forvo.com/word/controleren/#nl	f	f	384	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
de berg	the mountain	\N	https://forvo.com/word/berg/#nl	f	f	1763	geography	2023-09-27 14:59:57.873874+01	\N
object	object	n/a	https://forvo.com/word/object/#nl	f	f	361	\N	2023-09-27 14:59:57.873874+01	\N
het avondeten	the dinner	\N	https://forvo.com/word/avondeten/#nl	f	f	1824	cooking	2023-09-27 14:59:57.873874+01	\N
de trui	the sweater	\N	https://forvo.com/word/trui/#nl	f	f	1465	clothes	2023-09-27 14:59:57.873874+01	\N
tien over zes	ten past six		#	f	f	1058	time	2023-09-27 14:59:57.873874+01	\N
brengen	to bring	\N	https://forvo.com/word/brengen/#nl	f	f	1490	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
geest	mind	n/a	https://forvo.com/word/geest/#nl	f	f	445	\N	2023-09-27 14:59:57.873874+01	\N
herhaal	repeat	n/a	https://forvo.com/word/herhaal/#nl	f	f	992	\N	2023-09-27 14:59:57.873874+01	\N
sterven	die	n/a	https://forvo.com/word/sterven/#nl	f	f	610	\N	2023-09-27 14:59:57.873874+01	\N
wet	law	n/a	https://forvo.com/word/wet/#nl	f	f	731	\N	2023-09-27 14:59:57.873874+01	\N
kledinghanger	coat hanger	noun	https://forvo.com/word/kledinghanger/#nl	f	f	1015	household	2023-09-27 14:59:57.873874+01	\N
gewas	crop	n/a	https://forvo.com/word/gewas/#nl	f	f	769	nature	2023-09-27 14:59:57.873874+01	\N
stijgen	rise	n/a	https://forvo.com/word/stijgen/#nl	f	f	624	\N	2023-09-27 14:59:57.873874+01	\N
de mijne	mine	n/a	#	f	f	833	professions	2023-09-27 14:59:57.873874+01	\N
symbool	symbol	n/a	https://forvo.com/word/symbool/#nl	f	f	609	dutch symbols	2023-09-27 14:59:57.873874+01	\N
kleden	clothe	n/a	https://forvo.com/word/kleden/#nl	f	f	598	clothes	2023-09-27 14:59:57.873874+01	\N
scheiden	to divorce	\N	https://forvo.com/word/scheiden/#nl	f	f	1565	family	2023-09-27 14:59:57.873874+01	\N
tien	ten	\N	https://forvo.com/word/tien/#nl	f	f	1232	numbers/counting	2023-09-27 14:59:57.873874+01	\N
grote	major/big/great/large	n/a	https://forvo.com/word/grote/#nl	f	f	836	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
beetje	bit	n/a	https://forvo.com/word/beetje/#nl	f	f	732	\N	2023-09-27 14:59:57.873874+01	\N
de kapper	the hairdresser	\N	https://forvo.com/word/kapper/#nl	f	f	1143	professions	2023-09-27 14:59:57.873874+01	\N
dicht	close	n/a	https://forvo.com/word/dicht/#nl	f	f	246	\N	2023-09-27 14:59:57.873874+01	\N
de muis	the mouse	\N	https://forvo.com/word/muis/#nl	f	f	1571	animals (1)	2023-09-27 14:59:57.873874+01	\N
het konijn	the rabbit	\N	https://forvo.com/word/konijn/#nl	f	f	1572	animals (1)	2023-09-27 14:59:57.873874+01	\N
kamp	camp	n/a	https://forvo.com/word/kamp/#nl	f	f	970	\N	2023-09-27 14:59:57.873874+01	\N
regenen	to rain	\N	https://forvo.com/word/regenen/#nl	f	f	1670	weather	2023-09-27 14:59:57.873874+01	\N
roken	to smoke	\N	https://forvo.com/word/roken/#nl	f	f	1111	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
bracht	brought	n/a	https://forvo.com/word/bracht/#nl	f	f	390	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
anders	else	n/a	https://forvo.com/word/anders/#nl	t	f	653	\N	2023-09-27 14:59:57.873874+01	\N
de weg	the road	\N	https://forvo.com/word/weg/#nl	f	t	1198	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
het lichaam, het lijf	the body	\N	https://forvo.com/word/lichaam/#nl	t	f	1432	body	2023-09-27 14:59:57.873874+01	\N
klein	small	\N	https://forvo.com/word/klein/#nl	f	t	1275	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
stad	town/city	n/a	https://forvo.com/word/stad/#nl	t	f	404	geography	2023-09-27 14:59:57.873874+01	\N
de tandarts	the dentist	\N	https://forvo.com/word/tandarts/#nl	f	t	1734	doctor	2023-09-27 14:59:57.873874+01	\N
negen	nine	\N	https://forvo.com/word/negen/#nl	f	t	1231	numbers/counting	2023-09-27 14:59:57.873874+01	\N
groot	big	\N	https://forvo.com/word/groot/#nl	f	t	1274	common adjectives (1)	2023-09-27 14:59:57.873874+01	\N
het legitimatiebewijs	the id	\N	https://forvo.com/word/legitimatiebewijs/#nl	t	f	1780	moving/immigration	2023-09-27 14:59:57.873874+01	\N
base	base	n/a	https://forvo.com/word/base/#nl	f	t	265	\N	2023-09-27 14:59:57.873874+01	\N
de slaapkamer	the sleeping room	\N	https://forvo.com/word/slaapkamer/#nl	f	t	1423	household	2023-09-27 14:59:57.873874+01	\N
kaart	card, map	n/a	https://forvo.com/word/kaart/#nl	f	t	934	geography	2023-09-27 14:59:57.873874+01	\N
‘s nachts	at night		#	f	t	1067	time	2023-09-27 14:59:57.873874+01	\N
de vrije dag	the day off	\N	#	f	t	2000	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
de spijkerbroek	the jeans	\N	https://forvo.com/word/spijkerbroek/#nl	f	t	1464	clothes	2023-09-27 14:59:57.873874+01	\N
olie	oil	n/a	https://forvo.com/word/olie/#nl	f	t	627	tools/materials	2023-09-27 14:59:57.873874+01	\N
de baas	the boss	\N	https://forvo.com/word/baas/#nl	t	t	1133	professions	2023-09-27 14:59:57.873874+01	\N
poort	port	n/a	https://forvo.com/word/poort/#nl	t	t	66	Amsterdam	2023-09-27 14:59:57.873874+01	\N
sporten	to exercise	\N	https://forvo.com/word/sporten/#nl	f	f	1365	hobbies	2023-09-27 14:59:57.873874+01	\N
de heuvel	the hill	\N	https://forvo.com/word/heuvel/#nl	f	f	1764	geography	2023-09-27 14:59:57.873874+01	\N
akkoord	chord	n/a	https://forvo.com/word/akkoord/#nl	f	f	863	\N	2023-09-27 14:59:57.873874+01	\N
geluk	the happiness	\N	https://forvo.com/word/geluk/#nl	f	f	2106	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
teken	sign	n/a	https://forvo.com/word/teken/#nl	f	f	583	\N	2023-09-27 14:59:57.873874+01	\N
de neus	the nose	\N	https://forvo.com/word/neus/#nl	f	f	1442	body	2023-09-27 14:59:57.873874+01	\N
kindje	baby	n/a	https://forvo.com/word/kindje/#nl	f	f	702	family	2023-09-27 14:59:57.873874+01	\N
het kuiken	the chick	n/a	https://forvo.com/word/kuiken/#nl	f	f	882	animals (2)	2023-09-27 14:59:57.873874+01	\N
hem	him	n/a	https://forvo.com/word/hem/#nl	f	f	173	\N	2023-09-27 14:59:57.873874+01	\N
verzamelen	to collect/gather	n/a	https://forvo.com/word/verzamelen/#nl	f	f	648	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
de pen	the pen	\N	https://forvo.com/word/pen/#nl	f	f	1922	tools/materials	2023-09-27 14:59:57.873874+01	\N
gevangen	caught	n/a	https://forvo.com/word/gevangen/#nl	f	f	782	\N	2023-09-27 14:59:57.873874+01	\N
kracht	force/power	n/a	https://forvo.com/word/kracht/#nl	f	f	359	misc. words (1)	2023-09-27 14:59:57.873874+01	\N
ziek	ill	\N	https://forvo.com/word/ziek/#nl	f	f	1711	doctor	2023-09-27 14:59:57.873874+01	\N
raamstoel	window seat	\N	https://forvo.com/word/raamstoel/#nl	f	f	2147	household	2023-09-27 14:59:57.873874+01	\N
overwegen	to consider	\N	https://forvo.com/word/overwegen/#nl	f	f	1652	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
creëren	create	n/a	https://forvo.com/word/creëren/#nl	f	f	806	\N	2023-09-27 14:59:57.873874+01	\N
de mandarijn	the mandarin	\N	https://forvo.com/word/mandarijn/#nl	f	f	1874	fruits/veggies	2023-09-27 14:59:57.873874+01	\N
vrouwen	women	n/a	https://forvo.com/word/vrouwen/#nl	f	f	907	family	2023-09-27 14:59:57.873874+01	\N
voor	for/before/in front of	\N	https://forvo.com/word/voor/#nl	f	f	1333	prepositions	2023-09-27 14:59:57.873874+01	\N
verhaal	story	n/a	https://forvo.com/word/verhaal/#nl	f	f	235	\N	2023-09-27 14:59:57.873874+01	\N
de pannenkoek	the pancake	\N	https://forvo.com/word/pannenkoek/#nl	f	f	1170	food/drink	2023-09-27 14:59:57.873874+01	\N
vreemd	strange	n/a	https://forvo.com/word/vreemd/#nl	f	f	599	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
eenzaam	lonely	\N	https://forvo.com/word/eenzaam/#nl	f	f	2072	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
bewijzen	prove	n/a	https://forvo.com/word/bewijzen/#nl	f	f	561	\N	2023-09-27 14:59:57.873874+01	\N
gat	hole	n/a	https://forvo.com/word/gat/#nl	f	f	700	\N	2023-09-27 14:59:57.873874+01	\N
gewicht	weight	n/a	https://forvo.com/word/gewicht/#nl	f	f	526	\N	2023-09-27 14:59:57.873874+01	\N
dorp	village	n/a	https://forvo.com/word/dorp/#nl	f	f	704	geography	2023-09-27 14:59:57.873874+01	\N
woestijn	desert	n/a	https://forvo.com/word/woestijn/#nl	f	f	846	nature	2023-09-27 14:59:57.873874+01	\N
het brood	the bread	\N	https://forvo.com/word/brood/#nl	f	f	1151	food/drink	2023-09-27 14:59:57.873874+01	\N
spell	spell	n/a	https://forvo.com/word/spell/#nl	f	f	68	\N	2023-09-27 14:59:57.873874+01	\N
vrachtwagen	truck	n/a	https://forvo.com/word/vrachtwagen/#nl	f	f	977	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
oh	oh	n/a	https://forvo.com/word/oh/#nl	f	f	436	\N	2023-09-27 14:59:57.873874+01	\N
de ontsteking	the inflammation	\N	https://forvo.com/word/ontsteking/#nl	f	f	1716	doctor	2023-09-27 14:59:57.873874+01	\N
misselijk	nauseous	\N	https://forvo.com/word/misselijk/#nl	f	f	1717	doctor	2023-09-27 14:59:57.873874+01	\N
het plein	the square	\N	https://forvo.com/word/plein/#nl	f	f	1395	Amsterdam	2023-09-27 14:59:57.873874+01	\N
leuk vinden	to like	\N	#	f	f	1508	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
de vlieg	the fly	\N	https://forvo.com/word/vlieg/#nl	f	f	1591	animals (1)	2023-09-27 14:59:57.873874+01	\N
het vuur	the fire	\N	https://forvo.com/word/vuur/#nl	f	f	1838	cooking	2023-09-27 14:59:57.873874+01	\N
de jas	the coat	\N	https://forvo.com/word/jas/#nl	f	f	1466	clothes	2023-09-27 14:59:57.873874+01	\N
leeftijd	age	n/a	https://forvo.com/word/leeftijd/#nl	f	f	676	time	2023-09-27 14:59:57.873874+01	\N
lokaliseren	locate	n/a	https://forvo.com/word/lokaliseren/#nl	f	f	778	common verbs (4)	2023-09-27 14:59:57.873874+01	\N
aankomen	arrive	n/a	https://forvo.com/word/aankomen/#nl	f	f	851	\N	2023-09-27 14:59:57.873874+01	\N
begeleiden	guide	n/a	https://forvo.com/word/begeleiden/#nl	f	f	925	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
heerlijk	delicious	adjective	https://forvo.com/word/heerlijk/#nl	f	f	1007	food/drink	2023-09-27 14:59:57.873874+01	\N
gemak	ease	n/a	https://forvo.com/word/gemak/#nl	f	f	285	\N	2023-09-27 14:59:57.873874+01	\N
de eerste helft	the first half	\N	#	t	f	1610	football	2023-09-27 14:59:57.873874+01	\N
brand	fire	n/a	https://forvo.com/word/brand/#nl	f	t	340	\N	2023-09-27 14:59:57.873874+01	\N
de koe	the cow	\N	https://forvo.com/word/koe/#nl	f	f	1575	animals (1)	2023-09-27 14:59:57.873874+01	\N
denken	to think	\N	https://forvo.com/word/denken/#nl	t	f	1271	common verbs (1)	2023-09-27 14:59:57.873874+01	\N
het potlood	the pencil	\N	https://forvo.com/word/potlood/#nl	f	t	1921	tools/materials	2023-09-27 14:59:57.873874+01	\N
het adres	the address	\N	https://forvo.com/word/adres/#nl	f	t	1776	moving/immigration	2023-09-27 14:59:57.873874+01	\N
staart	tail	n/a	https://forvo.com/word/staart/#nl	f	t	448	\N	2023-09-27 14:59:57.873874+01	\N
drop	liquorice	\N	https://forvo.com/word/drop/#nl	f	t	1172	food/drink	2023-09-27 14:59:57.873874+01	\N
mogelijk	possible	\N	https://forvo.com/word/mogelijk/#nl	f	t	1704	common adjectives (2)	2023-09-27 14:59:57.873874+01	\N
ons	us	n/a	https://forvo.com/word/ons/#nl	f	t	91	\N	2023-09-27 14:59:57.873874+01	\N
excite	excite	n/a	https://forvo.com/word/excite/#nl	f	t	748	\N	2023-09-27 14:59:57.873874+01	\N
de kaas	the cheese	\N	https://forvo.com/word/kaas/#nl	f	t	1153	food/drink	2023-09-27 14:59:57.873874+01	\N
de olie	the oil	\N	https://forvo.com/word/olie/#nl	f	t	1924	tools/materials	2023-09-27 14:59:57.873874+01	\N
eenvoudig	simple/easy	UvA A2 Course	https://forvo.com/word/eenvoudig/#nl	f	f	478	\N	2023-09-27 14:59:57.873874+01	\N
de boerderij	the farm	\N	https://forvo.com/word/boerderij/#nl	f	t	1574	animals (1)	2023-09-27 14:59:57.873874+01	\N
bouwen	to build	\N	https://forvo.com/word/bouwen/#nl	f	t	1653	common verbs (3)	2023-09-27 14:59:57.873874+01	\N
klap	blow	n/a	https://forvo.com/word/klap/#nl	f	f	626	\N	2023-09-27 14:59:57.873874+01	\N
de teen	the toe	\N	https://forvo.com/word/teen/#nl	f	f	1451	body	2023-09-27 14:59:57.873874+01	\N
probleem	problem	n/a	https://forvo.com/word/probleem/#nl	f	t	342	\N	2023-09-27 14:59:57.873874+01	\N
algemeen	general	\N	https://forvo.com/word/algemeen/#nl	t	f	2057	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
leggen	lay	n/a	https://forvo.com/word/leggen/#nl	t	f	483	\N	2023-09-27 14:59:57.873874+01	\N
dom	stupid	\N	https://forvo.com/word/dom/#nl	f	t	2060	common adjectives (4)	2023-09-27 14:59:57.873874+01	\N
energie	energy	n/a	https://forvo.com/word/energie/#nl	f	t	502	nature	2023-09-27 14:59:57.873874+01	\N
hoe laat is het?	what time is it?	question	#	f	t	1047	time	2023-09-27 14:59:57.873874+01	\N
de vos	the fox	\N	https://forvo.com/word/vos/#nl	f	f	2033	animals (1)	2023-09-27 14:59:57.873874+01	\N
de sleutel	the key	\N	https://forvo.com/word/sleutel/#nl	f	f	1918	tools/materials	2023-09-27 14:59:57.873874+01	\N
de premier	the prime minister	\N	https://forvo.com/word/premier/#nl	f	f	1130	professions	2023-09-27 14:59:57.873874+01	\N
de vriend	the (boy) friend	\N	https://forvo.com/word/vriend/#nl	f	f	1556	family	2023-09-27 14:59:57.873874+01	\N
een beetje	a bit	\N	https://forvo.com/word/beetje/#nl	f	f	1941	adverbs	2023-09-27 14:59:57.873874+01	\N
altijd	always	\N	https://forvo.com/word/altijd/#nl	f	t	1951	adverbs	2023-09-27 14:59:57.873874+01	\N
is	is	n/a	https://forvo.com/word/is/#nl	f	f	25	\N	2023-09-27 14:59:57.873874+01	\N
het zilver	the silver	\N	https://forvo.com/word/zilver/#nl	f	f	1928	tools/materials	2023-09-27 14:59:57.873874+01	\N
pond	pound	n/a	https://forvo.com/word/pond/#nl	f	f	424	\N	2023-09-27 14:59:57.873874+01	\N
a.u.b.	please	\N	https://forvo.com/word/a.u.b./#nl	f	f	1106	pronouns/thanking	2023-09-27 14:59:57.873874+01	\N
klimmen	climb	n/a	https://forvo.com/word/klimmen/#nl	f	f	684	\N	2023-09-27 14:59:57.873874+01	\N
de rook	the smoke	\N	https://forvo.com/word/rook/#nl	t	f	1839	cooking	2023-09-27 14:59:57.873874+01	\N
moe	tired	\N	https://forvo.com/word/moe/#nl	f	f	1795	moods/emotions	2023-09-27 14:59:57.873874+01	\N
gevaar	danger	n/a	https://forvo.com/word/gevaar/#nl	f	f	755	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
Koningsdag	King’s Day	\N	https://forvo.com/word/Koningsdag/#nl	f	f	2001	celebrations/holidays	2023-09-27 14:59:57.873874+01	\N
tijdperk	era	noun	https://forvo.com/word/tijdperk/#nl	t	f	1045	time	2023-09-27 14:59:57.873874+01	\N
brief	letter	n/a	https://forvo.com/word/brief/#nl	f	t	294	\N	2023-09-27 14:59:57.873874+01	\N
atoom	atom	n/a	https://forvo.com/word/atoom/#nl	f	f	787	nature	2023-09-27 14:59:57.873874+01	\N
vreugde	joy	n/a	https://forvo.com/word/vreugde/#nl	f	f	571	moods/emotions	2023-09-27 14:59:57.873874+01	\N
ondersteuning	support	n/a	https://forvo.com/word/ondersteuning/#nl	f	f	888	\N	2023-09-27 14:59:57.873874+01	\N
pyjama	pajamas	\N	https://forvo.com/word/pyjama/#nl	f	t	2150	clothes	2023-09-27 14:59:57.873874+01	\N
instrument	instrument	n/a	https://forvo.com/word/instrument/#nl	f	f	576	tools/materials	2023-09-27 14:59:57.873874+01	\N
bellen	to call	\N	https://forvo.com/word/bellen/#nl	f	f	1493	common verbs (2)	2023-09-27 14:59:57.873874+01	\N
water	water	n/a	https://forvo.com/word/water/#nl	f	f	191	nature	2023-09-27 14:59:57.873874+01	\N
openen	to open	\N	https://forvo.com/word/openen/#nl	f	f	1919	tools/materials	2023-09-27 14:59:57.873874+01	\N
antwoord	answer	n/a	https://forvo.com/word/antwoord/#nl	f	f	209	\N	2023-09-27 14:59:57.873874+01	\N
koele	cool	n/a	https://forvo.com/word/koele/#nl	f	f	685	\N	2023-09-27 14:59:57.873874+01	\N
de auto	the car	\N	https://forvo.com/word/auto/#nl	t	f	1200	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
thuis	home	\N	https://forvo.com/word/thuis/#nl	f	t	2109	misc. words (2)	2023-09-27 14:59:57.873874+01	\N
juni	June	\N	https://forvo.com/word/juni/#nl	f	f	1318	weekdays/months/seasons	2023-09-27 14:59:57.873874+01	\N
borrelen	to have a drink	\N	https://forvo.com/word/borrelen/#nl	f	f	1370	hobbies	2023-09-27 14:59:57.873874+01	\N
scherpe	sharp	n/a	https://forvo.com/word/scherpe/#nl	f	f	804	\N	2023-09-27 14:59:57.873874+01	\N
chagrijnig	grumpy	\N	https://forvo.com/word/chagrijnig/#nl	f	f	1794	moods/emotions	2023-09-27 14:59:57.873874+01	\N
handel	trade	n/a	https://forvo.com/word/handel/#nl	f	f	601	job hunting/business	2023-09-27 14:59:57.873874+01	\N
lift	lift	n/a	https://forvo.com/word/lift/#nl	f	f	849	\N	2023-09-27 14:59:57.873874+01	\N
buitenspel	offside	\N	https://forvo.com/word/buitenspel/#nl	f	f	1623	football	2023-09-27 14:59:57.873874+01	\N
de directeur	the (company) director	\N	https://forvo.com/word/directeur/#nl	f	f	1144	professions	2023-09-27 14:59:57.873874+01	\N
het bier	the beer	\N	https://forvo.com/word/bier/#nl	f	f	1161	food/drink	2023-09-27 14:59:57.873874+01	\N
puistje	pimple	noun	https://forvo.com/word/puistje/#nl	f	f	1024	body	2023-09-27 14:59:57.873874+01	\N
de schildpad	the turtle	\N	https://forvo.com/word/schildpad/#nl	f	f	2028	animals (1)	2023-09-27 14:59:57.873874+01	\N
de straat	the street	\N	https://forvo.com/word/straat/#nl	f	f	1197	traffic/buildings	2023-09-27 14:59:57.873874+01	\N
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 45, true);


--
-- Name: lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_id_seq', 4, true);


--
-- Name: vocabulary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pi
--

SELECT pg_catalog.setval('public.vocabulary_id_seq', 2540, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: lesson lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_pkey PRIMARY KEY (id);


--
-- Name: vocabulary vocabulary_pkey; Type: CONSTRAINT; Schema: public; Owner: pi
--

ALTER TABLE ONLY public.vocabulary
    ADD CONSTRAINT vocabulary_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

