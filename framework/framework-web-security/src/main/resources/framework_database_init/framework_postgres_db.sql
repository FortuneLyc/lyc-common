--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.api (
    id integer NOT NULL,
    remark text,
    url text NOT NULL,
    is_enable boolean NOT NULL
);


ALTER TABLE public.api OWNER TO ads;

--
-- Name: api_access; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.api_access (
    id integer NOT NULL,
    role_id integer NOT NULL,
    api_id integer NOT NULL,
    decision smallint NOT NULL
);


ALTER TABLE public.api_access OWNER TO ads;

--
-- Name: api_access_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.api_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_access_id_seq OWNER TO ads;

--
-- Name: api_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.api_access_id_seq OWNED BY public.api_access.id;


--
-- Name: api_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_id_seq OWNER TO ads;

--
-- Name: api_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.api_id_seq OWNED BY public.api.id;


--
-- Name: area_info; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.area_info (
    id integer NOT NULL,
    area_code text NOT NULL,
    area_name text NOT NULL,
    area_type integer NOT NULL,
    parent_code text,
    remark text,
    enable smallint NOT NULL
);


ALTER TABLE public.area_info OWNER TO ads;

--
-- Name: area_info_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.area_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_info_id_seq OWNER TO ads;

--
-- Name: area_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.area_info_id_seq OWNED BY public.area_info.id;


--
-- Name: data_dictionary; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.data_dictionary (
    id integer NOT NULL,
    tree_node_type integer NOT NULL,
    father_id integer NOT NULL,
    label text NOT NULL,
    type text,
    value text,
    order_num integer NOT NULL,
    remark text,
    enable boolean DEFAULT true NOT NULL,
    attr_json text
);


ALTER TABLE public.data_dictionary OWNER TO ads;

--
-- Name: data_dictionary_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.data_dictionary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_dictionary_id_seq OWNER TO ads;

--
-- Name: data_dictionary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.data_dictionary_id_seq OWNED BY public.data_dictionary.id;


--
-- Name: menu_element; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.menu_element (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    element_name text
);


ALTER TABLE public.menu_element OWNER TO ads;

--
-- Name: menu_element_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.menu_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_element_id_seq OWNER TO ads;

--
-- Name: menu_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.menu_element_id_seq OWNED BY public.menu_element.id;


--
-- Name: message_info; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.message_info (
    id integer NOT NULL,
    user_id integer,
    title text,
    content text,
    create_time timestamp without time zone,
    is_read boolean DEFAULT false
);


ALTER TABLE public.message_info OWNER TO ads;

--
-- Name: message_info_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.message_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_info_id_seq OWNER TO ads;

--
-- Name: message_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.message_info_id_seq OWNED BY public.message_info.id;


--
-- Name: operation_log; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.operation_log (
    id integer NOT NULL,
    username text NOT NULL,
    ip text NOT NULL,
    log_type smallint NOT NULL,
    message text NOT NULL,
    menu_path text,
    router_path text,
    api text,
    proceed_time integer,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.operation_log OWNER TO ads;

--
-- Name: operation_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.operation_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operation_log_id_seq OWNER TO ads;

--
-- Name: operation_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.operation_log_id_seq OWNED BY public.operation_log.id;


--
-- Name: resource_access; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.resource_access (
    id integer NOT NULL,
    ant_resource text NOT NULL,
    authorization_type smallint NOT NULL
);


ALTER TABLE public.resource_access OWNER TO ads;

--
-- Name: COLUMN resource_access.authorization_type; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.resource_access.authorization_type IS 'denyAll(1,"denyAll"),
permitAll(2,"permitAll"),
fullyAuthenticated(3,"fullyAuthenticated"),
rememberMe(4,"rememberMe"),
authenticated(5,"authenticated"),
anonymous(6,"anonymous"),';


--
-- Name: resource_access_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.resource_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_access_id_seq OWNER TO ads;

--
-- Name: resource_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.resource_access_id_seq OWNED BY public.resource_access.id;


--
-- Name: role_menu; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.role_menu (
    id integer NOT NULL,
    role_id integer NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.role_menu OWNER TO ads;

--
-- Name: role_menu_element_relatioin; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.role_menu_element_relatioin (
    id integer NOT NULL,
    role_id integer NOT NULL,
    element_id integer NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.role_menu_element_relatioin OWNER TO ads;

--
-- Name: role_menu_element_relatioin_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.role_menu_element_relatioin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_menu_element_relatioin_id_seq OWNER TO ads;

--
-- Name: role_menu_element_relatioin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.role_menu_element_relatioin_id_seq OWNED BY public.role_menu_element_relatioin.id;


--
-- Name: role_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.role_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_menu_id_seq OWNER TO ads;

--
-- Name: role_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.role_menu_id_seq OWNED BY public.role_menu.id;


--
-- Name: system_menu; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.system_menu (
    id integer NOT NULL,
    father_id integer NOT NULL,
    tree_node_type integer NOT NULL,
    order_num integer NOT NULL,
    menu_path text,
    menu_name text,
    menu_code text,
    menu_icon text,
    remark text,
    is_visible boolean DEFAULT true,
    is_new_window boolean NOT NULL
);


ALTER TABLE public.system_menu OWNER TO ads;

--
-- Name: system_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.system_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_menu_id_seq OWNER TO ads;

--
-- Name: system_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.system_menu_id_seq OWNED BY public.system_menu.id;


--
-- Name: system_role; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.system_role (
    id integer NOT NULL,
    father_id integer NOT NULL,
    tree_node_type integer NOT NULL,
    order_num integer NOT NULL,
    rolename text NOT NULL,
    remark text
);


ALTER TABLE public.system_role OWNER TO ads;

--
-- Name: system_role_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.system_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_role_id_seq OWNER TO ads;

--
-- Name: system_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.system_role_id_seq OWNED BY public.system_role.id;


--
-- Name: system_user; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.system_user (
    id integer NOT NULL,
    username text NOT NULL,
    display_name text NOT NULL,
    password text NOT NULL,
    phone text,
    email text,
    addr text,
    remark text,
    enable boolean DEFAULT true NOT NULL,
    layout text NOT NULL,
    theme text NOT NULL
);


ALTER TABLE public.system_user OWNER TO ads;

--
-- Name: system_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.system_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_user_id_seq OWNER TO ads;

--
-- Name: system_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.system_user_id_seq OWNED BY public.system_user.id;


--
-- Name: tb_my_favorites; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.tb_my_favorites (
    id integer NOT NULL,
    user_id integer,
    menu_id integer,
    click_count integer,
    is_favorite boolean
);


ALTER TABLE public.tb_my_favorites OWNER TO ads;

--
-- Name: tb_my_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.tb_my_favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_my_favorites_id_seq OWNER TO ads;

--
-- Name: tb_my_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.tb_my_favorites_id_seq OWNED BY public.tb_my_favorites.id;


--
-- Name: user_role_relation; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.user_role_relation (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_role_relation OWNER TO ads;

--
-- Name: user_role_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.user_role_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_role_relation_id_seq OWNER TO ads;

--
-- Name: user_role_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.user_role_relation_id_seq OWNED BY public.user_role_relation.id;


--
-- Name: version_info; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.version_info (
    id integer NOT NULL,
    version_no text,
    version_content text,
    name text,
    report_date timestamp without time zone,
    general_no text,
    first_report_date timestamp without time zone,
    is_visible boolean DEFAULT true,
    display_label text,
    publish_date text
);


ALTER TABLE public.version_info OWNER TO ads;

--
-- Name: TABLE version_info; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON TABLE public.version_info IS '版本信息表';


--
-- Name: COLUMN version_info.id; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.version_info.id IS '主键';


--
-- Name: COLUMN version_info.version_no; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.version_info.version_no IS '版本号';


--
-- Name: COLUMN version_info.version_content; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.version_info.version_content IS '版本内容';


--
-- Name: COLUMN version_info.name; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.version_info.name IS '组件名称';


--
-- Name: COLUMN version_info.report_date; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.version_info.report_date IS '版本上报时间';


--
-- Name: COLUMN version_info.general_no; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.version_info.general_no IS '总版本号';


--
-- Name: COLUMN version_info.first_report_date; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.version_info.first_report_date IS '首次上报时间';


--
-- Name: COLUMN version_info.is_visible; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.version_info.is_visible IS '是否展示';


--
-- Name: COLUMN version_info.display_label; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.version_info.display_label IS '页面展示label';


--
-- Name: version_info_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.version_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_info_id_seq OWNER TO ads;

--
-- Name: version_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.version_info_id_seq OWNED BY public.version_info.id;


--
-- Name: wf_business; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.wf_business (
    id integer NOT NULL,
    business_type integer NOT NULL,
    business_name text NOT NULL
);


ALTER TABLE public.wf_business OWNER TO ads;

--
-- Name: TABLE wf_business; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON TABLE public.wf_business IS '工作流业务表';


--
-- Name: wf_business_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.wf_business_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wf_business_id_seq OWNER TO ads;

--
-- Name: wf_business_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.wf_business_id_seq OWNED BY public.wf_business.id;


--
-- Name: wf_state; Type: TABLE; Schema: public; Owner: ads
--

CREATE TABLE public.wf_state (
    id integer NOT NULL,
    state_id integer NOT NULL,
    state_name text NOT NULL,
    business_type integer NOT NULL,
    class_aliax text,
    icon_class text,
    front_state_json text,
    wf_page_types integer,
    next_state_id_str text,
    role_id integer,
    user_id integer,
    is_branch boolean,
    bus_state_map_json text,
    is_batch boolean,
    is_head boolean
);


ALTER TABLE public.wf_state OWNER TO ads;

--
-- Name: TABLE wf_state; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON TABLE public.wf_state IS '工作流状态表';


--
-- Name: COLUMN wf_state.id; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.id IS '主键';


--
-- Name: COLUMN wf_state.state_id; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.state_id IS '状态ID';


--
-- Name: COLUMN wf_state.state_name; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.state_name IS '状态名称';


--
-- Name: COLUMN wf_state.business_type; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.business_type IS '业务类型';


--
-- Name: COLUMN wf_state.class_aliax; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.class_aliax IS '类反射别名';


--
-- Name: COLUMN wf_state.icon_class; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.icon_class IS '类图标';


--
-- Name: COLUMN wf_state.front_state_json; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.front_state_json IS '前端状态JSON';


--
-- Name: COLUMN wf_state.wf_page_types; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.wf_page_types IS '工作流页面类型';


--
-- Name: COLUMN wf_state.next_state_id_str; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.next_state_id_str IS '下一状态ID字符值';


--
-- Name: COLUMN wf_state.role_id; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.role_id IS '角色ID';


--
-- Name: COLUMN wf_state.user_id; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.user_id IS '用户ID';


--
-- Name: COLUMN wf_state.is_branch; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.is_branch IS '是否分支';


--
-- Name: COLUMN wf_state.bus_state_map_json; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.bus_state_map_json IS '业务状态JSON';


--
-- Name: COLUMN wf_state.is_batch; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.is_batch IS '是否批处理';


--
-- Name: COLUMN wf_state.is_head; Type: COMMENT; Schema: public; Owner: ads
--

COMMENT ON COLUMN public.wf_state.is_head IS '是否入口';


--
-- Name: wf_state_id_seq; Type: SEQUENCE; Schema: public; Owner: ads
--

CREATE SEQUENCE public.wf_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wf_state_id_seq OWNER TO ads;

--
-- Name: wf_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ads
--

ALTER SEQUENCE public.wf_state_id_seq OWNED BY public.wf_state.id;


--
-- Name: api id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.api ALTER COLUMN id SET DEFAULT nextval('public.api_id_seq'::regclass);


--
-- Name: api_access id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.api_access ALTER COLUMN id SET DEFAULT nextval('public.api_access_id_seq'::regclass);


--
-- Name: area_info id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.area_info ALTER COLUMN id SET DEFAULT nextval('public.area_info_id_seq'::regclass);


--
-- Name: data_dictionary id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.data_dictionary ALTER COLUMN id SET DEFAULT nextval('public.data_dictionary_id_seq'::regclass);


--
-- Name: menu_element id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.menu_element ALTER COLUMN id SET DEFAULT nextval('public.menu_element_id_seq'::regclass);


--
-- Name: message_info id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.message_info ALTER COLUMN id SET DEFAULT nextval('public.message_info_id_seq'::regclass);


--
-- Name: operation_log id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.operation_log ALTER COLUMN id SET DEFAULT nextval('public.operation_log_id_seq'::regclass);


--
-- Name: resource_access id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.resource_access ALTER COLUMN id SET DEFAULT nextval('public.resource_access_id_seq'::regclass);


--
-- Name: role_menu id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.role_menu ALTER COLUMN id SET DEFAULT nextval('public.role_menu_id_seq'::regclass);


--
-- Name: role_menu_element_relatioin id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.role_menu_element_relatioin ALTER COLUMN id SET DEFAULT nextval('public.role_menu_element_relatioin_id_seq'::regclass);


--
-- Name: system_menu id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.system_menu ALTER COLUMN id SET DEFAULT nextval('public.system_menu_id_seq'::regclass);


--
-- Name: system_role id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.system_role ALTER COLUMN id SET DEFAULT nextval('public.system_role_id_seq'::regclass);


--
-- Name: system_user id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.system_user ALTER COLUMN id SET DEFAULT nextval('public.system_user_id_seq'::regclass);


--
-- Name: tb_my_favorites id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.tb_my_favorites ALTER COLUMN id SET DEFAULT nextval('public.tb_my_favorites_id_seq'::regclass);


--
-- Name: user_role_relation id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.user_role_relation ALTER COLUMN id SET DEFAULT nextval('public.user_role_relation_id_seq'::regclass);


--
-- Name: version_info id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.version_info ALTER COLUMN id SET DEFAULT nextval('public.version_info_id_seq'::regclass);


--
-- Name: wf_business id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.wf_business ALTER COLUMN id SET DEFAULT nextval('public.wf_business_id_seq'::regclass);


--
-- Name: wf_state id; Type: DEFAULT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.wf_state ALTER COLUMN id SET DEFAULT nextval('public.wf_state_id_seq'::regclass);


--
-- Data for Name: api; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.api (id, remark, url, is_enable) FROM stdin;
\.


--
-- Data for Name: api_access; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.api_access (id, role_id, api_id, decision) FROM stdin;
\.


--
-- Data for Name: area_info; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.area_info (id, area_code, area_name, area_type, parent_code, remark, enable) FROM stdin;
51	141126	石楼县	3	141100	\N	1
52	141127	岚县	3	141100	\N	1
53	141128	方山县	3	141100	\N	1
54	141129	中阳县	3	141100	\N	1
55	141130	交口县	3	141100	\N	1
56	141181	孝义市	3	141100	\N	1
57	141182	汾阳市	3	141100	\N	1
58	150000	内蒙古自治区	1	0	\N	1
59	150100	呼和浩特市	2	150000	\N	1
60	150101	市辖区	3	150100	\N	1
61	150102	新城区	3	150100	\N	1
62	150103	回民区	3	150100	\N	1
63	150104	玉泉区	3	150100	\N	1
64	150105	赛罕区	3	150100	\N	1
65	150121	土默特左旗	3	150100	\N	1
66	150122	托克托县	3	150100	\N	1
67	150123	和林格尔县	3	150100	\N	1
68	150124	清水河县	3	150100	\N	1
69	150125	武川县	3	150100	\N	1
70	150200	包头市	2	150000	\N	1
71	150201	市辖区	3	150200	\N	1
72	150202	东河区	3	150200	\N	1
73	150203	昆都仑区	3	150200	\N	1
74	150204	青山区	3	150200	\N	1
75	150205	石拐区	3	150200	\N	1
76	150206	白云矿区	3	150200	\N	1
77	150207	九原区	3	150200	\N	1
78	150221	土默特右旗	3	150200	\N	1
79	150222	固阳县	3	150200	\N	1
80	150223	达尔罕茂明安联合旗	3	150200	\N	1
81	150300	乌海市	2	150000	\N	1
82	150301	市辖区	3	150300	\N	1
83	150302	海勃湾区	3	150300	\N	1
84	150303	海南区	3	150300	\N	1
85	150304	乌达区	3	150300	\N	1
86	150400	赤峰市	2	150000	\N	1
87	150401	市辖区	3	150400	\N	1
88	150402	红山区	3	150400	\N	1
89	150403	元宝山区	3	150400	\N	1
90	150404	松山区	3	150400	\N	1
91	150421	阿鲁科尔沁旗	3	150400	\N	1
92	150422	巴林左旗	3	150400	\N	1
93	150423	巴林右旗	3	150400	\N	1
94	150424	林西县	3	150400	\N	1
95	150425	克什克腾旗	3	150400	\N	1
96	150426	翁牛特旗	3	150400	\N	1
97	150428	喀喇沁旗	3	150400	\N	1
98	150429	宁城县	3	150400	\N	1
99	150430	敖汉旗	3	150400	\N	1
100	150500	通辽市	2	150000	\N	1
101	150501	市辖区	3	150500	\N	1
102	150502	科尔沁区	3	150500	\N	1
103	150521	科尔沁左翼中旗	3	150500	\N	1
104	150522	科尔沁左翼后旗	3	150500	\N	1
105	150523	开鲁县	3	150500	\N	1
106	150524	库伦旗	3	150500	\N	1
107	150525	奈曼旗	3	150500	\N	1
108	150526	扎鲁特旗	3	150500	\N	1
109	150581	霍林郭勒市	3	150500	\N	1
110	150600	鄂尔多斯市	2	150000	\N	1
111	150602	东胜区	3	150600	\N	1
112	150621	达拉特旗	3	150600	\N	1
113	150622	准格尔旗	3	150600	\N	1
114	150623	鄂托克前旗	3	150600	\N	1
115	150624	鄂托克旗	3	150600	\N	1
116	150625	杭锦旗	3	150600	\N	1
117	150626	乌审旗	3	150600	\N	1
118	150627	伊金霍洛旗	3	150600	\N	1
119	150700	呼伦贝尔市	2	150000	\N	1
120	150701	市辖区	3	150700	\N	1
121	150702	海拉尔区	3	150700	\N	1
122	150721	阿荣旗	3	150700	\N	1
123	150723	鄂伦春自治旗	3	150700	\N	1
124	150724	鄂温克族自治旗	3	150700	\N	1
125	150725	陈巴尔虎旗	3	150700	\N	1
126	150726	新巴尔虎左旗	3	150700	\N	1
127	150727	新巴尔虎右旗	3	150700	\N	1
128	150781	满洲里市	3	150700	\N	1
129	150782	牙克石市	3	150700	\N	1
130	150783	扎兰屯市	3	150700	\N	1
131	150784	额尔古纳市	3	150700	\N	1
132	150785	根河市	3	150700	\N	1
133	150800	巴彦淖尔市	2	150000	\N	1
134	150801	市辖区	3	150800	\N	1
135	150802	临河区	3	150800	\N	1
136	150821	五原县	3	150800	\N	1
137	150822	磴口县	3	150800	\N	1
138	150823	乌拉特前旗	3	150800	\N	1
139	150824	乌拉特中旗	3	150800	\N	1
140	150825	乌拉特后旗	3	150800	\N	1
141	150826	杭锦后旗	3	150800	\N	1
142	150900	乌兰察布市	2	150000	\N	1
143	150901	市辖区	3	150900	\N	1
144	150902	集宁区	3	150900	\N	1
145	150921	卓资县	3	150900	\N	1
146	150922	化德县	3	150900	\N	1
147	150923	商都县	3	150900	\N	1
148	150924	兴和县	3	150900	\N	1
149	150925	凉城县	3	150900	\N	1
150	150926	察哈尔右翼前旗	3	150900	\N	1
151	150927	察哈尔右翼中旗	3	150900	\N	1
152	150928	察哈尔右翼后旗	3	150900	\N	1
153	150929	四子王旗	3	150900	\N	1
154	150981	丰镇市	3	150900	\N	1
155	152200	兴安盟	2	150000	\N	1
156	152201	乌兰浩特市	3	152200	\N	1
157	152202	阿尔山市	3	152200	\N	1
158	152221	科尔沁右翼前旗	3	152200	\N	1
159	152222	科尔沁右翼中旗	3	152200	\N	1
160	152223	扎赉特旗	3	152200	\N	1
161	152224	突泉县	3	152200	\N	1
162	152500	锡林郭勒盟	2	150000	\N	1
163	152501	二连浩特市	3	152500	\N	1
164	152502	锡林浩特市	3	152500	\N	1
165	152522	阿巴嘎旗	3	152500	\N	1
166	152523	苏尼特左旗	3	152500	\N	1
167	152524	苏尼特右旗	3	152500	\N	1
168	152525	东乌珠穆沁旗	3	152500	\N	1
169	441623	连平县	3	441600	\N	1
170	152526	西乌珠穆沁旗	3	152500	\N	1
171	152527	太仆寺旗	3	152500	\N	1
172	152528	镶黄旗	3	152500	\N	1
173	152529	正镶白旗	3	152500	\N	1
174	152530	正蓝旗	3	152500	\N	1
175	152531	多伦县	3	152500	\N	1
176	152900	阿拉善盟	2	150000	\N	1
177	152921	阿拉善左旗	3	152900	\N	1
178	152922	阿拉善右旗	3	152900	\N	1
179	152923	额济纳旗	3	152900	\N	1
180	210000	辽宁省	1	0	\N	1
181	210100	沈阳市	2	210000	\N	1
182	210103	沈河区	3	210100	\N	1
183	210104	大东区	3	210100	\N	1
184	210105	皇姑区	3	210100	\N	1
185	210106	铁西区	3	210100	\N	1
186	210111	苏家屯区	3	210100	\N	1
187	210112	东陵区	3	210100	\N	1
188	210113	沈北新区	3	210100	\N	1
189	210114	于洪区	3	210100	\N	1
190	210122	辽中县	3	210100	\N	1
191	210123	康平县	3	210100	\N	1
192	210124	法库县	3	210100	\N	1
193	210181	新民市	3	210100	\N	1
194	210200	大连市	2	210000	\N	1
195	210882	大石桥市	3	210800	\N	1
196	230207	碾子山区	3	230200	\N	1
197	230208	梅里斯达斡尔族区	3	230200	\N	1
198	230221	龙江县	3	230200	\N	1
199	230223	依安县	3	230200	\N	1
200	230224	泰来县	3	230200	\N	1
201	230225	甘南县	3	230200	\N	1
202	230227	富裕县	3	230200	\N	1
203	230229	克山县	3	230200	\N	1
204	230230	克东县	3	230200	\N	1
205	230231	拜泉县	3	230200	\N	1
206	230281	讷河市	3	230200	\N	1
207	230301	市辖区	3	230300	\N	1
208	230302	鸡冠区	3	230300	\N	1
209	230303	恒山区	3	230300	\N	1
210	230304	滴道区	3	230300	\N	1
211	320106	鼓楼区	3	320100	\N	1
212	321181	丹阳市	3	321100	\N	1
213	321182	扬中市	3	321100	\N	1
214	321183	句容市	3	321100	\N	1
215	340202	镜湖区	3	340200	\N	1
216	340203	弋江区	3	340200	\N	1
217	340207	鸠江区	3	340200	\N	1
218	340208	三山区	3	340200	\N	1
219	340221	芜湖县	3	340200	\N	1
220	340222	繁昌县	3	340200	\N	1
221	340223	南陵县	3	340200	\N	1
222	340300	蚌埠市	2	340000	\N	1
223	340301	市辖区	3	340300	\N	1
224	340811	宜秀区	3	340800	\N	1
225	340822	怀宁县	3	340800	\N	1
226	340827	望江县	3	340800	\N	1
227	340828	岳西县	3	340800	\N	1
228	340881	桐城市	3	340800	\N	1
229	341000	黄山市	2	340000	\N	1
230	341001	市辖区	3	341000	\N	1
231	341002	屯溪区	3	341000	\N	1
232	341003	黄山区	3	341000	\N	1
233	341004	徽州区	3	341000	\N	1
234	341021	歙县	3	341000	\N	1
235	341022	休宁县	3	341000	\N	1
236	341023	黟县	3	341000	\N	1
237	341024	祁门县	3	341000	\N	1
238	341100	滁州市	2	340000	\N	1
239	341101	市辖区	3	341100	\N	1
240	341102	琅琊区	3	341100	\N	1
241	341103	南谯区	3	341100	\N	1
242	341122	来安县	3	341100	\N	1
243	341124	全椒县	3	341100	\N	1
244	341125	定远县	3	341100	\N	1
245	341126	凤阳县	3	341100	\N	1
246	341622	蒙城县	3	341600	\N	1
247	341623	利辛县	3	341600	\N	1
248	341700	池州市	2	340000	\N	1
249	341701	市辖区	3	341700	\N	1
250	341702	贵池区	3	341700	\N	1
251	411424	柘城县	3	411400	\N	1
252	411425	虞城县	3	411400	\N	1
253	411500	信阳市	2	410000	\N	1
254	411501	市辖区	3	411500	\N	1
255	411502	浉河区	3	411500	\N	1
256	411503	平桥区	3	411500	\N	1
257	411521	罗山县	3	411500	\N	1
258	411522	光山县	3	411500	\N	1
259	411523	新县	3	411500	\N	1
260	411524	商城县	3	411500	\N	1
261	411525	固始县	3	411500	\N	1
262	411526	潢川县	3	411500	\N	1
263	411527	淮滨县	3	411500	\N	1
264	411528	息县	3	411500	\N	1
265	411600	周口市	2	410000	\N	1
266	411601	市辖区	3	411600	\N	1
267	411602	川汇区	3	411600	\N	1
268	411621	扶沟县	3	411600	\N	1
269	450123	隆安县	3	450100	\N	1
270	450124	马山县	3	450100	\N	1
271	450125	上林县	3	450100	\N	1
272	450126	宾阳县	3	450100	\N	1
273	450127	横县	3	450100	\N	1
274	450200	柳州市	2	450000	\N	1
275	450201	市辖区	3	450200	\N	1
276	450202	城中区	3	450200	\N	1
277	450203	鱼峰区	3	450200	\N	1
278	450204	柳南区	3	450200	\N	1
279	450205	柳北区	3	450200	\N	1
280	450221	柳江县	3	450200	\N	1
281	450222	柳城县	3	450200	\N	1
282	450223	鹿寨县	3	450200	\N	1
283	450224	融安县	3	450200	\N	1
284	450225	融水苗族自治县	3	450200	\N	1
285	450226	三江侗族自治县	3	450200	\N	1
286	450300	桂林市	2	450000	\N	1
287	450301	市辖区	3	450300	\N	1
288	450302	秀峰区	3	450300	\N	1
289	450303	叠彩区	3	450300	\N	1
290	450304	象山区	3	450300	\N	1
291	450305	七星区	3	450300	\N	1
292	450311	雁山区	3	450300	\N	1
293	450321	阳朔县	3	450300	\N	1
294	450322	临桂县	3	\N	\N	1
295	450323	灵川县	3	450300	\N	1
296	450324	全州县	3	450300	\N	1
297	450325	兴安县	3	450300	\N	1
298	450326	永福县	3	450300	\N	1
299	450327	灌阳县	3	450300	\N	1
300	450328	龙胜各族自治县	3	450300	\N	1
301	450329	资源县	3	450300	\N	1
302	450330	平乐县	3	450300	\N	1
303	450331	荔蒲县	3	450300	\N	1
304	450332	恭城瑶族自治县	3	450300	\N	1
305	450400	梧州市	2	450000	\N	1
306	450401	市辖区	3	450400	\N	1
307	450403	万秀区	3	450400	\N	1
308	450404	蝶山区	3	\N	\N	1
309	450405	长洲区	3	450400	\N	1
310	450421	苍梧县	3	450400	\N	1
311	450422	藤县	3	450400	\N	1
312	450423	蒙山县	3	450400	\N	1
313	450481	岑溪市	3	450400	\N	1
314	450500	北海市	2	450000	\N	1
315	450501	市辖区	3	450500	\N	1
316	450502	海城区	3	450500	\N	1
317	450503	银海区	3	450500	\N	1
318	450512	铁山港区	3	450500	\N	1
319	450521	合浦县	3	450500	\N	1
320	450600	防城港市	2	450000	\N	1
321	450601	市辖区	3	450600	\N	1
322	450602	港口区	3	450600	\N	1
323	450603	防城区	3	450600	\N	1
324	450621	上思县	3	450600	\N	1
325	450681	东兴市	3	450600	\N	1
326	450700	钦州市	2	450000	\N	1
327	450701	市辖区	3	450700	\N	1
328	460000	海南省	1	0	\N	1
329	460100	海口市	2	460000	\N	1
330	460101	市辖区	3	460100	\N	1
331	460107	琼山区	3	460100	\N	1
332	460108	美兰区	3	460100	\N	1
333	460200	三亚市	2	460000	\N	1
334	460201	市辖区	3	460200	\N	1
335	469000	省直辖县级行政单位	2	460000	\N	1
336	469001	五指山市	3	469000	\N	1
337	469002	琼海市	3	469000	\N	1
338	469003	儋州市	3	469000	\N	1
339	469005	文昌市	3	469000	\N	1
340	469006	万宁市	3	469000	\N	1
341	469007	东方市	3	469000	\N	1
342	469025	定安县	3	469000	\N	1
343	469026	屯昌县	3	469000	\N	1
344	469027	澄迈县	3	469000	\N	1
345	469028	临高县	3	469000	\N	1
346	469030	白沙黎族自治县	3	469000	\N	1
347	469031	昌江黎族自治县	3	\N	\N	1
348	469033	乐东黎族自治县	3	\N	\N	1
349	469034	陵水黎族自治县	3	\N	\N	1
350	469035	保亭黎族苗族自治县	3	\N	\N	1
351	469036	琼中黎族苗族自治县	3	\N	\N	1
352	469037	西沙群岛	3	\N	\N	1
353	469038	南沙群岛	3	\N	\N	1
354	500000	重庆市	1	0	\N	1
355	500100	市辖区	2	500000	\N	1
356	500101	万州区	3	500100	\N	1
357	500102	涪陵区	3	500100	\N	1
358	500103	渝中区	3	500100	\N	1
359	500104	大渡口区	3	500100	\N	1
360	500105	江北区	3	500100	\N	1
361	500106	沙坪坝区	3	500100	\N	1
362	500107	九龙坡区	3	500100	\N	1
363	500108	南岸区	3	500100	\N	1
364	500109	北碚区	3	500100	\N	1
365	500110	万盛区	3	500100	\N	1
366	500111	双桥区	3	500100	\N	1
367	500112	渝北区	3	500100	\N	1
368	500113	巴南区	3	500100	\N	1
369	500115	长寿区	3	500100	\N	1
370	500116	江津区	3	500100	\N	1
371	500117	合川区	3	500100	\N	1
372	500118	永川区	3	500100	\N	1
373	500119	南川区	3	500100	\N	1
374	500200	县	2	500000	\N	1
375	500222	綦江县	3	\N	\N	1
376	500223	潼南县	3	500100	\N	1
377	500224	铜梁县	3	\N	\N	1
378	500225	大足县	3	\N	\N	1
379	500226	荣昌县	3	500100	\N	1
380	500235	云阳县	3	500100	\N	1
381	500236	奉节县	3	500100	\N	1
382	500237	巫山县	3	500100	\N	1
383	500238	巫溪县	3	500100	\N	1
384	500240	石柱土家族自治县	3	500100	\N	1
385	500241	秀山土家族苗族自治县	3	500100	\N	1
386	500242	酉阳土家族苗族自治县	3	500100	\N	1
387	510115	温江区	3	510100	\N	1
388	510121	金堂县	3	510100	\N	1
389	510124	郫县	3	510100	\N	1
390	510129	大邑县	3	510100	\N	1
391	510131	蒲江县	3	510100	\N	1
392	510132	新津县	3	510100	\N	1
393	510181	都江堰市	3	510100	\N	1
394	510182	彭州市	3	510100	\N	1
395	510183	邛崃市	3	510100	\N	1
396	510184	崇州市	3	510100	\N	1
397	510300	自贡市	2	510000	\N	1
398	510301	市辖区	3	510300	\N	1
399	510302	自流井区	3	510300	\N	1
400	510303	贡井区	3	510300	\N	1
401	510304	大安区	3	510300	\N	1
402	510311	沿滩区	3	510300	\N	1
403	510411	仁和区	3	510400	\N	1
404	510421	米易县	3	510400	\N	1
405	510422	盐边县	3	510400	\N	1
406	510500	泸州市	2	510000	\N	1
407	510501	市辖区	3	510500	\N	1
408	510502	江阳区	3	510500	\N	1
409	510503	纳溪区	3	510500	\N	1
410	510504	龙马潭区	3	510500	\N	1
411	510521	泸县	3	510500	\N	1
412	510522	合江县	3	510500	\N	1
413	510524	叙永县	3	510500	\N	1
414	510525	古蔺县	3	510500	\N	1
415	510600	德阳市	2	510000	\N	1
416	510703	涪城区	3	510700	\N	1
417	510725	梓潼县	3	510700	\N	1
418	510726	北川羌族自治县	3	510700	\N	1
419	510727	平武县	3	510700	\N	1
420	510781	江油市	3	510700	\N	1
421	510800	广元市	2	510000	\N	1
422	510801	市辖区	3	510800	\N	1
423	510802	市中区	3	510800	\N	1
424	450702	钦南区	3	450700	\N	1
425	450703	钦北区	3	450700	\N	1
426	450721	灵山县	3	450700	\N	1
427	450722	浦北县	3	450700	\N	1
428	450800	贵港市	2	450000	\N	1
429	450801	市辖区	3	450800	\N	1
430	450802	港北区	3	450800	\N	1
431	450803	港南区	3	450800	\N	1
432	450804	覃塘区	3	450800	\N	1
433	450821	平南县	3	450800	\N	1
434	450881	桂平市	3	450800	\N	1
435	450900	玉林市	2	450000	\N	1
1073	450108	良庆区	3	450100	\N	1
1074	450109	邕宁区	3	450100	\N	1
1075	450122	武鸣县	3	450100	\N	1
1076	532600	文山壮族苗族自治州	2	530000	\N	1
1077	532621	文山县	3	\N	\N	1
1078	532622	砚山县	3	532600	\N	1
1079	533102	瑞丽市	3	533100	\N	1
1080	533103	潞西市	3	533100	\N	1
1081	533122	梁河县	3	533100	\N	1
1082	533123	盈江县	3	533100	\N	1
1083	533124	陇川县	3	533100	\N	1
1084	533300	怒江傈僳族自治州	2	530000	\N	1
1085	533321	泸水县	3	533300	\N	1
1086	533323	福贡县	3	533300	\N	1
1087	533324	贡山独龙族怒族自治县	3	533300	\N	1
1088	533325	兰坪白族普米族自治县	3	533300	\N	1
1089	533400	迪庆藏族自治州	2	530000	\N	1
1090	533421	香格里拉县	3	533400	\N	1
1091	533422	德钦县	3	533400	\N	1
1092	533423	维西傈僳族自治县	3	533400	\N	1
1093	350121	闽侯县	3	350100	\N	1
1094	350122	连江县	3	350100	\N	1
1095	360424	修水县	3	360400	\N	1
1096	410882	沁阳市	3	410800	\N	1
1097	410902	华龙区	3	410900	\N	1
1098	419001	市辖区	3	419000	\N	1
1099	430901	市辖区	3	430900	\N	1
1100	430902	资阳区	3	430900	\N	1
1101	430903	赫山区	3	430900	\N	1
1102	430921	南县	3	430900	\N	1
1103	430922	桃江县	3	430900	\N	1
1104	430923	安化县	3	430900	\N	1
1105	430981	沅江市	3	430900	\N	1
1106	431000	郴州市	2	430000	\N	1
1107	431001	市辖区	3	431000	\N	1
1108	431002	北湖区	3	431000	\N	1
1109	431003	苏仙区	3	431000	\N	1
1110	431026	汝城县	3	431000	\N	1
1111	431027	桂东县	3	431000	\N	1
1112	431028	安仁县	3	431000	\N	1
1113	431081	资兴市	3	431000	\N	1
1114	431100	永州市	2	430000	\N	1
1115	431101	市辖区	3	431100	\N	1
1116	431102	零陵区	3	431100	\N	1
1117	511402	东坡区	3	511400	\N	1
1118	511421	仁寿县	3	511400	\N	1
1119	511422	彭山县	3	511400	\N	1
1120	532531	绿春县	3	532500	\N	1
1121	542226	曲松县	3	542200	\N	1
1122	632100	海东地区	2	\N	\N	1
1123	632121	平安县	3	\N	\N	1
1124	140721	榆社县	3	140700	\N	1
1125	140722	左权县	3	140700	\N	1
1126	140723	和顺县	3	140700	\N	1
1127	140724	昔阳县	3	140700	\N	1
1128	140725	寿阳县	3	140700	\N	1
1129	140726	太谷县	3	140700	\N	1
1130	140727	祁县	3	140700	\N	1
1131	140728	平遥县	3	140700	\N	1
1132	140729	灵石县	3	140700	\N	1
1133	140781	介休市	3	140700	\N	1
1134	140800	运城市	2	140000	\N	1
1135	140801	市辖区	3	140800	\N	1
1136	140802	盐湖区	3	140800	\N	1
1137	140821	临猗县	3	140800	\N	1
1138	140822	万荣县	3	140800	\N	1
1139	140823	闻喜县	3	140800	\N	1
1140	140824	稷山县	3	140800	\N	1
1141	140825	新绛县	3	140800	\N	1
1142	210703	凌河区	3	210700	\N	1
1143	210711	太和区	3	210700	\N	1
1144	210726	黑山县	3	210700	\N	1
1145	210727	义县	3	210700	\N	1
1146	210781	凌海市	3	210700	\N	1
1147	210782	北镇市	3	210700	\N	1
1148	210800	营口市	2	210000	\N	1
1149	210801	市辖区	3	210800	\N	1
1150	210802	站前区	3	210800	\N	1
1151	210803	西市区	3	210800	\N	1
1152	210804	鲅鱼圈区	3	210800	\N	1
1153	210811	老边区	3	210800	\N	1
1154	210881	盖州市	3	210800	\N	1
1155	210900	阜新市	2	210000	\N	1
1156	210901	市辖区	3	210900	\N	1
1157	210902	海州区	3	210900	\N	1
1158	210903	新邱区	3	210900	\N	1
1159	210904	太平区	3	210900	\N	1
1160	210905	清河门区	3	210900	\N	1
1161	210911	细河区	3	210900	\N	1
1162	210921	阜新蒙古族自治县	3	210900	\N	1
1163	210922	彰武县	3	210900	\N	1
1164	211000	辽阳市	2	210000	\N	1
1165	211001	市辖区	3	211000	\N	1
1166	211002	白塔区	3	211000	\N	1
1167	211003	文圣区	3	211000	\N	1
1168	211004	宏伟区	3	211000	\N	1
1169	211005	弓长岭区	3	211000	\N	1
1170	211011	太子河区	3	211000	\N	1
1171	211021	辽阳县	3	211000	\N	1
1172	211081	灯塔市	3	211000	\N	1
1173	211100	盘锦市	2	210000	\N	1
1174	211101	市辖区	3	211100	\N	1
1175	211102	双台子区	3	211100	\N	1
1176	211103	兴隆台区	3	211100	\N	1
1177	211121	大洼县	3	211100	\N	1
1327	371521	阳谷县	3	371500	\N	1
1328	371522	莘县	3	371500	\N	1
1329	371523	茌平县	3	371500	\N	1
1330	371524	东阿县	3	371500	\N	1
1331	371525	冠县	3	371500	\N	1
1332	371526	高唐县	3	371500	\N	1
1333	371581	临清市	3	371500	\N	1
1334	371600	滨州市	2	370000	\N	1
1335	371601	市辖区	3	371600	\N	1
1336	371602	滨城区	3	371600	\N	1
1337	371621	惠民县	3	371600	\N	1
1338	371622	阳信县	3	371600	\N	1
1339	371623	无棣县	3	371600	\N	1
1340	371624	沾化县	3	\N	\N	1
1341	371625	博兴县	3	371600	\N	1
1342	371724	巨野县	3	371700	\N	1
1343	371725	郓城县	3	371700	\N	1
1344	371726	鄄城县	3	371700	\N	1
1345	371727	定陶县	3	371700	\N	1
1346	371728	东明县	3	371700	\N	1
1347	410000	河南省	1	0	\N	1
1348	410100	郑州市	2	410000	\N	1
1349	410101	市辖区	3	410100	\N	1
1350	410102	中原区	3	410100	\N	1
1351	410103	二七区	3	410100	\N	1
1352	410104	管城回族区	3	410100	\N	1
1353	410105	金水区	3	410100	\N	1
1354	410106	上街区	3	410100	\N	1
1355	410108	惠济区	3	410100	\N	1
1356	410122	中牟县	3	410100	\N	1
1357	410181	巩义市	3	410100	\N	1
1358	410182	荥阳市	3	410100	\N	1
1359	410183	新密市	3	410100	\N	1
1360	410184	新郑市	3	410100	\N	1
1361	410185	登封市	3	410100	\N	1
1362	410200	开封市	2	410000	\N	1
1363	410201	市辖区	3	410200	\N	1
1364	410202	龙亭区	3	410200	\N	1
1365	410203	顺河回族区	3	410200	\N	1
1366	410204	鼓楼区	3	410200	\N	1
1367	410205	禹王台区	3	410200	\N	1
1368	410211	金明区	3	410200	\N	1
1369	410221	杞县	3	410200	\N	1
1370	410305	涧西区	3	410300	\N	1
1371	410306	吉利区	3	410300	\N	1
1372	410307	洛龙区	3	\N	\N	1
1373	410322	孟津县	3	410300	\N	1
1374	410323	新安县	3	410300	\N	1
1375	410324	栾川县	3	410300	\N	1
1376	410325	嵩县	3	410300	\N	1
1377	410728	长垣县	3	410700	\N	1
1378	410781	卫辉市	3	410700	\N	1
1379	410782	辉县市	3	410700	\N	1
1380	410800	焦作市	2	410000	\N	1
1381	410801	市辖区	3	410800	\N	1
1382	410802	解放区	3	410800	\N	1
1383	130982	任丘市	3	130900	\N	1
1384	130983	黄骅市	3	130900	\N	1
1385	130984	河间市	3	130900	\N	1
1386	131000	廊坊市	2	130000	\N	1
1387	131001	市辖区	3	131000	\N	1
1388	131002	安次区	3	131000	\N	1
1389	131003	广阳区	3	131000	\N	1
1390	131022	固安县	3	131000	\N	1
1391	131023	永清县	3	131000	\N	1
1392	131024	香河县	3	131000	\N	1
1393	131025	大城县	3	131000	\N	1
1394	131026	文安县	3	131000	\N	1
1395	131028	大厂回族自治县	3	131000	\N	1
1396	131081	霸州市	3	131000	\N	1
1397	131082	三河市	3	131000	\N	1
1398	131100	衡水市	2	130000	\N	1
1399	131101	市辖区	3	131100	\N	1
1400	652328	木垒哈萨克自治县	3	652300	\N	1
1401	131121	枣强县	3	131100	\N	1
1402	131122	武邑县	3	131100	\N	1
1403	131123	武强县	3	131100	\N	1
1404	131124	饶阳县	3	131100	\N	1
1405	131125	安平县	3	131100	\N	1
1406	131126	故城县	3	131100	\N	1
1407	131127	景县	3	131100	\N	1
1408	131128	阜城县	3	131100	\N	1
1409	131181	冀州市	3	131100	\N	1
1410	131182	深州市	3	131100	\N	1
1411	140000	山西省	1	0	\N	1
1412	140100	太原市	2	140000	\N	1
1413	140101	市辖区	3	140100	\N	1
1414	140105	小店区	3	140100	\N	1
436	450901	市辖区	3	450900	\N	1
437	450902	玉州区	3	450900	\N	1
438	450921	容县	3	450900	\N	1
439	450922	陆川县	3	450900	\N	1
440	450923	博白县	3	450900	\N	1
441	450924	兴业县	3	450900	\N	1
442	450981	北流市	3	450900	\N	1
443	451000	百色市	2	450000	\N	1
444	451001	市辖区	3	451000	\N	1
445	451002	右江区	3	451000	\N	1
446	451021	田阳县	3	451000	\N	1
447	451022	田东县	3	451000	\N	1
448	451023	平果县	3	451000	\N	1
449	451024	德保县	3	451000	\N	1
450	451025	靖西县	3	451000	\N	1
451	451026	那坡县	3	451000	\N	1
452	451027	凌云县	3	451000	\N	1
453	451028	乐业县	3	451000	\N	1
454	511302	顺庆区	3	511300	\N	1
455	511303	高坪区	3	511300	\N	1
456	511304	嘉陵区	3	511300	\N	1
457	511321	南部县	3	511300	\N	1
458	511322	营山县	3	511300	\N	1
459	511323	蓬安县	3	511300	\N	1
460	511324	仪陇县	3	511300	\N	1
461	511325	西充县	3	511300	\N	1
462	511381	阆中市	3	511300	\N	1
463	511400	眉山市	2	510000	\N	1
464	511529	屏山县	3	511500	\N	1
465	511600	广安市	2	510000	\N	1
466	511601	市辖区	3	511600	\N	1
467	511602	广安区	3	511600	\N	1
468	511621	岳池县	3	511600	\N	1
469	511622	武胜县	3	511600	\N	1
470	511900	巴中市	2	510000	\N	1
471	511901	市辖区	3	511900	\N	1
472	511902	巴州区	3	511900	\N	1
473	511921	通江县	3	511900	\N	1
474	511922	南江县	3	511900	\N	1
475	511923	平昌县	3	511900	\N	1
476	512000	资阳市	2	510000	\N	1
477	512001	市辖区	3	512000	\N	1
478	512002	雁江区	3	512000	\N	1
479	512021	安岳县	3	512000	\N	1
480	512022	乐至县	3	512000	\N	1
481	512081	简阳市	3	512000	\N	1
482	513200	阿坝藏族羌族自治州	2	510000	\N	1
483	513221	汶川县	3	513200	\N	1
484	513222	理县	3	513200	\N	1
485	513223	茂县	3	513200	\N	1
486	513224	松潘县	3	513200	\N	1
487	513225	九寨沟县	3	513200	\N	1
488	513226	金川县	3	513200	\N	1
489	513227	小金县	3	513200	\N	1
490	513228	黑水县	3	513200	\N	1
491	120116	滨海新区	3	120100	\N	1
492	441421	梅县	3	\N	\N	1
493	441422	大埔县	3	441400	\N	1
494	441423	丰顺县	3	441400	\N	1
495	441424	五华县	3	441400	\N	1
496	441426	平远县	3	441400	\N	1
497	441427	蕉岭县	3	441400	\N	1
498	441481	兴宁市	3	441400	\N	1
499	441500	汕尾市	2	440000	\N	1
500	350201	市辖区	3	350200	\N	1
501	350203	思明区	3	350200	\N	1
502	350205	海沧区	3	350200	\N	1
503	350206	湖里区	3	350200	\N	1
504	350211	集美区	3	350200	\N	1
505	350212	同安区	3	350200	\N	1
506	350213	翔安区	3	350200	\N	1
507	350300	莆田市	2	350000	\N	1
508	350301	市辖区	3	350300	\N	1
509	350302	城厢区	3	350300	\N	1
510	350401	市辖区	3	350400	\N	1
511	350402	梅列区	3	350400	\N	1
512	350403	三元区	3	350400	\N	1
513	350421	明溪县	3	350400	\N	1
514	350423	清流县	3	350400	\N	1
515	350424	宁化县	3	350400	\N	1
516	350425	大田县	3	350400	\N	1
517	350426	尤溪县	3	350400	\N	1
518	350427	沙县	3	350400	\N	1
519	350428	将乐县	3	350400	\N	1
520	350429	泰宁县	3	350400	\N	1
521	350430	建宁县	3	350400	\N	1
522	350481	永安市	3	350400	\N	1
523	350500	泉州市	2	350000	\N	1
524	370983	肥城市	3	370900	\N	1
525	371000	威海市	2	370000	\N	1
526	371001	市辖区	3	371000	\N	1
527	371002	环翠区	3	371000	\N	1
528	371081	文登市	3	\N	\N	1
529	371082	荣成市	3	371000	\N	1
530	371424	临邑县	3	371400	\N	1
531	371425	齐河县	3	371400	\N	1
532	371426	平原县	3	371400	\N	1
533	371427	夏津县	3	371400	\N	1
534	371428	武城县	3	371400	\N	1
535	371481	乐陵市	3	371400	\N	1
536	371482	禹城市	3	371400	\N	1
537	371500	聊城市	2	370000	\N	1
538	371626	邹平县	3	371600	\N	1
539	371700	菏泽市	2	370000	\N	1
540	371701	市辖区	3	371700	\N	1
541	371702	牡丹区	3	371700	\N	1
542	371721	曹县	3	371700	\N	1
543	371722	单县	3	371700	\N	1
544	371723	成武县	3	371700	\N	1
545	410222	通许县	3	410200	\N	1
546	410223	尉氏县	3	410200	\N	1
547	410224	开封县	3	410200	\N	1
548	410225	兰考县	3	410200	\N	1
549	410300	洛阳市	2	410000	\N	1
550	410301	市辖区	3	410300	\N	1
551	410302	老城区	3	410300	\N	1
552	410303	西工区	3	410300	\N	1
553	410304	廛河回族区	3	410300	\N	1
554	410326	汝阳县	3	410300	\N	1
555	410327	宜阳县	3	410300	\N	1
556	410328	洛宁县	3	410300	\N	1
557	410329	伊川县	3	410300	\N	1
558	410381	偃师市	3	410300	\N	1
559	410400	平顶山市	2	410000	\N	1
560	410401	市辖区	3	410400	\N	1
561	410402	新华区	3	410400	\N	1
562	410403	卫东区	3	410400	\N	1
563	410404	石龙区	3	410400	\N	1
564	410411	湛河区	3	410400	\N	1
565	410421	宝丰县	3	410400	\N	1
566	410422	叶县	3	410400	\N	1
567	410423	鲁山县	3	410400	\N	1
568	410425	郏县	3	410400	\N	1
569	410481	舞钢市	3	410400	\N	1
570	410482	汝州市	3	410400	\N	1
571	410500	安阳市	2	410000	\N	1
572	410501	市辖区	3	410500	\N	1
573	410502	文峰区	3	410500	\N	1
574	410503	北关区	3	410500	\N	1
575	410505	殷都区	3	410500	\N	1
576	410506	龙安区	3	410500	\N	1
577	410522	安阳县	3	410500	\N	1
578	410523	汤阴县	3	410500	\N	1
579	410526	滑县	3	410500	\N	1
580	410527	内黄县	3	410500	\N	1
581	410581	林州市	3	410500	\N	1
582	410600	鹤壁市	2	410000	\N	1
583	410601	市辖区	3	410600	\N	1
584	410602	鹤山区	3	410600	\N	1
585	410603	山城区	3	410600	\N	1
586	410611	淇滨区	3	410600	\N	1
587	410621	浚县	3	410600	\N	1
588	410622	淇县	3	410600	\N	1
1030	441781	阳春市	3	441700	\N	1
1031	441800	清远市	2	440000	\N	1
1032	441801	市辖区	3	441800	\N	1
1033	441802	清城区	3	441800	\N	1
1034	441821	佛冈县	3	441800	\N	1
1035	441823	阳山县	3	441800	\N	1
1036	441825	连山壮族瑶族自治县	3	441800	\N	1
1037	441826	连南瑶族自治县	3	441800	\N	1
1038	441827	清新县	3	\N	\N	1
1039	441881	英德市	3	441800	\N	1
1040	441882	连州市	3	441800	\N	1
1041	411001	市辖区	3	411000	\N	1
1042	441900	东莞市	2	440000	\N	1
1043	441901	东莞市市辖区	3	441900	\N	1
1044	442000	中山市	2	440000	\N	1
1045	442001	中山市市辖区	3	442000	\N	1
1046	442101	市区	3	\N	\N	1
1047	445100	潮州市	2	440000	\N	1
1048	445101	市辖区	3	445100	\N	1
1049	445102	湘桥区	3	445100	\N	1
1050	445121	潮安县	3	\N	\N	1
1051	445122	饶平县	3	445100	\N	1
1052	445200	揭阳市	2	440000	\N	1
1053	445201	市辖区	3	445200	\N	1
1054	445202	榕城区	3	445200	\N	1
1055	445221	揭东县	3	\N	\N	1
1056	445222	揭西县	3	445200	\N	1
1057	445224	惠来县	3	445200	\N	1
1058	445281	普宁市	3	445200	\N	1
1059	445300	云浮市	2	440000	\N	1
1060	445301	市辖区	3	445300	\N	1
1061	445302	云城区	3	445300	\N	1
1062	445321	新兴县	3	445300	\N	1
1063	445322	郁南县	3	445300	\N	1
1064	445323	云安县	3	\N	\N	1
1065	445381	罗定市	3	445300	\N	1
1066	450000	广西壮族自治区	1	0	\N	1
1067	450100	南宁市	2	450000	\N	1
1068	450101	市辖区	3	450100	\N	1
1069	450102	兴宁区	3	450100	\N	1
1070	450103	青秀区	3	450100	\N	1
1071	450105	江南区	3	450100	\N	1
1072	450107	西乡塘区	3	450100	\N	1
589	410700	新乡市	2	410000	\N	1
590	410701	市辖区	3	410700	\N	1
591	410702	红旗区	3	410700	\N	1
592	410703	卫滨区	3	410700	\N	1
593	410704	凤泉区	3	410700	\N	1
594	410711	牧野区	3	410700	\N	1
595	410721	新乡县	3	410700	\N	1
596	410724	获嘉县	3	410700	\N	1
597	410725	原阳县	3	410700	\N	1
598	410726	延津县	3	410700	\N	1
599	410727	封丘县	3	410700	\N	1
600	411024	鄢陵县	3	411000	\N	1
601	411025	襄城县	3	411000	\N	1
602	411081	禹州市	3	411000	\N	1
603	411082	长葛市	3	411000	\N	1
604	411100	漯河市	2	410000	\N	1
605	411101	市辖区	3	411100	\N	1
606	411102	源汇区	3	411100	\N	1
607	411103	郾城区	3	411100	\N	1
608	411104	召陵区	3	411100	\N	1
609	411121	舞阳县	3	411100	\N	1
610	411122	临颍县	3	411100	\N	1
611	411200	三门峡市	2	410000	\N	1
612	411201	市辖区	3	411200	\N	1
613	411202	湖滨区	3	411200	\N	1
614	411221	渑池县	3	411200	\N	1
615	411222	陕县	3	411200	\N	1
616	411224	卢氏县	3	411200	\N	1
617	411281	义马市	3	411200	\N	1
618	411282	灵宝市	3	411200	\N	1
619	411300	南阳市	2	410000	\N	1
620	411301	市辖区	3	411300	\N	1
621	411302	宛城区	3	411300	\N	1
622	411303	卧龙区	3	411300	\N	1
623	411321	南召县	3	411300	\N	1
624	411322	方城县	3	411300	\N	1
625	411623	商水县	3	411600	\N	1
626	411624	沈丘县	3	411600	\N	1
627	411625	郸城县	3	411600	\N	1
628	411626	淮阳县	3	411600	\N	1
629	411627	太康县	3	411600	\N	1
630	411628	鹿邑县	3	411600	\N	1
631	411681	项城市	3	411600	\N	1
632	411700	驻马店市	2	410000	\N	1
633	411701	市辖区	3	411700	\N	1
634	411702	驿城区	3	411700	\N	1
635	411721	西平县	3	411700	\N	1
636	411722	上蔡县	3	411700	\N	1
637	411723	平舆县	3	411700	\N	1
638	411724	正阳县	3	411700	\N	1
639	411725	确山县	3	411700	\N	1
640	411726	泌阳县	3	411700	\N	1
641	411727	汝南县	3	411700	\N	1
642	411728	遂平县	3	411700	\N	1
643	411729	新蔡县	3	411700	\N	1
644	419000	济源市	2	410000	\N	1
645	420111	洪山区	3	420100	\N	1
646	420112	东西湖区	3	420100	\N	1
647	420113	汉南区	3	420100	\N	1
648	420114	蔡甸区	3	420100	\N	1
649	420115	江夏区	3	420100	\N	1
650	420116	黄陂区	3	420100	\N	1
651	420117	新洲区	3	420100	\N	1
652	420200	黄石市	2	420000	\N	1
653	420201	市辖区	3	420200	\N	1
654	420202	黄石港区	3	420200	\N	1
655	420203	西塞山区	3	420200	\N	1
656	420204	下陆区	3	420200	\N	1
657	420205	铁山区	3	420200	\N	1
658	420222	阳新县	3	420200	\N	1
659	420281	大冶市	3	420200	\N	1
660	420300	十堰市	2	420000	\N	1
661	420301	市辖区	3	420300	\N	1
662	420302	茅箭区	3	420300	\N	1
663	420303	张湾区	3	420300	\N	1
664	420321	郧县	3	\N	\N	1
665	420322	郧西县	3	420300	\N	1
666	420323	竹山县	3	420300	\N	1
667	420324	竹溪县	3	420300	\N	1
668	420325	房县	3	420300	\N	1
669	420381	丹江口市	3	420300	\N	1
670	420500	宜昌市	2	420000	\N	1
671	420501	市辖区	3	420500	\N	1
672	420502	西陵区	3	420500	\N	1
673	420503	伍家岗区	3	420500	\N	1
674	420504	点军区	3	420500	\N	1
675	420505	猇亭区	3	420500	\N	1
676	420506	夷陵区	3	420500	\N	1
677	420525	远安县	3	420500	\N	1
678	420526	兴山县	3	420500	\N	1
679	420527	秭归县	3	420500	\N	1
680	420528	长阳土家族自治县	3	420500	\N	1
681	420529	五峰土家族自治县	3	420500	\N	1
682	420581	宜都市	3	420500	\N	1
683	420582	当阳市	3	420500	\N	1
684	420583	枝江市	3	420500	\N	1
685	420600	襄樊市	2	420000	\N	1
686	420601	市辖区	3	420600	\N	1
687	420602	襄城区	3	420600	\N	1
688	420606	樊城区	3	420600	\N	1
689	420607	襄阳区	3	420600	\N	1
690	420624	南漳县	3	420600	\N	1
691	420625	谷城县	3	420600	\N	1
692	420626	保康县	3	420600	\N	1
693	420682	老河口市	3	420600	\N	1
694	420683	枣阳市	3	420600	\N	1
695	420684	宜城市	3	420600	\N	1
696	420703	华容区	3	420700	\N	1
697	420704	鄂城区	3	420700	\N	1
698	420800	荆门市	2	420000	\N	1
699	420801	市辖区	3	420800	\N	1
700	420802	东宝区	3	420800	\N	1
701	420804	掇刀区	3	420800	\N	1
702	420821	京山县	3	420800	\N	1
703	420822	沙洋县	3	420800	\N	1
704	420881	钟祥市	3	420800	\N	1
705	420900	孝感市	2	420000	\N	1
706	420901	市辖区	3	420900	\N	1
707	420902	孝南区	3	420900	\N	1
708	420921	孝昌县	3	420900	\N	1
709	420922	大悟县	3	420900	\N	1
710	420923	云梦县	3	420900	\N	1
711	420981	应城市	3	420900	\N	1
712	420982	安陆市	3	420900	\N	1
713	420984	汉川市	3	420900	\N	1
714	421083	洪湖市	3	421000	\N	1
715	421087	松滋市	3	421000	\N	1
716	421100	黄冈市	2	420000	\N	1
717	421101	市辖区	3	421100	\N	1
718	421102	黄州区	3	421100	\N	1
719	421121	团风县	3	421100	\N	1
720	421122	红安县	3	421100	\N	1
721	421123	罗田县	3	421100	\N	1
722	421124	英山县	3	421100	\N	1
723	421125	浠水县	3	421100	\N	1
724	421126	蕲春县	3	421100	\N	1
725	421127	黄梅县	3	421100	\N	1
726	421181	麻城市	3	421100	\N	1
727	421182	武穴市	3	421100	\N	1
728	421200	咸宁市	2	420000	\N	1
729	421201	市辖区	3	421200	\N	1
730	421202	咸安区	3	421200	\N	1
731	421221	嘉鱼县	3	421200	\N	1
732	430101	市辖区	3	430100	\N	1
733	430102	芙蓉区	3	430100	\N	1
734	430103	天心区	3	430100	\N	1
735	430104	岳麓区	3	430100	\N	1
1	140826	绛县	3	140800	\N	1
2	140827	垣曲县	3	140800	\N	1
3	140828	夏县	3	140800	\N	1
4	140829	平陆县	3	140800	\N	1
5	140830	芮城县	3	140800	\N	1
6	140881	永济市	3	140800	\N	1
7	140882	河津市	3	140800	\N	1
8	140900	忻州市	2	140000	\N	1
9	140901	市辖区	3	140900	\N	1
10	140902	忻府区	3	140900	\N	1
11	140921	定襄县	3	140900	\N	1
12	140922	五台县	3	140900	\N	1
13	140923	代县	3	140900	\N	1
14	140924	繁峙县	3	140900	\N	1
15	140925	宁武县	3	140900	\N	1
16	140926	静乐县	3	140900	\N	1
17	140927	神池县	3	140900	\N	1
18	140928	五寨县	3	140900	\N	1
19	140929	岢岚县	3	140900	\N	1
20	140930	河曲县	3	140900	\N	1
21	140931	保德县	3	140900	\N	1
22	140932	偏关县	3	140900	\N	1
23	140981	原平市	3	140900	\N	1
24	141000	临汾市	2	140000	\N	1
25	141001	市辖区	3	141000	\N	1
26	141002	尧都区	3	141000	\N	1
27	141021	曲沃县	3	141000	\N	1
28	141022	翼城县	3	141000	\N	1
29	141023	襄汾县	3	141000	\N	1
30	141024	洪洞县	3	141000	\N	1
31	141025	古县	3	141000	\N	1
32	141026	安泽县	3	141000	\N	1
33	141027	浮山县	3	141000	\N	1
34	141028	吉县	3	141000	\N	1
35	141029	乡宁县	3	141000	\N	1
36	141030	大宁县	3	141000	\N	1
37	141031	隰县	3	141000	\N	1
38	141032	永和县	3	141000	\N	1
39	141033	蒲县	3	141000	\N	1
40	141034	汾西县	3	141000	\N	1
41	141081	侯马市	3	141000	\N	1
42	141082	霍州市	3	141000	\N	1
43	141100	吕梁市	2	140000	\N	1
44	141101	市辖区	3	141100	\N	1
45	141102	离石区	3	141100	\N	1
46	141121	文水县	3	141100	\N	1
47	141122	交城县	3	141100	\N	1
48	141123	兴县	3	141100	\N	1
49	141124	临县	3	141100	\N	1
50	141125	柳林县	3	141100	\N	1
1415	140106	迎泽区	3	140100	\N	1
1416	140107	杏花岭区	3	140100	\N	1
1417	140108	尖草坪区	3	140100	\N	1
1418	140109	万柏林区	3	140100	\N	1
1419	140110	晋源区	3	140100	\N	1
1420	140121	清徐县	3	140100	\N	1
1421	140122	阳曲县	3	140100	\N	1
1422	140123	娄烦县	3	140100	\N	1
1423	140181	古交市	3	140100	\N	1
1424	140200	大同市	2	140000	\N	1
1425	140201	市辖区	3	140200	\N	1
1426	140202	城区	3	140200	\N	1
1427	140203	矿区	3	140200	\N	1
1428	140211	南郊区	3	140200	\N	1
1429	140212	新荣区	3	140200	\N	1
1430	140221	阳高县	3	140200	\N	1
1431	140222	天镇县	3	140200	\N	1
1432	140223	广灵县	3	140200	\N	1
1433	140224	灵丘县	3	140200	\N	1
1434	140225	浑源县	3	140200	\N	1
1435	140226	左云县	3	140200	\N	1
1436	140227	大同县	3	140200	\N	1
1437	140300	阳泉市	2	140000	\N	1
1438	140301	市辖区	3	140300	\N	1
1439	140302	城区	3	140300	\N	1
1440	140303	矿区	3	140300	\N	1
1441	140311	郊区	3	140300	\N	1
1442	140321	平定县	3	140300	\N	1
1443	140322	盂县	3	140300	\N	1
1444	140400	长治市	2	140000	\N	1
1445	140401	市辖区	3	140400	\N	1
1446	140402	城区	3	140400	\N	1
1447	140411	郊区	3	140400	\N	1
1448	140421	长治县	3	140400	\N	1
1449	140423	襄垣县	3	140400	\N	1
1450	140424	屯留县	3	140400	\N	1
1451	140425	平顺县	3	140400	\N	1
1452	140426	黎城县	3	140400	\N	1
1453	140427	壶关县	3	140400	\N	1
1454	140429	武乡县	3	140400	\N	1
1455	140430	沁县	3	140400	\N	1
1456	140431	沁源县	3	140400	\N	1
1457	140481	潞城市	3	140400	\N	1
1458	140500	晋城市	2	140000	\N	1
1459	140501	市辖区	3	140500	\N	1
1460	140502	城区	3	140500	\N	1
1461	140521	沁水县	3	140500	\N	1
1462	140522	阳城县	3	140500	\N	1
1463	140524	陵川县	3	140500	\N	1
1464	140525	泽州县	3	140500	\N	1
1465	140581	高平市	3	140500	\N	1
1466	140600	朔州市	2	140000	\N	1
1467	140601	市辖区	3	140600	\N	1
1468	140602	朔城区	3	140600	\N	1
1469	140603	平鲁区	3	140600	\N	1
1470	140621	山阴县	3	140600	\N	1
1471	140622	应县	3	140600	\N	1
1472	140623	右玉县	3	140600	\N	1
1473	140624	怀仁县	3	140600	\N	1
1474	140700	晋中市	2	140000	\N	1
1475	140701	市辖区	3	140700	\N	1
1476	140702	榆次区	3	140700	\N	1
1477	130527	南和县	3	130500	\N	1
1478	340101	市辖区	3	340100	\N	1
1479	340102	瑶海区	3	340100	\N	1
1480	340103	庐阳区	3	340100	\N	1
1481	340104	蜀山区	3	340100	\N	1
1482	340111	包河区	3	340100	\N	1
1483	340121	长丰县	3	340100	\N	1
1484	340122	肥东县	3	340100	\N	1
1485	340123	肥西县	3	340100	\N	1
1486	340200	芜湖市	2	340000	\N	1
1487	340201	市辖区	3	340200	\N	1
1488	340302	龙子湖区	3	340300	\N	1
1489	340303	蚌山区	3	340300	\N	1
1490	340304	禹会区	3	340300	\N	1
1491	340311	淮上区	3	340300	\N	1
1492	340321	怀远县	3	340300	\N	1
1493	340322	五河县	3	340300	\N	1
1494	340323	固镇县	3	340300	\N	1
1495	340400	淮南市	2	340000	\N	1
1496	340401	市辖区	3	340400	\N	1
1497	340402	大通区	3	340400	\N	1
1498	340403	田家庵区	3	340400	\N	1
1499	340404	谢家集区	3	340400	\N	1
1500	340405	八公山区	3	340400	\N	1
1501	340406	潘集区	3	340400	\N	1
1502	340421	凤台县	3	340400	\N	1
1503	340500	马鞍山市	2	340000	\N	1
1504	340501	市辖区	3	340500	\N	1
1505	340502	金家庄区	3	\N	\N	1
1506	340503	花山区	3	340500	\N	1
1507	340504	雨山区	3	340500	\N	1
1508	340521	当涂县	3	340500	\N	1
1509	340600	淮北市	2	340000	\N	1
1510	340601	市辖区	3	340600	\N	1
1511	340602	杜集区	3	340600	\N	1
1512	340603	相山区	3	340600	\N	1
1513	340604	烈山区	3	340600	\N	1
1514	340621	濉溪县	3	340600	\N	1
1515	340700	铜陵市	2	340000	\N	1
1516	340701	市辖区	3	340700	\N	1
1517	340702	铜官山区	3	340700	\N	1
1518	340703	狮子山区	3	340700	\N	1
1519	340711	郊区	3	340700	\N	1
1520	340721	铜陵县	3	340700	\N	1
1521	340800	安庆市	2	340000	\N	1
1522	340801	市辖区	3	340800	\N	1
1523	220800	白城市	2	220000	\N	1
1524	220801	市辖区	3	220800	\N	1
1525	220802	洮北区	3	220800	\N	1
1526	220821	镇赉县	3	220800	\N	1
1527	220822	通榆县	3	220800	\N	1
1528	220881	洮南市	3	220800	\N	1
1529	220882	大安市	3	220800	\N	1
1530	222400	延边朝鲜族自治州	2	220000	\N	1
1531	222401	延吉市	3	222400	\N	1
1532	222402	图们市	3	222400	\N	1
1533	222403	敦化市	3	222400	\N	1
1534	222404	珲春市	3	222400	\N	1
1535	222405	龙井市	3	222400	\N	1
1536	222406	和龙市	3	222400	\N	1
1537	222424	汪清县	3	222400	\N	1
1538	222426	安图县	3	222400	\N	1
1539	230000	黑龙江省	1	0	\N	1
1540	230100	哈尔滨市	2	230000	\N	1
1541	230101	市辖区	3	230100	\N	1
1542	230102	道里区	3	230100	\N	1
1543	230103	南岗区	3	230100	\N	1
1544	230104	道外区	3	230100	\N	1
1545	230108	平房区	3	230100	\N	1
1546	230109	松北区	3	230100	\N	1
1547	230110	香坊区	3	230100	\N	1
1548	230111	呼兰区	3	230100	\N	1
1549	230112	阿城区	3	230100	\N	1
1550	230123	依兰县	3	230100	\N	1
1551	230124	方正县	3	230100	\N	1
1552	230125	宾县	3	230100	\N	1
1553	230126	巴彦县	3	230100	\N	1
1554	230127	木兰县	3	230100	\N	1
1555	230128	通河县	3	230100	\N	1
1556	230129	延寿县	3	230100	\N	1
1557	230182	双城市	3	230100	\N	1
1558	230183	尚志市	3	230100	\N	1
1559	230184	五常市	3	230100	\N	1
1560	230200	齐齐哈尔市	2	230000	\N	1
1561	230201	市辖区	3	230200	\N	1
1562	230202	龙沙区	3	230200	\N	1
1563	230203	建华区	3	230200	\N	1
1564	230204	铁锋区	3	230200	\N	1
1565	230205	昂昂溪区	3	230200	\N	1
1566	230206	富拉尔基区	3	230200	\N	1
1567	230300	鸡西市	2	230000	\N	1
1568	230305	梨树区	3	230300	\N	1
1569	230306	城子河区	3	230300	\N	1
1570	230307	麻山区	3	230300	\N	1
1571	230321	鸡东县	3	230300	\N	1
1572	230381	虎林市	3	230300	\N	1
1573	230382	密山市	3	230300	\N	1
1574	230400	鹤岗市	2	230000	\N	1
1575	230401	市辖区	3	230400	\N	1
1576	230402	向阳区	3	230400	\N	1
1577	230403	工农区	3	230400	\N	1
1578	230404	南山区	3	230400	\N	1
1579	230405	兴安区	3	230400	\N	1
1580	230406	东山区	3	230400	\N	1
1581	230407	兴山区	3	230400	\N	1
1582	230421	萝北县	3	230400	\N	1
1583	230422	绥滨县	3	230400	\N	1
1584	230500	双鸭山市	2	230000	\N	1
1585	230501	市辖区	3	230500	\N	1
1586	230502	尖山区	3	230500	\N	1
1587	230503	岭东区	3	230500	\N	1
1588	230505	四方台区	3	230500	\N	1
1589	230506	宝山区	3	230500	\N	1
1590	230521	集贤县	3	230500	\N	1
1591	230522	友谊县	3	230500	\N	1
1592	230523	宝清县	3	230500	\N	1
1593	230524	饶河县	3	230500	\N	1
1594	230600	大庆市	2	230000	\N	1
1595	230601	市辖区	3	230600	\N	1
1596	230602	萨尔图区	3	230600	\N	1
1597	230603	龙凤区	3	230600	\N	1
1598	230604	让胡路区	3	230600	\N	1
1599	230605	红岗区	3	230600	\N	1
1600	230606	大同区	3	230600	\N	1
1601	230621	肇州县	3	230600	\N	1
1602	230622	肇源县	3	230600	\N	1
1603	230623	林甸县	3	230600	\N	1
1604	230624	杜尔伯特蒙古族自治县	3	230600	\N	1
1605	230700	伊春市	2	230000	\N	1
1606	230701	市辖区	3	230700	\N	1
1607	230702	伊春区	3	230700	\N	1
1608	230703	南岔区	3	230700	\N	1
1609	230704	友好区	3	230700	\N	1
1610	230705	西林区	3	230700	\N	1
2929	330303	龙湾区	3	330300	\N	1
2930	330304	瓯海区	3	330300	\N	1
2931	330322	洞头县	3	330300	\N	1
2932	330324	永嘉县	3	330300	\N	1
2933	330326	平阳县	3	330300	\N	1
2934	330327	苍南县	3	330300	\N	1
2935	330328	文成县	3	330300	\N	1
2936	330381	瑞安市	3	330300	\N	1
2937	330382	乐清市	3	330300	\N	1
2938	330400	嘉兴市	2	330000	\N	1
2939	330401	市辖区	3	330400	\N	1
2940	330402	秀城区	3	330400	\N	1
2941	330411	秀洲区	3	330400	\N	1
2942	330421	嘉善县	3	330400	\N	1
2943	330424	海盐县	3	330400	\N	1
2944	330481	海宁市	3	330400	\N	1
2945	330482	平湖市	3	330400	\N	1
2946	330483	桐乡市	3	330400	\N	1
2947	330500	湖州市	2	330000	\N	1
2948	330501	市辖区	3	330500	\N	1
2949	330502	吴兴区	3	330500	\N	1
2950	330503	南浔区	3	330500	\N	1
2951	330521	德清县	3	330500	\N	1
2952	330522	长兴县	3	330500	\N	1
2659	421300	随州市	2	420000	\N	1
2660	421301	市辖区	3	421300	\N	1
2661	421302	曾都区	3	\N	\N	1
2662	421381	广水市	3	421300	\N	1
2663	422800	恩施土家族苗族自治州	2	420000	\N	1
2664	422801	恩施市	3	422800	\N	1
2665	422802	利川市	3	422800	\N	1
2666	422822	建始县	3	422800	\N	1
2667	422823	巴东县	3	422800	\N	1
2668	422825	宣恩县	3	422800	\N	1
2669	422826	咸丰县	3	422800	\N	1
2670	422827	来凤县	3	422800	\N	1
2671	422828	鹤峰县	3	422800	\N	1
2672	429000	省直辖行政单位	2	420000	\N	1
2673	429004	仙桃市	3	429000	\N	1
2674	429005	潜江市	3	429000	\N	1
2675	429006	天门市	3	429000	\N	1
2676	429021	神农架林区	3	429000	\N	1
2677	430000	湖南省	1	0	\N	1
2678	430100	长沙市	2	430000	\N	1
2679	430400	衡阳市	2	430000	\N	1
2680	430401	市辖区	3	430400	\N	1
2681	430405	珠晖区	3	430400	\N	1
2682	430406	雁峰区	3	430400	\N	1
2683	430407	石鼓区	3	430400	\N	1
2684	430408	蒸湘区	3	430400	\N	1
2685	430412	南岳区	3	430400	\N	1
2686	430421	衡阳县	3	430400	\N	1
2687	430422	衡南县	3	430400	\N	1
2688	430423	衡山县	3	430400	\N	1
2689	430424	衡东县	3	430400	\N	1
2690	430426	祁东县	3	430400	\N	1
2691	430481	耒阳市	3	430400	\N	1
2692	430482	常宁市	3	430400	\N	1
2693	430500	邵阳市	2	430000	\N	1
2694	430501	市辖区	3	430500	\N	1
2695	430502	双清区	3	430500	\N	1
2696	430503	大祥区	3	430500	\N	1
2697	430511	北塔区	3	430500	\N	1
2698	430521	邵东县	3	430500	\N	1
2699	430522	新邵县	3	430500	\N	1
2700	430523	邵阳县	3	430500	\N	1
2701	430524	隆回县	3	430500	\N	1
2702	430525	洞口县	3	430500	\N	1
2703	430527	绥宁县	3	430500	\N	1
2704	430528	新宁县	3	430500	\N	1
2705	430529	城步苗族自治县	3	430500	\N	1
2706	430581	武冈市	3	430500	\N	1
2707	430600	岳阳市	2	430000	\N	1
2708	430601	市辖区	3	430600	\N	1
2709	430602	岳阳楼区	3	430600	\N	1
2710	430603	云溪区	3	430600	\N	1
2711	430611	君山区	3	430600	\N	1
2712	430621	岳阳县	3	430600	\N	1
2713	430623	华容县	3	430600	\N	1
2714	430624	湘阴县	3	430600	\N	1
2715	430626	平江县	3	430600	\N	1
2716	430681	汨罗市	3	430600	\N	1
2717	430682	临湘市	3	430600	\N	1
2718	430700	常德市	2	430000	\N	1
2719	430701	市辖区	3	430700	\N	1
2720	430702	武陵区	3	430700	\N	1
2721	430703	鼎城区	3	430700	\N	1
2722	430721	安乡县	3	430700	\N	1
2723	430722	汉寿县	3	430700	\N	1
2724	430723	澧县	3	430700	\N	1
2725	430724	临澧县	3	430700	\N	1
2726	430725	桃源县	3	430700	\N	1
2727	430726	石门县	3	430700	\N	1
2728	430781	津市市	3	430700	\N	1
2729	430800	张家界市	2	430000	\N	1
2730	430801	市辖区	3	430800	\N	1
2731	430802	永定区	3	430800	\N	1
2732	430811	武陵源区	3	430800	\N	1
2733	430821	慈利县	3	430800	\N	1
2734	430822	桑植县	3	430800	\N	1
2735	430900	益阳市	2	430000	\N	1
2736	431021	桂阳县	3	431000	\N	1
2737	431022	宜章县	3	431000	\N	1
2738	431023	永兴县	3	431000	\N	1
2739	431024	嘉禾县	3	431000	\N	1
2740	431025	临武县	3	431000	\N	1
2741	431230	通道侗族自治县	3	431200	\N	1
2742	431281	洪江市	3	431200	\N	1
2743	431300	娄底市	2	430000	\N	1
2744	431301	市辖区	3	431300	\N	1
2745	431302	娄星区	3	431300	\N	1
2746	431321	双峰县	3	431300	\N	1
2747	431322	新化县	3	431300	\N	1
2748	431381	冷水江市	3	431300	\N	1
2749	431382	涟源市	3	431300	\N	1
2750	433100	湘西土家族苗族自治州	2	430000	\N	1
2751	433101	吉首市	3	433100	\N	1
2752	433122	泸溪县	3	433100	\N	1
2753	433123	凤凰县	3	433100	\N	1
2754	433124	花垣县	3	433100	\N	1
2755	433130	龙山县	3	433100	\N	1
2756	440115	南沙区	3	440100	\N	1
2757	440116	萝岗区	3	440100	\N	1
2758	440183	增城市	3	\N	\N	1
2759	440184	从化市	3	\N	\N	1
2760	440200	韶关市	2	440000	\N	1
2761	440205	曲江区	3	440200	\N	1
2762	440222	始兴县	3	440200	\N	1
2763	440224	仁化县	3	440200	\N	1
2764	440304	福田区	3	440300	\N	1
2765	440305	南山区	3	440300	\N	1
2766	440306	宝安区	3	440300	\N	1
2767	440307	龙岗区	3	440300	\N	1
2768	440308	盐田区	3	440300	\N	1
2769	440400	珠海市	2	440000	\N	1
2770	440401	市辖区	3	440400	\N	1
2771	440402	香洲区	3	440400	\N	1
2772	440403	斗门区	3	440400	\N	1
2773	440404	金湾区	3	440400	\N	1
2774	440500	汕头市	2	440000	\N	1
2775	440501	市辖区	3	440500	\N	1
2776	440507	龙湖区	3	440500	\N	1
2777	440511	金平区	3	440500	\N	1
2778	440512	濠江区	3	440500	\N	1
2779	440513	潮阳区	3	440500	\N	1
2780	440514	潮南区	3	440500	\N	1
2781	440515	澄海区	3	440500	\N	1
2782	440523	南澳县	3	440500	\N	1
2783	440600	佛山市	2	440000	\N	1
2784	440601	市辖区	3	440600	\N	1
2785	530630	水富县	3	530600	\N	1
2786	530700	丽江市	2	530000	\N	1
2787	530701	市辖区	3	530700	\N	1
2788	530702	古城区	3	530700	\N	1
2789	530829	西盟佤族自治县	3	530800	\N	1
2790	530900	临沧市	2	530000	\N	1
2791	530901	市辖区	3	530900	\N	1
2792	530902	临翔区	3	530900	\N	1
2793	530921	凤庆县	3	530900	\N	1
2794	530922	云县	3	530900	\N	1
2795	530923	永德县	3	530900	\N	1
2796	530924	镇康县	3	530900	\N	1
2797	530926	耿马傣族佤族自治县	3	530900	\N	1
2798	530927	沧源佤族自治县	3	530900	\N	1
2799	532300	楚雄彝族自治州	2	530000	\N	1
2800	532301	楚雄市	3	532300	\N	1
2801	532322	双柏县	3	532300	\N	1
2802	532323	牟定县	3	532300	\N	1
2803	532324	南华县	3	532300	\N	1
2804	532325	姚安县	3	532300	\N	1
2805	532326	大姚县	3	532300	\N	1
1921	530822	墨江哈尼族自治县	3	530800	\N	1
1922	530823	景东彝族自治县	3	530800	\N	1
1923	530824	景谷傣族彝族自治县	3	530800	\N	1
1924	530826	江城哈尼族彝族自治县	3	530800	\N	1
1925	530828	澜沧拉祜族自治县	3	530800	\N	1
1926	532500	红河哈尼族彝族自治州	2	530000	\N	1
1927	610528	富平县	3	610500	\N	1
1928	610581	韩城市	3	610500	\N	1
1929	610582	华阴市	3	610500	\N	1
1930	610600	延安市	2	610000	\N	1
1931	610601	市辖区	3	610600	\N	1
1932	610602	宝塔区	3	610600	\N	1
1933	610621	延长县	3	610600	\N	1
1934	610622	延川县	3	610600	\N	1
1935	610623	子长县	3	610600	\N	1
1936	610624	安塞县	3	610600	\N	1
1937	610625	志丹县	3	610600	\N	1
1938	610626	吴起县	3	610600	\N	1
1939	610627	甘泉县	3	610600	\N	1
1940	610628	富县	3	610600	\N	1
1611	230706	翠峦区	3	230700	\N	1
1612	230707	新青区	3	230700	\N	1
1613	230708	美溪区	3	230700	\N	1
1614	230709	金山屯区	3	230700	\N	1
1615	230710	五营区	3	230700	\N	1
1616	230711	乌马河区	3	230700	\N	1
1617	230712	汤旺河区	3	230700	\N	1
1618	230713	带岭区	3	230700	\N	1
1619	230714	乌伊岭区	3	230700	\N	1
1620	230715	红星区	3	230700	\N	1
1621	230716	上甘岭区	3	230700	\N	1
1622	230722	嘉荫县	3	230700	\N	1
1774	231202	北林区	3	231200	\N	1
1775	231221	望奎县	3	231200	\N	1
1776	231222	兰西县	3	231200	\N	1
1777	231223	青冈县	3	231200	\N	1
1778	231224	庆安县	3	231200	\N	1
1779	231225	明水县	3	231200	\N	1
1780	231226	绥棱县	3	231200	\N	1
1781	231281	安达市	3	231200	\N	1
1782	231282	肇东市	3	231200	\N	1
1783	231283	海伦市	3	231200	\N	1
1784	232700	大兴安岭地区	2	230000	\N	1
1785	232701	加格达奇区	3	232700	\N	1
1786	232702	松岭区	3	232700	\N	1
1787	232703	新林区	3	232700	\N	1
1788	232704	呼中区	3	232700	\N	1
1789	232721	呼玛县	3	232700	\N	1
1790	232722	塔河县	3	232700	\N	1
1791	232723	漠河县	3	232700	\N	1
1792	310000	上海市	1	0	\N	1
1793	310100	市辖区	2	310000	\N	1
1794	310101	黄浦区	3	310100	\N	1
1795	310103	卢湾区	3	\N	\N	1
1796	310104	徐汇区	3	310100	\N	1
1797	310105	长宁区	3	310100	\N	1
1798	310106	静安区	3	310100	\N	1
1799	310107	普陀区	3	310100	\N	1
1800	310108	闸北区	3	310100	\N	1
1801	310109	虹口区	3	310100	\N	1
1802	310110	杨浦区	3	310100	\N	1
1803	310112	闵行区	3	310100	\N	1
1804	310113	宝山区	3	310100	\N	1
1805	310114	嘉定区	3	310100	\N	1
1806	310115	浦东新区	3	310100	\N	1
1807	310116	金山区	3	310100	\N	1
1808	310117	松江区	3	310100	\N	1
1809	310118	青浦区	3	310100	\N	1
1810	310119	南汇区	3	\N	\N	1
1811	310120	奉贤区	3	310100	\N	1
1812	310200	县	2	310000	\N	1
1813	310230	崇明县	3	310100	\N	1
1814	320000	江苏省	1	0	\N	1
1815	320100	南京市	2	320000	\N	1
1816	320101	市辖区	3	320100	\N	1
1817	320102	玄武区	3	320100	\N	1
1818	320103	白下区	3	320100	\N	1
1819	320104	秦淮区	3	320100	\N	1
1820	320105	建邺区	3	320100	\N	1
1821	320107	下关区	3	320100	\N	1
1822	320111	浦口区	3	320100	\N	1
1823	320113	栖霞区	3	320100	\N	1
1824	320114	雨花台区	3	320100	\N	1
1825	320115	江宁区	3	320100	\N	1
1826	320116	六合区	3	320100	\N	1
1827	320124	溧水县	3	320100	\N	1
1828	320125	高淳县	3	320100	\N	1
1829	320200	无锡市	2	320000	\N	1
1830	320201	市辖区	3	320200	\N	1
1831	320202	崇安区	3	320200	\N	1
1832	320203	南长区	3	320200	\N	1
1833	320204	北塘区	3	320200	\N	1
1834	320205	锡山区	3	320200	\N	1
1835	320206	惠山区	3	320200	\N	1
1836	320211	滨湖区	3	320200	\N	1
1837	320281	江阴市	3	320200	\N	1
1838	320282	宜兴市	3	320200	\N	1
1839	320300	徐州市	2	320000	\N	1
1840	320301	市辖区	3	320300	\N	1
1841	320302	鼓楼区	3	320300	\N	1
1842	320303	云龙区	3	320300	\N	1
1843	320304	九里区	3	320300	\N	1
1844	320305	贾汪区	3	320300	\N	1
1845	320311	泉山区	3	320300	\N	1
1846	320321	丰县	3	320300	\N	1
1847	320322	沛县	3	320300	\N	1
1848	320323	铜山县	3	320300	\N	1
1849	320324	睢宁县	3	320300	\N	1
1850	320381	新沂市	3	320300	\N	1
1851	320382	邳州市	3	320300	\N	1
1852	320400	常州市	2	320000	\N	1
1853	320401	市辖区	3	320400	\N	1
1854	320402	天宁区	3	320400	\N	1
1855	320404	钟楼区	3	320400	\N	1
1856	320405	戚墅堰区	3	320400	\N	1
1857	320411	新北区	3	320400	\N	1
1858	320412	武进区	3	320400	\N	1
1859	320481	溧阳市	3	320400	\N	1
1860	320482	金坛市	3	320400	\N	1
1861	320500	苏州市	2	320000	\N	1
1862	320501	市辖区	3	320500	\N	1
1863	522424	金沙县	3	\N	\N	1
1864	522425	织金县	3	\N	\N	1
1865	522426	纳雍县	3	\N	\N	1
1866	522702	福泉市	3	522700	\N	1
1867	522722	荔波县	3	522700	\N	1
1868	522723	贵定县	3	522700	\N	1
1869	522725	瓮安县	3	522700	\N	1
1870	522726	独山县	3	522700	\N	1
1871	522727	平塘县	3	522700	\N	1
1872	522728	罗甸县	3	522700	\N	1
1873	522729	长顺县	3	522700	\N	1
1874	522730	龙里县	3	522700	\N	1
1875	522731	惠水县	3	522700	\N	1
1876	522732	三都水族自治县	3	522700	\N	1
1877	530000	云南省	1	0	\N	1
1878	530100	昆明市	2	530000	\N	1
1879	530101	市辖区	3	530100	\N	1
1880	530102	五华区	3	530100	\N	1
1881	530103	盘龙区	3	530100	\N	1
1882	530111	官渡区	3	530100	\N	1
1883	530112	西山区	3	530100	\N	1
1884	530113	东川区	3	530100	\N	1
1885	530121	呈贡县	3	\N	\N	1
1886	530122	晋宁县	3	530100	\N	1
1887	530124	富民县	3	530100	\N	1
1888	530125	宜良县	3	530100	\N	1
1889	530126	石林彝族自治县	3	530100	\N	1
1890	530127	嵩明县	3	530100	\N	1
1891	530128	禄劝彝族苗族自治县	3	530100	\N	1
1892	530129	寻甸回族彝族自治县	3	530100	\N	1
1893	530181	安宁市	3	530100	\N	1
1894	530300	曲靖市	2	530000	\N	1
1895	530301	市辖区	3	530300	\N	1
1896	530302	麒麟区	3	530300	\N	1
1897	530321	马龙县	3	530300	\N	1
1898	530322	陆良县	3	530300	\N	1
1899	530323	师宗县	3	530300	\N	1
1900	530324	罗平县	3	530300	\N	1
1901	530325	富源县	3	530300	\N	1
1902	530326	会泽县	3	530300	\N	1
1903	530328	沾益县	3	530300	\N	1
1904	530381	宣威市	3	530300	\N	1
1905	530400	玉溪市	2	530000	\N	1
1906	530401	市辖区	3	530400	\N	1
1907	530402	红塔区	3	530400	\N	1
1908	530421	江川县	3	530400	\N	1
1909	530422	澄江县	3	530400	\N	1
1910	530423	通海县	3	530400	\N	1
1911	530424	华宁县	3	530400	\N	1
1912	530425	易门县	3	530400	\N	1
1913	530721	玉龙纳西族自治县	3	530700	\N	1
1914	530722	永胜县	3	530700	\N	1
1915	530723	华坪县	3	530700	\N	1
1916	530724	宁蒗彝族自治县	3	530700	\N	1
1917	530800	普洱市	2	530000	\N	1
1918	530801	市辖区	3	530800	\N	1
1919	530802	思茅区	3	530800	\N	1
1920	530821	宁洱哈尼族彝族自治县	3	530800	\N	1
1623	230781	铁力市	3	230700	\N	1
1624	230800	佳木斯市	2	230000	\N	1
1625	230801	市辖区	3	230800	\N	1
1626	230803	向阳区	3	230800	\N	1
1627	230804	前进区	3	230800	\N	1
1628	230805	东风区	3	230800	\N	1
1629	230811	郊区	3	230800	\N	1
1630	230822	桦南县	3	230800	\N	1
1631	230826	桦川县	3	230800	\N	1
1632	230828	汤原县	3	230800	\N	1
1633	230833	抚远县	3	230800	\N	1
1634	230881	同江市	3	230800	\N	1
1635	230882	富锦市	3	230800	\N	1
1636	230900	七台河市	2	230000	\N	1
1637	230901	市辖区	3	230900	\N	1
1638	230902	新兴区	3	230900	\N	1
1639	230903	桃山区	3	230900	\N	1
1640	230904	茄子河区	3	230900	\N	1
1641	230921	勃利县	3	230900	\N	1
1642	231000	牡丹江市	2	230000	\N	1
1643	231001	市辖区	3	231000	\N	1
1644	231002	东安区	3	231000	\N	1
1645	540102	城关区	3	540100	\N	1
1646	540121	林周县	3	540100	\N	1
1647	540122	当雄县	3	540100	\N	1
1648	540123	尼木县	3	540100	\N	1
1649	540124	曲水县	3	540100	\N	1
1650	540125	堆龙德庆县	3	540100	\N	1
1651	540126	达孜县	3	540100	\N	1
1652	540127	墨竹工卡县	3	540100	\N	1
1653	542100	昌都地区	2	540000	\N	1
1654	542121	昌都县	3	542100	\N	1
1655	542122	江达县	3	542100	\N	1
1656	542123	贡觉县	3	542100	\N	1
1657	542124	类乌齐县	3	542100	\N	1
1658	542125	丁青县	3	542100	\N	1
1659	542126	察雅县	3	542100	\N	1
1660	542127	八宿县	3	542100	\N	1
1661	542128	左贡县	3	542100	\N	1
1662	542129	芒康县	3	542100	\N	1
1663	542132	洛隆县	3	542100	\N	1
1664	542133	边坝县	3	542100	\N	1
1665	542200	山南地区	2	540000	\N	1
1666	542221	乃东县	3	542200	\N	1
1667	542222	扎囊县	3	542200	\N	1
1668	542223	贡嘎县	3	542200	\N	1
1669	542224	桑日县	3	542200	\N	1
1670	542225	琼结县	3	542200	\N	1
1671	542227	措美县	3	542200	\N	1
1672	542228	洛扎县	3	542200	\N	1
1673	542325	萨迦县	3	\N	\N	1
1674	542326	拉孜县	3	\N	\N	1
1675	542327	昂仁县	3	\N	\N	1
1676	542328	谢通门县	3	\N	\N	1
1677	542329	白朗县	3	\N	\N	1
1678	542330	仁布县	3	\N	\N	1
1679	542331	康马县	3	\N	\N	1
1680	542332	定结县	3	\N	\N	1
1681	542333	仲巴县	3	\N	\N	1
1682	542334	亚东县	3	\N	\N	1
1683	542335	吉隆县	3	\N	\N	1
1684	542336	聂拉木县	3	\N	\N	1
1685	542337	萨嘎县	3	\N	\N	1
1686	542338	岗巴县	3	\N	\N	1
1687	542400	那曲地区	2	540000	\N	1
1688	542426	申扎县	3	542400	\N	1
1689	542427	索县	3	542400	\N	1
1690	542428	班戈县	3	542400	\N	1
1691	542429	巴青县	3	542400	\N	1
1692	542525	革吉县	3	542500	\N	1
1693	542526	改则县	3	542500	\N	1
1694	542527	措勤县	3	542500	\N	1
1695	542600	林芝地区	2	540000	\N	1
1696	542621	林芝县	3	542600	\N	1
1697	542622	工布江达县	3	542600	\N	1
1698	542623	米林县	3	542600	\N	1
1699	542624	墨脱县	3	542600	\N	1
1700	542625	波密县	3	542600	\N	1
1701	542626	察隅县	3	542600	\N	1
1702	542627	朗县	3	542600	\N	1
1703	610000	陕西省	1	0	\N	1
1704	610100	西安市	2	610000	\N	1
1705	610101	市辖区	3	610100	\N	1
1706	610102	新城区	3	610100	\N	1
1707	610103	碑林区	3	610100	\N	1
1708	610104	莲湖区	3	610100	\N	1
1709	610111	灞桥区	3	610100	\N	1
1710	610112	未央区	3	610100	\N	1
1711	610113	雁塔区	3	610100	\N	1
1712	610114	阎良区	3	610100	\N	1
1713	610115	临潼区	3	610100	\N	1
1714	610116	长安区	3	610100	\N	1
1715	610122	蓝田县	3	610100	\N	1
1716	610124	周至县	3	610100	\N	1
1717	610125	户县	3	610100	\N	1
1718	610126	高陵县	3	610100	\N	1
1719	610200	铜川市	2	610000	\N	1
1720	610201	市辖区	3	610200	\N	1
1721	610202	王益区	3	610200	\N	1
1722	610203	印台区	3	610200	\N	1
1723	610204	耀州区	3	610200	\N	1
1724	610222	宜君县	3	610200	\N	1
1725	610300	宝鸡市	2	610000	\N	1
1726	610301	市辖区	3	610300	\N	1
1727	610302	渭滨区	3	610300	\N	1
1728	610303	金台区	3	610300	\N	1
1729	610304	陈仓区	3	610300	\N	1
1730	610322	凤翔县	3	610300	\N	1
1731	610323	岐山县	3	610300	\N	1
1732	610324	扶风县	3	610300	\N	1
1733	610326	眉县	3	610300	\N	1
1734	610327	陇县	3	610300	\N	1
1735	610330	凤县	3	610300	\N	1
1736	610331	太白县	3	610300	\N	1
1737	610400	咸阳市	2	610000	\N	1
1738	610401	市辖区	3	610400	\N	1
1739	610402	秦都区	3	610400	\N	1
1740	610403	杨凌区	3	610400	\N	1
1741	610404	渭城区	3	610400	\N	1
1742	610422	三原县	3	610400	\N	1
1743	610423	泾阳县	3	610400	\N	1
1744	610424	乾县	3	610400	\N	1
1745	610425	礼泉县	3	610400	\N	1
1746	610426	永寿县	3	610400	\N	1
1747	610427	彬县	3	610400	\N	1
1748	610802	榆阳区	3	610800	\N	1
1749	610821	神木县	3	610800	\N	1
1750	610822	府谷县	3	610800	\N	1
1751	610823	横山县	3	610800	\N	1
1752	610824	靖边县	3	610800	\N	1
1753	610921	汉阴县	3	610900	\N	1
1754	610922	石泉县	3	610900	\N	1
1755	231003	阳明区	3	231000	\N	1
1756	231004	爱民区	3	231000	\N	1
1757	231005	西安区	3	231000	\N	1
1758	231024	东宁县	3	231000	\N	1
1759	231025	林口县	3	231000	\N	1
1760	231081	绥芬河市	3	231000	\N	1
1761	231083	海林市	3	231000	\N	1
1762	231084	宁安市	3	231000	\N	1
1763	231085	穆棱市	3	231000	\N	1
1764	231100	黑河市	2	230000	\N	1
1765	231101	市辖区	3	231100	\N	1
1766	231102	爱辉区	3	231100	\N	1
1767	231121	嫩江县	3	231100	\N	1
1768	231123	逊克县	3	231100	\N	1
1769	231124	孙吴县	3	231100	\N	1
1770	231181	北安市	3	231100	\N	1
1771	231182	五大连池市	3	231100	\N	1
1772	231200	绥化市	2	230000	\N	1
1773	231201	市辖区	3	231200	\N	1
1178	211122	盘山县	3	211100	\N	1
1179	211200	铁岭市	2	210000	\N	1
1180	211201	市辖区	3	211200	\N	1
1181	211202	银州区	3	211200	\N	1
1182	211204	清河区	3	211200	\N	1
1183	211221	铁岭县	3	211200	\N	1
1184	211223	西丰县	3	211200	\N	1
1185	211224	昌图县	3	211200	\N	1
1186	211281	调兵山市	3	211200	\N	1
1187	211282	开原市	3	211200	\N	1
1188	211300	朝阳市	2	210000	\N	1
1189	211301	市辖区	3	211300	\N	1
1190	211302	双塔区	3	211300	\N	1
1191	211303	龙城区	3	211300	\N	1
1192	211321	朝阳县	3	211300	\N	1
1193	211322	建平县	3	211300	\N	1
1194	211381	北票市	3	211300	\N	1
1195	211382	凌源市	3	211300	\N	1
1196	211400	葫芦岛市	2	210000	\N	1
1197	211401	市辖区	3	211400	\N	1
1198	211402	连山区	3	211400	\N	1
1199	211403	龙港区	3	211400	\N	1
1200	211404	南票区	3	211400	\N	1
1201	211421	绥中县	3	211400	\N	1
1202	211422	建昌县	3	211400	\N	1
1203	211481	兴城市	3	211400	\N	1
1204	220000	吉林省	1	0	\N	1
1205	220100	长春市	2	220000	\N	1
1206	220101	市辖区	3	220100	\N	1
1207	220102	南关区	3	220100	\N	1
1208	220103	宽城区	3	220100	\N	1
1209	220104	朝阳区	3	220100	\N	1
1210	220105	二道区	3	220100	\N	1
1211	220106	绿园区	3	220100	\N	1
1212	220112	双阳区	3	220100	\N	1
1213	220122	农安县	3	220100	\N	1
1214	220181	九台市	3	\N	\N	1
1215	220182	榆树市	3	220100	\N	1
1216	220183	德惠市	3	220100	\N	1
1217	220200	吉林市	2	220000	\N	1
1218	220201	市辖区	3	220200	\N	1
1219	220202	昌邑区	3	220200	\N	1
1220	220203	龙潭区	3	220200	\N	1
1221	220204	船营区	3	220200	\N	1
1222	220211	丰满区	3	220200	\N	1
1223	220221	永吉县	3	220200	\N	1
1224	220281	蛟河市	3	220200	\N	1
1225	220282	桦甸市	3	220200	\N	1
1226	220283	舒兰市	3	220200	\N	1
1227	220284	磐石市	3	220200	\N	1
1228	220300	四平市	2	220000	\N	1
1229	220301	市辖区	3	220300	\N	1
1230	220302	铁西区	3	220300	\N	1
1231	220303	铁东区	3	220300	\N	1
1232	220322	梨树县	3	220300	\N	1
1233	220323	伊通满族自治县	3	220300	\N	1
1234	220381	公主岭市	3	220300	\N	1
1235	220382	双辽市	3	220300	\N	1
1236	220400	辽源市	2	220000	\N	1
1237	220401	市辖区	3	220400	\N	1
1238	220402	龙山区	3	220400	\N	1
1239	220403	西安区	3	220400	\N	1
1240	220421	东丰县	3	220400	\N	1
1241	220422	东辽县	3	220400	\N	1
1242	220500	通化市	2	220000	\N	1
1243	220501	市辖区	3	220500	\N	1
1244	220502	东昌区	3	220500	\N	1
1245	220503	二道江区	3	220500	\N	1
1246	220521	通化县	3	220500	\N	1
1247	220523	辉南县	3	220500	\N	1
1248	220524	柳河县	3	220500	\N	1
1249	220581	梅河口市	3	220500	\N	1
1250	220582	集安市	3	220500	\N	1
1251	220600	白山市	2	220000	\N	1
1252	220601	市辖区	3	220600	\N	1
1253	220602	八道江区	3	220600	\N	1
1254	220604	江源区	3	\N	\N	1
1255	220621	抚松县	3	220600	\N	1
1256	220622	靖宇县	3	220600	\N	1
1257	220623	长白朝鲜族自治县	3	220600	\N	1
1258	220681	临江市	3	220600	\N	1
1259	220700	松原市	2	220000	\N	1
1260	220701	市辖区	3	220700	\N	1
1261	220702	宁江区	3	220700	\N	1
1262	220722	长岭县	3	220700	\N	1
1263	220723	乾安县	3	220700	\N	1
1264	220724	扶余县	3	\N	\N	1
1265	370406	山亭区	3	370400	\N	1
1266	370481	滕州市	3	370400	\N	1
1267	370500	东营市	2	370000	\N	1
1268	370501	市辖区	3	370500	\N	1
1269	370502	东营区	3	370500	\N	1
1270	370503	河口区	3	370500	\N	1
1271	370521	垦利县	3	370500	\N	1
1272	370522	利津县	3	370500	\N	1
1273	370523	广饶县	3	370500	\N	1
1274	370687	海阳市	3	370600	\N	1
1275	370700	潍坊市	2	370000	\N	1
1276	370701	市辖区	3	370700	\N	1
1277	370702	潍城区	3	370700	\N	1
1278	370703	寒亭区	3	370700	\N	1
1279	370704	坊子区	3	370700	\N	1
1280	370705	奎文区	3	370700	\N	1
1281	370724	临朐县	3	370700	\N	1
1282	370725	昌乐县	3	370700	\N	1
1283	370781	青州市	3	370700	\N	1
1284	370782	诸城市	3	370700	\N	1
1285	370783	寿光市	3	370700	\N	1
1286	370784	安丘市	3	370700	\N	1
1287	370785	高密市	3	370700	\N	1
1288	370829	嘉祥县	3	370800	\N	1
1289	370830	汶上县	3	370800	\N	1
1290	370831	泗水县	3	370800	\N	1
1291	370832	梁山县	3	370800	\N	1
1292	370881	曲阜市	3	370800	\N	1
1293	370882	兖州市	3	\N	\N	1
1294	371083	乳山市	3	371000	\N	1
1295	371100	日照市	2	370000	\N	1
1296	371101	市辖区	3	371100	\N	1
1297	371102	东港区	3	371100	\N	1
1298	371103	岚山区	3	371100	\N	1
1299	371121	五莲县	3	371100	\N	1
1300	371122	莒县	3	371100	\N	1
1301	371200	莱芜市	2	370000	\N	1
1302	371201	市辖区	3	371200	\N	1
1303	371202	莱城区	3	371200	\N	1
1304	371203	钢城区	3	371200	\N	1
1305	371300	临沂市	2	370000	\N	1
1306	371301	市辖区	3	371300	\N	1
1307	371302	兰山区	3	371300	\N	1
1308	371311	罗庄区	3	371300	\N	1
1309	371312	河东区	3	371300	\N	1
1310	371321	沂南县	3	371300	\N	1
1311	371322	郯城县	3	371300	\N	1
1312	371323	沂水县	3	371300	\N	1
1313	371324	苍山县	3	371300	\N	1
1314	371325	费县	3	371300	\N	1
1315	371326	平邑县	3	371300	\N	1
1316	371327	莒南县	3	371300	\N	1
1317	371328	蒙阴县	3	371300	\N	1
1318	371329	临沭县	3	371300	\N	1
1319	371400	德州市	2	370000	\N	1
1320	371401	市辖区	3	371400	\N	1
1321	371402	德城区	3	371400	\N	1
1322	371421	陵县	3	\N	\N	1
1323	371422	宁津县	3	371400	\N	1
1324	371423	庆云县	3	371400	\N	1
1325	371501	市辖区	3	371500	\N	1
1326	371502	东昌府区	3	371500	\N	1
736	430105	开福区	3	430100	\N	1
737	430111	雨花区	3	430100	\N	1
738	430121	长沙县	3	430100	\N	1
739	430122	望城县	3	\N	\N	1
740	430124	宁乡县	3	430100	\N	1
741	430181	浏阳市	3	430100	\N	1
742	430200	株洲市	2	430000	\N	1
743	430201	市辖区	3	430200	\N	1
744	430202	荷塘区	3	430200	\N	1
745	430203	芦淞区	3	430200	\N	1
746	430204	石峰区	3	430200	\N	1
747	430211	天元区	3	430200	\N	1
748	430221	株洲县	3	430200	\N	1
749	430223	攸县	3	430200	\N	1
750	430224	茶陵县	3	430200	\N	1
751	430225	炎陵县	3	430200	\N	1
752	430281	醴陵市	3	430200	\N	1
753	430300	湘潭市	2	430000	\N	1
754	430301	市辖区	3	430300	\N	1
755	430302	雨湖区	3	430300	\N	1
756	430304	岳塘区	3	430300	\N	1
757	430321	湘潭县	3	430300	\N	1
758	430381	湘乡市	3	430300	\N	1
759	430382	韶山市	3	430300	\N	1
760	431103	冷水滩区	3	431100	\N	1
761	431121	祁阳县	3	431100	\N	1
762	431122	东安县	3	431100	\N	1
763	431123	双牌县	3	431100	\N	1
764	431124	道县	3	431100	\N	1
765	431125	江永县	3	431100	\N	1
766	431126	宁远县	3	431100	\N	1
767	431127	蓝山县	3	431100	\N	1
768	431128	新田县	3	431100	\N	1
769	431129	江华瑶族自治县	3	431100	\N	1
770	431200	怀化市	2	430000	\N	1
771	431201	市辖区	3	431200	\N	1
772	431202	鹤城区	3	431200	\N	1
773	431221	中方县	3	431200	\N	1
774	431222	沅陵县	3	431200	\N	1
775	431223	辰溪县	3	431200	\N	1
776	431224	溆浦县	3	431200	\N	1
777	431225	会同县	3	431200	\N	1
778	431226	麻阳苗族自治县	3	431200	\N	1
779	431227	新晃侗族自治县	3	431200	\N	1
780	431228	芷江侗族自治县	3	431200	\N	1
781	431229	靖州苗族侗族自治县	3	431200	\N	1
782	433125	保靖县	3	433100	\N	1
783	433126	古丈县	3	433100	\N	1
784	433127	永顺县	3	433100	\N	1
785	440000	广东省	1	0	\N	1
786	440100	广州市	2	440000	\N	1
787	440101	市辖区	3	440100	\N	1
788	440102	东山区	3	\N	\N	1
789	440103	荔湾区	3	440100	\N	1
790	440104	越秀区	3	440100	\N	1
791	440105	海珠区	3	440100	\N	1
792	440106	天河区	3	440100	\N	1
793	440111	白云区	3	440100	\N	1
794	440112	黄埔区	3	440100	\N	1
795	440113	番禺区	3	440100	\N	1
796	440114	花都区	3	440100	\N	1
797	440201	市辖区	3	440200	\N	1
798	440203	武江区	3	440200	\N	1
799	440204	浈江区	3	440200	\N	1
800	440229	翁源县	3	440200	\N	1
801	440232	乳源瑶族自治县	3	440200	\N	1
802	440233	新丰县	3	440200	\N	1
803	440281	乐昌市	3	440200	\N	1
804	440282	南雄市	3	440200	\N	1
805	440300	深圳市	2	440000	\N	1
806	652700	博尔塔拉蒙古自治州	2	650000	\N	1
807	652701	博乐市	3	652700	\N	1
808	652801	库尔勒市	3	652800	\N	1
809	652822	轮台县	3	652800	\N	1
810	652823	尉犁县	3	652800	\N	1
811	652824	若羌县	3	652800	\N	1
812	652825	且末县	3	652800	\N	1
813	652826	焉耆回族自治县	3	652800	\N	1
814	652827	和静县	3	652800	\N	1
815	652828	和硕县	3	652800	\N	1
816	652829	博湖县	3	652800	\N	1
817	652900	阿克苏地区	2	650000	\N	1
818	652901	阿克苏市	3	652900	\N	1
819	652922	温宿县	3	652900	\N	1
820	652923	库车县	3	652900	\N	1
821	652924	沙雅县	3	652900	\N	1
822	652925	新和县	3	652900	\N	1
823	652926	拜城县	3	652900	\N	1
824	652927	乌什县	3	652900	\N	1
825	653001	阿图什市	3	653000	\N	1
826	653022	阿克陶县	3	653000	\N	1
827	653023	阿合奇县	3	653000	\N	1
828	653024	乌恰县	3	653000	\N	1
829	653100	喀什地区	2	650000	\N	1
830	653101	喀什市	3	653100	\N	1
831	653121	疏附县	3	653100	\N	1
832	653122	疏勒县	3	653100	\N	1
833	653123	英吉沙县	3	653100	\N	1
834	653124	泽普县	3	653100	\N	1
835	653125	莎车县	3	653100	\N	1
836	653126	叶城县	3	653100	\N	1
837	653127	麦盖提县	3	653100	\N	1
838	653128	岳普湖县	3	653100	\N	1
839	653129	伽师县	3	653100	\N	1
840	653130	巴楚县	3	653100	\N	1
841	653200	和田地区	2	650000	\N	1
842	653201	和田市	3	653200	\N	1
843	653221	和田县	3	653200	\N	1
844	653222	墨玉县	3	653200	\N	1
845	653223	皮山县	3	653200	\N	1
846	653224	洛浦县	3	653200	\N	1
847	653225	策勒县	3	653200	\N	1
848	653226	于田县	3	653200	\N	1
849	653227	民丰县	3	653200	\N	1
850	654000	伊犁哈萨克自治州	2	650000	\N	1
851	654002	伊宁市	3	654000	\N	1
852	654003	奎屯市	3	654000	\N	1
853	654021	伊宁县	3	654000	\N	1
854	654022	察布查尔锡伯自治县	3	654000	\N	1
855	654023	霍城县	3	654000	\N	1
856	654024	巩留县	3	654000	\N	1
857	654025	新源县	3	654000	\N	1
858	654026	昭苏县	3	654000	\N	1
859	654027	特克斯县	3	654000	\N	1
860	654028	尼勒克县	3	654000	\N	1
861	654200	塔城地区	2	650000	\N	1
862	654201	塔城市	3	654200	\N	1
863	654226	和布克赛尔蒙古自治县	3	654200	\N	1
864	654300	阿勒泰地区	2	650000	\N	1
865	654301	阿勒泰市	3	654300	\N	1
866	654321	布尔津县	3	654300	\N	1
867	654322	富蕴县	3	654300	\N	1
868	654325	青河县	3	654300	\N	1
869	654326	吉木乃县	3	654300	\N	1
870	659000	省直辖行政单位	2	650000	\N	1
871	659001	石河子市	3	659000	\N	1
872	659002	阿拉尔市	3	659000	\N	1
873	659003	图木舒克市	3	659000	\N	1
874	659004	五家渠市	3	659000	\N	1
875	710000	台湾省	1	0	\N	1
876	350501	市辖区	3	350500	\N	1
877	350502	鲤城区	3	350500	\N	1
878	350503	丰泽区	3	350500	\N	1
879	350504	洛江区	3	350500	\N	1
880	350505	泉港区	3	350500	\N	1
881	350521	惠安县	3	350500	\N	1
882	350524	安溪县	3	350500	\N	1
883	350525	永春县	3	350500	\N	1
884	350526	德化县	3	350500	\N	1
885	350527	金门县	3	350500	\N	1
886	350581	石狮市	3	350500	\N	1
887	350582	晋江市	3	350500	\N	1
888	350583	南安市	3	350500	\N	1
889	350600	漳州市	2	350000	\N	1
890	350700	南平市	2	350000	\N	1
891	350701	市辖区	3	350700	\N	1
892	360101	市辖区	3	360100	\N	1
893	360102	东湖区	3	360100	\N	1
894	360103	西湖区	3	360100	\N	1
895	360104	青云谱区	3	360100	\N	1
896	360105	湾里区	3	360100	\N	1
897	360111	青山湖区	3	360100	\N	1
898	360121	南昌县	3	360100	\N	1
899	360122	新建县	3	360100	\N	1
900	360123	安义县	3	360100	\N	1
901	360124	进贤县	3	360100	\N	1
902	360302	安源区	3	360300	\N	1
903	360313	湘东区	3	360300	\N	1
904	360321	莲花县	3	360300	\N	1
905	360322	上栗县	3	360300	\N	1
906	360323	芦溪县	3	360300	\N	1
907	360400	九江市	2	360000	\N	1
908	360401	市辖区	3	360400	\N	1
909	360402	庐山区	3	360400	\N	1
910	360403	浔阳区	3	360400	\N	1
911	360421	九江县	3	360400	\N	1
912	360423	武宁县	3	360400	\N	1
913	360425	永修县	3	360400	\N	1
914	360426	德安县	3	360400	\N	1
915	360427	星子县	3	360400	\N	1
916	360428	都昌县	3	360400	\N	1
917	360429	湖口县	3	360400	\N	1
918	360430	彭泽县	3	360400	\N	1
919	360481	瑞昌市	3	360400	\N	1
920	360500	新余市	2	360000	\N	1
921	360501	市辖区	3	360500	\N	1
922	360502	渝水区	3	360500	\N	1
923	360521	分宜县	3	360500	\N	1
924	360600	鹰潭市	2	360000	\N	1
925	360601	市辖区	3	360600	\N	1
926	360722	信丰县	3	360700	\N	1
927	360828	万安县	3	360800	\N	1
928	360829	安福县	3	360800	\N	1
929	370202	市南区	3	370200	\N	1
930	370203	市北区	3	370200	\N	1
931	370205	四方区	3	\N	\N	1
932	370211	黄岛区	3	370200	\N	1
933	370212	崂山区	3	370200	\N	1
934	440705	新会区	3	440700	\N	1
935	440781	台山市	3	440700	\N	1
936	440783	开平市	3	440700	\N	1
937	440784	鹤山市	3	440700	\N	1
938	440785	恩平市	3	440700	\N	1
939	440800	湛江市	2	440000	\N	1
940	440801	市辖区	3	440800	\N	1
941	440802	赤坎区	3	440800	\N	1
942	440803	霞山区	3	440800	\N	1
943	440804	坡头区	3	440800	\N	1
944	440811	麻章区	3	440800	\N	1
945	440823	遂溪县	3	440800	\N	1
946	440825	徐闻县	3	440800	\N	1
947	440881	廉江市	3	440800	\N	1
948	440882	雷州市	3	440800	\N	1
949	440883	吴川市	3	440800	\N	1
950	440900	茂名市	2	440000	\N	1
951	440901	市辖区	3	440900	\N	1
952	440902	茂南区	3	440900	\N	1
953	440903	茂港区	3	\N	\N	1
954	440923	电白县	3	\N	\N	1
955	440981	高州市	3	440900	\N	1
956	440982	化州市	3	440900	\N	1
957	440983	信宜市	3	440900	\N	1
958	441200	肇庆市	2	440000	\N	1
959	441201	市辖区	3	441200	\N	1
960	441202	端州区	3	441200	\N	1
961	441203	鼎湖区	3	441200	\N	1
962	441223	广宁县	3	441200	\N	1
963	441224	怀集县	3	441200	\N	1
964	441225	封开县	3	441200	\N	1
965	441226	德庆县	3	441200	\N	1
966	441283	高要市	3	441200	\N	1
967	441284	四会市	3	441200	\N	1
968	441300	惠州市	2	440000	\N	1
969	441301	市辖区	3	441300	\N	1
970	441302	惠城区	3	441300	\N	1
971	441303	惠阳区	3	441300	\N	1
972	441322	博罗县	3	441300	\N	1
973	441323	惠东县	3	441300	\N	1
974	441324	龙门县	3	441300	\N	1
975	441400	梅州市	2	440000	\N	1
976	441401	市辖区	3	441400	\N	1
977	441402	梅江区	3	441400	\N	1
978	410803	中站区	3	410800	\N	1
979	410804	马村区	3	410800	\N	1
980	410811	山阳区	3	410800	\N	1
981	410821	修武县	3	410800	\N	1
982	410822	博爱县	3	410800	\N	1
983	410823	武陟县	3	410800	\N	1
984	410825	温县	3	410800	\N	1
985	410881	济源市	3	\N	\N	1
986	410883	孟州市	3	410800	\N	1
987	410900	濮阳市	2	410000	\N	1
988	410901	市辖区	3	410900	\N	1
989	410922	清丰县	3	410900	\N	1
990	410923	南乐县	3	410900	\N	1
991	410926	范县	3	410900	\N	1
992	410927	台前县	3	410900	\N	1
993	410928	濮阳县	3	410900	\N	1
994	411000	许昌市	2	410000	\N	1
995	411002	魏都区	3	411000	\N	1
996	411023	许昌县	3	411000	\N	1
997	411323	西峡县	3	411300	\N	1
998	411324	镇平县	3	411300	\N	1
999	411325	内乡县	3	411300	\N	1
1000	411326	淅川县	3	411300	\N	1
1001	411327	社旗县	3	411300	\N	1
1002	411328	唐河县	3	411300	\N	1
1003	411329	新野县	3	411300	\N	1
1004	411330	桐柏县	3	411300	\N	1
1005	411381	邓州市	3	411300	\N	1
1006	411400	商丘市	2	410000	\N	1
1007	411401	市辖区	3	411400	\N	1
1008	411402	梁园区	3	411400	\N	1
1009	411403	睢阳区	3	411400	\N	1
1010	411421	民权县	3	411400	\N	1
1011	411422	睢县	3	411400	\N	1
1012	411423	宁陵县	3	411400	\N	1
1013	441501	市辖区	3	441500	\N	1
1014	441502	城区	3	441500	\N	1
1015	441521	海丰县	3	441500	\N	1
1016	441523	陆河县	3	441500	\N	1
1017	441581	陆丰市	3	441500	\N	1
1018	441600	河源市	2	440000	\N	1
1019	441601	市辖区	3	441600	\N	1
1020	441602	源城区	3	441600	\N	1
1021	441621	紫金县	3	441600	\N	1
1022	441622	龙川县	3	441600	\N	1
1023	441624	和平县	3	441600	\N	1
1024	441625	东源县	3	441600	\N	1
1025	441700	阳江市	2	440000	\N	1
1026	441701	市辖区	3	441700	\N	1
1027	441702	江城区	3	441700	\N	1
1028	441721	阳西县	3	441700	\N	1
1029	441723	阳东县	3	441700	\N	1
2364	350628	平和县	3	350600	\N	1
2365	350629	华安县	3	350600	\N	1
2366	350681	龙海市	3	350600	\N	1
2367	350702	延平区	3	350700	\N	1
2368	350721	顺昌县	3	350700	\N	1
2369	350722	浦城县	3	350700	\N	1
2370	350723	光泽县	3	350700	\N	1
2371	350724	松溪县	3	350700	\N	1
2372	350725	政和县	3	350700	\N	1
2373	350781	邵武市	3	350700	\N	1
2374	350782	武夷山市	3	350700	\N	1
2375	350783	建瓯市	3	350700	\N	1
2376	350784	建阳市	3	350700	\N	1
2377	350800	龙岩市	2	350000	\N	1
2378	350801	市辖区	3	350800	\N	1
2379	350802	新罗区	3	350800	\N	1
2380	350821	长汀县	3	350800	\N	1
2381	350822	永定县	3	350800	\N	1
2382	350823	上杭县	3	350800	\N	1
2383	350824	武平县	3	350800	\N	1
2384	350825	连城县	3	350800	\N	1
2385	350881	漳平市	3	350800	\N	1
2386	350900	宁德市	2	350000	\N	1
2387	350901	市辖区	3	350900	\N	1
2388	350902	蕉城区	3	350900	\N	1
2389	350921	霞浦县	3	350900	\N	1
2390	350922	古田县	3	350900	\N	1
2391	350923	屏南县	3	350900	\N	1
2392	350924	寿宁县	3	350900	\N	1
2393	350925	周宁县	3	350900	\N	1
2394	350926	柘荣县	3	350900	\N	1
2395	350981	福安市	3	350900	\N	1
2396	350982	福鼎市	3	350900	\N	1
2397	360000	江西省	1	0	\N	1
2398	360100	南昌市	2	360000	\N	1
2399	360200	景德镇市	2	360000	\N	1
2400	360201	市辖区	3	360200	\N	1
2401	360202	昌江区	3	360200	\N	1
2402	360203	珠山区	3	360200	\N	1
2403	360222	浮梁县	3	360200	\N	1
2404	360281	乐平市	3	360200	\N	1
2405	360300	萍乡市	2	360000	\N	1
2406	360301	市辖区	3	360300	\N	1
2407	360602	月湖区	3	360600	\N	1
2408	360622	余江县	3	360600	\N	1
2409	360681	贵溪市	3	360600	\N	1
2410	360700	赣州市	2	360000	\N	1
2411	360701	市辖区	3	360700	\N	1
2412	360702	章贡区	3	360700	\N	1
2413	360721	赣县	3	360700	\N	1
2414	360723	大余县	3	360700	\N	1
2415	360724	上犹县	3	360700	\N	1
2416	360725	崇义县	3	360700	\N	1
2417	360726	安远县	3	360700	\N	1
2418	360727	龙南县	3	360700	\N	1
2419	360728	定南县	3	360700	\N	1
2420	360729	全南县	3	360700	\N	1
2421	360730	宁都县	3	360700	\N	1
2422	360731	于都县	3	360700	\N	1
2423	360732	兴国县	3	360700	\N	1
2424	360733	会昌县	3	360700	\N	1
2425	360734	寻乌县	3	360700	\N	1
2426	360735	石城县	3	360700	\N	1
2427	360781	瑞金市	3	360700	\N	1
2428	360782	南康市	3	\N	\N	1
2429	360800	吉安市	2	360000	\N	1
2430	360801	市辖区	3	360800	\N	1
2431	360802	吉州区	3	360800	\N	1
2432	360803	青原区	3	360800	\N	1
2433	360821	吉安县	3	360800	\N	1
2434	360822	吉水县	3	360800	\N	1
2435	360823	峡江县	3	360800	\N	1
2436	360824	新干县	3	360800	\N	1
2437	360825	永丰县	3	360800	\N	1
2438	360826	泰和县	3	360800	\N	1
2439	360827	遂川县	3	360800	\N	1
2440	360830	永新县	3	360800	\N	1
2441	360881	井冈山市	3	360800	\N	1
2442	131102	桃城区	3	131100	\N	1
2443	210321	台安县	3	210300	\N	1
2444	210323	岫岩满族自治县	3	210300	\N	1
2445	210381	海城市	3	210300	\N	1
2446	210400	抚顺市	2	210000	\N	1
2447	210401	市辖区	3	210400	\N	1
2448	210402	新抚区	3	210400	\N	1
2449	210403	东洲区	3	210400	\N	1
2450	210404	望花区	3	210400	\N	1
2451	210411	顺城区	3	210400	\N	1
2452	210421	抚顺县	3	210400	\N	1
2453	210422	新宾满族自治县	3	210400	\N	1
2454	210423	清原满族自治县	3	210400	\N	1
2455	210500	本溪市	2	210000	\N	1
2456	210501	市辖区	3	210500	\N	1
2457	210502	平山区	3	210500	\N	1
2458	210503	溪湖区	3	210500	\N	1
2459	210504	明山区	3	210500	\N	1
2460	210505	南芬区	3	210500	\N	1
2461	210521	本溪满族自治县	3	210500	\N	1
2462	210522	桓仁满族自治县	3	210500	\N	1
2463	210600	丹东市	2	210000	\N	1
2464	210601	市辖区	3	210600	\N	1
2465	210602	元宝区	3	210600	\N	1
2466	210603	振兴区	3	210600	\N	1
2467	210604	振安区	3	210600	\N	1
2468	210624	宽甸满族自治县	3	210600	\N	1
2469	210681	东港市	3	210600	\N	1
2470	210682	凤城市	3	210600	\N	1
2471	210700	锦州市	2	210000	\N	1
2472	210701	市辖区	3	210700	\N	1
2473	210702	古塔区	3	210700	\N	1
2474	532527	泸西县	3	532500	\N	1
2475	532528	元阳县	3	532500	\N	1
2476	532529	红河县	3	532500	\N	1
2477	532532	河口瑶族自治县	3	532500	\N	1
2478	532623	西畴县	3	532600	\N	1
2479	532624	麻栗坡县	3	532600	\N	1
2480	532625	马关县	3	532600	\N	1
2481	532626	丘北县	3	532600	\N	1
2482	532627	广南县	3	532600	\N	1
2483	532628	富宁县	3	532600	\N	1
2484	532800	西双版纳傣族自治州	2	530000	\N	1
2485	532801	景洪市	3	532800	\N	1
2486	532822	勐海县	3	532800	\N	1
2487	532823	勐腊县	3	532800	\N	1
2488	532900	大理白族自治州	2	530000	\N	1
2489	532901	大理市	3	532900	\N	1
2490	532922	漾濞彝族自治县	3	532900	\N	1
2491	532923	祥云县	3	532900	\N	1
2492	532924	宾川县	3	532900	\N	1
2493	532925	弥渡县	3	532900	\N	1
2494	532926	南涧彝族自治县	3	532900	\N	1
2495	532927	巍山彝族回族自治县	3	532900	\N	1
2496	532928	永平县	3	532900	\N	1
2497	532929	云龙县	3	532900	\N	1
2498	532930	洱源县	3	532900	\N	1
2499	451029	田林县	3	451000	\N	1
2500	451030	西林县	3	451000	\N	1
2501	451031	隆林各族自治县	3	451000	\N	1
2502	451100	贺州市	2	450000	\N	1
2503	451101	市辖区	3	451100	\N	1
2504	451102	八步区	3	451100	\N	1
2505	451121	昭平县	3	451100	\N	1
2506	451122	钟山县	3	451100	\N	1
2507	451123	富川瑶族自治县	3	451100	\N	1
2508	451200	河池市	2	450000	\N	1
2509	451201	市辖区	3	451200	\N	1
2510	451221	南丹县	3	451200	\N	1
2511	451222	天峨县	3	451200	\N	1
2512	451223	凤山县	3	451200	\N	1
2513	451224	东兰县	3	451200	\N	1
2514	451225	罗城仫佬族自治县	3	451200	\N	1
2515	532931	剑川县	3	532900	\N	1
2516	532932	鹤庆县	3	532900	\N	1
2517	533100	德宏傣族景颇族自治州	2	530000	\N	1
2518	540101	市辖区	3	540100	\N	1
2519	210201	市辖区	3	210200	\N	1
2520	210202	中山区	3	210200	\N	1
2521	210203	西岗区	3	210200	\N	1
2522	210204	沙河口区	3	210200	\N	1
2523	210211	甘井子区	3	210200	\N	1
2524	210212	旅顺口区	3	210200	\N	1
2525	210213	金州区	3	210200	\N	1
2526	210224	长海县	3	210200	\N	1
2527	210281	瓦房店市	3	210200	\N	1
2528	210282	普兰店市	3	210200	\N	1
2529	210283	庄河市	3	210200	\N	1
2530	210300	鞍山市	2	210000	\N	1
2531	210301	市辖区	3	210300	\N	1
2532	210302	铁东区	3	210300	\N	1
2533	210303	铁西区	3	210300	\N	1
2534	210304	立山区	3	210300	\N	1
2535	210311	千山区	3	210300	\N	1
2536	360900	宜春市	2	360000	\N	1
2537	360901	市辖区	3	360900	\N	1
2538	360902	袁州区	3	360900	\N	1
2539	360921	奉新县	3	360900	\N	1
2540	360922	万载县	3	360900	\N	1
2541	360923	上高县	3	360900	\N	1
2542	360924	宜丰县	3	360900	\N	1
2543	360925	靖安县	3	360900	\N	1
2544	360926	铜鼓县	3	360900	\N	1
2545	360981	丰城市	3	360900	\N	1
2546	360982	樟树市	3	360900	\N	1
2547	360983	高安市	3	360900	\N	1
2548	361000	抚州市	2	360000	\N	1
2549	361001	市辖区	3	361000	\N	1
2550	361002	临川区	3	361000	\N	1
2551	361021	南城县	3	361000	\N	1
2552	361022	黎川县	3	361000	\N	1
2553	361023	南丰县	3	361000	\N	1
2554	361024	崇仁县	3	361000	\N	1
2555	361025	乐安县	3	361000	\N	1
2556	361026	宜黄县	3	361000	\N	1
2557	361027	金溪县	3	361000	\N	1
2558	361028	资溪县	3	361000	\N	1
2559	361029	东乡县	3	361000	\N	1
2560	361030	广昌县	3	361000	\N	1
2561	361100	上饶市	2	360000	\N	1
2562	361101	市辖区	3	361100	\N	1
2563	361102	信州区	3	361100	\N	1
2564	361121	上饶县	3	361100	\N	1
2565	361122	广丰县	3	361100	\N	1
2566	361123	玉山县	3	361100	\N	1
2567	361124	铅山县	3	361100	\N	1
2568	361125	横峰县	3	361100	\N	1
2569	361126	弋阳县	3	361100	\N	1
2570	361127	余干县	3	361100	\N	1
2571	361128	鄱阳县	3	361100	\N	1
2572	361129	万年县	3	361100	\N	1
2573	361130	婺源县	3	361100	\N	1
2574	361181	德兴市	3	361100	\N	1
2575	370000	山东省	1	0	\N	1
2576	370100	济南市	2	370000	\N	1
2577	370101	市辖区	3	370100	\N	1
2578	370102	历下区	3	370100	\N	1
2579	370103	市中区	3	370100	\N	1
2580	370104	槐荫区	3	370100	\N	1
2581	370105	天桥区	3	370100	\N	1
2582	370112	历城区	3	370100	\N	1
2583	370113	长清区	3	370100	\N	1
2584	370124	平阴县	3	370100	\N	1
2585	370125	济阳县	3	370100	\N	1
2586	370126	商河县	3	370100	\N	1
2587	370181	章丘市	3	370100	\N	1
2588	370200	青岛市	2	370000	\N	1
2589	370201	市辖区	3	370200	\N	1
2590	370284	胶南市	3	\N	\N	1
2591	370285	莱西市	3	370200	\N	1
2592	370300	淄博市	2	370000	\N	1
2593	370301	市辖区	3	370300	\N	1
2594	370302	淄川区	3	370300	\N	1
2595	370303	张店区	3	370300	\N	1
2596	370304	博山区	3	370300	\N	1
2597	370305	临淄区	3	370300	\N	1
2598	370306	周村区	3	370300	\N	1
2599	370321	桓台县	3	370300	\N	1
2600	370600	烟台市	2	370000	\N	1
2601	370601	市辖区	3	370600	\N	1
2602	370602	芝罘区	3	370600	\N	1
2603	370611	福山区	3	370600	\N	1
2604	370612	牟平区	3	370600	\N	1
2605	370613	莱山区	3	370600	\N	1
2606	370634	长岛县	3	370600	\N	1
2607	370681	龙口市	3	370600	\N	1
2608	370682	莱阳市	3	370600	\N	1
2609	370683	莱州市	3	370600	\N	1
2610	370684	蓬莱市	3	370600	\N	1
2611	370685	招远市	3	370600	\N	1
2612	370686	栖霞市	3	370600	\N	1
2613	370786	昌邑市	3	370700	\N	1
2614	370800	济宁市	2	370000	\N	1
2615	370801	市辖区	3	370800	\N	1
2616	370802	市中区	3	\N	\N	1
2617	370811	任城区	3	370800	\N	1
2618	370826	微山县	3	370800	\N	1
2619	370827	鱼台县	3	370800	\N	1
2620	370828	金乡县	3	370800	\N	1
2621	370883	邹城市	3	370800	\N	1
2622	370900	泰安市	2	370000	\N	1
2623	370901	市辖区	3	370900	\N	1
2624	370902	泰山区	3	370900	\N	1
2625	370903	岱岳区	3	\N	\N	1
2626	370921	宁阳县	3	370900	\N	1
2627	370923	东平县	3	370900	\N	1
2628	370982	新泰市	3	370900	\N	1
2629	140428	长子县	3	140400	\N	1
2630	210101	市辖区	3	210100	\N	1
2631	210102	和平区	3	210100	\N	1
2632	411426	夏邑县	3	411400	\N	1
2633	411481	永城市	3	411400	\N	1
2634	411622	西华县	3	411600	\N	1
2635	420000	湖北省	1	0	\N	1
2636	420100	武汉市	2	420000	\N	1
2637	420101	市辖区	3	420100	\N	1
2638	420102	江岸区	3	420100	\N	1
2639	420103	江汉区	3	420100	\N	1
2640	420104	硚口区	3	420100	\N	1
2641	420105	汉阳区	3	420100	\N	1
2642	420106	武昌区	3	420100	\N	1
2643	420107	青山区	3	420100	\N	1
2644	420700	鄂州市	2	420000	\N	1
2645	420701	市辖区	3	420700	\N	1
2646	420702	梁子湖区	3	420700	\N	1
2647	421000	荆州市	2	420000	\N	1
2648	421001	市辖区	3	421000	\N	1
2649	421002	沙市区	3	421000	\N	1
2650	421003	荆州区	3	421000	\N	1
2651	421022	公安县	3	421000	\N	1
2652	421023	监利县	3	421000	\N	1
2653	421024	江陵县	3	421000	\N	1
2654	421081	石首市	3	421000	\N	1
2655	421222	通城县	3	421200	\N	1
2656	421223	崇阳县	3	421200	\N	1
2657	421224	通山县	3	421200	\N	1
2658	421281	赤壁市	3	421200	\N	1
2806	532327	永仁县	3	532300	\N	1
2807	532328	元谋县	3	532300	\N	1
2808	532329	武定县	3	532300	\N	1
2809	532331	禄丰县	3	532300	\N	1
2810	532501	个旧市	3	532500	\N	1
2811	532502	开远市	3	532500	\N	1
2812	532522	蒙自县	3	\N	\N	1
2813	532523	屏边苗族自治县	3	532500	\N	1
2814	532524	建水县	3	532500	\N	1
2815	532525	石屏县	3	532500	\N	1
2816	532526	弥勒县	3	\N	\N	1
2817	320502	沧浪区	3	320500	\N	1
2818	320503	平江区	3	320500	\N	1
2819	320504	金阊区	3	320500	\N	1
2820	320505	虎丘区	3	320500	\N	1
2821	320506	吴中区	3	320500	\N	1
2822	320507	相城区	3	320500	\N	1
2823	320581	常熟市	3	320500	\N	1
2824	320582	张家港市	3	320500	\N	1
2825	320583	昆山市	3	320500	\N	1
2826	320584	吴江市	3	320500	\N	1
2827	320585	太仓市	3	320500	\N	1
2828	320600	南通市	2	320000	\N	1
2829	320601	市辖区	3	320600	\N	1
2830	320602	崇川区	3	320600	\N	1
2831	320611	港闸区	3	320600	\N	1
2832	320621	海安县	3	320600	\N	1
2833	320623	如东县	3	320600	\N	1
2834	320681	启东市	3	320600	\N	1
2835	320682	如皋市	3	320600	\N	1
2836	320683	通州市	3	320600	\N	1
2837	320684	海门市	3	320600	\N	1
2838	320700	连云港市	2	320000	\N	1
2839	320701	市辖区	3	320700	\N	1
2840	320703	连云区	3	320700	\N	1
2841	320705	新浦区	3	320700	\N	1
2842	320706	海州区	3	320700	\N	1
2843	320721	赣榆县	3	320700	\N	1
2844	320722	东海县	3	320700	\N	1
2845	320723	灌云县	3	320700	\N	1
2846	320724	灌南县	3	320700	\N	1
2847	320800	淮安市	2	320000	\N	1
2848	320801	市辖区	3	320800	\N	1
2849	320802	清河区	3	320800	\N	1
2850	320803	楚州区	3	320800	\N	1
2851	320804	淮阴区	3	320800	\N	1
2852	320811	清浦区	3	320800	\N	1
2853	320826	涟水县	3	320800	\N	1
2854	320829	洪泽县	3	320800	\N	1
2855	320830	盱眙县	3	320800	\N	1
2856	320831	金湖县	3	320800	\N	1
2857	320900	盐城市	2	320000	\N	1
2858	320901	市辖区	3	320900	\N	1
2859	320902	亭湖区	3	320900	\N	1
2860	320903	盐都区	3	320900	\N	1
2861	320921	响水县	3	320900	\N	1
2862	320922	滨海县	3	320900	\N	1
2863	320923	阜宁县	3	320900	\N	1
2864	320924	射阳县	3	320900	\N	1
2865	320925	建湖县	3	320900	\N	1
2866	320981	东台市	3	320900	\N	1
2867	320982	大丰市	3	320900	\N	1
2868	321000	扬州市	2	320000	\N	1
2869	321001	市辖区	3	321000	\N	1
2870	321002	广陵区	3	321000	\N	1
2871	321003	邗江区	3	321000	\N	1
2872	321011	维扬区	3	321000	\N	1
2873	321023	宝应县	3	321000	\N	1
2874	321081	仪征市	3	321000	\N	1
2875	321084	高邮市	3	321000	\N	1
2876	321088	江都市	3	321000	\N	1
2877	321100	镇江市	2	320000	\N	1
2878	321101	市辖区	3	321100	\N	1
2879	321102	京口区	3	321100	\N	1
2880	321111	润州区	3	321100	\N	1
2881	321112	丹徒区	3	321100	\N	1
2882	321200	泰州市	2	320000	\N	1
2883	321201	市辖区	3	321200	\N	1
2884	321202	海陵区	3	321200	\N	1
2885	321203	高港区	3	321200	\N	1
2886	321281	兴化市	3	321200	\N	1
2887	321282	靖江市	3	321200	\N	1
2888	321283	泰兴市	3	321200	\N	1
2889	321284	姜堰市	3	321200	\N	1
2890	321300	宿迁市	2	320000	\N	1
2891	321301	市辖区	3	321300	\N	1
2892	321302	宿城区	3	321300	\N	1
2893	321311	宿豫区	3	321300	\N	1
2894	321322	沭阳县	3	321300	\N	1
2895	321323	泗阳县	3	321300	\N	1
2896	321324	泗洪县	3	321300	\N	1
2897	330000	浙江省	1	0	\N	1
2898	330100	杭州市	2	330000	\N	1
2899	330101	市辖区	3	330100	\N	1
2900	330102	上城区	3	330100	\N	1
2901	330103	下城区	3	330100	\N	1
2902	330104	江干区	3	330100	\N	1
2903	330105	拱墅区	3	330100	\N	1
2904	330106	西湖区	3	330100	\N	1
2905	330108	滨江区	3	330100	\N	1
2906	330109	萧山区	3	330100	\N	1
2907	330110	余杭区	3	330100	\N	1
2908	330122	桐庐县	3	330100	\N	1
2909	330127	淳安县	3	330100	\N	1
2910	330182	建德市	3	330100	\N	1
2911	330183	富阳市	3	330100	\N	1
2912	330185	临安市	3	330100	\N	1
2913	330200	宁波市	2	330000	\N	1
2914	330201	市辖区	3	330200	\N	1
2915	330203	海曙区	3	330200	\N	1
2916	330204	江东区	3	330200	\N	1
2917	330205	江北区	3	330200	\N	1
2918	330206	北仑区	3	330200	\N	1
2919	330211	镇海区	3	330200	\N	1
2920	330212	鄞州区	3	330200	\N	1
2921	330225	象山县	3	330200	\N	1
2922	330226	宁海县	3	330200	\N	1
2923	330281	余姚市	3	330200	\N	1
2924	330282	慈溪市	3	330200	\N	1
2925	330283	奉化市	3	330200	\N	1
2926	330300	温州市	2	330000	\N	1
2927	330301	市辖区	3	330300	\N	1
2928	330302	鹿城区	3	330300	\N	1
1941	610629	洛川县	3	610600	\N	1
1942	610630	宜川县	3	610600	\N	1
1943	610631	黄龙县	3	610600	\N	1
1944	610632	黄陵县	3	610600	\N	1
1945	610700	汉中市	2	610000	\N	1
1946	610701	市辖区	3	610700	\N	1
1947	610702	汉台区	3	610700	\N	1
1948	610721	南郑县	3	610700	\N	1
1949	610722	城固县	3	610700	\N	1
1950	610723	洋县	3	610700	\N	1
1951	610724	西乡县	3	610700	\N	1
1952	610725	勉县	3	610700	\N	1
1953	610726	宁强县	3	610700	\N	1
1954	610727	略阳县	3	610700	\N	1
1955	610728	镇巴县	3	610700	\N	1
1956	610729	留坝县	3	610700	\N	1
1957	610730	佛坪县	3	610700	\N	1
1958	610800	榆林市	2	610000	\N	1
1959	610801	市辖区	3	610800	\N	1
1960	610825	定边县	3	610800	\N	1
1961	610826	绥德县	3	610800	\N	1
1962	610827	米脂县	3	610800	\N	1
1963	610828	佳县	3	610800	\N	1
1964	610829	吴堡县	3	610800	\N	1
1965	610830	清涧县	3	610800	\N	1
1966	610831	子洲县	3	610800	\N	1
1967	610900	安康市	2	610000	\N	1
1968	610901	市辖区	3	610900	\N	1
1969	610902	汉滨区	3	610900	\N	1
1970	610923	宁陕县	3	610900	\N	1
1971	610924	紫阳县	3	610900	\N	1
1972	610925	岚皋县	3	610900	\N	1
1973	610926	平利县	3	610900	\N	1
1974	610927	镇坪县	3	610900	\N	1
1975	610928	旬阳县	3	610900	\N	1
1976	610929	白河县	3	610900	\N	1
1977	611000	商洛市	2	610000	\N	1
1978	611001	市辖区	3	611000	\N	1
1979	611002	商州区	3	611000	\N	1
1980	620104	西固区	3	620100	\N	1
1981	620105	安宁区	3	620100	\N	1
1982	620111	红古区	3	620100	\N	1
1983	620121	永登县	3	620100	\N	1
1984	620122	皋兰县	3	620100	\N	1
1985	620123	榆中县	3	620100	\N	1
1986	620200	嘉峪关市	2	620000	\N	1
1987	620201	市辖区	3	620200	\N	1
1988	620300	金昌市	2	620000	\N	1
1989	620301	市辖区	3	620300	\N	1
1990	620302	金川区	3	620300	\N	1
1991	620321	永昌县	3	620300	\N	1
1992	620400	白银市	2	620000	\N	1
1993	620401	市辖区	3	620400	\N	1
1994	620402	白银区	3	620400	\N	1
1995	620403	平川区	3	620400	\N	1
1996	620421	靖远县	3	620400	\N	1
1997	620702	甘州区	3	620700	\N	1
1998	620721	肃南裕固族自治县	3	620700	\N	1
1999	620722	民乐县	3	620700	\N	1
2000	620723	临泽县	3	620700	\N	1
2001	620724	高台县	3	620700	\N	1
2002	620725	山丹县	3	620700	\N	1
2003	620800	平凉市	2	620000	\N	1
2004	620802	崆峒区	3	620800	\N	1
2005	620821	泾川县	3	620800	\N	1
2006	620822	灵台县	3	620800	\N	1
2007	620823	崇信县	3	620800	\N	1
2008	620824	华亭县	3	620800	\N	1
2009	620825	庄浪县	3	620800	\N	1
2010	620826	静宁县	3	620800	\N	1
2011	620900	酒泉市	2	620000	\N	1
2012	620901	市辖区	3	620900	\N	1
2013	620902	肃州区	3	620900	\N	1
2014	620921	金塔县	3	620900	\N	1
2015	620922	瓜州县	3	620900	\N	1
2016	620923	肃北蒙古族自治县	3	620900	\N	1
2017	620924	阿克塞哈萨克族自治县	3	620900	\N	1
2018	621122	陇西县	3	621100	\N	1
2019	621123	渭源县	3	621100	\N	1
2020	621124	临洮县	3	621100	\N	1
2021	621125	漳县	3	621100	\N	1
2022	621200	陇南市	2	620000	\N	1
2023	621201	市辖区	3	621200	\N	1
2024	621222	文县	3	621200	\N	1
2025	621223	宕昌县	3	621200	\N	1
2026	621224	康县	3	621200	\N	1
2027	621225	西和县	3	621200	\N	1
2028	621226	礼县	3	621200	\N	1
2029	621227	徽县	3	621200	\N	1
2030	623021	临潭县	3	623000	\N	1
2031	623022	卓尼县	3	623000	\N	1
2032	623023	舟曲县	3	623000	\N	1
2033	623024	迭部县	3	623000	\N	1
2034	623025	玛曲县	3	623000	\N	1
2035	623026	碌曲县	3	623000	\N	1
2036	623027	夏河县	3	623000	\N	1
2037	630000	青海省	1	0	\N	1
2038	630100	西宁市	2	630000	\N	1
2039	630101	市辖区	3	630100	\N	1
2040	632600	果洛藏族自治州	2	630000	\N	1
2041	632724	治多县	3	632700	\N	1
2042	632725	囊谦县	3	632700	\N	1
2043	650105	水磨沟区	3	650100	\N	1
2044	650106	头屯河区	3	650100	\N	1
2045	650107	达坂城区	3	650100	\N	1
2046	650108	东山区	3	\N	\N	1
2047	650121	乌鲁木齐县	3	650100	\N	1
2048	650200	克拉玛依市	2	650000	\N	1
2049	652222	巴里坤哈萨克自治县	3	652200	\N	1
2050	652223	伊吾县	3	652200	\N	1
2051	652300	昌吉回族自治州	2	650000	\N	1
2052	652301	昌吉市	3	652300	\N	1
2053	652302	阜康市	3	652300	\N	1
2054	652722	精河县	3	652700	\N	1
2055	652723	温泉县	3	652700	\N	1
2056	652800	巴音郭楞蒙古自治州	2	650000	\N	1
2057	652928	阿瓦提县	3	652900	\N	1
2058	652929	柯坪县	3	652900	\N	1
2059	654202	乌苏市	3	654200	\N	1
2060	654221	额敏县	3	654200	\N	1
2061	654223	沙湾县	3	654200	\N	1
2062	654224	托里县	3	654200	\N	1
2063	654225	裕民县	3	654200	\N	1
2064	654323	福海县	3	654300	\N	1
2065	654324	哈巴河县	3	654300	\N	1
2066	810000	香港特别行政区	1	0	\N	1
2067	820000	澳门特别行政区	1	0	\N	1
2069	621126	岷县	3	621100	\N	1
2070	451226	环江毛南族自治县	3	451200	\N	1
2071	451227	巴马瑶族自治县	3	451200	\N	1
2072	451228	都安瑶族自治县	3	451200	\N	1
2073	451229	大化瑶族自治县	3	451200	\N	1
2074	451281	宜州市	3	451200	\N	1
2075	451300	来宾市	2	450000	\N	1
2076	451301	市辖区	3	451300	\N	1
2077	460105	秀英区	3	460100	\N	1
2078	460106	龙华区	3	460100	\N	1
2079	500114	黔江区	3	500100	\N	1
2080	500227	璧山县	3	\N	\N	1
2081	500228	梁平县	3	500100	\N	1
2082	500229	城口县	3	500100	\N	1
2083	500230	丰都县	3	500100	\N	1
2084	500231	垫江县	3	500100	\N	1
2085	500232	武隆县	3	500100	\N	1
2086	500233	忠县	3	500100	\N	1
2087	513229	马尔康县	3	513200	\N	1
2088	500234	开县	3	500100	\N	1
2089	500243	彭水苗族土家族自治县	3	500100	\N	1
2090	510000	四川省	1	0	\N	1
2091	510100	成都市	2	510000	\N	1
2092	510101	市辖区	3	510100	\N	1
2093	510104	锦江区	3	510100	\N	1
2094	510105	青羊区	3	510100	\N	1
2095	510106	金牛区	3	510100	\N	1
2096	510107	武侯区	3	510100	\N	1
2097	510108	成华区	3	510100	\N	1
2098	510112	龙泉驿区	3	510100	\N	1
2099	510113	青白江区	3	510100	\N	1
2100	510114	新都区	3	510100	\N	1
2101	510122	双流县	3	510100	\N	1
2102	510321	荣县	3	510300	\N	1
2103	510322	富顺县	3	510300	\N	1
2104	510400	攀枝花市	2	510000	\N	1
2105	510401	市辖区	3	510400	\N	1
2106	510402	东区	3	510400	\N	1
2107	510403	西区	3	510400	\N	1
2108	510601	市辖区	3	510600	\N	1
2109	510603	旌阳区	3	510600	\N	1
2110	510623	中江县	3	510600	\N	1
2111	510626	罗江县	3	510600	\N	1
2112	510681	广汉市	3	510600	\N	1
2113	510682	什邡市	3	510600	\N	1
2114	510683	绵竹市	3	510600	\N	1
2115	510700	绵阳市	2	510000	\N	1
2116	510701	市辖区	3	510700	\N	1
2117	510704	游仙区	3	510700	\N	1
2118	510722	三台县	3	510700	\N	1
2119	510723	盐亭县	3	510700	\N	1
2120	510724	安县	3	510700	\N	1
2121	510811	元坝区	3	510800	\N	1
2122	510812	朝天区	3	510800	\N	1
2123	510821	旺苍县	3	510800	\N	1
2124	510822	青川县	3	510800	\N	1
2125	510823	剑阁县	3	510800	\N	1
2126	510824	苍溪县	3	510800	\N	1
2127	510900	遂宁市	2	510000	\N	1
2128	510901	市辖区	3	510900	\N	1
2129	510903	船山区	3	510900	\N	1
2130	510904	安居区	3	510900	\N	1
2131	510921	蓬溪县	3	510900	\N	1
2132	510922	射洪县	3	510900	\N	1
2133	510923	大英县	3	510900	\N	1
2134	511000	内江市	2	510000	\N	1
2135	511001	市辖区	3	511000	\N	1
2136	511002	市中区	3	511000	\N	1
2137	511011	东兴区	3	511000	\N	1
2138	511024	威远县	3	511000	\N	1
2139	511025	资中县	3	511000	\N	1
2140	511028	隆昌县	3	511000	\N	1
2141	511100	乐山市	2	510000	\N	1
2142	511101	市辖区	3	511100	\N	1
2143	511102	市中区	3	511100	\N	1
2144	511111	沙湾区	3	511100	\N	1
2145	511112	五通桥区	3	511100	\N	1
2146	511113	金口河区	3	511100	\N	1
2147	511123	犍为县	3	511100	\N	1
2148	511124	井研县	3	511100	\N	1
2149	511126	夹江县	3	511100	\N	1
2150	511129	沐川县	3	511100	\N	1
2151	511132	峨边彝族自治县	3	511100	\N	1
2152	511133	马边彝族自治县	3	511100	\N	1
2153	511181	峨眉山市	3	511100	\N	1
2154	511300	南充市	2	510000	\N	1
2155	511301	市辖区	3	511300	\N	1
2156	511401	市辖区	3	511400	\N	1
2157	511423	洪雅县	3	511400	\N	1
2158	511424	丹棱县	3	511400	\N	1
2159	511425	青神县	3	511400	\N	1
2160	511500	宜宾市	2	510000	\N	1
2161	511501	市辖区	3	511500	\N	1
2162	511502	翠屏区	3	511500	\N	1
2163	511521	宜宾县	3	511500	\N	1
2164	511522	南溪县	3	\N	\N	1
2165	511523	江安县	3	511500	\N	1
2166	511524	长宁县	3	511500	\N	1
2167	511525	高县	3	511500	\N	1
2168	511526	珙县	3	511500	\N	1
2169	511527	筠连县	3	511500	\N	1
2170	511528	兴文县	3	511500	\N	1
2171	511623	邻水县	3	511600	\N	1
2172	511681	华蓥市	3	511600	\N	1
2173	511700	达州市	2	510000	\N	1
2174	511701	市辖区	3	511700	\N	1
2175	511702	通川区	3	511700	\N	1
2176	511721	达县	3	\N	\N	1
2177	511722	宣汉县	3	511700	\N	1
2178	511723	开江县	3	511700	\N	1
2179	511724	大竹县	3	511700	\N	1
2180	511725	渠县	3	511700	\N	1
2181	511781	万源市	3	511700	\N	1
2182	511800	雅安市	2	510000	\N	1
2183	511801	市辖区	3	511800	\N	1
2184	511802	雨城区	3	511800	\N	1
2185	511821	名山县	3	\N	\N	1
2186	511822	荥经县	3	511800	\N	1
2187	511823	汉源县	3	511800	\N	1
2188	511824	石棉县	3	511800	\N	1
2189	511825	天全县	3	511800	\N	1
2190	511826	芦山县	3	511800	\N	1
2191	511827	宝兴县	3	511800	\N	1
2192	520101	市辖区	3	520100	\N	1
2193	520102	南明区	3	520100	\N	1
2194	520103	云岩区	3	520100	\N	1
2195	520111	花溪区	3	520100	\N	1
2196	520112	乌当区	3	520100	\N	1
2197	520113	白云区	3	520100	\N	1
2198	520114	小河区	3	\N	\N	1
2199	520121	开阳县	3	520100	\N	1
2200	520122	息烽县	3	520100	\N	1
2201	520123	修文县	3	520100	\N	1
2202	520181	清镇市	3	520100	\N	1
2203	520200	六盘水市	2	520000	\N	1
2204	520201	钟山区	3	520200	\N	1
2205	520221	水城县	3	520200	\N	1
2206	520222	盘县	3	520200	\N	1
2207	520300	遵义市	2	520000	\N	1
2208	520301	市辖区	3	520300	\N	1
2209	520302	红花岗区	3	520300	\N	1
2210	520303	汇川区	3	520300	\N	1
2211	520321	遵义县	3	520300	\N	1
2212	520322	桐梓县	3	520300	\N	1
2213	520323	绥阳县	3	520300	\N	1
2214	520324	正安县	3	520300	\N	1
2215	520325	道真仡佬族苗族自治县	3	520300	\N	1
2216	520326	务川仡佬族苗族自治县	3	520300	\N	1
2217	520327	凤冈县	3	520300	\N	1
2218	520328	湄潭县	3	520300	\N	1
2219	520329	余庆县	3	520300	\N	1
2220	520330	习水县	3	520300	\N	1
2221	520381	赤水市	3	520300	\N	1
2222	520382	仁怀市	3	520300	\N	1
2223	520400	安顺市	2	520000	\N	1
2224	520401	市辖区	3	520400	\N	1
2225	520402	西秀区	3	520400	\N	1
2226	520421	平坝县	3	520400	\N	1
2227	520422	普定县	3	520400	\N	1
2228	520423	镇宁布依族苗族自治县	3	520400	\N	1
2229	520424	关岭布依族苗族自治县	3	520400	\N	1
2230	520425	紫云苗族布依族自治县	3	520400	\N	1
2231	522200	铜仁地区	2	\N	\N	1
2232	522201	铜仁市	3	\N	\N	1
2233	522222	江口县	3	\N	\N	1
2234	522223	玉屏侗族自治县	3	\N	\N	1
2235	522224	石阡县	3	\N	\N	1
2236	522225	思南县	3	\N	\N	1
2237	522428	赫章县	3	\N	\N	1
2238	522600	黔东南苗族侗族自治州	2	520000	\N	1
2239	522601	凯里市	3	522600	\N	1
2240	522622	黄平县	3	522600	\N	1
2241	522623	施秉县	3	522600	\N	1
2242	522624	三穗县	3	522600	\N	1
2243	522625	镇远县	3	522600	\N	1
2244	522626	岑巩县	3	522600	\N	1
2245	522627	天柱县	3	522600	\N	1
2246	522628	锦屏县	3	522600	\N	1
2247	522629	剑河县	3	522600	\N	1
2248	522630	台江县	3	522600	\N	1
2249	522631	黎平县	3	522600	\N	1
2250	522632	榕江县	3	522600	\N	1
2251	522633	从江县	3	522600	\N	1
2252	522634	雷山县	3	522600	\N	1
2253	522635	麻江县	3	522600	\N	1
2254	522636	丹寨县	3	522600	\N	1
2255	522700	黔南布依族苗族自治州	2	520000	\N	1
2256	522701	都匀市	3	522700	\N	1
2257	530426	峨山彝族自治县	3	530400	\N	1
2258	530427	新平彝族傣族自治县	3	530400	\N	1
2259	530500	保山市	2	530000	\N	1
2260	530501	市辖区	3	530500	\N	1
2261	530502	隆阳区	3	530500	\N	1
2262	530521	施甸县	3	530500	\N	1
2263	530522	腾冲县	3	530500	\N	1
2264	530523	龙陵县	3	530500	\N	1
2265	530524	昌宁县	3	530500	\N	1
2266	530600	昭通市	2	530000	\N	1
2267	530601	市辖区	3	530600	\N	1
2268	530602	昭阳区	3	530600	\N	1
2269	530621	鲁甸县	3	530600	\N	1
2270	530622	巧家县	3	530600	\N	1
2271	530623	盐津县	3	530600	\N	1
2272	530624	大关县	3	530600	\N	1
2273	530625	永善县	3	530600	\N	1
2274	530626	绥江县	3	530600	\N	1
2275	530627	镇雄县	3	530600	\N	1
2276	530628	彝良县	3	530600	\N	1
2277	530629	威信县	3	530600	\N	1
2278	340802	迎江区	3	340800	\N	1
2279	340803	大观区	3	340800	\N	1
2280	340823	枞阳县	3	340800	\N	1
2281	340824	潜山县	3	340800	\N	1
2282	340825	太湖县	3	340800	\N	1
2283	340826	宿松县	3	340800	\N	1
2284	341181	天长市	3	341100	\N	1
2285	341182	明光市	3	341100	\N	1
2286	341200	阜阳市	2	340000	\N	1
2287	341201	市辖区	3	341200	\N	1
2288	341202	颍州区	3	341200	\N	1
2289	341203	颍东区	3	341200	\N	1
2290	341204	颍泉区	3	341200	\N	1
2291	341221	临泉县	3	341200	\N	1
2292	341222	太和县	3	341200	\N	1
2293	341225	阜南县	3	341200	\N	1
2294	341226	颍上县	3	341200	\N	1
2295	341282	界首市	3	341200	\N	1
2296	341300	宿州市	2	340000	\N	1
2297	341301	市辖区	3	341300	\N	1
2298	341302	埇桥区	3	341300	\N	1
2299	341321	砀山县	3	341300	\N	1
2300	341322	萧县	3	341300	\N	1
2301	341323	灵璧县	3	341300	\N	1
2302	341324	泗县	3	341300	\N	1
2303	341400	巢湖市	2	\N	\N	1
2304	341401	市辖区	3	\N	\N	1
2305	341402	居巢区	3	\N	\N	1
2306	341421	庐江县	3	\N	\N	1
2307	341422	无为县	3	\N	\N	1
2308	341423	含山县	3	\N	\N	1
2309	341424	和县	3	\N	\N	1
2310	341500	六安市	2	340000	\N	1
2311	341501	市辖区	3	341500	\N	1
2312	341502	金安区	3	341500	\N	1
2313	341503	裕安区	3	341500	\N	1
2314	341521	寿县	3	341500	\N	1
2315	341522	霍邱县	3	341500	\N	1
2316	341523	舒城县	3	341500	\N	1
2317	341524	金寨县	3	341500	\N	1
2318	341525	霍山县	3	341500	\N	1
2319	341600	亳州市	2	340000	\N	1
2320	341601	市辖区	3	341600	\N	1
2321	341602	谯城区	3	341600	\N	1
2322	341621	涡阳县	3	341600	\N	1
2323	341721	东至县	3	341700	\N	1
2324	341722	石台县	3	341700	\N	1
2325	341723	青阳县	3	341700	\N	1
2326	341800	宣城市	2	340000	\N	1
2327	341801	市辖区	3	341800	\N	1
2328	341802	宣州区	3	341800	\N	1
2329	341821	郎溪县	3	341800	\N	1
2330	341822	广德县	3	341800	\N	1
2331	341823	泾县	3	341800	\N	1
2332	341824	绩溪县	3	341800	\N	1
2333	341825	旌德县	3	341800	\N	1
2334	341881	宁国市	3	341800	\N	1
2335	350000	福建省	1	0	\N	1
2336	350100	福州市	2	350000	\N	1
2337	350101	市辖区	3	350100	\N	1
2338	350102	鼓楼区	3	350100	\N	1
2339	350103	台江区	3	350100	\N	1
2340	350104	仓山区	3	350100	\N	1
2341	350105	马尾区	3	350100	\N	1
2342	350111	晋安区	3	350100	\N	1
2343	350123	罗源县	3	350100	\N	1
2344	350124	闽清县	3	350100	\N	1
2345	350125	永泰县	3	350100	\N	1
2346	350128	平潭县	3	350100	\N	1
2347	350181	福清市	3	350100	\N	1
2348	350182	长乐市	3	350100	\N	1
2349	350200	厦门市	2	350000	\N	1
2350	350303	涵江区	3	350300	\N	1
2351	350304	荔城区	3	350300	\N	1
2352	350305	秀屿区	3	350300	\N	1
2353	350322	仙游县	3	350300	\N	1
2354	350400	三明市	2	350000	\N	1
2355	350601	市辖区	3	350600	\N	1
2356	350602	芗城区	3	350600	\N	1
2357	350603	龙文区	3	350600	\N	1
2358	350622	云霄县	3	350600	\N	1
2359	350623	漳浦县	3	350600	\N	1
2360	350624	诏安县	3	350600	\N	1
2361	350625	长泰县	3	350600	\N	1
2362	350626	东山县	3	350600	\N	1
2363	350627	南靖县	3	350600	\N	1
3252	513428	普格县	3	513400	\N	1
3253	513429	布拖县	3	513400	\N	1
3254	513430	金阳县	3	513400	\N	1
3255	513431	昭觉县	3	513400	\N	1
3256	513432	喜德县	3	513400	\N	1
3257	513433	冕宁县	3	513400	\N	1
3258	513434	越西县	3	513400	\N	1
3259	513435	甘洛县	3	513400	\N	1
3260	513436	美姑县	3	513400	\N	1
3261	513437	雷波县	3	513400	\N	1
3262	520000	贵州省	1	0	\N	1
3263	520100	贵阳市	2	520000	\N	1
3264	520203	六枝特区	3	520200	\N	1
3265	522226	印江土家族苗族自治县	3	\N	\N	1
3266	522227	德江县	3	\N	\N	1
3267	522228	沿河土家族自治县	3	\N	\N	1
3268	522229	松桃苗族自治县	3	\N	\N	1
3269	522230	万山特区	3	\N	\N	1
3270	522301	兴义市	3	522300	\N	1
3271	522322	兴仁县	3	522300	\N	1
3272	522323	普安县	3	522300	\N	1
3273	522324	晴隆县	3	522300	\N	1
3274	522325	贞丰县	3	522300	\N	1
3275	522326	望谟县	3	522300	\N	1
3276	522327	册亨县	3	522300	\N	1
3277	522328	安龙县	3	522300	\N	1
3278	522400	毕节地区	2	\N	\N	1
3279	522401	毕节市	3	\N	\N	1
3280	522422	大方县	3	\N	\N	1
3281	522423	黔西县	3	\N	\N	1
3282	370213	李沧区	3	370200	\N	1
3283	370214	城阳区	3	370200	\N	1
3284	370281	胶州市	3	370200	\N	1
3285	370282	即墨市	3	370200	\N	1
3286	370283	平度市	3	370200	\N	1
3287	370322	高青县	3	370300	\N	1
3288	370323	沂源县	3	370300	\N	1
3289	370400	枣庄市	2	370000	\N	1
3290	370401	市辖区	3	370400	\N	1
3291	370402	市中区	3	370400	\N	1
3292	370403	薛城区	3	370400	\N	1
3293	370404	峄城区	3	370400	\N	1
3294	370405	台儿庄区	3	370400	\N	1
3295	440604	禅城区	3	440600	\N	1
3296	440605	南海区	3	440600	\N	1
3297	440606	顺德区	3	440600	\N	1
3298	440607	三水区	3	440600	\N	1
3299	440608	高明区	3	440600	\N	1
3300	440700	江门市	2	440000	\N	1
3301	440701	市辖区	3	440700	\N	1
3302	440703	蓬江区	3	440700	\N	1
3303	440704	江海区	3	440700	\N	1
3304	440301	市辖区	3	440300	\N	1
3305	440303	罗湖区	3	440300	\N	1
3306	451202	金城江区	3	451200	\N	1
3307	451302	兴宾区	3	451300	\N	1
3308	451321	忻城县	3	451300	\N	1
3309	451322	象州县	3	451300	\N	1
3310	451323	武宣县	3	451300	\N	1
3311	451324	金秀瑶族自治县	3	451300	\N	1
3312	451381	合山市	3	451300	\N	1
3313	451400	崇左市	2	450000	\N	1
3314	451401	市辖区	3	451400	\N	1
3315	451402	江洲区	3	451400	\N	1
3316	451421	扶绥县	3	451400	\N	1
3317	451422	宁明县	3	451400	\N	1
3318	451423	龙州县	3	451400	\N	1
3319	451424	大新县	3	451400	\N	1
3320	451425	天等县	3	451400	\N	1
3321	451481	凭祥市	3	451400	\N	1
3322	540000	西藏自治区	1	0	\N	1
3323	540100	拉萨市	2	540000	\N	1
3324	542229	加查县	3	542200	\N	1
3325	542231	隆子县	3	542200	\N	1
3326	542232	错那县	3	542200	\N	1
3327	542233	浪卡子县	3	542200	\N	1
3328	542300	日喀则地区	2	\N	\N	1
3329	542301	日喀则市	3	\N	\N	1
3330	542322	南木林县	3	\N	\N	1
3331	542323	江孜县	3	\N	\N	1
3332	542324	定日县	3	\N	\N	1
3333	542421	那曲县	3	542400	\N	1
3334	542422	嘉黎县	3	542400	\N	1
3335	542423	比如县	3	542400	\N	1
3336	542424	聂荣县	3	542400	\N	1
3337	542425	安多县	3	542400	\N	1
3338	542430	尼玛县	3	542400	\N	1
3339	542500	阿里地区	2	540000	\N	1
3340	542521	普兰县	3	542500	\N	1
3341	542522	札达县	3	542500	\N	1
3342	542523	噶尔县	3	542500	\N	1
3343	542524	日土县	3	542500	\N	1
3344	610328	千阳县	3	610300	\N	1
3345	610329	麟游县	3	610300	\N	1
3346	610428	长武县	3	610400	\N	1
3347	610429	旬邑县	3	610400	\N	1
3348	610430	淳化县	3	610400	\N	1
3349	610431	武功县	3	610400	\N	1
3350	610481	兴平市	3	610400	\N	1
3351	610500	渭南市	2	610000	\N	1
3352	610501	市辖区	3	610500	\N	1
3353	610502	临渭区	3	610500	\N	1
3354	610521	华县	3	610500	\N	1
3355	610522	潼关县	3	610500	\N	1
3356	610523	大荔县	3	610500	\N	1
3357	610524	合阳县	3	610500	\N	1
3358	610525	澄城县	3	610500	\N	1
3359	610526	蒲城县	3	610500	\N	1
3360	610527	白水县	3	610500	\N	1
3361	611021	洛南县	3	611000	\N	1
3362	611022	丹凤县	3	611000	\N	1
3363	611023	商南县	3	611000	\N	1
3364	611024	山阳县	3	611000	\N	1
3365	611025	镇安县	3	611000	\N	1
3366	611026	柞水县	3	611000	\N	1
3367	620000	甘肃省	1	0	\N	1
3368	620100	兰州市	2	620000	\N	1
3369	620101	市辖区	3	620100	\N	1
3370	620102	城关区	3	620100	\N	1
3371	620103	七里河区	3	620100	\N	1
3372	620422	会宁县	3	620400	\N	1
3373	620423	景泰县	3	620400	\N	1
3374	620500	天水市	2	620000	\N	1
3375	620501	市辖区	3	620500	\N	1
3376	620502	秦城区	3	620500	\N	1
3377	620503	北道区	3	620500	\N	1
3378	620521	清水县	3	620500	\N	1
3379	620522	秦安县	3	620500	\N	1
3380	620523	甘谷县	3	620500	\N	1
3381	620524	武山县	3	620500	\N	1
3382	620525	张家川回族自治县	3	620500	\N	1
3383	620600	武威市	2	620000	\N	1
3384	620601	市辖区	3	620600	\N	1
3385	620602	凉州区	3	620600	\N	1
3386	620621	民勤县	3	620600	\N	1
3387	620622	古浪县	3	620600	\N	1
3388	620623	天祝藏族自治县	3	620600	\N	1
3389	620700	张掖市	2	620000	\N	1
3390	620701	市辖区	3	620700	\N	1
3391	620801	市辖区	3	620800	\N	1
3392	620981	玉门市	3	620900	\N	1
3393	620982	敦煌市	3	620900	\N	1
3394	621000	庆阳市	2	620000	\N	1
3395	621001	市辖区	3	621000	\N	1
3396	621002	西峰区	3	621000	\N	1
3397	621021	庆城县	3	621000	\N	1
3398	621022	环县	3	621000	\N	1
3399	621023	华池县	3	621000	\N	1
3400	621024	合水县	3	621000	\N	1
3401	621025	正宁县	3	621000	\N	1
3402	621026	宁县	3	621000	\N	1
3403	621027	镇原县	3	621000	\N	1
3404	621100	定西市	2	620000	\N	1
3405	621101	市辖区	3	621100	\N	1
3406	621102	安定区	3	621100	\N	1
3407	621121	通渭县	3	621100	\N	1
3408	621202	武都区	3	621200	\N	1
3409	621221	成县	3	621200	\N	1
3410	621228	两当县	3	621200	\N	1
3411	622900	临夏回族自治州	2	620000	\N	1
3412	622901	临夏市	3	622900	\N	1
3413	622921	临夏县	3	622900	\N	1
3414	622922	康乐县	3	622900	\N	1
3415	622923	永靖县	3	622900	\N	1
3416	622924	广河县	3	622900	\N	1
3417	622925	和政县	3	622900	\N	1
3418	622926	东乡族自治县	3	622900	\N	1
3419	623000	甘南藏族自治州	2	620000	\N	1
3420	623001	合作市	3	623000	\N	1
3421	630102	城东区	3	630100	\N	1
3422	630103	城中区	3	630100	\N	1
3423	630104	城西区	3	630100	\N	1
3424	630105	城北区	3	630100	\N	1
3425	630121	大通回族土族自治县	3	630100	\N	1
3426	630122	湟中县	3	630100	\N	1
3427	630123	湟源县	3	630100	\N	1
3428	632122	民和回族土族自治县	3	\N	\N	1
3429	632123	乐都县	3	\N	\N	1
3430	632126	互助土族自治县	3	\N	\N	1
3431	632127	化隆回族自治县	3	\N	\N	1
3432	632128	循化撒拉族自治县	3	\N	\N	1
3433	632200	海北藏族自治州	2	630000	\N	1
3434	632221	门源回族自治县	3	632200	\N	1
3435	632222	祁连县	3	632200	\N	1
3436	632223	海晏县	3	632200	\N	1
3437	632224	刚察县	3	632200	\N	1
3438	632300	黄南藏族自治州	2	630000	\N	1
3439	632321	同仁县	3	632300	\N	1
3440	632322	尖扎县	3	632300	\N	1
3441	632323	泽库县	3	632300	\N	1
3442	632324	河南蒙古族自治县	3	632300	\N	1
3443	632500	海南藏族自治州	2	630000	\N	1
3444	632521	共和县	3	632500	\N	1
3445	632522	同德县	3	632500	\N	1
3446	632523	贵德县	3	632500	\N	1
3447	632524	兴海县	3	632500	\N	1
3448	632525	贵南县	3	632500	\N	1
3449	632621	玛沁县	3	632600	\N	1
3450	632622	班玛县	3	632600	\N	1
3451	632623	甘德县	3	632600	\N	1
3452	632624	达日县	3	632600	\N	1
3453	632625	久治县	3	632600	\N	1
3454	632626	玛多县	3	632600	\N	1
3455	632700	玉树藏族自治州	2	630000	\N	1
3456	632721	玉树县	3	\N	\N	1
3457	632722	杂多县	3	632700	\N	1
3458	632723	称多县	3	632700	\N	1
3459	632726	曲麻莱县	3	632700	\N	1
3460	632800	海西蒙古族藏族自治州	2	630000	\N	1
3461	632801	格尔木市	3	632800	\N	1
3462	632802	德令哈市	3	632800	\N	1
3463	632821	乌兰县	3	632800	\N	1
3464	632822	都兰县	3	632800	\N	1
3465	632823	天峻县	3	632800	\N	1
3466	632824	芒崖	3	\N	\N	1
3467	632825	冷湖	3	\N	\N	1
3468	632826	大柴旦	3	\N	\N	1
3469	640000	宁夏回族自治区	1	0	\N	1
3470	640100	银川市	2	640000	\N	1
3471	640101	市辖区	3	640100	\N	1
3472	640104	兴庆区	3	640100	\N	1
3473	640105	西夏区	3	640100	\N	1
3474	640106	金凤区	3	640100	\N	1
3475	640121	永宁县	3	640100	\N	1
3476	640122	贺兰县	3	640100	\N	1
3477	640181	灵武市	3	640100	\N	1
3478	640200	石嘴山市	2	640000	\N	1
3479	640201	市辖区	3	640200	\N	1
3480	640202	大武口区	3	640200	\N	1
3481	640205	惠农区	3	640200	\N	1
3482	640221	平罗县	3	640200	\N	1
3483	640300	吴忠市	2	640000	\N	1
3484	640301	市辖区	3	640300	\N	1
3485	640302	利通区	3	640300	\N	1
3486	640323	盐池县	3	640300	\N	1
3487	640324	同心县	3	640300	\N	1
3488	640381	青铜峡市	3	640300	\N	1
3489	640400	固原市	2	640000	\N	1
3490	640401	市辖区	3	640400	\N	1
3491	640402	原州区	3	640400	\N	1
3492	640422	西吉县	3	640400	\N	1
3493	640423	隆德县	3	640400	\N	1
3494	640424	泾源县	3	640400	\N	1
3495	640425	彭阳县	3	640400	\N	1
3496	640500	中卫市	2	640000	\N	1
3497	640501	市辖区	3	640500	\N	1
3498	640502	沙坡头区	3	640500	\N	1
3499	640521	中宁县	3	640500	\N	1
3500	640522	海原县	3	640500	\N	1
3501	650000	新疆维吾尔自治区	1	0	\N	1
3502	650100	乌鲁木齐市	2	650000	\N	1
3503	650101	市辖区	3	650100	\N	1
3504	650102	天山区	3	650100	\N	1
3505	650103	沙依巴克区	3	650100	\N	1
3506	650104	新市区	3	650100	\N	1
3507	650201	市辖区	3	650200	\N	1
3508	650202	独山子区	3	650200	\N	1
3509	650203	克拉玛依区	3	650200	\N	1
3510	650204	白碱滩区	3	650200	\N	1
3511	650205	乌尔禾区	3	650200	\N	1
3512	650300	石河子市	2	\N	\N	1
3513	652100	吐鲁番地区	2	650000	\N	1
3514	652101	吐鲁番市	3	652100	\N	1
3515	652122	鄯善县	3	652100	\N	1
3516	652123	托克逊县	3	652100	\N	1
3517	652200	哈密地区	2	650000	\N	1
3518	652201	哈密市	3	652200	\N	1
3519	652303	米泉市	3	\N	\N	1
3520	652323	呼图壁县	3	652300	\N	1
3521	652324	玛纳斯县	3	652300	\N	1
3522	652325	奇台县	3	652300	\N	1
3523	652327	吉木萨尔县	3	652300	\N	1
2953	330523	安吉县	3	330500	\N	1
2954	330600	绍兴市	2	330000	\N	1
2955	330601	市辖区	3	330600	\N	1
2956	330602	越城区	3	330600	\N	1
2957	330621	绍兴县	3	\N	\N	1
2958	330624	新昌县	3	330600	\N	1
2959	330681	诸暨市	3	330600	\N	1
2960	330682	上虞市	3	\N	\N	1
2961	330683	嵊州市	3	330600	\N	1
2962	330700	金华市	2	330000	\N	1
2963	330701	市辖区	3	330700	\N	1
2964	330702	婺城区	3	330700	\N	1
2965	330703	金东区	3	330700	\N	1
2966	330723	武义县	3	330700	\N	1
2967	330726	浦江县	3	330700	\N	1
2968	330727	磐安县	3	330700	\N	1
2969	330781	兰溪市	3	330700	\N	1
2970	330782	义乌市	3	330700	\N	1
2971	330783	东阳市	3	330700	\N	1
2972	330784	永康市	3	330700	\N	1
2973	330800	衢州市	2	330000	\N	1
2974	330801	市辖区	3	330800	\N	1
2975	330802	柯城区	3	330800	\N	1
2976	330803	衢江区	3	330800	\N	1
2977	330822	常山县	3	330800	\N	1
2978	330824	开化县	3	330800	\N	1
2979	330825	龙游县	3	330800	\N	1
2980	330881	江山市	3	330800	\N	1
2981	330900	舟山市	2	330000	\N	1
2982	330901	市辖区	3	330900	\N	1
2983	330902	定海区	3	330900	\N	1
2984	330903	普陀区	3	330900	\N	1
2985	330921	岱山县	3	330900	\N	1
2986	330922	嵊泗县	3	330900	\N	1
2987	331000	台州市	2	330000	\N	1
2988	331001	市辖区	3	331000	\N	1
2989	331002	椒江区	3	331000	\N	1
2990	331003	黄岩区	3	331000	\N	1
2991	331004	路桥区	3	331000	\N	1
2992	331021	玉环县	3	331000	\N	1
2993	331022	三门县	3	331000	\N	1
2994	331023	天台县	3	331000	\N	1
2995	331024	仙居县	3	331000	\N	1
2996	331081	温岭市	3	331000	\N	1
2997	331082	临海市	3	331000	\N	1
2998	331100	丽水市	2	330000	\N	1
2999	331101	市辖区	3	331100	\N	1
3000	331102	莲都区	3	331100	\N	1
3001	331121	青田县	3	331100	\N	1
3002	331122	缙云县	3	331100	\N	1
3003	331123	遂昌县	3	331100	\N	1
3004	331124	松阳县	3	331100	\N	1
3005	331125	云和县	3	331100	\N	1
3006	331126	庆元县	3	331100	\N	1
3007	331127	景宁畲族自治县	3	331100	\N	1
3008	331181	龙泉市	3	331100	\N	1
3009	340000	安徽省	1	0	\N	1
3010	340100	合肥市	2	340000	\N	1
3011	4419	长平镇	3	\N	\N	1
3012	110000	北京市	1	0	\N	1
3013	110100	市辖区	2	110000	\N	1
3014	110101	东城区	3	110100	\N	1
3015	110102	西城区	3	110100	\N	1
3016	110103	崇文区	3	\N	\N	1
3017	110104	宣武区	3	\N	\N	1
3018	110105	朝阳区	3	110100	\N	1
3019	110106	丰台区	3	110100	\N	1
3020	110107	石景山区	3	110100	\N	1
3021	110108	海淀区	3	110100	\N	1
3022	110109	门头沟区	3	110100	\N	1
3023	110111	房山区	3	110100	\N	1
3024	110112	通州区	3	110100	\N	1
3025	110113	顺义区	3	110100	\N	1
3026	110114	昌平区	3	110100	\N	1
3027	110115	大兴区	3	110100	\N	1
3028	110116	怀柔区	3	110100	\N	1
3029	110117	平谷区	3	110100	\N	1
3030	110200	县	2	110000	\N	1
3031	110228	密云县	3	110100	\N	1
3032	110229	延庆县	3	110100	\N	1
3033	120000	天津市	1	0	\N	1
3034	120100	市辖区	2	120000	\N	1
3035	120101	和平区	3	120100	\N	1
3036	120102	河东区	3	120100	\N	1
3037	120103	河西区	3	120100	\N	1
3038	120104	南开区	3	120100	\N	1
3039	120105	河北区	3	120100	\N	1
3040	120106	红桥区	3	120100	\N	1
3041	120107	塘沽区	3	\N	\N	1
3042	120108	汉沽区	3	\N	\N	1
3043	120109	大港区	3	\N	\N	1
3044	120110	东丽区	3	120100	\N	1
3045	120111	西青区	3	120100	\N	1
3046	120112	津南区	3	120100	\N	1
3047	120113	北辰区	3	120100	\N	1
3048	120114	武清区	3	120100	\N	1
3049	120115	宝坻区	3	120100	\N	1
3050	120200	县	2	120000	\N	1
3051	120221	宁河县	3	120100	\N	1
3052	120223	静海县	3	120100	\N	1
3053	120225	蓟县	3	120100	\N	1
3054	130000	河北省	1	0	\N	1
3055	130100	石家庄市	2	130000	\N	1
3056	130101	市辖区	3	130100	\N	1
3057	130102	长安区	3	130100	\N	1
3058	130103	桥东区	3	\N	\N	1
3059	130104	桥西区	3	130100	\N	1
3060	130105	新华区	3	130100	\N	1
3061	130107	井陉矿区	3	130100	\N	1
3062	130108	裕华区	3	130100	\N	1
3063	130121	井陉县	3	130100	\N	1
3064	130123	正定县	3	130100	\N	1
3065	130124	栾城县	3	\N	\N	1
3066	130125	行唐县	3	130100	\N	1
3067	130126	灵寿县	3	130100	\N	1
3068	130127	高邑县	3	130100	\N	1
3069	130128	深泽县	3	130100	\N	1
3070	130129	赞皇县	3	130100	\N	1
3071	130130	无极县	3	130100	\N	1
3072	130131	平山县	3	130100	\N	1
3073	130132	元氏县	3	130100	\N	1
3074	130133	赵县	3	130100	\N	1
3075	130181	辛集市	3	130100	\N	1
3076	130182	藁城市	3	\N	\N	1
3077	130183	晋州市	3	130100	\N	1
3078	130184	新乐市	3	130100	\N	1
3079	130185	鹿泉市	3	\N	\N	1
3080	130200	唐山市	2	130000	\N	1
3081	130201	市辖区	3	130200	\N	1
3082	130202	路南区	3	130200	\N	1
3083	130203	路北区	3	130200	\N	1
3084	130204	古冶区	3	130200	\N	1
3085	130205	开平区	3	130200	\N	1
3086	130207	丰南区	3	130200	\N	1
3087	130208	丰润区	3	130200	\N	1
3088	130223	滦县	3	130200	\N	1
3089	130224	滦南县	3	130200	\N	1
3090	130225	乐亭县	3	130200	\N	1
3091	130227	迁西县	3	130200	\N	1
3092	130229	玉田县	3	130200	\N	1
3093	130230	唐海县	3	\N	\N	1
3094	130281	遵化市	3	130200	\N	1
3095	130283	迁安市	3	130200	\N	1
3096	130300	秦皇岛市	2	130000	\N	1
3097	130301	市辖区	3	130300	\N	1
3098	130302	海港区	3	130300	\N	1
3099	130303	山海关区	3	130300	\N	1
3100	130304	北戴河区	3	130300	\N	1
3101	130321	青龙满族自治县	3	130300	\N	1
3102	130322	昌黎县	3	130300	\N	1
3103	130323	抚宁县	3	130300	\N	1
3104	130324	卢龙县	3	130300	\N	1
3105	130400	邯郸市	2	130000	\N	1
3106	130401	市辖区	3	130400	\N	1
3107	130402	邯山区	3	130400	\N	1
3108	130403	丛台区	3	130400	\N	1
3109	130404	复兴区	3	130400	\N	1
3110	130406	峰峰矿区	3	130400	\N	1
3111	130421	邯郸县	3	130400	\N	1
3112	130423	临漳县	3	130400	\N	1
3113	130424	成安县	3	130400	\N	1
3114	130425	大名县	3	130400	\N	1
3115	130426	涉县	3	130400	\N	1
3116	130427	磁县	3	130400	\N	1
3117	130428	肥乡县	3	130400	\N	1
3118	130429	永年县	3	130400	\N	1
3119	130430	邱县	3	130400	\N	1
3120	130431	鸡泽县	3	130400	\N	1
3121	130432	广平县	3	130400	\N	1
3122	130433	馆陶县	3	130400	\N	1
3123	130434	魏县	3	130400	\N	1
3124	130435	曲周县	3	130400	\N	1
3125	130481	武安市	3	130400	\N	1
3126	130500	邢台市	2	130000	\N	1
3127	130501	市辖区	3	130500	\N	1
3128	130502	桥东区	3	130500	\N	1
3129	130503	桥西区	3	130500	\N	1
3130	130521	邢台县	3	130500	\N	1
3131	130522	临城县	3	130500	\N	1
3132	130523	内丘县	3	130500	\N	1
3133	130524	柏乡县	3	130500	\N	1
3134	130525	隆尧县	3	130500	\N	1
3135	130526	任县	3	130500	\N	1
3136	130528	宁晋县	3	130500	\N	1
3137	130529	巨鹿县	3	130500	\N	1
3138	130530	新河县	3	130500	\N	1
3139	130531	广宗县	3	130500	\N	1
3140	130532	平乡县	3	130500	\N	1
3141	130533	威县	3	130500	\N	1
3142	130534	清河县	3	130500	\N	1
3143	130535	临西县	3	130500	\N	1
3144	130581	南宫市	3	130500	\N	1
3145	130582	沙河市	3	130500	\N	1
3146	130600	保定市	2	130000	\N	1
3147	130601	市辖区	3	130600	\N	1
3148	130602	新市区	3	130600	\N	1
3149	130603	北市区	3	130600	\N	1
3150	130604	南市区	3	130600	\N	1
3151	130621	满城县	3	130600	\N	1
3152	130622	清苑县	3	130600	\N	1
3153	130623	涞水县	3	130600	\N	1
3154	130624	阜平县	3	130600	\N	1
3155	130625	徐水县	3	130600	\N	1
3156	130626	定兴县	3	130600	\N	1
3157	130627	唐县	3	130600	\N	1
3158	130628	高阳县	3	130600	\N	1
3159	130629	容城县	3	130600	\N	1
3160	130630	涞源县	3	130600	\N	1
3161	130631	望都县	3	130600	\N	1
3162	130632	安新县	3	130600	\N	1
3163	130633	易县	3	130600	\N	1
3164	130634	曲阳县	3	130600	\N	1
3165	130635	蠡县	3	130600	\N	1
3166	130636	顺平县	3	130600	\N	1
3167	130637	博野县	3	130600	\N	1
3168	130638	雄县	3	130600	\N	1
3169	130681	涿州市	3	130600	\N	1
3170	130682	定州市	3	130600	\N	1
3171	130683	安国市	3	130600	\N	1
3172	130684	高碑店市	3	130600	\N	1
3173	130700	张家口市	2	130000	\N	1
3174	130701	市辖区	3	130700	\N	1
3175	130702	桥东区	3	130700	\N	1
3176	130703	桥西区	3	130700	\N	1
3177	130705	宣化区	3	130700	\N	1
3178	130706	下花园区	3	130700	\N	1
3179	130721	宣化县	3	130700	\N	1
3180	130722	张北县	3	130700	\N	1
3181	130723	康保县	3	130700	\N	1
3182	130724	沽源县	3	130700	\N	1
3183	130725	尚义县	3	130700	\N	1
3184	130726	蔚县	3	130700	\N	1
3185	130727	阳原县	3	130700	\N	1
3186	130728	怀安县	3	130700	\N	1
3187	130729	万全县	3	130700	\N	1
3188	130730	怀来县	3	130700	\N	1
3189	130731	涿鹿县	3	130700	\N	1
3190	130732	赤城县	3	130700	\N	1
3191	130733	崇礼县	3	130700	\N	1
3192	130800	承德市	2	130000	\N	1
3193	130801	市辖区	3	130800	\N	1
3194	130802	双桥区	3	130800	\N	1
3195	130803	双滦区	3	130800	\N	1
3196	130804	鹰手营子矿区	3	130800	\N	1
3197	130821	承德县	3	130800	\N	1
3198	130822	兴隆县	3	130800	\N	1
3199	130823	平泉县	3	130800	\N	1
3200	130824	滦平县	3	130800	\N	1
3201	130825	隆化县	3	130800	\N	1
3202	130826	丰宁满族自治县	3	130800	\N	1
3203	130827	宽城满族自治县	3	130800	\N	1
3204	130828	围场满族蒙古族自治县	3	130800	\N	1
3205	130900	沧州市	2	130000	\N	1
3206	130901	市辖区	3	130900	\N	1
3207	130902	新华区	3	130900	\N	1
3208	130903	运河区	3	130900	\N	1
3209	130921	沧县	3	130900	\N	1
3210	130922	青县	3	130900	\N	1
3211	130923	东光县	3	130900	\N	1
3212	130924	海兴县	3	130900	\N	1
3213	130925	盐山县	3	130900	\N	1
3214	130926	肃宁县	3	130900	\N	1
3215	130927	南皮县	3	130900	\N	1
3216	130928	吴桥县	3	130900	\N	1
3217	130929	献县	3	130900	\N	1
3218	130930	孟村回族自治县	3	130900	\N	1
3219	130981	泊头市	3	130900	\N	1
3220	513230	壤塘县	3	513200	\N	1
3221	513231	阿坝县	3	513200	\N	1
3222	513232	若尔盖县	3	513200	\N	1
3223	513233	红原县	3	513200	\N	1
3224	513300	甘孜藏族自治州	2	510000	\N	1
3225	513321	康定县	3	513300	\N	1
3226	513322	泸定县	3	513300	\N	1
3227	513323	丹巴县	3	513300	\N	1
3228	513324	九龙县	3	513300	\N	1
3229	513325	雅江县	3	513300	\N	1
3230	513326	道孚县	3	513300	\N	1
3231	513327	炉霍县	3	513300	\N	1
3232	513328	甘孜县	3	513300	\N	1
3233	513329	新龙县	3	513300	\N	1
3234	513330	德格县	3	513300	\N	1
3235	513331	白玉县	3	513300	\N	1
3236	513332	石渠县	3	513300	\N	1
3237	513333	色达县	3	513300	\N	1
3238	330329	泰顺县	3	330300	\N	1
3239	513334	理塘县	3	513300	\N	1
3240	513335	巴塘县	3	513300	\N	1
3241	513336	乡城县	3	513300	\N	1
3242	513337	稻城县	3	513300	\N	1
3243	513338	得荣县	3	513300	\N	1
3244	513400	凉山彝族自治州	2	510000	\N	1
3245	513401	西昌市	3	513400	\N	1
3246	513422	木里藏族自治县	3	513400	\N	1
3247	513423	盐源县	3	513400	\N	1
3248	513424	德昌县	3	513400	\N	1
3249	513425	会理县	3	513400	\N	1
3250	513426	会东县	3	513400	\N	1
3251	513427	宁南县	3	513400	\N	1
\.


--
-- Data for Name: data_dictionary; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.data_dictionary (id, tree_node_type, father_id, label, type, value, order_num, remark, enable, attr_json) FROM stdin;
22	2	21	启动	IRCS_BASE_DATA_QUERY_STATE_START	3	1	\N	t	{"icon":"NO","btnType":"success"}
21	1	4	基础数据查询	IRCS_BASE_DATA_QUERY_STATE	1	4	\N	t	\N
34	1	1	基础数据核验相关字典分类	BASIC_DATA_VERIFICATION	2	2	\N	t	\N
35	1	34	核验结果	CHECK_THE_RESULTS	2	1	\N	t	\N
36	2	35	上报记录通过核验	CHECK_THE_RESULTS_PASS	0	1	\N	t	\N
37	2	35	上报数据与既有数据记录冲突	CHECK_THE_RESULTS_CONFLICT	1	2	\N	t	\N
38	2	35	上报数据内容不完整	CHECK_THE_RESULTS_INCOMPLETENESS	2	3	\N	t	\N
39	2	35	上报数据内容错误	CHECK_THE_RESULTS_CONTENT_ERROR	3	4	\N	t	\N
40	2	35	其他原因退回	CHECK_THE_RESULTS_SEND_BACK	4	5	\N	t	\N
43	1	34	节点ID	NODE_ID	3	5	\N	t	\N
44	2	43	用户ID	NODE_USER_ID	2	1	\N	t	\N
45	2	43	业务节点ID	NODE_BUSINESS_ID	1	2	\N	t	\N
56	2	50	导出最大值	ACT_FRAMEWORK_SYSTEM_INFO_EXPORT_ALL_SIZE	5000	4	Excel导出全部时导出的最大条数	t	{}
57	1	4	紧急程度	EMERGENCY_LEVEL	7	7	\N	t	{}
58	2	57	一般	GENERAL	1	1	\N	t	{}
59	2	57	紧急	URGENT	2	2	\N	t	{}
60	2	57	特急	EXTRA_URGENT	3	3	\N	t	{}
66	1	46	看板	ACT_BOARD	0	2	\N	t	{}
67	1	66	BI看板	ACT_BOARD_BI	0	0	\N	t	{"menuCode":"biDashboard"}
68	2	67	BI看板一	ACT_BOARD_BI_ONE	0	0	\N	t	{"background":"#20a8d8","icon":"fa fa-address-book","href":"http://www.baidu.com","title":"BI看板一"}
69	2	67	BI看板二	ACT_BOARD_BI_TWO	1	1	\N	t	{"background":"#63c2de","icon":"fa fa-codiepie","href":"http://www.sina.com","title":"看板二"}
70	2	67	BI看板三	ACT_BOARD_BI_THREE	2	2	\N	t	{"background":"#ffc107","icon":"fa fa-codepen","href":"http://www.qq.com","title":"看板三"}
12	1	4	信安策略过滤状态	STRATEGY_STATE_FILTER_STANDARD	2	2	\N	t	\N
13	2	12	未启动	STRATEGY_STATE_FILTER_STANDARD_NOT_START	0	1	\N	t	{"icon":"NO","btnType":"primary"}
14	2	12	启动	STRATEGY_STATE_FILTER_STANDARD_START	3	2	\N	t	{"icon":"NO","btnType":"success"}
15	2	12	停止	STRATEGY_STATE_FILTER_STANDARD_STOP	4	3	\N	t	{"icon":"NO","btnType":"danger"}
16	2	12	结束	STRATEGY_STATE_FILTER_STANDARD_END	99	4	\N	t	{"icon":"NO","btnType":"primary"}
17	1	4	信安黑名单状态	BLACKLIST_STATE	3	3	\N	t	\N
18	2	17	未启动	BLACKLIST_STATE_NOT_START	0	0	\N	t	{"icon":"NO","btnType":"primary"}
19	2	17	启动	BLACKLIST_STATE_START	3	1	\N	t	{"icon":"NO","btnType":"success"}
20	2	17	停止	BLACKLIST_STATE_END	4	2	\N	t	{"icon":"NO","btnType":"danger"}
42	2	23	停止	 CS_PUBLIC_QUERY_STOP	4	2	\N	t	{"icon":"NO","btnType":"danger"}
23	1	4	部省公共查询请求状态	CS_PUBLIC_QUERY	5	5	\N	t	\N
24	2	23	未启动	CS_PUBLIC_QUERY_NOT_START	0	0	\N	t	{"icon":"NO","btnType":"primary"}
25	2	23	启动	CS_PUBLIC_QUERY_START	3	1	\N	t	{"icon":"NO","btnType":"success"}
52	2	50	系统简称	ACT_FRAMEWORK_SYSTEM_INFO_SYSTEM_NAME_SHORT	<b>D</b>ns	1	\N	t	{}
53	2	50	浏览器标题	ACT_FRAMEWORK_SYSTEM_INFO_BROWSER_TITLE	欢迎使用DNS系统	2	\N	t	{}
96	2	94	hao123Iframe	ACT_FRAMEWORK_IFRAME_GOOGLE	http://hao123.com	1	\N	t	{"menuCode":"hao123Iframe"}
101	2	99	启动	LOG_PARAM_STATUS_START	2	2	\N	t	{"icon":"NO","btnType":"success"}
102	2	99	停止	LOG_PARAM_STATUS_STOP	3	3	\N	t	{"icon":"NO","btnType":"danger"}
4	1	1	策略业务相关字典分类	STRATEGY_BUSINESS_DICT_CLASS	1	0	策略业务相关字典分类	t	\N
5	1	4	信安策略状态	STRATEGY_STATE_STANDARD	1	0	信安策略状态	t	\N
6	2	5	待审核	STRATEGY_STATE_STANDARD_UNAUDIT	0	0	\N	t	{"icon":"NO","btnType":"primary"}
7	2	5	审核通过	STRATEGY_STATE_STANDARD_PASS	1	1	\N	t	{"icon":"NO","btnType":"success"}
8	2	5	审核不通过	STRATEGY_STATE_STANDARD_DECLINE	2	2	\N	t	{"icon":"NO","btnType":"warning"}
9	2	5	启动	STRATEGY_STATE_STANDARD_RUN	3	3	\N	t	{"icon":"NO","btnType":"success"}
10	2	5	停止	STRATEGY_STATE_STANDARD_STOP	4	4	\N	t	{"icon":"NO","btnType":"danger"}
11	2	5	结束	STRATEGY_STATE_STANDARD_END	99	4	\N	t	{"icon":"NO","btnType":"primary"}
27	1	4	部省处置请求	STRATEGY_STATE_REQHANDLE	6	6	\N	t	\N
28	2	27	未启动	STRATEGY_STATE_REQHANDLE_NOT_START	0	1	\N	t	{"icon":"NO","btnType":"primary"}
29	2	27	审核通过	STRATEGY_STATE_REQHANDLE_PASS	1	2	\N	t	{"icon":"NO","btnType":"success"}
30	2	27	审核不通过	STRATEGY_STATE_REQHANDLE_DECLINE	2	3	\N	t	{"icon":"NO","btnType":"warning"}
31	2	27	启动	STRATEGY_STATE_START	3	4	\N	t	{"icon":"NO","btnType":"success"}
32	2	27	停止	STRATEGY_STATE_REQHANDLE_STOP 	4	5	\N	t	{"icon":"NO","btnType":"danger"}
33	2	27	结束	STRATEGY_STATE_REQHANDLE_END	99	6	\N	t	{"icon":"NO","btnType":"primary"}
46	1	1	系统属性配置	ACT_FRAMEWORK	0	99	\N	t	{}
47	1	46	主题	ACT_FRAMEWORK_THEMES	0	0	\N	t	{}
48	2	47	炫酷蓝	ACT_FRAMEWORK_THEMES_BLUE	0	0	\N	t	{"bg":"sidebar-mini skin-blue","style":"background: #324fa9;"}
49	2	47	冷酷黑	ACT_FRAMEWORK_THEMES_BLACK	1	1	\N	t	{"bg":"sidebar-mini skin-black","style":"background: #141414;"}
99	1	4	日志参数状态	LOG_PARAM_STATUS	8	8	日志参数运行状态	t	{}
100	2	99	未启动	LOG_PARAM_STATUS_NOTSTART	1	1	\N	t	{"icon":"NO","btnType":"primary"}
1	0	1	根节点	ROOT	0	0	\N	t	\N
50	1	46	系统信息	ACT_FRAMEWORK_SYSTEM_INFO	0	1	\N	t	{}
41	2	21	未启动	IRCS_BASE_DATA_QUERY_STATE_NOT_START	0	0	\N	t	{"icon":"NO","btnType":"primary"}
51	2	50	系统名称	ACT_FRAMEWORK_SYSTEM_INFO_SYSTEM_NAME	域名服务信息安全管理系统务信息	0	\N	t	{}
54	1	50	跳转入口	ACT_FRAMEWORK_SYSTEM_INFO_ENTRY	0	3	\N	t	{}
55	2	54	DNS大屏	ACT_FRAMEWORK_SYSTEM_INFO_ENTRY_DNS1	entryMon.html	0	\N	t	{"class":"fa fa-map-o"}
61	1	1	特定域名处置类型	COMMAND_DISPOSAL_TYPE	3	3	\N	t	{}
62	2	61	停止解析	COMMAND_DISPOSAL_TYPE_STOP_PARSING	1	1	\N	t	{}
63	2	61	域名锁定转移	COMMAND_DISPOSAL_TYPE_DOMAIN_LOCK_TRANSFER	2	2	\N	t	{}
64	2	61	清除缓存	COMMAND_DISPOSAL_TYPE_CLEAR_CACHE	3	3	\N	t	{}
72	2	71	军队	ORGAN_ID_NATURE_ARMY	1	1	\N	t	{}
71	1	1	机构单位性质	ORGAN_ID_NATURE	4	4	\N	t	{}
73	2	71	政府机关	ORGAN_ID_NATURE_ GOVERNMENT 	2	2	\N	t	{}
74	2	71	事业单位	ORGAN_ID_PUBLIC_INSTITUTION	3	3	\N	t	{}
75	2	71	企业	ORGAN_ID_COMPANY	4	4	\N	t	{}
76	2	71	个人	ORGAN_ID_PERSONAL	5	5	\N	t	{}
77	2	71	社会团体	ORGAN_ID_SOCIAL GROUPS	6	6	\N	t	{}
78	2	71	个体工商户	ORGAN_ID_INDIVIDUAL_BUSINESS	8	7	\N	t	{}
79	2	71	民办非企业	ORGAN_ID_PRIVATE_NON_ENTERPRISE	9	8	\N	t	{}
80	2	71	基金会	ORGAN_ID_THE_FOUNDATION	10	9	\N	t	{}
81	2	71	律师事务所	ORGAN_ID_LAW_FIRM	11	10	\N	t	{}
82	2	71	其它	ORGAN_ID_OTHERS	999	11	\N	t	{}
83	1	1	证件类型代码	CODE_TYPE	5	5	\N	t	{}
84	2	83	工商营业执照号码	CODE_TYPE_BUSINESS_LICENSE_NUMBER	1	1	\N	t	{}
85	2	83	身份证	CODE_TYPE_IDENTIFICATION_CARD	2	2	\N	t	{}
86	2	83	组织机构代码证书	CODE_TYPE_ORGANIZATION_CODE_CERTIFICATE	3	3	\N	t	{}
87	2	83	事业法人证书	CODE_TYPE_BUSINESS_LEGAL_PERSON_CERTIFICATE	4	4	\N	t	{}
88	2	83	军队代号	CODE_TYPE_ARMY_CODE	5	5	\N	t	{}
89	2	83	社团法人证书	CODE_TYPE_CORPORATE_LEGAL_CERTIFICATE	6	6	\N	t	{}
90	2	83	护照	CODE_TYPE_PASSPORT	7	7	\N	t	{}
91	2	83	军官证	CODE_TYPE_CERTIFICATE_OFFICERS	8	8	\N	t	{}
92	2	83	台胞证	CODE_TYPE_TAIWAN_COMPATRIOTS_CERTIFICATE	9	9	\N	t	{}
93	2	83	其它	CODE_TYPE_OTHERS	999	10	\N	t	{}
94	1	46	iframe	ACT_FRAMEWORK_IFRAME	4	4	\N	t	{}
95	2	94	百度iframe	ACT_FRAMEWORK_IFRAME_BAIDU	http://www.baidu.com	0	\N	t	{"menuCode":"baiduIframe"}
108	2	104	系统简称	DNS1_SUBSYS_ACT_FRAMEWORK_SYSTEM_INFO_SYSTEM_NAME_SHORT	dns1	2	\N	t	{}
109	2	104	跳转入口	DNS1_SUBSYS_ACT_FRAMEWORK_SYSTEM_INFO_ENTRY	0	3	\N	t	{}
112	2	110	域名模块	ACT_FRAMEWORK_SYSTEM_INFO_MODEL_TYPE_SMMS	smms	1	\N	t	{}
103	1	46	子系统信息	SUBSYS_ACT_FRAMEWORK_SYSTEM_INFO	0	4	\N	t	{}
104	1	103	DNS测试子系统1	DNS1_SUBSYS_ACT_FRAMEWORK_SYSTEM_INFO	0	0	\N	t	{}
105	2	103	DNS测试子系统2	DNS2_SUBSYS_ACT_FRAMEWORK_SYSTEM_INFO	0	1	\N	t	{}
106	2	104	系统名称	DNS1_SUBSYS_ACT_FRAMEWORK_SYSTEM_INFO_SYSTEM_NAME	DNS子系统1	0	\N	t	{}
107	2	104	浏览器标题	DNS1_SUBSYS_ACT_FRAMEWORK_SYSTEM_INFO_BROWSER_TITLE	欢迎使用测试子系统1	1	\N	t	{}
110	1	50	模块类型	ACT_FRAMEWORK_SYSTEM_INFO_MODEL_TYPE	0	6	\N	t	{}
111	2	110	框架模块	ACT_FRAMEWORK_SYSTEM_INFO_MODEL_TYPE_FRAMEWORK	framework	0	\N	t	{}
\.


--
-- Data for Name: menu_element; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.menu_element (id, menu_id, element_name) FROM stdin;
\.


--
-- Data for Name: message_info; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.message_info (id, user_id, title, content, create_time, is_read) FROM stdin;
1	24	消息1	内容内容内容1111	2017-11-15 00:00:04	f
2	6	消息2	消息嘻嘻嘻	2017-11-15 00:00:01	f
3	6	消息3	是的发生的	2017-11-15 12:00:00	f
\.


--
-- Data for Name: operation_log; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.operation_log (id, username, ip, log_type, message, menu_path, router_path, api, proceed_time, "time") FROM stdin;
\.


--
-- Data for Name: resource_access; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.resource_access (id, ant_resource, authorization_type) FROM stdin;
16	/captcha	2
17	/login.html	6
18	/framework/web/versionInfo/**	6
1	/login	6
2	/logout	6
3	/img/**	2
4	/assets/**	2
5	/*.js	2
6	/**.png	2
7	/**.jpg	2
8	/**.doc	2
9	/**.xlsx	2
10	/**.docx	2
11	/favicon.ico	6
12	/favicon	6
\.


--
-- Data for Name: role_menu; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.role_menu (id, role_id, menu_id) FROM stdin;
887	4	12
888	4	13
889	4	14
890	4	15
891	4	19
892	4	20
893	4	34
894	4	35
895	4	37
1495	1	4
1496	1	8
1497	1	9
1498	1	10
1499	1	12
1500	1	13
1501	1	14
1502	1	15
1503	1	18
1504	1	19
1505	1	20
1506	1	21
1507	1	22
1508	1	23
1509	1	24
1510	1	26
1511	1	27
1512	1	29
1513	1	31
1514	1	32
1515	1	33
1516	1	34
1517	1	35
1518	1	36
1519	1	37
1520	1	38
1521	1	39
1522	1	40
1523	1	41
1524	1	44
1525	1	46
1526	1	47
1527	1	48
1528	1	49
1529	1	50
1530	1	51
1531	1	52
1532	1	53
1533	1	54
1534	1	55
1535	1	57
1536	1	60
1537	1	61
1538	1	63
1539	1	64
1540	1	67
1541	1	68
1448	2	4
1449	2	8
1450	2	9
1451	2	10
1452	2	12
1453	2	13
1454	2	14
1455	2	15
1456	2	18
1457	2	19
1458	2	20
1459	2	21
1460	2	22
1461	2	23
1462	2	24
1463	2	26
1464	2	27
1465	2	29
1466	2	31
1467	2	32
1468	2	33
1469	2	34
1470	2	35
1471	2	36
1472	2	37
1473	2	38
1474	2	39
1475	2	40
1476	2	41
1477	2	44
1478	2	46
1479	2	47
1480	2	48
1481	2	49
1482	2	50
1483	2	51
1484	2	52
1485	2	53
1486	2	54
1487	2	55
1488	2	57
1489	2	60
1490	2	61
1491	2	63
1492	2	64
1493	2	67
1494	2	68
\.


--
-- Data for Name: role_menu_element_relatioin; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.role_menu_element_relatioin (id, role_id, element_id, menu_id) FROM stdin;
\.


--
-- Data for Name: system_menu; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.system_menu (id, father_id, tree_node_type, order_num, menu_path, menu_name, menu_code, menu_icon, remark, is_visible, is_new_window) FROM stdin;
19	11	2	2	/smms/gj/basic/domainRecursiveOrg	递归解析服务机构	domainRecursiveOrg	no	展示省内递归解析服务机构信息，并提供查询功能包括单位名称、许可证编号、企业法人等	t	f
20	11	2	1	/smms/gj/basic/domainRegistServer	域名注册服务机构	domainRegistServer	no	实现对域名注册服务机构上报的机构信息的查询，包括单位名称、许可证编号、企业法人等	t	f
23	17	2	3	/smms/gj/dynamicResource/RecursiveParseRecord	递归解析记录	recursiveParseRecord	f	\N	f	f
25	2	1	3	\N	违规域名管理	illegalDomainManage	fa fa-eye-slash	\N	t	f
26	25	2	1	/smms/gj/illegalDomainManage/websiteMonitor	特定域名监测	websiteMonitor	f	管局可下发特定域名监测指令，企业接收指令并按照指令起止时间要求对特定域名进行监测，并上报域名解析日志，包括域名、源IP、目的IP、访问时间等	t	f
32	30	2	2	/smms/gj/apply/csCollaborateTask	省级协办	csCollaborateTask	f	通过部省接口，管局系统可向部系统发起省级协办任务，包括省级监测指令、省级过滤指令；	t	f
33	30	2	3	/smms/gj/apply/superviseInstruct	监测指令	superviseInstruct	f	同步接收部平台下发的违法违规监测指令，并向部平台上报监测结果	t	f
40	30	2	9	/smms/gj/apply/suspectedIssued	疑似与异常数据推送	suspectedIssued	f	接收工信部下发的疑似数据，并下发到企业侧系统，企业根据下发内容进行相应本地操作	t	f
53	3	2	3	/system/systemDictionary	数据字典	systemDictionary	f	这里是数据字典配置页面	t	f
55	25	2	7	/smms/gj/illegalDomainManage/blackResult	黑名单结果	blackResult	fa fa-edit	黑名单结果日志	f	f
57	3	2	0	/system/biDashboard	看板	biDashboard	none	\N	t	f
11	2	1	1	\N	基础资源	basic	fa fa-book	我是基础资源	t	f
12	11	2	4	/smms/gj/basic/trustDomainInfo	托管域名信息	trustDomainInfo	f	展示权威解析机构上报的托管域名信息，并提供查询功能，接收并展示权威解析服务机构信息，包括：域名、老化时间、托管开始时间等	t	f
14	11	2	6	/smms/gj/basic/nodeInfo	业务节点信息	nodeInfo	f	展示权威解析机构、递归解析机构的业务节点信息，并提供查询功能	t	f
15	11	2	3	/smms/gj/basic/domainAuthorityOrg	权威解析服务机构	domainAuthorityOrg	no	展示省内权威解析服务机构信息，并提供查询功能，包括单位名称、许可证编号、企业法人等	t	f
27	17	2	6	/smms/gj/dynamicResource/domainRecursion	递归解析信息查询	domainRecursion	f	管局可下发域名递归解析查询指令，企业接收指令，并根据指令要求上报域名递归解析记录信息，包括：域名、IP地址、老化时间、权威解析服务器IP地址等	t	f
24	17	2	5	/smms/gj/dynamicResource/iRCSBaseData	基础数据查询	iRCSBaseData	f	基础数据查询	t	f
35	11	2	8	/smms/gj/basic/serveroomLinkInfo	链路详情	serveroomLinkInfo	f	链路详情	f	f
30	2	1	4	\N	部省应用	apply	fa fa-linode	部省应用	t	f
54	25	2	0	/smms/gj/illegalDomainManage/composeDispose	组合处置	composeDispose	No	组合处置	t	f
44	30	2	7	/smms/gj/apply/csCollaborateTaskReceive	省级协办-任务执行	csCollaborateTaskReceive	f	省级协办-任务执行	f	f
13	11	2	5	/smms/gj/basic/domainInfos	注册域名信息	domainInfos	f	接收并展示域名注册服务机构上报的注册域名信息，并提供方便的查询功能	t	f
17	2	1	2	\N	动态资源	dynamicResource	fa fa-tachometer	动态资源	t	f
18	17	2	4	/smms/gj/dynamicResource/dataVerify	基础数据核验记录	dataVerify	f	对基础数据的格式进行核验，主动发现异常数据	t	f
21	17	2	1	/smms/gj/dynamicResource/domainVisitCount	域名解析量	domainVisitCount	f	查询域名1小时内的访问量，企业是按照小时上报。	t	f
39	30	2	6	/smms/gj/apply/queryReq	查询请求	queryReq	f	\N	t	f
47	25	2	4	/smms/gj/illegalDomainManage/monitorResult	监测结果	monitorResult	f	\N	f	f
61	3	2	0	/system/iframeBoard	hao123Iframe	hao123Iframe	null	\N	t	f
22	17	2	2	/smms/gj/dynamicResource/authorityOperateLog	权威解析操作日志	authorityOperateLog	f	展示权威解析服务机构上报的权威解析操作日志，包括域名、IP、操作类型（启动、暂停等）	t	f
34	11	2	7	/smms/gj/basic/serviceOrgInfo	代理机构详情	serviceOrgInfo	f	\N	f	f
38	25	2	3	/smms/gj/illegalDomainManage/blackList	黑名单网站	blacklist	f	1、展示工信部下发的黑名单网站；2、展示黑名单网站执行情况。	t	f
48	25	2	5	/smms/gj/illegalDomainManage/filterResult	处置结果	filterResult	f	\N	f	f
51	3	2	8	/smms/gj/system/enterpriseInfo	企业信息配置	enterpriseInfo	f	\N	t	f
60	3	2	0	/system/iframeBoard	百度iframe	baiduIframe	null	iframe支持页	t	f
1	1	0	0	/	主页	dnsIndex	\N	我是主页说明	t	f
2	1	1	0	/smms/gj/welcome	DNS系统	dnsIndex	fa fa-shield	我是DNS系统说明	t	f
3	2	1	10	\N	系统设置	system	el-icon-share	我是系统设置说明	t	f
4	3	2	5	/system/operationLog	操作日志	operationLog	fs	我是操作日志说明	t	f
9	3	2	1	/system/systemRole	角色管理	systemRole	f	系统管理员可配置各个用户的角色信息	t	f
8	3	2	2	/system/systemMenu	系统菜单	systemMenu	f	我是系统菜单	t	f
10	3	2	0	/system/systemUser	用户管理	systemUser	f	根据实际业务需要，可为各个用户配置相应的账号信息，以供查看与自己相关的数据	t	f
29	3	2	0	/system/workFlow	工作流配置	workFlow	f	在这里进行工作流配置	t	f
31	30	2	1	/smms/gj/apply/reqHandle	处置请求	reqHandle	f	管局可向部系统申请对违规域名的处置请求	t	f
36	25	2	2	/smms/gj/illegalDomainManage/websiteDispose	特定域名处置	websiteDispose	f	管局可下发违法违规域名处置指令到企业侧系统，企业侧系统按照指令时限要求对域名进行处置，并上报处置结果	f	f
37	11	2	9	/smms/gj/basic/serveroomServerInfo	服务器数量详情	serveroomServerInfo	f	服务器数量详情	f	f
41	30	2	8	/smms/gj/apply/suspectedIssuedToHandle	疑似与异常数据反馈处理指令	suspectedIssuedToHandle	f	\N	f	f
46	30	2	4	/smms/gj/apply/processInstruct	过滤指令	processInstruct	f	\N	t	f
49	3	2	6	/smms/gj/system/paramManage	信安参数管理	paramManage	f	\N	t	f
50	3	2	7	/smms/gj/system/isCode	代码表管理	isCode	f	SMMS通过接口将系统所用代码全量下发给企业侧系统，企业系统根据下发的代码更新本地代码	t	f
52	3	2	9	/smms/gj/system/logParam	日志参数	logParam	f	可通过此功能，设置是否全量上报DNS日志文件	t	f
63	30	2	10	/smms/gj/apply/collaborateData	协办数据	collaborateData	f	\N	t	f
64	11	2	0	/smms/gj/basic/demo	demo	demo	fa fa-edit	\N	t	f
65	1	1	1	/smms/gj/welcome	DNS子系统	dns1_subsys	fa fa-edit	\N	t	f
66	65	1	0	\N	测试菜单1	test1	fa fa-edit	\N	t	f
67	66	2	0	/smms/gj/apply/collaborateData	测试菜单2	test2	fa fa-edit	\N	t	f
68	30	2	5	/smms/gj/apply/recursionInstruct	递归指令	recursionInstruct	f	\N	t	f
\.


--
-- Data for Name: system_role; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.system_role (id, father_id, tree_node_type, order_num, rolename, remark) FROM stdin;
1	1	0	0	superAdmin	根节点
2	1	1	0	管理员角色	Commony用户
4	1	1	0	普通用户角色	\N
8	2	1	0	维护者角色	\N
\.


--
-- Data for Name: system_user; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.system_user (id, username, display_name, password, phone, email, addr, remark, enable, layout, theme) FROM stdin;
6	manager	系统管理员	8ba5f68f2e13f920bec17ac9b19c36c0	13498989898	zhangpeng@act-telecom.com	\N	\N	t	left	sidebar-mini skin-blue
7	maintainer	系统维护员	8ba5f68f2e13f920bec17ac9b19c36c0	13456789876	zhangpeng@act-telecom.com	\N	\N	t	left	sidebar-mini skin-blue
8	user1	用户1	8ba5f68f2e13f920bec17ac9b19c36c0	13456765456	zhangpeng@act-telecom.com	\N	www	t	left	sidebar-mini skin-blue
\.


--
-- Data for Name: tb_my_favorites; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.tb_my_favorites (id, user_id, menu_id, click_count, is_favorite) FROM stdin;
2	6	29	2	f
1	6	10	3	t
4	6	57	1	f
5	6	9	1	f
3	6	8	2	f
6	6	4	1	f
7	6	53	1	f
8	6	49	1	f
9	6	50	1	f
10	6	51	1	f
11	6	52	1	f
\.


--
-- Data for Name: user_role_relation; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.user_role_relation (id, user_id, role_id) FROM stdin;
22	6	2
11	7	8
14	8	4
\.


--
-- Data for Name: version_info; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.version_info (id, version_no, version_content, name, report_date, general_no, first_report_date, is_visible, display_label, publish_date) FROM stdin;
\.


--
-- Data for Name: wf_business; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.wf_business (id, business_type, business_name) FROM stdin;
92	1043	违规域名监测
93	1023	违规域名处置
94	10	基础数据核验
95	1070	黑名单网站
96	2000	基础数据查询
97	102	部省公共查询请求
98	2006	域名递归解析信息查询
99	2005	疑似与异常数据推送指令
100	2001	部省应用处置请求
101	100	省级协办提出业务
102	101	省级协办执行省业务
103	2010	日志参数
104	1060	代码表
\.


--
-- Data for Name: wf_state; Type: TABLE DATA; Schema: public; Owner: ads
--

COPY public.wf_state (id, state_id, state_name, business_type, class_aliax, icon_class, front_state_json, wf_page_types, next_state_id_str, role_id, user_id, is_branch, bus_state_map_json, is_batch, is_head) FROM stdin;
\.


--
-- Name: api_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.api_access_id_seq', 1, false);


--
-- Name: api_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.api_id_seq', 1, false);


--
-- Name: area_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.area_info_id_seq', 3524, false);


--
-- Name: data_dictionary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.data_dictionary_id_seq', 113, false);


--
-- Name: menu_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.menu_element_id_seq', 1, false);


--
-- Name: message_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.message_info_id_seq', 4, false);


--
-- Name: operation_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.operation_log_id_seq', 1, false);


--
-- Name: resource_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.resource_access_id_seq', 19, false);


--
-- Name: role_menu_element_relatioin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.role_menu_element_relatioin_id_seq', 1, false);


--
-- Name: role_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.role_menu_id_seq', 1542, false);


--
-- Name: system_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.system_menu_id_seq', 69, false);


--
-- Name: system_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.system_role_id_seq', 9, false);


--
-- Name: system_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.system_user_id_seq', 26, false);


--
-- Name: tb_my_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.tb_my_favorites_id_seq', 11, true);


--
-- Name: user_role_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.user_role_relation_id_seq', 86, false);


--
-- Name: version_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.version_info_id_seq', 1, false);


--
-- Name: wf_business_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.wf_business_id_seq', 104, true);


--
-- Name: wf_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ads
--

SELECT pg_catalog.setval('public.wf_state_id_seq', 1, false);


--
-- Name: api_access API_ACCESS_pkey; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.api_access
    ADD CONSTRAINT "API_ACCESS_pkey" PRIMARY KEY (id);


--
-- Name: api API_pkey; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.api
    ADD CONSTRAINT "API_pkey" PRIMARY KEY (id);


--
-- Name: area_info area_info_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.area_info
    ADD CONSTRAINT area_info_id_pk PRIMARY KEY (id);


--
-- Name: data_dictionary data_dictionary_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.data_dictionary
    ADD CONSTRAINT data_dictionary_id_pk PRIMARY KEY (id);


--
-- Name: menu_element menu_element_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.menu_element
    ADD CONSTRAINT menu_element_id_pk PRIMARY KEY (id);


--
-- Name: message_info message_info_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.message_info
    ADD CONSTRAINT message_info_id_pk PRIMARY KEY (id);


--
-- Name: operation_log operation_log_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.operation_log
    ADD CONSTRAINT operation_log_id_pk PRIMARY KEY (id);


--
-- Name: resource_access resource_access_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.resource_access
    ADD CONSTRAINT resource_access_id_pk PRIMARY KEY (id);


--
-- Name: role_menu_element_relatioin role_menu_element_relatioin_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.role_menu_element_relatioin
    ADD CONSTRAINT role_menu_element_relatioin_id_pk PRIMARY KEY (id);


--
-- Name: role_menu role_menu_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.role_menu
    ADD CONSTRAINT role_menu_id_pk PRIMARY KEY (id);


--
-- Name: system_menu system_menu_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.system_menu
    ADD CONSTRAINT system_menu_id_pk PRIMARY KEY (id);


--
-- Name: system_role system_role_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.system_role
    ADD CONSTRAINT system_role_id_pk PRIMARY KEY (id);


--
-- Name: system_user system_user_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.system_user
    ADD CONSTRAINT system_user_id_pk PRIMARY KEY (id);


--
-- Name: tb_my_favorites tb_my_favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.tb_my_favorites
    ADD CONSTRAINT tb_my_favourites_pkey PRIMARY KEY (id);


--
-- Name: user_role_relation user_role_relation_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.user_role_relation
    ADD CONSTRAINT user_role_relation_id_pk PRIMARY KEY (id);


--
-- Name: version_info version_info_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.version_info
    ADD CONSTRAINT version_info_id_pk PRIMARY KEY (id);


--
-- Name: wf_business wf_business_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.wf_business
    ADD CONSTRAINT wf_business_id_pk PRIMARY KEY (id);


--
-- Name: wf_state wf_state_id_pk; Type: CONSTRAINT; Schema: public; Owner: ads
--

ALTER TABLE ONLY public.wf_state
    ADD CONSTRAINT wf_state_id_pk PRIMARY KEY (id);


--
-- Name: area_info_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX area_info_id_uindex ON public.area_info USING btree (id);


--
-- Name: data_dictionary_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX data_dictionary_id_uindex ON public.data_dictionary USING btree (id);


--
-- Name: menu_element_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX menu_element_id_uindex ON public.menu_element USING btree (id);


--
-- Name: message_info_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX message_info_id_uindex ON public.message_info USING btree (id);


--
-- Name: operation_log_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX operation_log_id_uindex ON public.operation_log USING btree (id);


--
-- Name: resource_access_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX resource_access_id_uindex ON public.resource_access USING btree (id);


--
-- Name: role_menu_element_relatioin_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX role_menu_element_relatioin_id_uindex ON public.role_menu_element_relatioin USING btree (id);


--
-- Name: role_menu_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX role_menu_id_uindex ON public.role_menu USING btree (id);


--
-- Name: system_menu_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX system_menu_id_uindex ON public.system_menu USING btree (id);


--
-- Name: system_role_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX system_role_id_uindex ON public.system_role USING btree (id);


--
-- Name: system_user_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX system_user_id_uindex ON public.system_user USING btree (id);


--
-- Name: tb_my_favourites_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX tb_my_favourites_id_uindex ON public.tb_my_favorites USING btree (id);


--
-- Name: user_role_relation_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX user_role_relation_id_uindex ON public.user_role_relation USING btree (id);


--
-- Name: version_info_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX version_info_id_uindex ON public.version_info USING btree (id);


--
-- Name: wf_business_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX wf_business_id_uindex ON public.wf_business USING btree (id);


--
-- Name: wf_state_id_uindex; Type: INDEX; Schema: public; Owner: ads
--

CREATE UNIQUE INDEX wf_state_id_uindex ON public.wf_state USING btree (id);


--
-- PostgreSQL database dump complete
--

