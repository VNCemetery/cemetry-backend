--
-- TOC entry 230 (class 1259 OID 74016)
-- Name: cell_vertices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cell_vertices (
                                      cell_id bigint NOT NULL,
                                      vertex_id bigint NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 74021)
-- Name: cells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cells (
                              id bigint NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 74026)
-- Name: contributions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contributions (
                                      id uuid NOT NULL,
                                      created_at timestamp(6) without time zone,
                                      updated_at timestamp(6) without time zone,
                                      content character varying(255),
                                      deleted boolean NOT NULL,
                                      processed boolean NOT NULL,
                                      martyr_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 74031)
-- Name: edges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.edges (
                              id bigint NOT NULL,
                              distance numeric(20,15) DEFAULT 0,
                              one_way boolean NOT NULL,
                              vertex1_id bigint,
                              vertex2_id bigint
);

--
-- TOC entry 234 (class 1259 OID 74037)
-- Name: grave_rows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grave_rows (
                                   id bigint NOT NULL,
                                   created_at timestamp(6) without time zone,
                                   updated_at timestamp(6) without time zone,
                                   area_name character varying(255),
                                   row_name character varying(255),
                                   vertex1_id bigint,
                                   vertex2_id bigint
);


--
-- TOC entry 235 (class 1259 OID 74044)
-- Name: logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logs (
                             id uuid NOT NULL,
                             action character varying(255) NOT NULL,
                             resource character varying(255),
                             "timestamp" timestamp(6) without time zone,
                             user_id uuid
);


--
-- TOC entry 236 (class 1259 OID 74051)
-- Name: martyr_graves; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.martyr_graves (
                                      id uuid NOT NULL,
                                      created_at timestamp(6) without time zone,
                                      updated_at timestamp(6) without time zone,
                                      additional_field1 character varying(255),
                                      additional_field2 character varying(255),
                                      additional_field3 character varying(255),
                                      additional_field4 character varying(255),
                                      code_name character varying(255),
                                      commune character varying(255),
                                      date_of_death character varying(255),
                                      date_of_enlistment character varying(255),
                                      dieu_chinh character varying(255),
                                      district character varying(255),
                                      full_name character varying(255),
                                      home_town character varying(255),
                                      image character varying(255),
                                      name character varying(255),
                                      ngay_thang_nam character varying(255),
                                      note character varying(255),
                                      place_of_exhumation character varying(255),
                                      quy_tap character varying(255),
                                      rank_position_unit character varying(255),
                                      year_of_birth character varying(255),
                                      grave_row_id bigint
);


--
-- TOC entry 237 (class 1259 OID 74058)
-- Name: path_vertices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.path_vertices (
                                      path_id uuid NOT NULL,
                                      vertex_id bigint NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 74061)
-- Name: paths; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.paths (
                              id uuid NOT NULL,
                              is_good boolean
);


--
-- TOC entry 239 (class 1259 OID 74066)
-- Name: refresh_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.refresh_tokens (
                                       id uuid NOT NULL,
                                       expires_at timestamp(6) without time zone NOT NULL,
                                       token character varying(255) NOT NULL,
                                       user_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 74071)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
                              id uuid NOT NULL,
                              created_at timestamp(6) without time zone,
                              updated_at timestamp(6) without time zone,
                              email character varying(255),
                              password character varying(255) NOT NULL,
                              username character varying(255)
);


--
-- TOC entry 241 (class 1259 OID 74078)
-- Name: verify_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.verify_codes (
                                     id uuid NOT NULL,
                                     code character varying(255),
                                     created_at timestamp(6) without time zone,
                                     expired_at timestamp(6) without time zone,
                                     user_id uuid
);


--
-- TOC entry 242 (class 1259 OID 74083)
-- Name: vertices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vertices (
                                 id bigint NOT NULL,
                                 geom public.geometry(Point,4326),
                                 latitude double precision NOT NULL,
                                 longitude double precision NOT NULL
);

--
-- TOC entry 4450 (class 0 OID 74016)
-- Dependencies: 230
-- Data for Name: cell_vertices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cell_vertices VALUES (1, 226);
INSERT INTO public.cell_vertices VALUES (1, 224);
INSERT INTO public.cell_vertices VALUES (2, 226);
INSERT INTO public.cell_vertices VALUES (2, 223);
INSERT INTO public.cell_vertices VALUES (2, 224);
INSERT INTO public.cell_vertices VALUES (3, 227);
INSERT INTO public.cell_vertices VALUES (3, 226);
INSERT INTO public.cell_vertices VALUES (4, 227);
INSERT INTO public.cell_vertices VALUES (4, 226);
INSERT INTO public.cell_vertices VALUES (5, 227);
INSERT INTO public.cell_vertices VALUES (5, 19);
INSERT INTO public.cell_vertices VALUES (6, 227);
INSERT INTO public.cell_vertices VALUES (6, 19);
INSERT INTO public.cell_vertices VALUES (7, 227);
INSERT INTO public.cell_vertices VALUES (7, 19);
INSERT INTO public.cell_vertices VALUES (8, 227);
INSERT INTO public.cell_vertices VALUES (9, 227);
INSERT INTO public.cell_vertices VALUES (12, 131);
INSERT INTO public.cell_vertices VALUES (13, 131);
INSERT INTO public.cell_vertices VALUES (14, 131);
INSERT INTO public.cell_vertices VALUES (15, 131);
INSERT INTO public.cell_vertices VALUES (16, 131);
INSERT INTO public.cell_vertices VALUES (17, 222);
INSERT INTO public.cell_vertices VALUES (17, 223);
INSERT INTO public.cell_vertices VALUES (17, 224);
INSERT INTO public.cell_vertices VALUES (18, 226);
INSERT INTO public.cell_vertices VALUES (18, 224);
INSERT INTO public.cell_vertices VALUES (19, 227);
INSERT INTO public.cell_vertices VALUES (19, 226);
INSERT INTO public.cell_vertices VALUES (20, 227);
INSERT INTO public.cell_vertices VALUES (20, 226);
INSERT INTO public.cell_vertices VALUES (21, 227);
INSERT INTO public.cell_vertices VALUES (21, 19);
INSERT INTO public.cell_vertices VALUES (22, 227);
INSERT INTO public.cell_vertices VALUES (22, 19);
INSERT INTO public.cell_vertices VALUES (23, 227);
INSERT INTO public.cell_vertices VALUES (23, 19);
INSERT INTO public.cell_vertices VALUES (25, 17);
INSERT INTO public.cell_vertices VALUES (26, 17);
INSERT INTO public.cell_vertices VALUES (27, 17);
INSERT INTO public.cell_vertices VALUES (28, 16);
INSERT INTO public.cell_vertices VALUES (28, 17);
INSERT INTO public.cell_vertices VALUES (29, 131);
INSERT INTO public.cell_vertices VALUES (30, 131);
INSERT INTO public.cell_vertices VALUES (33, 222);
INSERT INTO public.cell_vertices VALUES (33, 223);
INSERT INTO public.cell_vertices VALUES (34, 222);
INSERT INTO public.cell_vertices VALUES (34, 223);
INSERT INTO public.cell_vertices VALUES (34, 224);
INSERT INTO public.cell_vertices VALUES (35, 231);
INSERT INTO public.cell_vertices VALUES (35, 226);
INSERT INTO public.cell_vertices VALUES (35, 223);
INSERT INTO public.cell_vertices VALUES (35, 229);
INSERT INTO public.cell_vertices VALUES (35, 230);
INSERT INTO public.cell_vertices VALUES (36, 227);
INSERT INTO public.cell_vertices VALUES (36, 228);
INSERT INTO public.cell_vertices VALUES (36, 231);
INSERT INTO public.cell_vertices VALUES (36, 226);
INSERT INTO public.cell_vertices VALUES (36, 223);
INSERT INTO public.cell_vertices VALUES (36, 224);
INSERT INTO public.cell_vertices VALUES (36, 229);
INSERT INTO public.cell_vertices VALUES (36, 230);
INSERT INTO public.cell_vertices VALUES (37, 227);
INSERT INTO public.cell_vertices VALUES (37, 228);
INSERT INTO public.cell_vertices VALUES (37, 20);
INSERT INTO public.cell_vertices VALUES (37, 19);
INSERT INTO public.cell_vertices VALUES (37, 21);
INSERT INTO public.cell_vertices VALUES (37, 229);
INSERT INTO public.cell_vertices VALUES (37, 235);
INSERT INTO public.cell_vertices VALUES (37, 230);
INSERT INTO public.cell_vertices VALUES (37, 232);
INSERT INTO public.cell_vertices VALUES (38, 227);
INSERT INTO public.cell_vertices VALUES (38, 228);
INSERT INTO public.cell_vertices VALUES (38, 20);
INSERT INTO public.cell_vertices VALUES (38, 19);
INSERT INTO public.cell_vertices VALUES (38, 229);
INSERT INTO public.cell_vertices VALUES (39, 20);
INSERT INTO public.cell_vertices VALUES (39, 19);
INSERT INTO public.cell_vertices VALUES (40, 19);
INSERT INTO public.cell_vertices VALUES (40, 17);
INSERT INTO public.cell_vertices VALUES (41, 19);
INSERT INTO public.cell_vertices VALUES (41, 17);
INSERT INTO public.cell_vertices VALUES (42, 16);
INSERT INTO public.cell_vertices VALUES (42, 17);
INSERT INTO public.cell_vertices VALUES (43, 16);
INSERT INTO public.cell_vertices VALUES (43, 133);
INSERT INTO public.cell_vertices VALUES (43, 17);
INSERT INTO public.cell_vertices VALUES (44, 16);
INSERT INTO public.cell_vertices VALUES (44, 133);
INSERT INTO public.cell_vertices VALUES (44, 134);
INSERT INTO public.cell_vertices VALUES (44, 140);
INSERT INTO public.cell_vertices VALUES (44, 137);
INSERT INTO public.cell_vertices VALUES (44, 17);
INSERT INTO public.cell_vertices VALUES (45, 133);
INSERT INTO public.cell_vertices VALUES (45, 134);
INSERT INTO public.cell_vertices VALUES (45, 135);
INSERT INTO public.cell_vertices VALUES (45, 140);
INSERT INTO public.cell_vertices VALUES (45, 137);
INSERT INTO public.cell_vertices VALUES (45, 129);
INSERT INTO public.cell_vertices VALUES (46, 134);
INSERT INTO public.cell_vertices VALUES (46, 135);
INSERT INTO public.cell_vertices VALUES (46, 137);
INSERT INTO public.cell_vertices VALUES (46, 126);
INSERT INTO public.cell_vertices VALUES (46, 129);
INSERT INTO public.cell_vertices VALUES (47, 125);
INSERT INTO public.cell_vertices VALUES (47, 126);
INSERT INTO public.cell_vertices VALUES (47, 129);
INSERT INTO public.cell_vertices VALUES (48, 125);
INSERT INTO public.cell_vertices VALUES (48, 126);
INSERT INTO public.cell_vertices VALUES (48, 129);
INSERT INTO public.cell_vertices VALUES (49, 220);
INSERT INTO public.cell_vertices VALUES (49, 221);
INSERT INTO public.cell_vertices VALUES (49, 222);
INSERT INTO public.cell_vertices VALUES (49, 219);
INSERT INTO public.cell_vertices VALUES (49, 223);
INSERT INTO public.cell_vertices VALUES (50, 220);
INSERT INTO public.cell_vertices VALUES (50, 221);
INSERT INTO public.cell_vertices VALUES (50, 231);
INSERT INTO public.cell_vertices VALUES (50, 222);
INSERT INTO public.cell_vertices VALUES (50, 233);
INSERT INTO public.cell_vertices VALUES (50, 223);
INSERT INTO public.cell_vertices VALUES (50, 234);
INSERT INTO public.cell_vertices VALUES (50, 232);
INSERT INTO public.cell_vertices VALUES (51, 231);
INSERT INTO public.cell_vertices VALUES (51, 236);
INSERT INTO public.cell_vertices VALUES (51, 233);
INSERT INTO public.cell_vertices VALUES (51, 223);
INSERT INTO public.cell_vertices VALUES (51, 224);
INSERT INTO public.cell_vertices VALUES (51, 235);
INSERT INTO public.cell_vertices VALUES (51, 234);
INSERT INTO public.cell_vertices VALUES (51, 230);
INSERT INTO public.cell_vertices VALUES (51, 232);
INSERT INTO public.cell_vertices VALUES (52, 237);
INSERT INTO public.cell_vertices VALUES (52, 229);
INSERT INTO public.cell_vertices VALUES (52, 235);
INSERT INTO public.cell_vertices VALUES (52, 238);
INSERT INTO public.cell_vertices VALUES (52, 232);
INSERT INTO public.cell_vertices VALUES (53, 228);
INSERT INTO public.cell_vertices VALUES (53, 20);
INSERT INTO public.cell_vertices VALUES (53, 21);
INSERT INTO public.cell_vertices VALUES (53, 229);
INSERT INTO public.cell_vertices VALUES (53, 235);
INSERT INTO public.cell_vertices VALUES (53, 232);
INSERT INTO public.cell_vertices VALUES (54, 20);
INSERT INTO public.cell_vertices VALUES (54, 19);
INSERT INTO public.cell_vertices VALUES (54, 21);
INSERT INTO public.cell_vertices VALUES (55, 20);
INSERT INTO public.cell_vertices VALUES (55, 19);
INSERT INTO public.cell_vertices VALUES (55, 21);
INSERT INTO public.cell_vertices VALUES (56, 16);
INSERT INTO public.cell_vertices VALUES (56, 20);
INSERT INTO public.cell_vertices VALUES (56, 19);
INSERT INTO public.cell_vertices VALUES (56, 17);
INSERT INTO public.cell_vertices VALUES (57, 16);
INSERT INTO public.cell_vertices VALUES (57, 20);
INSERT INTO public.cell_vertices VALUES (57, 19);
INSERT INTO public.cell_vertices VALUES (57, 17);
INSERT INTO public.cell_vertices VALUES (58, 16);
INSERT INTO public.cell_vertices VALUES (58, 17);
INSERT INTO public.cell_vertices VALUES (59, 16);
INSERT INTO public.cell_vertices VALUES (59, 17);
INSERT INTO public.cell_vertices VALUES (60, 16);
INSERT INTO public.cell_vertices VALUES (60, 133);
INSERT INTO public.cell_vertices VALUES (60, 134);
INSERT INTO public.cell_vertices VALUES (60, 142);
INSERT INTO public.cell_vertices VALUES (60, 140);
INSERT INTO public.cell_vertices VALUES (60, 137);
INSERT INTO public.cell_vertices VALUES (61, 134);
INSERT INTO public.cell_vertices VALUES (61, 142);
INSERT INTO public.cell_vertices VALUES (61, 140);
INSERT INTO public.cell_vertices VALUES (61, 137);
INSERT INTO public.cell_vertices VALUES (62, 139);
INSERT INTO public.cell_vertices VALUES (62, 138);
INSERT INTO public.cell_vertices VALUES (62, 140);
INSERT INTO public.cell_vertices VALUES (62, 141);
INSERT INTO public.cell_vertices VALUES (62, 137);
INSERT INTO public.cell_vertices VALUES (63, 125);
INSERT INTO public.cell_vertices VALUES (63, 139);
INSERT INTO public.cell_vertices VALUES (63, 123);
INSERT INTO public.cell_vertices VALUES (63, 138);
INSERT INTO public.cell_vertices VALUES (63, 124);
INSERT INTO public.cell_vertices VALUES (63, 126);
INSERT INTO public.cell_vertices VALUES (64, 125);
INSERT INTO public.cell_vertices VALUES (64, 123);
INSERT INTO public.cell_vertices VALUES (64, 124);
INSERT INTO public.cell_vertices VALUES (64, 126);
INSERT INTO public.cell_vertices VALUES (65, 220);
INSERT INTO public.cell_vertices VALUES (65, 217);
INSERT INTO public.cell_vertices VALUES (65, 221);
INSERT INTO public.cell_vertices VALUES (65, 222);
INSERT INTO public.cell_vertices VALUES (65, 219);
INSERT INTO public.cell_vertices VALUES (65, 218);
INSERT INTO public.cell_vertices VALUES (66, 220);
INSERT INTO public.cell_vertices VALUES (66, 217);
INSERT INTO public.cell_vertices VALUES (66, 221);
INSERT INTO public.cell_vertices VALUES (66, 237);
INSERT INTO public.cell_vertices VALUES (66, 236);
INSERT INTO public.cell_vertices VALUES (66, 219);
INSERT INTO public.cell_vertices VALUES (66, 234);
INSERT INTO public.cell_vertices VALUES (66, 218);
INSERT INTO public.cell_vertices VALUES (67, 237);
INSERT INTO public.cell_vertices VALUES (67, 239);
INSERT INTO public.cell_vertices VALUES (67, 236);
INSERT INTO public.cell_vertices VALUES (67, 233);
INSERT INTO public.cell_vertices VALUES (67, 234);
INSERT INTO public.cell_vertices VALUES (67, 238);
INSERT INTO public.cell_vertices VALUES (68, 237);
INSERT INTO public.cell_vertices VALUES (68, 239);
INSERT INTO public.cell_vertices VALUES (68, 236);
INSERT INTO public.cell_vertices VALUES (68, 238);
INSERT INTO public.cell_vertices VALUES (69, 237);
INSERT INTO public.cell_vertices VALUES (69, 20);
INSERT INTO public.cell_vertices VALUES (69, 21);
INSERT INTO public.cell_vertices VALUES (69, 238);
INSERT INTO public.cell_vertices VALUES (69, 22);
INSERT INTO public.cell_vertices VALUES (70, 20);
INSERT INTO public.cell_vertices VALUES (70, 21);
INSERT INTO public.cell_vertices VALUES (70, 23);
INSERT INTO public.cell_vertices VALUES (70, 238);
INSERT INTO public.cell_vertices VALUES (70, 22);
INSERT INTO public.cell_vertices VALUES (71, 21);
INSERT INTO public.cell_vertices VALUES (71, 23);
INSERT INTO public.cell_vertices VALUES (71, 45);
INSERT INTO public.cell_vertices VALUES (71, 22);
INSERT INTO public.cell_vertices VALUES (72, 45);
INSERT INTO public.cell_vertices VALUES (72, 46);
INSERT INTO public.cell_vertices VALUES (73, 45);
INSERT INTO public.cell_vertices VALUES (73, 46);
INSERT INTO public.cell_vertices VALUES (74, 13);
INSERT INTO public.cell_vertices VALUES (74, 46);
INSERT INTO public.cell_vertices VALUES (75, 13);
INSERT INTO public.cell_vertices VALUES (75, 46);
INSERT INTO public.cell_vertices VALUES (75, 86);
INSERT INTO public.cell_vertices VALUES (76, 87);
INSERT INTO public.cell_vertices VALUES (76, 118);
INSERT INTO public.cell_vertices VALUES (76, 86);
INSERT INTO public.cell_vertices VALUES (77, 142);
INSERT INTO public.cell_vertices VALUES (77, 140);
INSERT INTO public.cell_vertices VALUES (77, 120);
INSERT INTO public.cell_vertices VALUES (77, 141);
INSERT INTO public.cell_vertices VALUES (77, 88);
INSERT INTO public.cell_vertices VALUES (77, 87);
INSERT INTO public.cell_vertices VALUES (77, 118);
INSERT INTO public.cell_vertices VALUES (77, 119);
INSERT INTO public.cell_vertices VALUES (77, 86);
INSERT INTO public.cell_vertices VALUES (78, 139);
INSERT INTO public.cell_vertices VALUES (78, 142);
INSERT INTO public.cell_vertices VALUES (78, 123);
INSERT INTO public.cell_vertices VALUES (78, 121);
INSERT INTO public.cell_vertices VALUES (78, 120);
INSERT INTO public.cell_vertices VALUES (78, 141);
INSERT INTO public.cell_vertices VALUES (78, 118);
INSERT INTO public.cell_vertices VALUES (78, 119);
INSERT INTO public.cell_vertices VALUES (79, 139);
INSERT INTO public.cell_vertices VALUES (79, 142);
INSERT INTO public.cell_vertices VALUES (79, 123);
INSERT INTO public.cell_vertices VALUES (79, 121);
INSERT INTO public.cell_vertices VALUES (79, 141);
INSERT INTO public.cell_vertices VALUES (79, 124);
INSERT INTO public.cell_vertices VALUES (80, 125);
INSERT INTO public.cell_vertices VALUES (80, 123);
INSERT INTO public.cell_vertices VALUES (80, 121);
INSERT INTO public.cell_vertices VALUES (80, 124);
INSERT INTO public.cell_vertices VALUES (81, 217);
INSERT INTO public.cell_vertices VALUES (81, 219);
INSERT INTO public.cell_vertices VALUES (81, 186);
INSERT INTO public.cell_vertices VALUES (81, 218);
INSERT INTO public.cell_vertices VALUES (82, 217);
INSERT INTO public.cell_vertices VALUES (82, 186);
INSERT INTO public.cell_vertices VALUES (82, 215);
INSERT INTO public.cell_vertices VALUES (82, 216);
INSERT INTO public.cell_vertices VALUES (82, 218);
INSERT INTO public.cell_vertices VALUES (83, 239);
INSERT INTO public.cell_vertices VALUES (83, 186);
INSERT INTO public.cell_vertices VALUES (83, 215);
INSERT INTO public.cell_vertices VALUES (83, 216);
INSERT INTO public.cell_vertices VALUES (83, 184);
INSERT INTO public.cell_vertices VALUES (84, 214);
INSERT INTO public.cell_vertices VALUES (84, 22);
INSERT INTO public.cell_vertices VALUES (84, 184);
INSERT INTO public.cell_vertices VALUES (85, 22);
INSERT INTO public.cell_vertices VALUES (85, 184);
INSERT INTO public.cell_vertices VALUES (86, 21);
INSERT INTO public.cell_vertices VALUES (86, 23);
INSERT INTO public.cell_vertices VALUES (86, 22);
INSERT INTO public.cell_vertices VALUES (87, 23);
INSERT INTO public.cell_vertices VALUES (87, 22);
INSERT INTO public.cell_vertices VALUES (88, 45);
INSERT INTO public.cell_vertices VALUES (89, 45);
INSERT INTO public.cell_vertices VALUES (89, 46);
INSERT INTO public.cell_vertices VALUES (90, 13);
INSERT INTO public.cell_vertices VALUES (90, 46);
INSERT INTO public.cell_vertices VALUES (91, 13);
INSERT INTO public.cell_vertices VALUES (91, 86);
INSERT INTO public.cell_vertices VALUES (92, 88);
INSERT INTO public.cell_vertices VALUES (92, 87);
INSERT INTO public.cell_vertices VALUES (92, 118);
INSERT INTO public.cell_vertices VALUES (92, 86);
INSERT INTO public.cell_vertices VALUES (93, 88);
INSERT INTO public.cell_vertices VALUES (93, 87);
INSERT INTO public.cell_vertices VALUES (93, 118);
INSERT INTO public.cell_vertices VALUES (93, 86);
INSERT INTO public.cell_vertices VALUES (94, 120);
INSERT INTO public.cell_vertices VALUES (94, 89);
INSERT INTO public.cell_vertices VALUES (95, 121);
INSERT INTO public.cell_vertices VALUES (95, 89);
INSERT INTO public.cell_vertices VALUES (95, 90);
INSERT INTO public.cell_vertices VALUES (96, 121);
INSERT INTO public.cell_vertices VALUES (96, 90);
INSERT INTO public.cell_vertices VALUES (97, 217);
INSERT INTO public.cell_vertices VALUES (97, 186);
INSERT INTO public.cell_vertices VALUES (98, 217);
INSERT INTO public.cell_vertices VALUES (98, 186);
INSERT INTO public.cell_vertices VALUES (98, 216);
INSERT INTO public.cell_vertices VALUES (99, 186);
INSERT INTO public.cell_vertices VALUES (99, 213);
INSERT INTO public.cell_vertices VALUES (99, 215);
INSERT INTO public.cell_vertices VALUES (99, 214);
INSERT INTO public.cell_vertices VALUES (99, 184);
INSERT INTO public.cell_vertices VALUES (99, 212);
INSERT INTO public.cell_vertices VALUES (100, 214);
INSERT INTO public.cell_vertices VALUES (100, 147);
INSERT INTO public.cell_vertices VALUES (100, 184);
INSERT INTO public.cell_vertices VALUES (101, 146);
INSERT INTO public.cell_vertices VALUES (101, 147);
INSERT INTO public.cell_vertices VALUES (101, 145);
INSERT INTO public.cell_vertices VALUES (102, 144);
INSERT INTO public.cell_vertices VALUES (102, 23);
INSERT INTO public.cell_vertices VALUES (102, 24);
INSERT INTO public.cell_vertices VALUES (102, 146);
INSERT INTO public.cell_vertices VALUES (102, 145);
INSERT INTO public.cell_vertices VALUES (103, 38);
INSERT INTO public.cell_vertices VALUES (104, 36);
INSERT INTO public.cell_vertices VALUES (104, 45);
INSERT INTO public.cell_vertices VALUES (105, 36);
INSERT INTO public.cell_vertices VALUES (105, 45);
INSERT INTO public.cell_vertices VALUES (106, 36);
INSERT INTO public.cell_vertices VALUES (106, 35);
INSERT INTO public.cell_vertices VALUES (107, 13);
INSERT INTO public.cell_vertices VALUES (107, 47);
INSERT INTO public.cell_vertices VALUES (107, 48);
INSERT INTO public.cell_vertices VALUES (107, 12);
INSERT INTO public.cell_vertices VALUES (108, 47);
INSERT INTO public.cell_vertices VALUES (108, 87);
INSERT INTO public.cell_vertices VALUES (108, 48);
INSERT INTO public.cell_vertices VALUES (109, 52);
INSERT INTO public.cell_vertices VALUES (109, 116);
INSERT INTO public.cell_vertices VALUES (109, 88);
INSERT INTO public.cell_vertices VALUES (109, 87);
INSERT INTO public.cell_vertices VALUES (109, 51);
INSERT INTO public.cell_vertices VALUES (110, 52);
INSERT INTO public.cell_vertices VALUES (110, 115);
INSERT INTO public.cell_vertices VALUES (110, 116);
INSERT INTO public.cell_vertices VALUES (110, 114);
INSERT INTO public.cell_vertices VALUES (110, 51);
INSERT INTO public.cell_vertices VALUES (111, 115);
INSERT INTO public.cell_vertices VALUES (111, 116);
INSERT INTO public.cell_vertices VALUES (111, 89);
INSERT INTO public.cell_vertices VALUES (111, 90);
INSERT INTO public.cell_vertices VALUES (111, 91);
INSERT INTO public.cell_vertices VALUES (112, 92);
INSERT INTO public.cell_vertices VALUES (112, 90);
INSERT INTO public.cell_vertices VALUES (112, 91);
INSERT INTO public.cell_vertices VALUES (113, 188);
INSERT INTO public.cell_vertices VALUES (113, 189);
INSERT INTO public.cell_vertices VALUES (113, 190);
INSERT INTO public.cell_vertices VALUES (114, 188);
INSERT INTO public.cell_vertices VALUES (114, 210);
INSERT INTO public.cell_vertices VALUES (114, 211);
INSERT INTO public.cell_vertices VALUES (114, 189);
INSERT INTO public.cell_vertices VALUES (114, 213);
INSERT INTO public.cell_vertices VALUES (114, 212);
INSERT INTO public.cell_vertices VALUES (115, 150);
INSERT INTO public.cell_vertices VALUES (115, 210);
INSERT INTO public.cell_vertices VALUES (115, 211);
INSERT INTO public.cell_vertices VALUES (115, 213);
INSERT INTO public.cell_vertices VALUES (115, 149);
INSERT INTO public.cell_vertices VALUES (115, 148);
INSERT INTO public.cell_vertices VALUES (115, 212);
INSERT INTO public.cell_vertices VALUES (116, 150);
INSERT INTO public.cell_vertices VALUES (116, 149);
INSERT INTO public.cell_vertices VALUES (116, 148);
INSERT INTO public.cell_vertices VALUES (117, 144);
INSERT INTO public.cell_vertices VALUES (117, 145);
INSERT INTO public.cell_vertices VALUES (118, 24);
INSERT INTO public.cell_vertices VALUES (119, 39);
INSERT INTO public.cell_vertices VALUES (119, 38);
INSERT INTO public.cell_vertices VALUES (120, 38);
INSERT INTO public.cell_vertices VALUES (121, 36);
INSERT INTO public.cell_vertices VALUES (121, 35);
INSERT INTO public.cell_vertices VALUES (122, 34);
INSERT INTO public.cell_vertices VALUES (122, 35);
INSERT INTO public.cell_vertices VALUES (123, 12);
INSERT INTO public.cell_vertices VALUES (124, 47);
INSERT INTO public.cell_vertices VALUES (124, 48);
INSERT INTO public.cell_vertices VALUES (124, 85);
INSERT INTO public.cell_vertices VALUES (125, 52);
INSERT INTO public.cell_vertices VALUES (125, 51);
INSERT INTO public.cell_vertices VALUES (126, 52);
INSERT INTO public.cell_vertices VALUES (126, 115);
INSERT INTO public.cell_vertices VALUES (126, 113);
INSERT INTO public.cell_vertices VALUES (126, 51);
INSERT INTO public.cell_vertices VALUES (127, 115);
INSERT INTO public.cell_vertices VALUES (127, 113);
INSERT INTO public.cell_vertices VALUES (127, 114);
INSERT INTO public.cell_vertices VALUES (127, 92);
INSERT INTO public.cell_vertices VALUES (127, 93);
INSERT INTO public.cell_vertices VALUES (127, 91);
INSERT INTO public.cell_vertices VALUES (128, 92);
INSERT INTO public.cell_vertices VALUES (128, 93);
INSERT INTO public.cell_vertices VALUES (128, 91);
INSERT INTO public.cell_vertices VALUES (129, 192);
INSERT INTO public.cell_vertices VALUES (129, 190);
INSERT INTO public.cell_vertices VALUES (129, 191);
INSERT INTO public.cell_vertices VALUES (130, 210);
INSERT INTO public.cell_vertices VALUES (130, 208);
INSERT INTO public.cell_vertices VALUES (130, 190);
INSERT INTO public.cell_vertices VALUES (130, 191);
INSERT INTO public.cell_vertices VALUES (131, 152);
INSERT INTO public.cell_vertices VALUES (131, 153);
INSERT INTO public.cell_vertices VALUES (131, 150);
INSERT INTO public.cell_vertices VALUES (131, 210);
INSERT INTO public.cell_vertices VALUES (131, 208);
INSERT INTO public.cell_vertices VALUES (132, 152);
INSERT INTO public.cell_vertices VALUES (132, 153);
INSERT INTO public.cell_vertices VALUES (132, 181);
INSERT INTO public.cell_vertices VALUES (132, 150);
INSERT INTO public.cell_vertices VALUES (132, 180);
INSERT INTO public.cell_vertices VALUES (133, 181);
INSERT INTO public.cell_vertices VALUES (133, 25);
INSERT INTO public.cell_vertices VALUES (133, 180);
INSERT INTO public.cell_vertices VALUES (134, 24);
INSERT INTO public.cell_vertices VALUES (134, 25);
INSERT INTO public.cell_vertices VALUES (134, 180);
INSERT INTO public.cell_vertices VALUES (135, 39);
INSERT INTO public.cell_vertices VALUES (136, 39);
INSERT INTO public.cell_vertices VALUES (137, 34);
INSERT INTO public.cell_vertices VALUES (138, 34);
INSERT INTO public.cell_vertices VALUES (139, 82);
INSERT INTO public.cell_vertices VALUES (139, 12);
INSERT INTO public.cell_vertices VALUES (139, 85);
INSERT INTO public.cell_vertices VALUES (139, 11);
INSERT INTO public.cell_vertices VALUES (140, 82);
INSERT INTO public.cell_vertices VALUES (140, 83);
INSERT INTO public.cell_vertices VALUES (140, 80);
INSERT INTO public.cell_vertices VALUES (140, 81);
INSERT INTO public.cell_vertices VALUES (140, 11);
INSERT INTO public.cell_vertices VALUES (141, 82);
INSERT INTO public.cell_vertices VALUES (141, 56);
INSERT INTO public.cell_vertices VALUES (141, 81);
INSERT INTO public.cell_vertices VALUES (142, 110);
INSERT INTO public.cell_vertices VALUES (142, 109);
INSERT INTO public.cell_vertices VALUES (142, 56);
INSERT INTO public.cell_vertices VALUES (142, 111);
INSERT INTO public.cell_vertices VALUES (143, 110);
INSERT INTO public.cell_vertices VALUES (143, 109);
INSERT INTO public.cell_vertices VALUES (143, 111);
INSERT INTO public.cell_vertices VALUES (143, 96);
INSERT INTO public.cell_vertices VALUES (143, 94);
INSERT INTO public.cell_vertices VALUES (143, 95);
INSERT INTO public.cell_vertices VALUES (144, 96);
INSERT INTO public.cell_vertices VALUES (144, 94);
INSERT INTO public.cell_vertices VALUES (144, 93);
INSERT INTO public.cell_vertices VALUES (144, 95);
INSERT INTO public.cell_vertices VALUES (145, 194);
INSERT INTO public.cell_vertices VALUES (145, 192);
INSERT INTO public.cell_vertices VALUES (145, 193);
INSERT INTO public.cell_vertices VALUES (146, 205);
INSERT INTO public.cell_vertices VALUES (146, 194);
INSERT INTO public.cell_vertices VALUES (146, 192);
INSERT INTO public.cell_vertices VALUES (146, 193);
INSERT INTO public.cell_vertices VALUES (147, 153);
INSERT INTO public.cell_vertices VALUES (147, 155);
INSERT INTO public.cell_vertices VALUES (147, 205);
INSERT INTO public.cell_vertices VALUES (147, 154);
INSERT INTO public.cell_vertices VALUES (148, 153);
INSERT INTO public.cell_vertices VALUES (148, 155);
INSERT INTO public.cell_vertices VALUES (148, 154);
INSERT INTO public.cell_vertices VALUES (149, 175);
INSERT INTO public.cell_vertices VALUES (149, 25);
INSERT INTO public.cell_vertices VALUES (149, 180);
INSERT INTO public.cell_vertices VALUES (150, 40);
INSERT INTO public.cell_vertices VALUES (150, 25);
INSERT INTO public.cell_vertices VALUES (151, 40);
INSERT INTO public.cell_vertices VALUES (152, 40);
INSERT INTO public.cell_vertices VALUES (153, 33);
INSERT INTO public.cell_vertices VALUES (154, 33);
INSERT INTO public.cell_vertices VALUES (155, 33);
INSERT INTO public.cell_vertices VALUES (155, 11);
INSERT INTO public.cell_vertices VALUES (156, 82);
INSERT INTO public.cell_vertices VALUES (156, 79);
INSERT INTO public.cell_vertices VALUES (156, 77);
INSERT INTO public.cell_vertices VALUES (156, 80);
INSERT INTO public.cell_vertices VALUES (156, 81);
INSERT INTO public.cell_vertices VALUES (157, 58);
INSERT INTO public.cell_vertices VALUES (157, 79);
INSERT INTO public.cell_vertices VALUES (157, 81);
INSERT INTO public.cell_vertices VALUES (158, 107);
INSERT INTO public.cell_vertices VALUES (158, 109);
INSERT INTO public.cell_vertices VALUES (158, 58);
INSERT INTO public.cell_vertices VALUES (159, 97);
INSERT INTO public.cell_vertices VALUES (159, 107);
INSERT INTO public.cell_vertices VALUES (159, 109);
INSERT INTO public.cell_vertices VALUES (159, 98);
INSERT INTO public.cell_vertices VALUES (159, 96);
INSERT INTO public.cell_vertices VALUES (160, 97);
INSERT INTO public.cell_vertices VALUES (160, 98);
INSERT INTO public.cell_vertices VALUES (160, 96);
INSERT INTO public.cell_vertices VALUES (161, 197);
INSERT INTO public.cell_vertices VALUES (161, 196);
INSERT INTO public.cell_vertices VALUES (161, 195);
INSERT INTO public.cell_vertices VALUES (162, 197);
INSERT INTO public.cell_vertices VALUES (162, 196);
INSERT INTO public.cell_vertices VALUES (162, 201);
INSERT INTO public.cell_vertices VALUES (162, 195);
INSERT INTO public.cell_vertices VALUES (163, 156);
INSERT INTO public.cell_vertices VALUES (163, 157);
INSERT INTO public.cell_vertices VALUES (163, 159);
INSERT INTO public.cell_vertices VALUES (163, 201);
INSERT INTO public.cell_vertices VALUES (164, 156);
INSERT INTO public.cell_vertices VALUES (164, 174);
INSERT INTO public.cell_vertices VALUES (164, 157);
INSERT INTO public.cell_vertices VALUES (164, 159);
INSERT INTO public.cell_vertices VALUES (164, 173);
INSERT INTO public.cell_vertices VALUES (165, 174);
INSERT INTO public.cell_vertices VALUES (165, 175);
INSERT INTO public.cell_vertices VALUES (165, 26);
INSERT INTO public.cell_vertices VALUES (165, 173);
INSERT INTO public.cell_vertices VALUES (166, 41);
INSERT INTO public.cell_vertices VALUES (166, 26);
INSERT INTO public.cell_vertices VALUES (167, 41);
INSERT INTO public.cell_vertices VALUES (168, 41);
INSERT INTO public.cell_vertices VALUES (169, 32);
INSERT INTO public.cell_vertices VALUES (170, 32);
INSERT INTO public.cell_vertices VALUES (171, 32);
INSERT INTO public.cell_vertices VALUES (172, 75);
INSERT INTO public.cell_vertices VALUES (172, 77);
INSERT INTO public.cell_vertices VALUES (172, 74);
INSERT INTO public.cell_vertices VALUES (172, 76);
INSERT INTO public.cell_vertices VALUES (173, 61);
INSERT INTO public.cell_vertices VALUES (173, 62);
INSERT INTO public.cell_vertices VALUES (173, 76);
INSERT INTO public.cell_vertices VALUES (174, 61);
INSERT INTO public.cell_vertices VALUES (174, 104);
INSERT INTO public.cell_vertices VALUES (174, 62);
INSERT INTO public.cell_vertices VALUES (174, 103);
INSERT INTO public.cell_vertices VALUES (174, 105);
INSERT INTO public.cell_vertices VALUES (175, 98);
INSERT INTO public.cell_vertices VALUES (175, 104);
INSERT INTO public.cell_vertices VALUES (175, 100);
INSERT INTO public.cell_vertices VALUES (175, 103);
INSERT INTO public.cell_vertices VALUES (175, 105);
INSERT INTO public.cell_vertices VALUES (176, 98);
INSERT INTO public.cell_vertices VALUES (176, 100);
INSERT INTO public.cell_vertices VALUES (177, 197);
INSERT INTO public.cell_vertices VALUES (177, 198);
INSERT INTO public.cell_vertices VALUES (177, 199);
INSERT INTO public.cell_vertices VALUES (178, 198);
INSERT INTO public.cell_vertices VALUES (178, 200);
INSERT INTO public.cell_vertices VALUES (178, 199);
INSERT INTO public.cell_vertices VALUES (179, 200);
INSERT INTO public.cell_vertices VALUES (179, 160);
INSERT INTO public.cell_vertices VALUES (179, 199);
INSERT INTO public.cell_vertices VALUES (179, 159);
INSERT INTO public.cell_vertices VALUES (179, 201);
INSERT INTO public.cell_vertices VALUES (179, 161);
INSERT INTO public.cell_vertices VALUES (180, 160);
INSERT INTO public.cell_vertices VALUES (180, 159);
INSERT INTO public.cell_vertices VALUES (180, 161);
INSERT INTO public.cell_vertices VALUES (180, 171);
INSERT INTO public.cell_vertices VALUES (181, 169);
INSERT INTO public.cell_vertices VALUES (181, 26);
INSERT INTO public.cell_vertices VALUES (181, 171);
INSERT INTO public.cell_vertices VALUES (181, 173);
INSERT INTO public.cell_vertices VALUES (182, 42);
INSERT INTO public.cell_vertices VALUES (183, 42);
INSERT INTO public.cell_vertices VALUES (184, 29);
INSERT INTO public.cell_vertices VALUES (185, 29);
INSERT INTO public.cell_vertices VALUES (185, 30);
INSERT INTO public.cell_vertices VALUES (186, 30);
INSERT INTO public.cell_vertices VALUES (186, 31);
INSERT INTO public.cell_vertices VALUES (187, 9);
INSERT INTO public.cell_vertices VALUES (187, 31);
INSERT INTO public.cell_vertices VALUES (188, 72);
INSERT INTO public.cell_vertices VALUES (188, 75);
INSERT INTO public.cell_vertices VALUES (188, 73);
INSERT INTO public.cell_vertices VALUES (188, 9);
INSERT INTO public.cell_vertices VALUES (188, 74);
INSERT INTO public.cell_vertices VALUES (188, 76);
INSERT INTO public.cell_vertices VALUES (189, 65);
INSERT INTO public.cell_vertices VALUES (189, 72);
INSERT INTO public.cell_vertices VALUES (189, 73);
INSERT INTO public.cell_vertices VALUES (189, 74);
INSERT INTO public.cell_vertices VALUES (189, 64);
INSERT INTO public.cell_vertices VALUES (190, 65);
INSERT INTO public.cell_vertices VALUES (190, 103);
INSERT INTO public.cell_vertices VALUES (190, 64);
INSERT INTO public.cell_vertices VALUES (191, 101);
INSERT INTO public.cell_vertices VALUES (191, 103);
INSERT INTO public.cell_vertices VALUES (192, 101);
INSERT INTO public.cell_vertices VALUES (193, 198);
INSERT INTO public.cell_vertices VALUES (193, 199);
INSERT INTO public.cell_vertices VALUES (193, 162);
INSERT INTO public.cell_vertices VALUES (194, 199);
INSERT INTO public.cell_vertices VALUES (194, 162);
INSERT INTO public.cell_vertices VALUES (195, 163);
INSERT INTO public.cell_vertices VALUES (195, 162);
INSERT INTO public.cell_vertices VALUES (196, 168);
INSERT INTO public.cell_vertices VALUES (196, 163);
INSERT INTO public.cell_vertices VALUES (196, 166);
INSERT INTO public.cell_vertices VALUES (196, 169);
INSERT INTO public.cell_vertices VALUES (196, 162);
INSERT INTO public.cell_vertices VALUES (197, 168);
INSERT INTO public.cell_vertices VALUES (197, 163);
INSERT INTO public.cell_vertices VALUES (197, 166);
INSERT INTO public.cell_vertices VALUES (197, 167);
INSERT INTO public.cell_vertices VALUES (197, 169);
INSERT INTO public.cell_vertices VALUES (197, 162);
INSERT INTO public.cell_vertices VALUES (198, 167);
INSERT INTO public.cell_vertices VALUES (198, 169);
INSERT INTO public.cell_vertices VALUES (198, 28);
INSERT INTO public.cell_vertices VALUES (199, 28);
INSERT INTO public.cell_vertices VALUES (200, 29);
INSERT INTO public.cell_vertices VALUES (200, 7);
INSERT INTO public.cell_vertices VALUES (201, 29);
INSERT INTO public.cell_vertices VALUES (201, 7);
INSERT INTO public.cell_vertices VALUES (201, 30);
INSERT INTO public.cell_vertices VALUES (202, 8);
INSERT INTO public.cell_vertices VALUES (202, 30);
INSERT INTO public.cell_vertices VALUES (203, 8);
INSERT INTO public.cell_vertices VALUES (203, 70);
INSERT INTO public.cell_vertices VALUES (203, 9);
INSERT INTO public.cell_vertices VALUES (204, 70);
INSERT INTO public.cell_vertices VALUES (204, 72);
INSERT INTO public.cell_vertices VALUES (204, 69);
INSERT INTO public.cell_vertices VALUES (205, 67);
INSERT INTO public.cell_vertices VALUES (205, 68);
INSERT INTO public.cell_vertices VALUES (205, 69);
INSERT INTO public.cell_vertices VALUES (206, 65);
INSERT INTO public.cell_vertices VALUES (206, 67);
INSERT INTO public.cell_vertices VALUES (206, 68);
INSERT INTO public.cell_vertices VALUES (207, 65);
INSERT INTO public.cell_vertices VALUES (207, 67);
INSERT INTO public.cell_vertices VALUES (208, 67);
INSERT INTO public.cell_vertices VALUES (208, 101);
INSERT INTO public.cell_vertices VALUES (209, 199);
INSERT INTO public.cell_vertices VALUES (210, 199);
INSERT INTO public.cell_vertices VALUES (212, 166);
INSERT INTO public.cell_vertices VALUES (213, 166);
INSERT INTO public.cell_vertices VALUES (213, 167);
INSERT INTO public.cell_vertices VALUES (214, 166);
INSERT INTO public.cell_vertices VALUES (214, 167);
INSERT INTO public.cell_vertices VALUES (214, 3);
INSERT INTO public.cell_vertices VALUES (214, 28);
INSERT INTO public.cell_vertices VALUES (215, 167);
INSERT INTO public.cell_vertices VALUES (215, 7);
INSERT INTO public.cell_vertices VALUES (215, 28);
INSERT INTO public.cell_vertices VALUES (216, 7);
INSERT INTO public.cell_vertices VALUES (216, 28);
INSERT INTO public.cell_vertices VALUES (217, 8);
INSERT INTO public.cell_vertices VALUES (217, 7);
INSERT INTO public.cell_vertices VALUES (218, 8);
INSERT INTO public.cell_vertices VALUES (218, 5);
INSERT INTO public.cell_vertices VALUES (218, 7);
INSERT INTO public.cell_vertices VALUES (219, 8);
INSERT INTO public.cell_vertices VALUES (219, 70);
INSERT INTO public.cell_vertices VALUES (219, 5);
INSERT INTO public.cell_vertices VALUES (219, 69);
INSERT INTO public.cell_vertices VALUES (220, 8);
INSERT INTO public.cell_vertices VALUES (220, 5);
INSERT INTO public.cell_vertices VALUES (220, 69);
INSERT INTO public.cell_vertices VALUES (221, 67);
INSERT INTO public.cell_vertices VALUES (221, 68);
INSERT INTO public.cell_vertices VALUES (221, 69);
INSERT INTO public.cell_vertices VALUES (222, 67);
INSERT INTO public.cell_vertices VALUES (222, 68);
INSERT INTO public.cell_vertices VALUES (223, 67);
INSERT INTO public.cell_vertices VALUES (223, 68);
INSERT INTO public.cell_vertices VALUES (224, 67);
INSERT INTO public.cell_vertices VALUES (224, 68);
INSERT INTO public.cell_vertices VALUES (225, 3);
INSERT INTO public.cell_vertices VALUES (226, 3);
INSERT INTO public.cell_vertices VALUES (227, 3);
INSERT INTO public.cell_vertices VALUES (228, 166);
INSERT INTO public.cell_vertices VALUES (228, 3);
INSERT INTO public.cell_vertices VALUES (229, 166);
INSERT INTO public.cell_vertices VALUES (229, 2);
INSERT INTO public.cell_vertices VALUES (229, 167);
INSERT INTO public.cell_vertices VALUES (229, 3);
INSERT INTO public.cell_vertices VALUES (230, 166);
INSERT INTO public.cell_vertices VALUES (230, 2);
INSERT INTO public.cell_vertices VALUES (230, 3);
INSERT INTO public.cell_vertices VALUES (231, 6);
INSERT INTO public.cell_vertices VALUES (232, 6);
INSERT INTO public.cell_vertices VALUES (233, 6);
INSERT INTO public.cell_vertices VALUES (234, 6);
INSERT INTO public.cell_vertices VALUES (235, 4);
INSERT INTO public.cell_vertices VALUES (235, 5);
INSERT INTO public.cell_vertices VALUES (235, 69);
INSERT INTO public.cell_vertices VALUES (236, 70);
INSERT INTO public.cell_vertices VALUES (236, 4);
INSERT INTO public.cell_vertices VALUES (236, 5);
INSERT INTO public.cell_vertices VALUES (236, 68);
INSERT INTO public.cell_vertices VALUES (236, 69);
INSERT INTO public.cell_vertices VALUES (237, 5);
INSERT INTO public.cell_vertices VALUES (237, 67);
INSERT INTO public.cell_vertices VALUES (237, 68);
INSERT INTO public.cell_vertices VALUES (237, 69);
INSERT INTO public.cell_vertices VALUES (238, 5);
INSERT INTO public.cell_vertices VALUES (238, 67);
INSERT INTO public.cell_vertices VALUES (238, 68);
INSERT INTO public.cell_vertices VALUES (239, 5);
INSERT INTO public.cell_vertices VALUES (239, 67);
INSERT INTO public.cell_vertices VALUES (239, 68);
INSERT INTO public.cell_vertices VALUES (240, 5);
INSERT INTO public.cell_vertices VALUES (240, 67);
INSERT INTO public.cell_vertices VALUES (240, 68);
INSERT INTO public.cell_vertices VALUES (241, 1);
INSERT INTO public.cell_vertices VALUES (242, 1);
INSERT INTO public.cell_vertices VALUES (243, 1);
INSERT INTO public.cell_vertices VALUES (244, 1);
INSERT INTO public.cell_vertices VALUES (245, 1);
INSERT INTO public.cell_vertices VALUES (246, 1);
INSERT INTO public.cell_vertices VALUES (247, 1);
INSERT INTO public.cell_vertices VALUES (248, 1);
INSERT INTO public.cell_vertices VALUES (249, 1);
INSERT INTO public.cell_vertices VALUES (250, 1);
INSERT INTO public.cell_vertices VALUES (251, 1);
INSERT INTO public.cell_vertices VALUES (252, 1);
INSERT INTO public.cell_vertices VALUES (253, 1);
INSERT INTO public.cell_vertices VALUES (254, 1);
INSERT INTO public.cell_vertices VALUES (255, 1);
INSERT INTO public.cell_vertices VALUES (256, 1);


--
-- TOC entry 4451 (class 0 OID 74021)
-- Dependencies: 231
-- Data for Name: cells; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cells VALUES (1);
INSERT INTO public.cells VALUES (2);
INSERT INTO public.cells VALUES (3);
INSERT INTO public.cells VALUES (4);
INSERT INTO public.cells VALUES (5);
INSERT INTO public.cells VALUES (6);
INSERT INTO public.cells VALUES (7);
INSERT INTO public.cells VALUES (8);
INSERT INTO public.cells VALUES (9);
INSERT INTO public.cells VALUES (12);
INSERT INTO public.cells VALUES (13);
INSERT INTO public.cells VALUES (14);
INSERT INTO public.cells VALUES (15);
INSERT INTO public.cells VALUES (16);
INSERT INTO public.cells VALUES (17);
INSERT INTO public.cells VALUES (18);
INSERT INTO public.cells VALUES (19);
INSERT INTO public.cells VALUES (20);
INSERT INTO public.cells VALUES (21);
INSERT INTO public.cells VALUES (22);
INSERT INTO public.cells VALUES (23);
INSERT INTO public.cells VALUES (25);
INSERT INTO public.cells VALUES (26);
INSERT INTO public.cells VALUES (27);
INSERT INTO public.cells VALUES (28);
INSERT INTO public.cells VALUES (29);
INSERT INTO public.cells VALUES (30);
INSERT INTO public.cells VALUES (33);
INSERT INTO public.cells VALUES (34);
INSERT INTO public.cells VALUES (35);
INSERT INTO public.cells VALUES (36);
INSERT INTO public.cells VALUES (37);
INSERT INTO public.cells VALUES (38);
INSERT INTO public.cells VALUES (39);
INSERT INTO public.cells VALUES (40);
INSERT INTO public.cells VALUES (41);
INSERT INTO public.cells VALUES (42);
INSERT INTO public.cells VALUES (43);
INSERT INTO public.cells VALUES (44);
INSERT INTO public.cells VALUES (45);
INSERT INTO public.cells VALUES (46);
INSERT INTO public.cells VALUES (47);
INSERT INTO public.cells VALUES (48);
INSERT INTO public.cells VALUES (49);
INSERT INTO public.cells VALUES (50);
INSERT INTO public.cells VALUES (51);
INSERT INTO public.cells VALUES (52);
INSERT INTO public.cells VALUES (53);
INSERT INTO public.cells VALUES (54);
INSERT INTO public.cells VALUES (55);
INSERT INTO public.cells VALUES (56);
INSERT INTO public.cells VALUES (57);
INSERT INTO public.cells VALUES (58);
INSERT INTO public.cells VALUES (59);
INSERT INTO public.cells VALUES (60);
INSERT INTO public.cells VALUES (61);
INSERT INTO public.cells VALUES (62);
INSERT INTO public.cells VALUES (63);
INSERT INTO public.cells VALUES (64);
INSERT INTO public.cells VALUES (65);
INSERT INTO public.cells VALUES (66);
INSERT INTO public.cells VALUES (67);
INSERT INTO public.cells VALUES (68);
INSERT INTO public.cells VALUES (69);
INSERT INTO public.cells VALUES (70);
INSERT INTO public.cells VALUES (71);
INSERT INTO public.cells VALUES (72);
INSERT INTO public.cells VALUES (73);
INSERT INTO public.cells VALUES (74);
INSERT INTO public.cells VALUES (75);
INSERT INTO public.cells VALUES (76);
INSERT INTO public.cells VALUES (77);
INSERT INTO public.cells VALUES (78);
INSERT INTO public.cells VALUES (79);
INSERT INTO public.cells VALUES (80);
INSERT INTO public.cells VALUES (81);
INSERT INTO public.cells VALUES (82);
INSERT INTO public.cells VALUES (83);
INSERT INTO public.cells VALUES (84);
INSERT INTO public.cells VALUES (85);
INSERT INTO public.cells VALUES (86);
INSERT INTO public.cells VALUES (87);
INSERT INTO public.cells VALUES (88);
INSERT INTO public.cells VALUES (89);
INSERT INTO public.cells VALUES (90);
INSERT INTO public.cells VALUES (91);
INSERT INTO public.cells VALUES (92);
INSERT INTO public.cells VALUES (93);
INSERT INTO public.cells VALUES (94);
INSERT INTO public.cells VALUES (95);
INSERT INTO public.cells VALUES (96);
INSERT INTO public.cells VALUES (97);
INSERT INTO public.cells VALUES (98);
INSERT INTO public.cells VALUES (99);
INSERT INTO public.cells VALUES (100);
INSERT INTO public.cells VALUES (101);
INSERT INTO public.cells VALUES (102);
INSERT INTO public.cells VALUES (103);
INSERT INTO public.cells VALUES (104);
INSERT INTO public.cells VALUES (105);
INSERT INTO public.cells VALUES (106);
INSERT INTO public.cells VALUES (107);
INSERT INTO public.cells VALUES (108);
INSERT INTO public.cells VALUES (109);
INSERT INTO public.cells VALUES (110);
INSERT INTO public.cells VALUES (111);
INSERT INTO public.cells VALUES (112);
INSERT INTO public.cells VALUES (113);
INSERT INTO public.cells VALUES (114);
INSERT INTO public.cells VALUES (115);
INSERT INTO public.cells VALUES (116);
INSERT INTO public.cells VALUES (117);
INSERT INTO public.cells VALUES (118);
INSERT INTO public.cells VALUES (119);
INSERT INTO public.cells VALUES (120);
INSERT INTO public.cells VALUES (121);
INSERT INTO public.cells VALUES (122);
INSERT INTO public.cells VALUES (123);
INSERT INTO public.cells VALUES (124);
INSERT INTO public.cells VALUES (125);
INSERT INTO public.cells VALUES (126);
INSERT INTO public.cells VALUES (127);
INSERT INTO public.cells VALUES (128);
INSERT INTO public.cells VALUES (129);
INSERT INTO public.cells VALUES (130);
INSERT INTO public.cells VALUES (131);
INSERT INTO public.cells VALUES (132);
INSERT INTO public.cells VALUES (133);
INSERT INTO public.cells VALUES (134);
INSERT INTO public.cells VALUES (135);
INSERT INTO public.cells VALUES (136);
INSERT INTO public.cells VALUES (137);
INSERT INTO public.cells VALUES (138);
INSERT INTO public.cells VALUES (139);
INSERT INTO public.cells VALUES (140);
INSERT INTO public.cells VALUES (141);
INSERT INTO public.cells VALUES (142);
INSERT INTO public.cells VALUES (143);
INSERT INTO public.cells VALUES (144);
INSERT INTO public.cells VALUES (145);
INSERT INTO public.cells VALUES (146);
INSERT INTO public.cells VALUES (147);
INSERT INTO public.cells VALUES (148);
INSERT INTO public.cells VALUES (149);
INSERT INTO public.cells VALUES (150);
INSERT INTO public.cells VALUES (151);
INSERT INTO public.cells VALUES (152);
INSERT INTO public.cells VALUES (153);
INSERT INTO public.cells VALUES (154);
INSERT INTO public.cells VALUES (155);
INSERT INTO public.cells VALUES (156);
INSERT INTO public.cells VALUES (157);
INSERT INTO public.cells VALUES (158);
INSERT INTO public.cells VALUES (159);
INSERT INTO public.cells VALUES (160);
INSERT INTO public.cells VALUES (161);
INSERT INTO public.cells VALUES (162);
INSERT INTO public.cells VALUES (163);
INSERT INTO public.cells VALUES (164);
INSERT INTO public.cells VALUES (165);
INSERT INTO public.cells VALUES (166);
INSERT INTO public.cells VALUES (167);
INSERT INTO public.cells VALUES (168);
INSERT INTO public.cells VALUES (169);
INSERT INTO public.cells VALUES (170);
INSERT INTO public.cells VALUES (171);
INSERT INTO public.cells VALUES (172);
INSERT INTO public.cells VALUES (173);
INSERT INTO public.cells VALUES (174);
INSERT INTO public.cells VALUES (175);
INSERT INTO public.cells VALUES (176);
INSERT INTO public.cells VALUES (177);
INSERT INTO public.cells VALUES (178);
INSERT INTO public.cells VALUES (179);
INSERT INTO public.cells VALUES (180);
INSERT INTO public.cells VALUES (181);
INSERT INTO public.cells VALUES (182);
INSERT INTO public.cells VALUES (183);
INSERT INTO public.cells VALUES (184);
INSERT INTO public.cells VALUES (185);
INSERT INTO public.cells VALUES (186);
INSERT INTO public.cells VALUES (187);
INSERT INTO public.cells VALUES (188);
INSERT INTO public.cells VALUES (189);
INSERT INTO public.cells VALUES (190);
INSERT INTO public.cells VALUES (191);
INSERT INTO public.cells VALUES (192);
INSERT INTO public.cells VALUES (193);
INSERT INTO public.cells VALUES (194);
INSERT INTO public.cells VALUES (195);
INSERT INTO public.cells VALUES (196);
INSERT INTO public.cells VALUES (197);
INSERT INTO public.cells VALUES (198);
INSERT INTO public.cells VALUES (199);
INSERT INTO public.cells VALUES (200);
INSERT INTO public.cells VALUES (201);
INSERT INTO public.cells VALUES (202);
INSERT INTO public.cells VALUES (203);
INSERT INTO public.cells VALUES (204);
INSERT INTO public.cells VALUES (205);
INSERT INTO public.cells VALUES (206);
INSERT INTO public.cells VALUES (207);
INSERT INTO public.cells VALUES (208);
INSERT INTO public.cells VALUES (209);
INSERT INTO public.cells VALUES (210);
INSERT INTO public.cells VALUES (212);
INSERT INTO public.cells VALUES (213);
INSERT INTO public.cells VALUES (214);
INSERT INTO public.cells VALUES (215);
INSERT INTO public.cells VALUES (216);
INSERT INTO public.cells VALUES (217);
INSERT INTO public.cells VALUES (218);
INSERT INTO public.cells VALUES (219);
INSERT INTO public.cells VALUES (220);
INSERT INTO public.cells VALUES (221);
INSERT INTO public.cells VALUES (222);
INSERT INTO public.cells VALUES (223);
INSERT INTO public.cells VALUES (224);
INSERT INTO public.cells VALUES (225);
INSERT INTO public.cells VALUES (226);
INSERT INTO public.cells VALUES (227);
INSERT INTO public.cells VALUES (228);
INSERT INTO public.cells VALUES (229);
INSERT INTO public.cells VALUES (230);
INSERT INTO public.cells VALUES (231);
INSERT INTO public.cells VALUES (232);
INSERT INTO public.cells VALUES (233);
INSERT INTO public.cells VALUES (234);
INSERT INTO public.cells VALUES (235);
INSERT INTO public.cells VALUES (236);
INSERT INTO public.cells VALUES (237);
INSERT INTO public.cells VALUES (238);
INSERT INTO public.cells VALUES (239);
INSERT INTO public.cells VALUES (240);
INSERT INTO public.cells VALUES (241);
INSERT INTO public.cells VALUES (242);
INSERT INTO public.cells VALUES (243);
INSERT INTO public.cells VALUES (244);
INSERT INTO public.cells VALUES (245);
INSERT INTO public.cells VALUES (246);
INSERT INTO public.cells VALUES (247);
INSERT INTO public.cells VALUES (248);
INSERT INTO public.cells VALUES (249);
INSERT INTO public.cells VALUES (250);
INSERT INTO public.cells VALUES (251);
INSERT INTO public.cells VALUES (252);
INSERT INTO public.cells VALUES (253);
INSERT INTO public.cells VALUES (254);
INSERT INTO public.cells VALUES (255);
INSERT INTO public.cells VALUES (256);


--
-- TOC entry 4452 (class 0 OID 74026)
-- Dependencies: 232
-- Data for Name: contributions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4453 (class 0 OID 74031)
-- Dependencies: 233
-- Data for Name: edges; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.edges VALUES (1, 7.525818152114000, false, 1, 6);
INSERT INTO public.edges VALUES (2, 5.708136334439000, false, 2, 3);
INSERT INTO public.edges VALUES (3, 22.990804816757000, false, 3, 6);
INSERT INTO public.edges VALUES (4, 5.636068540937000, false, 4, 5);
INSERT INTO public.edges VALUES (5, 21.853932352093000, false, 5, 6);
INSERT INTO public.edges VALUES (6, 6.993200230797000, false, 6, 7);
INSERT INTO public.edges VALUES (7, 17.247582346726000, false, 7, 8);
INSERT INTO public.edges VALUES (8, 18.109503496497000, false, 7, 28);
INSERT INTO public.edges VALUES (9, 7.899537955287000, false, 7, 29);
INSERT INTO public.edges VALUES (10, 13.301188957973000, false, 8, 9);
INSERT INTO public.edges VALUES (11, 12.881782515421000, false, 9, 10);
INSERT INTO public.edges VALUES (12, 7.234281388931000, false, 9, 72);
INSERT INTO public.edges VALUES (13, 7.802489762728000, false, 9, 73);
INSERT INTO public.edges VALUES (14, 14.562868187126000, false, 10, 11);
INSERT INTO public.edges VALUES (15, 6.252554811656000, false, 10, 75);
INSERT INTO public.edges VALUES (16, 5.064796420663000, false, 10, 77);
INSERT INTO public.edges VALUES (17, 6.869555531692000, false, 10, 78);
INSERT INTO public.edges VALUES (18, 12.406403230033000, false, 11, 12);
INSERT INTO public.edges VALUES (19, 6.206198711452000, false, 11, 82);
INSERT INTO public.edges VALUES (20, 13.912798458183000, false, 12, 13);
INSERT INTO public.edges VALUES (21, 6.457945401286000, false, 12, 47);
INSERT INTO public.edges VALUES (22, 9.607782145149000, false, 13, 14);
INSERT INTO public.edges VALUES (23, 13.247242187108000, false, 13, 46);
INSERT INTO public.edges VALUES (24, 3.853509657107000, false, 14, 15);
INSERT INTO public.edges VALUES (25, 12.426897450401000, false, 14, 46);
INSERT INTO public.edges VALUES (26, 12.934378272259000, false, 14, 86);
INSERT INTO public.edges VALUES (27, 7.832658425943000, false, 15, 16);
INSERT INTO public.edges VALUES (28, 11.454098914106000, false, 16, 17);
INSERT INTO public.edges VALUES (29, 19.780855565900000, false, 17, 18);
INSERT INTO public.edges VALUES (30, 16.880276365976000, false, 18, 19);
INSERT INTO public.edges VALUES (31, 10.288296481724000, false, 19, 20);
INSERT INTO public.edges VALUES (32, 9.275538980575000, false, 20, 21);
INSERT INTO public.edges VALUES (33, 5.006902378063000, false, 21, 22);
INSERT INTO public.edges VALUES (34, 8.498754952818000, false, 22, 23);
INSERT INTO public.edges VALUES (35, 17.240581121497000, false, 22, 44);
INSERT INTO public.edges VALUES (36, 13.223892054987000, false, 22, 183);
INSERT INTO public.edges VALUES (37, 14.122559271102000, false, 23, 24);
INSERT INTO public.edges VALUES (38, 16.628981719741000, false, 23, 44);
INSERT INTO public.edges VALUES (39, 11.768928014809000, false, 24, 25);
INSERT INTO public.edges VALUES (40, 5.585973396015000, false, 24, 144);
INSERT INTO public.edges VALUES (41, 13.897393739951000, false, 25, 26);
INSERT INTO public.edges VALUES (42, 5.741580224626000, false, 25, 180);
INSERT INTO public.edges VALUES (43, 13.951635604434000, false, 26, 27);
INSERT INTO public.edges VALUES (44, 6.625093951245000, false, 26, 172);
INSERT INTO public.edges VALUES (45, 4.194428411519000, false, 26, 174);
INSERT INTO public.edges VALUES (46, 5.311609545605000, false, 26, 175);
INSERT INTO public.edges VALUES (47, 13.106039065554000, false, 27, 28);
INSERT INTO public.edges VALUES (48, 6.876492289081000, false, 27, 169);
INSERT INTO public.edges VALUES (49, 7.454205349633000, false, 27, 170);
INSERT INTO public.edges VALUES (50, 13.739651190815000, false, 29, 30);
INSERT INTO public.edges VALUES (51, 12.778991897930000, false, 29, 43);
INSERT INTO public.edges VALUES (52, 10.509697487068000, false, 30, 31);
INSERT INTO public.edges VALUES (53, 9.128432738945000, false, 31, 32);
INSERT INTO public.edges VALUES (54, 9.160667924040000, false, 32, 33);
INSERT INTO public.edges VALUES (55, 8.393622768286000, false, 33, 34);
INSERT INTO public.edges VALUES (56, 8.181801257498000, false, 34, 35);
INSERT INTO public.edges VALUES (57, 6.623796401492000, false, 35, 36);
INSERT INTO public.edges VALUES (58, 6.427759143902000, false, 37, 38);
INSERT INTO public.edges VALUES (59, 9.349472459663000, false, 38, 39);
INSERT INTO public.edges VALUES (60, 7.803279080871000, false, 39, 40);
INSERT INTO public.edges VALUES (61, 8.601343763935000, false, 40, 41);
INSERT INTO public.edges VALUES (62, 11.069743316296000, false, 41, 42);
INSERT INTO public.edges VALUES (63, 10.721869083533000, false, 42, 43);
INSERT INTO public.edges VALUES (64, 12.069669413791000, false, 44, 45);
INSERT INTO public.edges VALUES (65, 11.468980556109000, false, 45, 46);
INSERT INTO public.edges VALUES (66, 3.938596431836000, false, 47, 48);
INSERT INTO public.edges VALUES (67, 4.444747788385000, false, 47, 85);
INSERT INTO public.edges VALUES (68, 4.552256973623000, false, 48, 49);
INSERT INTO public.edges VALUES (69, 5.416232216113000, false, 49, 50);
INSERT INTO public.edges VALUES (70, 8.224465987444000, false, 50, 51);
INSERT INTO public.edges VALUES (71, 4.607849959084000, false, 51, 52);
INSERT INTO public.edges VALUES (72, 3.920257842289000, false, 52, 53);
INSERT INTO public.edges VALUES (73, 2.590164994277000, false, 53, 54);
INSERT INTO public.edges VALUES (74, 4.056751373683000, false, 53, 55);
INSERT INTO public.edges VALUES (75, 2.891147828104000, false, 54, 55);
INSERT INTO public.edges VALUES (76, 2.809160641076000, false, 54, 112);
INSERT INTO public.edges VALUES (77, 3.012869480721000, false, 55, 56);
INSERT INTO public.edges VALUES (78, 3.371855813495000, false, 56, 57);
INSERT INTO public.edges VALUES (79, 4.105594736940000, false, 57, 58);
INSERT INTO public.edges VALUES (80, 3.569962292942000, false, 58, 59);
INSERT INTO public.edges VALUES (81, 2.372215755138000, false, 59, 60);
INSERT INTO public.edges VALUES (82, 3.539739519127000, false, 59, 61);
INSERT INTO public.edges VALUES (83, 2.766230838280000, false, 60, 61);
INSERT INTO public.edges VALUES (84, 2.775258353516000, false, 60, 106);
INSERT INTO public.edges VALUES (85, 3.565250848187000, false, 61, 62);
INSERT INTO public.edges VALUES (86, 3.423504935136000, false, 62, 63);
INSERT INTO public.edges VALUES (87, 3.767475164526000, false, 63, 64);
INSERT INTO public.edges VALUES (88, 2.987005557724000, false, 64, 65);
INSERT INTO public.edges VALUES (89, 3.133781344290000, false, 65, 66);
INSERT INTO public.edges VALUES (90, 3.235639535211000, false, 66, 67);
INSERT INTO public.edges VALUES (91, 7.500795140937000, false, 67, 68);
INSERT INTO public.edges VALUES (92, 7.059324079767000, false, 68, 69);
INSERT INTO public.edges VALUES (93, 6.023810218656000, false, 69, 70);
INSERT INTO public.edges VALUES (94, 5.618457312699000, false, 70, 71);
INSERT INTO public.edges VALUES (95, 4.837406927498000, false, 70, 72);
INSERT INTO public.edges VALUES (96, 5.424417997577000, false, 71, 72);
INSERT INTO public.edges VALUES (97, 3.107031527282000, false, 72, 73);
INSERT INTO public.edges VALUES (98, 5.469895334391000, false, 73, 74);
INSERT INTO public.edges VALUES (99, 5.983669633848000, false, 73, 75);
INSERT INTO public.edges VALUES (100, 5.517192328205000, false, 74, 75);
INSERT INTO public.edges VALUES (101, 5.593697224044000, false, 75, 76);
INSERT INTO public.edges VALUES (102, 4.928390155054000, false, 75, 77);
INSERT INTO public.edges VALUES (103, 5.563669996103000, false, 76, 77);
INSERT INTO public.edges VALUES (104, 3.756080145977000, false, 77, 78);
INSERT INTO public.edges VALUES (105, 5.217205815616000, false, 78, 79);
INSERT INTO public.edges VALUES (106, 5.226693344476000, false, 78, 80);
INSERT INTO public.edges VALUES (107, 5.330268966603000, false, 79, 80);
INSERT INTO public.edges VALUES (108, 5.529605154516000, false, 80, 81);
INSERT INTO public.edges VALUES (109, 5.364775449362000, false, 80, 82);
INSERT INTO public.edges VALUES (110, 5.393377811656000, false, 81, 82);
INSERT INTO public.edges VALUES (111, 3.497340665337000, false, 82, 83);
INSERT INTO public.edges VALUES (112, 3.708589412549000, false, 83, 84);
INSERT INTO public.edges VALUES (113, 4.625595655814000, false, 83, 85);
INSERT INTO public.edges VALUES (114, 4.304671426857000, false, 84, 85);
INSERT INTO public.edges VALUES (115, 5.079900456011000, false, 86, 87);
INSERT INTO public.edges VALUES (116, 4.575381891167000, false, 87, 88);
INSERT INTO public.edges VALUES (117, 4.262288020999000, false, 87, 118);
INSERT INTO public.edges VALUES (118, 11.501731098674000, false, 88, 89);
INSERT INTO public.edges VALUES (119, 6.299540077232000, false, 88, 117);
INSERT INTO public.edges VALUES (120, 8.116656149325000, false, 89, 90);
INSERT INTO public.edges VALUES (121, 5.469513647226000, false, 90, 91);
INSERT INTO public.edges VALUES (122, 4.101721502455000, false, 91, 92);
INSERT INTO public.edges VALUES (123, 3.475593929084000, false, 92, 93);
INSERT INTO public.edges VALUES (124, 3.418195528962000, false, 93, 94);
INSERT INTO public.edges VALUES (125, 3.983750724835000, false, 94, 95);
INSERT INTO public.edges VALUES (126, 3.292733921024000, false, 95, 96);
INSERT INTO public.edges VALUES (127, 3.289554825603000, false, 96, 97);
INSERT INTO public.edges VALUES (128, 2.897942109726000, false, 97, 98);
INSERT INTO public.edges VALUES (129, 4.404144377442000, false, 98, 99);
INSERT INTO public.edges VALUES (130, 3.383567093036000, false, 99, 100);
INSERT INTO public.edges VALUES (131, 3.139373360247000, false, 100, 101);
INSERT INTO public.edges VALUES (132, 6.322438364488000, false, 101, 102);
INSERT INTO public.edges VALUES (133, 7.369131161199000, false, 102, 103);
INSERT INTO public.edges VALUES (134, 3.344748711636000, false, 103, 104);
INSERT INTO public.edges VALUES (135, 3.397322716770000, false, 104, 105);
INSERT INTO public.edges VALUES (136, 2.308453714873000, false, 105, 106);
INSERT INTO public.edges VALUES (137, 3.627071453374000, false, 105, 107);
INSERT INTO public.edges VALUES (138, 2.762387996904000, false, 106, 107);
INSERT INTO public.edges VALUES (139, 3.065251120306000, false, 107, 108);
INSERT INTO public.edges VALUES (140, 3.430114324124000, false, 108, 109);
INSERT INTO public.edges VALUES (141, 3.431813511717000, false, 109, 110);
INSERT INTO public.edges VALUES (142, 3.681635321107000, false, 110, 111);
INSERT INTO public.edges VALUES (143, 2.598826032036000, false, 111, 112);
INSERT INTO public.edges VALUES (144, 3.517390749698000, false, 111, 113);
INSERT INTO public.edges VALUES (145, 2.232441893269000, false, 112, 113);
INSERT INTO public.edges VALUES (146, 3.650146459525000, false, 113, 114);
INSERT INTO public.edges VALUES (147, 3.741328681369000, false, 114, 115);
INSERT INTO public.edges VALUES (148, 4.152294659503000, false, 115, 116);
INSERT INTO public.edges VALUES (149, 4.594117102465000, false, 116, 117);
INSERT INTO public.edges VALUES (150, 3.699962236647000, false, 118, 119);
INSERT INTO public.edges VALUES (151, 4.950359799231000, false, 118, 143);
INSERT INTO public.edges VALUES (152, 8.899990667874000, false, 119, 120);
INSERT INTO public.edges VALUES (153, 8.098775171819000, false, 120, 121);
INSERT INTO public.edges VALUES (154, 3.313972528417000, false, 121, 122);
INSERT INTO public.edges VALUES (155, 4.838895163167000, false, 122, 123);
INSERT INTO public.edges VALUES (156, 2.964681151706000, false, 123, 124);
INSERT INTO public.edges VALUES (157, 2.998604021060000, false, 124, 125);
INSERT INTO public.edges VALUES (158, 4.541408985624000, false, 125, 126);
INSERT INTO public.edges VALUES (159, 6.580559282765000, false, 126, 127);
INSERT INTO public.edges VALUES (160, 5.763960041975000, false, 127, 128);
INSERT INTO public.edges VALUES (161, 3.478467473732000, false, 128, 129);
INSERT INTO public.edges VALUES (162, 5.423786897411000, false, 128, 136);
INSERT INTO public.edges VALUES (163, 2.972003743768000, false, 129, 130);
INSERT INTO public.edges VALUES (164, 6.092905322682000, false, 129, 135);
INSERT INTO public.edges VALUES (165, 6.806660801123000, false, 130, 131);
INSERT INTO public.edges VALUES (166, 8.447487190818000, false, 131, 132);
INSERT INTO public.edges VALUES (167, 3.483354330091000, false, 132, 133);
INSERT INTO public.edges VALUES (168, 4.348300606717000, false, 133, 134);
INSERT INTO public.edges VALUES (169, 3.628501204622000, false, 134, 135);
INSERT INTO public.edges VALUES (170, 4.165546862522000, false, 136, 137);
INSERT INTO public.edges VALUES (171, 3.572051841040000, false, 136, 138);
INSERT INTO public.edges VALUES (172, 4.973760610713000, false, 137, 138);
INSERT INTO public.edges VALUES (173, 3.278121747483000, false, 138, 139);
INSERT INTO public.edges VALUES (174, 6.201167842870000, false, 139, 140);
INSERT INTO public.edges VALUES (175, 4.069817027514000, false, 139, 141);
INSERT INTO public.edges VALUES (176, 6.000514540364000, false, 140, 141);
INSERT INTO public.edges VALUES (177, 5.582513010627000, false, 141, 142);
INSERT INTO public.edges VALUES (178, 6.712546753521000, false, 142, 143);
INSERT INTO public.edges VALUES (179, 3.640933770657000, false, 144, 145);
INSERT INTO public.edges VALUES (180, 4.606730647730000, false, 144, 182);
INSERT INTO public.edges VALUES (181, 3.719107304098000, false, 145, 146);
INSERT INTO public.edges VALUES (182, 5.344256745707000, false, 146, 147);
INSERT INTO public.edges VALUES (183, 7.679506391745000, false, 147, 148);
INSERT INTO public.edges VALUES (184, 4.537352075538000, false, 148, 149);
INSERT INTO public.edges VALUES (185, 3.731009110910000, false, 149, 150);
INSERT INTO public.edges VALUES (186, 2.931753292293000, false, 150, 151);
INSERT INTO public.edges VALUES (187, 3.834959830600000, false, 150, 152);
INSERT INTO public.edges VALUES (188, 2.716365331181000, false, 151, 152);
INSERT INTO public.edges VALUES (189, 3.784476955786000, false, 151, 209);
INSERT INTO public.edges VALUES (190, 3.473418554057000, false, 152, 153);
INSERT INTO public.edges VALUES (191, 3.566153926302000, false, 153, 154);
INSERT INTO public.edges VALUES (192, 3.169254677956000, false, 154, 155);
INSERT INTO public.edges VALUES (193, 3.446825428782000, false, 155, 156);
INSERT INTO public.edges VALUES (194, 3.433310608107000, false, 156, 157);
INSERT INTO public.edges VALUES (195, 2.339332652674000, false, 157, 158);
INSERT INTO public.edges VALUES (196, 3.569411077872000, false, 157, 159);
INSERT INTO public.edges VALUES (197, 2.801673623609000, false, 158, 159);
INSERT INTO public.edges VALUES (198, 3.803512067954000, false, 158, 202);
INSERT INTO public.edges VALUES (199, 3.618730313294000, false, 159, 160);
INSERT INTO public.edges VALUES (200, 3.678436273990000, false, 160, 161);
INSERT INTO public.edges VALUES (201, 2.990079733936000, false, 161, 162);
INSERT INTO public.edges VALUES (202, 3.649656245960000, false, 162, 163);
INSERT INTO public.edges VALUES (203, 3.470428259622000, false, 163, 164);
INSERT INTO public.edges VALUES (204, 6.688914473188000, false, 164, 165);
INSERT INTO public.edges VALUES (205, 5.903692282429000, false, 165, 166);
INSERT INTO public.edges VALUES (206, 5.663490483668000, false, 166, 167);
INSERT INTO public.edges VALUES (207, 5.487142673705000, false, 167, 168);
INSERT INTO public.edges VALUES (208, 5.207269168665000, false, 167, 169);
INSERT INTO public.edges VALUES (209, 5.634567848047000, false, 168, 169);
INSERT INTO public.edges VALUES (210, 3.089310840343000, false, 169, 170);
INSERT INTO public.edges VALUES (211, 5.451436065558000, false, 170, 171);
INSERT INTO public.edges VALUES (212, 5.895829409053000, false, 170, 172);
INSERT INTO public.edges VALUES (213, 5.980158819949000, false, 171, 172);
INSERT INTO public.edges VALUES (214, 5.503502517455000, false, 172, 173);
INSERT INTO public.edges VALUES (215, 5.482378059953000, false, 172, 174);
INSERT INTO public.edges VALUES (216, 5.654775089843000, false, 173, 174);
INSERT INTO public.edges VALUES (217, 3.298175954890000, false, 174, 175);
INSERT INTO public.edges VALUES (218, 5.165700035634000, false, 175, 176);
INSERT INTO public.edges VALUES (219, 5.373378829061000, false, 175, 177);
INSERT INTO public.edges VALUES (220, 5.475853090378000, false, 176, 177);
INSERT INTO public.edges VALUES (221, 5.040667788953000, false, 177, 178);
INSERT INTO public.edges VALUES (222, 4.825297892940000, false, 177, 179);
INSERT INTO public.edges VALUES (223, 5.237244180461000, false, 178, 179);
INSERT INTO public.edges VALUES (224, 3.208366379758000, false, 179, 180);
INSERT INTO public.edges VALUES (225, 4.177163743178000, false, 180, 181);
INSERT INTO public.edges VALUES (226, 5.282154684802000, false, 180, 182);
INSERT INTO public.edges VALUES (227, 4.446070730570000, false, 181, 182);
INSERT INTO public.edges VALUES (228, 7.509708142532000, false, 183, 184);
INSERT INTO public.edges VALUES (229, 6.436548925626000, false, 184, 185);
INSERT INTO public.edges VALUES (230, 6.704490095515000, false, 185, 186);
INSERT INTO public.edges VALUES (231, 2.803479235726000, false, 185, 215);
INSERT INTO public.edges VALUES (232, 7.508479739416000, false, 186, 187);
INSERT INTO public.edges VALUES (233, 5.300484680909000, false, 187, 188);
INSERT INTO public.edges VALUES (234, 4.174535053191000, false, 188, 189);
INSERT INTO public.edges VALUES (235, 3.491529617733000, false, 189, 190);
INSERT INTO public.edges VALUES (236, 3.731124180799000, false, 190, 191);
INSERT INTO public.edges VALUES (237, 3.650712291877000, false, 191, 192);
INSERT INTO public.edges VALUES (238, 3.342140352074000, false, 192, 193);
INSERT INTO public.edges VALUES (239, 3.968323953517000, false, 193, 194);
INSERT INTO public.edges VALUES (240, 3.078334925512000, false, 194, 195);
INSERT INTO public.edges VALUES (241, 3.386965075223000, false, 195, 196);
INSERT INTO public.edges VALUES (242, 3.305200525525000, false, 196, 197);
INSERT INTO public.edges VALUES (243, 3.305200639902000, false, 197, 198);
INSERT INTO public.edges VALUES (244, 6.224534995560000, false, 198, 199);
INSERT INTO public.edges VALUES (245, 6.487092563706000, false, 199, 200);
INSERT INTO public.edges VALUES (246, 3.020290746962000, false, 200, 201);
INSERT INTO public.edges VALUES (247, 2.885995025691000, false, 201, 202);
INSERT INTO public.edges VALUES (248, 3.552409927960000, false, 201, 203);
INSERT INTO public.edges VALUES (249, 2.145764643545000, false, 202, 203);
INSERT INTO public.edges VALUES (250, 3.422640725311000, false, 203, 204);
INSERT INTO public.edges VALUES (251, 3.182902873644000, false, 204, 205);
INSERT INTO public.edges VALUES (252, 4.018855106949000, false, 205, 206);
INSERT INTO public.edges VALUES (253, 3.147118887678000, false, 206, 207);
INSERT INTO public.edges VALUES (254, 3.907327196124000, false, 207, 208);
INSERT INTO public.edges VALUES (255, 2.574860805858000, false, 208, 209);
INSERT INTO public.edges VALUES (256, 3.785225507737000, false, 208, 210);
INSERT INTO public.edges VALUES (257, 2.145707366664000, false, 209, 210);
INSERT INTO public.edges VALUES (258, 2.878781693055000, false, 210, 211);
INSERT INTO public.edges VALUES (259, 3.860621654204000, false, 211, 212);
INSERT INTO public.edges VALUES (260, 4.319238444454000, false, 212, 213);
INSERT INTO public.edges VALUES (261, 4.887904143844000, false, 213, 214);
INSERT INTO public.edges VALUES (262, 4.871716041745000, false, 215, 216);
INSERT INTO public.edges VALUES (263, 5.760488290930000, false, 215, 239);
INSERT INTO public.edges VALUES (264, 7.191823121244000, false, 216, 217);
INSERT INTO public.edges VALUES (265, 4.668546744548000, false, 217, 218);
INSERT INTO public.edges VALUES (266, 3.319347095569000, false, 218, 219);
INSERT INTO public.edges VALUES (267, 3.385418652529000, false, 219, 220);
INSERT INTO public.edges VALUES (268, 3.552096052014000, false, 220, 221);
INSERT INTO public.edges VALUES (269, 5.565973955728000, false, 221, 222);
INSERT INTO public.edges VALUES (270, 10.152668347997000, false, 222, 223);
INSERT INTO public.edges VALUES (271, 4.008232839840000, false, 223, 224);
INSERT INTO public.edges VALUES (272, 4.487421782893000, false, 223, 231);
INSERT INTO public.edges VALUES (273, 2.969296841851000, false, 224, 225);
INSERT INTO public.edges VALUES (274, 7.109627452086000, false, 224, 230);
INSERT INTO public.edges VALUES (275, 7.310492428292000, false, 225, 226);
INSERT INTO public.edges VALUES (276, 7.926697525736000, false, 226, 227);
INSERT INTO public.edges VALUES (277, 4.084866353471000, false, 227, 228);
INSERT INTO public.edges VALUES (278, 3.651438384238000, false, 228, 229);
INSERT INTO public.edges VALUES (279, 3.751782127558000, false, 229, 230);
INSERT INTO public.edges VALUES (280, 3.717718430271000, false, 231, 232);
INSERT INTO public.edges VALUES (281, 3.768999632189000, false, 231, 233);
INSERT INTO public.edges VALUES (282, 3.625213464534000, false, 232, 233);
INSERT INTO public.edges VALUES (283, 3.163405489298000, false, 233, 234);
INSERT INTO public.edges VALUES (284, 5.181262068314000, false, 234, 235);
INSERT INTO public.edges VALUES (285, 3.623646800920000, false, 234, 236);
INSERT INTO public.edges VALUES (286, 6.395559281235000, false, 235, 236);
INSERT INTO public.edges VALUES (287, 4.203547585227000, false, 236, 237);
INSERT INTO public.edges VALUES (288, 5.540819579201000, false, 237, 238);
INSERT INTO public.edges VALUES (289, 6.570074498208000, false, 238, 239);


--
-- TOC entry 4454 (class 0 OID 74037)
-- Dependencies: 234
-- Data for Name: grave_rows; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.grave_rows VALUES (1, '2024-12-26 08:14:03.26633', '2024-12-26 08:14:03.266864', 'A 1', 'VH- Số1', 70, 70);
INSERT INTO public.grave_rows VALUES (2, '2024-12-26 08:14:03.270118', '2024-12-26 08:14:03.270118', 'A 1', 'VH- Số2', 75, 75);
INSERT INTO public.grave_rows VALUES (3, '2024-12-26 08:14:03.271704', '2024-12-26 08:14:03.271704', 'A 1', 'VH- Số3', 80, 80);
INSERT INTO public.grave_rows VALUES (4, '2024-12-26 08:14:03.273924', '2024-12-26 08:14:03.274438', 'A 1', 'VH- Số4', 47, 47);
INSERT INTO public.grave_rows VALUES (5, '2024-12-26 08:14:03.276106', '2024-12-26 08:14:03.276642', 'A 1', 'VH- Số5', 48, 48);
INSERT INTO public.grave_rows VALUES (6, '2024-12-26 08:14:03.27945', '2024-12-26 08:14:03.27945', 'A 1', 'VH- Số6', 49, 50);
INSERT INTO public.grave_rows VALUES (7, '2024-12-26 08:14:03.281749', '2024-12-26 08:14:03.281749', 'A 1', 'Hàng 1', 69, 67);
INSERT INTO public.grave_rows VALUES (8, '2024-12-26 08:14:03.283379', '2024-12-26 08:14:03.283379', 'A 1', 'Hàng 2', 71, 66);
INSERT INTO public.grave_rows VALUES (9, '2024-12-26 08:14:03.28501', '2024-12-26 08:14:03.28501', 'A 1', 'Hàng 3', 72, 65);
INSERT INTO public.grave_rows VALUES (10, '2024-12-26 08:14:03.287169', '2024-12-26 08:14:03.287169', 'A 1', 'Hàng 4', 73, 64);
INSERT INTO public.grave_rows VALUES (11, '2024-12-26 08:14:03.288253', '2024-12-26 08:14:03.288253', 'A 1', 'Hàng 5', 74, 63);
INSERT INTO public.grave_rows VALUES (12, '2024-12-26 08:14:03.289882', '2024-12-26 08:14:03.289882', 'A 1', 'Hàng 6', 76, 62);
INSERT INTO public.grave_rows VALUES (13, '2024-12-26 08:14:03.292065', '2024-12-26 08:14:03.292065', 'A 1', 'Hàng 7', 77, 61);
INSERT INTO public.grave_rows VALUES (14, '2024-12-26 08:14:03.293582', '2024-12-26 08:14:03.293582', 'A 1', 'Hàng 8', 78, 59);
INSERT INTO public.grave_rows VALUES (15, '2024-12-26 08:14:03.294788', '2024-12-26 08:14:03.294788', 'A 1', 'Hàng 9', 79, 58);
INSERT INTO public.grave_rows VALUES (16, '2024-12-26 08:14:03.296214', '2024-12-26 08:14:03.296214', 'A 1', 'Hàng 10', 81, 57);
INSERT INTO public.grave_rows VALUES (17, '2024-12-26 08:14:03.298232', '2024-12-26 08:14:03.298232', 'A 1', 'Hàng 11', 82, 56);
INSERT INTO public.grave_rows VALUES (18, '2024-12-26 08:14:03.299234', '2024-12-26 08:14:03.299234', 'A 1', 'Hàng 12', 83, 55);
INSERT INTO public.grave_rows VALUES (19, '2024-12-26 08:14:03.300747', '2024-12-26 08:14:03.300747', 'A 1', 'Hàng 13', 84, 53);
INSERT INTO public.grave_rows VALUES (20, '2024-12-26 08:14:03.301762', '2024-12-26 08:14:03.301762', 'A 1', 'Hàng 14', 52, 52);
INSERT INTO public.grave_rows VALUES (21, '2024-12-26 08:14:03.302763', '2024-12-26 08:14:03.302763', 'A 1', 'Hàng 15', 51, 51);
INSERT INTO public.grave_rows VALUES (22, '2024-12-26 08:14:03.303762', '2024-12-26 08:14:03.303762', 'A 2', 'VH- Số1', 167, 167);
INSERT INTO public.grave_rows VALUES (23, '2024-12-26 08:14:03.305761', '2024-12-26 08:14:03.305761', 'A 2', 'VH- Số2', 172, 172);
INSERT INTO public.grave_rows VALUES (24, '2024-12-26 08:14:03.307428', '2024-12-26 08:14:03.307428', 'A 2', 'VH- Số3', 177, 177);
INSERT INTO public.grave_rows VALUES (25, '2024-12-26 08:14:03.309082', '2024-12-26 08:14:03.309082', 'A 2', 'VH- Số4', 144, 144);
INSERT INTO public.grave_rows VALUES (26, '2024-12-26 08:14:03.310806', '2024-12-26 08:14:03.310806', 'A 2', 'VH- Số5', 145, 145);
INSERT INTO public.grave_rows VALUES (27, '2024-12-26 08:14:03.312458', '2024-12-26 08:14:03.312458', 'A 2', 'VH- Số6', 146, 147);
INSERT INTO public.grave_rows VALUES (28, '2024-12-26 08:14:03.313505', '2024-12-26 08:14:03.313505', 'A 2', 'Hàng 1', 164, 166);
INSERT INTO public.grave_rows VALUES (29, '2024-12-26 08:14:03.315099', '2024-12-26 08:14:03.315099', 'A 2', 'Hàng 2', 163, 168);
INSERT INTO public.grave_rows VALUES (30, '2024-12-26 08:14:03.31615', '2024-12-26 08:14:03.31615', 'A 2', 'Hàng 3', 162, 169);
INSERT INTO public.grave_rows VALUES (31, '2024-12-26 08:14:03.317755', '2024-12-26 08:14:03.317755', 'A 2', 'Hàng 4', 161, 170);
INSERT INTO public.grave_rows VALUES (32, '2024-12-26 08:14:03.319396', '2024-12-26 08:14:03.319396', 'A 2', 'Hàng 5', 160, 171);
INSERT INTO public.grave_rows VALUES (33, '2024-12-26 08:14:03.320773', '2024-12-26 08:14:03.320773', 'A 2', 'Hàng 6', 159, 173);
INSERT INTO public.grave_rows VALUES (34, '2024-12-26 08:14:03.32182', '2024-12-26 08:14:03.32182', 'A 2', 'Hàng 7', 157, 174);
INSERT INTO public.grave_rows VALUES (35, '2024-12-26 08:14:03.322909', '2024-12-26 08:14:03.322909', 'A 2', 'Hàng 8', 156, 175);
INSERT INTO public.grave_rows VALUES (36, '2024-12-26 08:14:03.325057', '2024-12-26 08:14:03.325057', 'A 2', 'Hàng 9', 155, 176);
INSERT INTO public.grave_rows VALUES (37, '2024-12-26 08:14:03.326171', '2024-12-26 08:14:03.326171', 'A 2', 'Hàng 10', 154, 178);
INSERT INTO public.grave_rows VALUES (38, '2024-12-26 08:14:03.32727', '2024-12-26 08:14:03.32727', 'A 2', 'Hàng 11', 153, 179);
INSERT INTO public.grave_rows VALUES (39, '2024-12-26 08:14:03.328338', '2024-12-26 08:14:03.328338', 'A 2', 'Hàng 12', 152, 180);
INSERT INTO public.grave_rows VALUES (40, '2024-12-26 08:14:03.329963', '2024-12-26 08:14:03.329963', 'A 2', 'Hàng 13', 150, 181);
INSERT INTO public.grave_rows VALUES (41, '2024-12-26 08:14:03.331018', '2024-12-26 08:14:03.331018', 'A 2', 'Hàng 14', 149, 149);
INSERT INTO public.grave_rows VALUES (42, '2024-12-26 08:14:03.332655', '2024-12-26 08:14:03.332655', 'A 2', 'Hàng 15', 148, 148);
INSERT INTO public.grave_rows VALUES (43, '2024-12-26 08:14:03.33431', '2024-12-26 08:14:03.33431', 'B 1', 'Hàng 1', 103, 101);
INSERT INTO public.grave_rows VALUES (44, '2024-12-26 08:14:03.335873', '2024-12-26 08:14:03.335873', 'B 1', 'Hàng 2', 104, 100);
INSERT INTO public.grave_rows VALUES (45, '2024-12-26 08:14:03.337537', '2024-12-26 08:14:03.337537', 'B 1', 'Hàng 3', 105, 99);
INSERT INTO public.grave_rows VALUES (46, '2024-12-26 08:14:03.339193', '2024-12-26 08:14:03.339193', 'B 1', 'Hàng 4', 107, 98);
INSERT INTO public.grave_rows VALUES (47, '2024-12-26 08:14:03.340327', '2024-12-26 08:14:03.340327', 'B 1', 'Hàng 5', 108, 97);
INSERT INTO public.grave_rows VALUES (48, '2024-12-26 08:14:03.342003', '2024-12-26 08:14:03.342003', 'B 1', 'Hàng 6', 109, 96);
INSERT INTO public.grave_rows VALUES (49, '2024-12-26 08:14:03.343633', '2024-12-26 08:14:03.343633', 'B 1', 'Hàng 7', 110, 95);
INSERT INTO public.grave_rows VALUES (50, '2024-12-26 08:14:03.345252', '2024-12-26 08:14:03.345252', 'B 1', 'Hàng 8', 111, 94);
INSERT INTO public.grave_rows VALUES (51, '2024-12-26 08:14:03.346314', '2024-12-26 08:14:03.346314', 'B 1', 'Hàng 9', 113, 93);
INSERT INTO public.grave_rows VALUES (52, '2024-12-26 08:14:03.347941', '2024-12-26 08:14:03.347941', 'B 1', 'Hàng 10', 114, 92);
INSERT INTO public.grave_rows VALUES (53, '2024-12-26 08:14:03.348992', '2024-12-26 08:14:03.348992', 'B 1', 'Hàng 11', 115, 91);
INSERT INTO public.grave_rows VALUES (54, '2024-12-26 08:14:03.350068', '2024-12-26 08:14:03.350068', 'B 1', 'Hàng 12', 116, 90);
INSERT INTO public.grave_rows VALUES (55, '2024-12-26 08:14:03.351587', '2024-12-26 08:14:03.351587', 'B 1', 'Hàng 13', 117, 89);
INSERT INTO public.grave_rows VALUES (56, '2024-12-26 08:14:03.352652', '2024-12-26 08:14:03.352652', 'B 2', 'Hàng 1', 198, 200);
INSERT INTO public.grave_rows VALUES (57, '2024-12-26 08:14:03.353612', '2024-12-26 08:14:03.353612', 'B 2', 'Hàng 2', 197, 201);
INSERT INTO public.grave_rows VALUES (58, '2024-12-26 08:14:03.354613', '2024-12-26 08:14:03.354613', 'B 2', 'Hàng 3', 196, 203);
INSERT INTO public.grave_rows VALUES (59, '2024-12-26 08:14:03.356805', '2024-12-26 08:14:03.356805', 'B 2', 'Hàng 4', 195, 204);
INSERT INTO public.grave_rows VALUES (60, '2024-12-26 08:14:03.358366', '2024-12-26 08:14:03.358366', 'B 2', 'Hàng 5', 194, 205);
INSERT INTO public.grave_rows VALUES (61, '2024-12-26 08:14:03.360101', '2024-12-26 08:14:03.360101', 'B 2', 'Hàng 6', 193, 206);
INSERT INTO public.grave_rows VALUES (62, '2024-12-26 08:14:03.361148', '2024-12-26 08:14:03.361148', 'B 2', 'Hàng 7', 192, 207);
INSERT INTO public.grave_rows VALUES (63, '2024-12-26 08:14:03.362817', '2024-12-26 08:14:03.362817', 'B 2', 'Hàng 8', 191, 208);
INSERT INTO public.grave_rows VALUES (64, '2024-12-26 08:14:03.364439', '2024-12-26 08:14:03.364439', 'B 2', 'Hàng 9', 190, 210);
INSERT INTO public.grave_rows VALUES (65, '2024-12-26 08:14:03.3661', '2024-12-26 08:14:03.3661', 'B 2', 'Hàng 10', 189, 211);
INSERT INTO public.grave_rows VALUES (66, '2024-12-26 08:14:03.367708', '2024-12-26 08:14:03.367708', 'B 2', 'Hàng 11', 188, 212);
INSERT INTO public.grave_rows VALUES (67, '2024-12-26 08:14:03.368768', '2024-12-26 08:14:03.368768', 'B 2', 'Hàng 12', 187, 213);
INSERT INTO public.grave_rows VALUES (68, '2024-12-26 08:14:03.37044', '2024-12-26 08:14:03.37044', 'B 2', 'Hàng 13', 186, 214);
INSERT INTO public.grave_rows VALUES (69, '2024-12-26 08:14:03.371661', '2024-12-26 08:14:03.371661', 'C 1', 'VH Số 1', 118, 143);
INSERT INTO public.grave_rows VALUES (70, '2024-12-26 08:14:03.373333', '2024-12-26 08:14:03.373333', 'C 1', 'Hàng 1', 119, 121);
INSERT INTO public.grave_rows VALUES (71, '2024-12-26 08:14:03.374949', '2024-12-26 08:14:03.374949', 'C 1', 'Hàng 2', 142, 122);
INSERT INTO public.grave_rows VALUES (72, '2024-12-26 08:14:03.376513', '2024-12-26 08:14:03.376513', 'C 1', 'Hàng 3', 141, 123);
INSERT INTO public.grave_rows VALUES (73, '2024-12-26 08:14:03.378791', '2024-12-26 08:14:03.378791', 'C 1', 'Hàng 4', 139, 124);
INSERT INTO public.grave_rows VALUES (74, '2024-12-26 08:14:03.380416', '2024-12-26 08:14:03.380416', 'C 1', 'Hàng 5', 138, 125);
INSERT INTO public.grave_rows VALUES (75, '2024-12-26 08:14:03.382027', '2024-12-26 08:14:03.382027', 'C 1', 'Hàng 6', 136, 126);
INSERT INTO public.grave_rows VALUES (76, '2024-12-26 08:14:03.384212', '2024-12-26 08:14:03.384212', 'C 2', 'VH Số 1', 238, 238);
INSERT INTO public.grave_rows VALUES (77, '2024-12-26 08:14:03.385298', '2024-12-26 08:14:03.385298', 'C 2', 'Hàng 1', 217, 239);
INSERT INTO public.grave_rows VALUES (78, '2024-12-26 08:14:03.387088', '2024-12-26 08:14:03.387088', 'C 2', 'Hàng 2', 218, 237);
INSERT INTO public.grave_rows VALUES (79, '2024-12-26 08:14:03.388819', '2024-12-26 08:14:03.388819', 'C 2', 'Hàng 3', 219, 236);
INSERT INTO public.grave_rows VALUES (80, '2024-12-26 08:14:03.390477', '2024-12-26 08:14:03.390477', 'C 2', 'Hàng 4', 220, 234);
INSERT INTO public.grave_rows VALUES (81, '2024-12-26 08:14:03.392092', '2024-12-26 08:14:03.392092', 'C 2', 'Hàng 5', 221, 233);
INSERT INTO public.grave_rows VALUES (82, '2024-12-26 08:14:03.393737', '2024-12-26 08:14:03.393737', 'C 2', 'Hàng 6', 222, 231);
INSERT INTO public.grave_rows VALUES (83, '2024-12-26 08:14:03.395434', '2024-12-26 08:14:03.395434', 'D 1', 'Hàng 1', 133, 135);
INSERT INTO public.grave_rows VALUES (84, '2024-12-26 08:14:03.397065', '2024-12-26 08:14:03.397065', 'D 1', 'Hàng 2', 132, 130);
INSERT INTO public.grave_rows VALUES (85, '2024-12-26 08:14:03.398709', '2024-12-26 08:14:03.398709', 'D 2', 'Hàng 1', 230, 228);
INSERT INTO public.grave_rows VALUES (86, '2024-12-26 08:14:03.3998', '2024-12-26 08:14:03.3998', 'D 2', 'Hàng 2', 225, 227);
INSERT INTO public.grave_rows VALUES (1000, '2024-12-26 08:14:17.933748', '2024-12-26 08:14:17.933748', 'khu 8', 'hàng 9', NULL, NULL);
--
-- TOC entry 4462 (class 0 OID 74083)
-- Dependencies: 242
-- Data for Name: vertices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.vertices VALUES (1, '0101000020E6100000B18D7F6646695A4003B5B32964EC2440', 10.461701682269, 105.644921898426);
INSERT INTO public.vertices VALUES (2, '0101000020E6100000E91852B044695A407E145AC67FEC2440', 10.461912344452, 105.644817428754);
INSERT INTO public.vertices VALUES (3, '0101000020E6100000B935D48A45695A40282E033480EC2440', 10.461915612591, 105.644869525181);
INSERT INTO public.vertices VALUES (4, '0101000020E6100000EEF5F48648695A40A0EDC9844DEC2440', 10.461528920793, 105.645051707477);
INSERT INTO public.vertices VALUES (5, '0101000020E61000007141A10349695A4042203EF252EC2440', 10.461570329746, 105.645081431843);
INSERT INTO public.vertices VALUES (6, '0101000020E61000006E0CC45647695A40D8A6891469EC2440', 10.461739198497, 105.644979182676);
INSERT INTO public.vertices VALUES (7, '0101000020E61000002647B23C48695A40AE0B6A536DEC2440', 10.461771589942, 105.645034002399);
INSERT INTO public.vertices VALUES (8, '0101000020E61000001C75D6FF49695A40B6498C745EEC2440', 10.461658136487, 105.645141562873);
INSERT INTO public.vertices VALUES (9, '0101000020E610000022014BE94B695A402F707D075AEC2440', 10.461624368727, 105.645258258101);
INSERT INTO public.vertices VALUES (10, '0101000020E6100000C89274AF4D695A404358D20260EC2440', 10.461670005967, 105.64536653885);
INSERT INTO public.vertices VALUES (11, '0101000020E6100000782DDE684F695A4049A7F1876AEC2440', 10.461750267266, 105.645471779795);
INSERT INTO public.vertices VALUES (12, '0101000020E6100000C26F98B650695A40C685D6F474EC2440', 10.461829806506, 105.645551346649);
INSERT INTO public.vertices VALUES (13, '0101000020E6100000C958A71B52695A40337C112581EC2440', 10.461922796616, 105.645636475968);
INSERT INTO public.vertices VALUES (14, '0101000020E6100000FD02728653695A4075FDEA2283EC2440', 10.461937991319, 105.64572297224);
INSERT INTO public.vertices VALUES (15, '0101000020E610000053B6781354695A404BAE397F84EC2440', 10.461948371688, 105.6457565955);
INSERT INTO public.vertices VALUES (16, '0101000020E610000025B451EA54695A409C2B70F38AEC2440', 10.461997611468, 105.645807819165);
INSERT INTO public.vertices VALUES (17, '0101000020E6100000E97C8EE754695A40F3D9C87398EC2440', 10.462100618618, 105.645807160519);
INSERT INTO public.vertices VALUES (18, '0101000020E6100000C5FE1E5555695A40F0FA5686AFEC2440', 10.46227664768, 105.645833282727);
INSERT INTO public.vertices VALUES (19, '0101000020E6100000A857EFD752695A40F44D9E0FB3EC2440', 10.462303627085, 105.645681365712);
INSERT INTO public.vertices VALUES (20, '0101000020E61000004B0BEB8351695A40951A8937B9EC2440', 10.462350593077, 105.645600299392);
INSERT INTO public.vertices VALUES (21, '0101000020E61000006F7DB92650695A40AE34021FB7EC2440', 10.462334603328, 105.645517045157);
INSERT INTO public.vertices VALUES (22, '0101000020E61000005DB0B28E4F695A403372C083B3EC2440', 10.462307088129, 105.645480799199);
INSERT INTO public.vertices VALUES (23, '0101000020E61000007C1FC7D44E695A40A7EB1E49ABEC2440', 10.462244305634, 105.645436472374);
INSERT INTO public.vertices VALUES (24, '0101000020E6100000B005D3C74C695A403479452DA7EC2440', 10.462212958079, 105.645311313702);
INSERT INTO public.vertices VALUES (25, '0101000020E61000007EA59F184B695A4029B2FF11A3EC2440', 10.462181627715, 105.645208507447);
INSERT INTO public.vertices VALUES (26, '0101000020E6100000BD2CEF3E49695A40B0E0628E9BEC2440', 10.462124299593, 105.645095571107);
INSERT INTO public.vertices VALUES (27, '0101000020E6100000EA98E5B247695A407CC8D87E90EC2440', 10.462039913142, 105.64500114843);
INSERT INTO public.vertices VALUES (28, '0101000020E6100000F738554D47695A4064927D5D81EC2440', 10.461924478129, 105.644976933694);
INSERT INTO public.vertices VALUES (29, '0101000020E61000000CE6FF3A49695A403B798F6372EC2440', 10.461810218109, 105.645094633008);
INSERT INTO public.vertices VALUES (30, '0101000020E610000073BAD4B54A695A409A4F2A2167EC2440', 10.461724316039, 105.645184953444);
INSERT INTO public.vertices VALUES (31, '0101000020E6100000345AFF3A4C695A405523B1E563EC2440', 10.461699655412, 105.645277737968);
INSERT INTO public.vertices VALUES (32, '0101000020E61000006757FC8B4D695A40EFEDC6D166EC2440', 10.461721950086, 105.645358082225);
INSERT INTO public.vertices VALUES (33, '0101000020E61000005CBC70A64E695A40791B283E6DEC2440', 10.461770956417, 105.645425424665);
INSERT INTO public.vertices VALUES (34, '0101000020E6100000956E35964F695A40CDEF91D873EC2440', 10.461821334662, 105.645482589893);
INSERT INTO public.vertices VALUES (35, '0101000020E610000054EC4F7550695A404878FFA07AEC2440', 10.461873084245, 105.645535781908);
INSERT INTO public.vertices VALUES (36, '0101000020E6100000486A3E0E51695A404F7F2BDD80EC2440', 10.461920653877, 105.645572243645);
INSERT INTO public.vertices VALUES (37, '0101000020E61000007BB62E564E695A40ACC37D14A5EC2440', 10.462196960785, 105.64540628969);
INSERT INTO public.vertices VALUES (38, '0101000020E6100000BEEC46644D695A4091B78A9DA3EC2440', 10.462185786422, 105.645348614943);
INSERT INTO public.vertices VALUES (39, '0101000020E6100000370DDD084C695A4024678DE1A0EC2440', 10.462164925109, 105.645265785094);
INSERT INTO public.vertices VALUES (40, '0101000020E61000005E42AD004B695A40BE04A98E9CEC2440', 10.462131937153, 105.645202798079);
INSERT INTO public.vertices VALUES (41, '0101000020E61000002A47BEDE49695A4068C3F3B797EC2440', 10.462095020777, 105.645133672541);
INSERT INTO public.vertices VALUES (42, '0101000020E61000003CF7B4D748695A40EBB5A7798DEC2440', 10.462016870234, 105.645070959782);
INSERT INTO public.vertices VALUES (43, '0101000020E61000002C394BB548695A40B8D48BE180EC2440', 10.461920784301, 105.64506275507);
INSERT INTO public.vertices VALUES (44, '0101000020E61000009990401A51695A408015713AA3EC2440', 10.462182833008, 105.64557510667);
INSERT INTO public.vertices VALUES (45, '0101000020E61000002C37151051695A409659260195EC2440', 10.462074314052, 105.645572682112);
INSERT INTO public.vertices VALUES (46, '0101000020E6100000AC4D6EAA52695A40D0E6892190EC2440', 10.462037132343, 105.645670516699);
INSERT INTO public.vertices VALUES (47, '0101000020E61000004CB3894951695A4065EDF7D36EEC2440', 10.461783050551, 105.645586380456);
INSERT INTO public.vertices VALUES (48, '0101000020E6100000C1A127E051695A401A6357776EEC2440', 10.461780290048, 105.645622290328);
INSERT INTO public.vertices VALUES (49, '0101000020E61000007C76C48E52695A40D1FDE86F6EEC2440', 10.46178006858, 105.645663921221);
INSERT INTO public.vertices VALUES (50, '0101000020E610000096093F1A53695A40194D98B469EC2440', 10.461743968574, 105.64569717556);
INSERT INTO public.vertices VALUES (51, '0101000020E6100000B5CB12E552695A403BBE442660EC2440', 10.461671062366, 105.645684498172);
INSERT INTO public.vertices VALUES (52, '0101000020E6100000DE8AEC9A52695A40743912385BEC2440', 10.461633445954, 105.645666819571);
INSERT INTO public.vertices VALUES (53, '0101000020E610000015EDF64152695A401CC44D7E57EC2440', 10.46160502147, 105.645645609988);
INSERT INTO public.vertices VALUES (54, '0101000020E6100000BC80AB3952695A40481C6B7354EC2440', 10.461581808877, 105.645643632396);
INSERT INTO public.vertices VALUES (55, '0101000020E61000001DC0C6CA51695A40F9C8476B54EC2440', 10.461581566346, 105.64561719331);
INSERT INTO public.vertices VALUES (56, '0101000020E610000063EE767151695A402DDD492A52EC2440', 10.461564370648, 105.645595899719);
INSERT INTO public.vertices VALUES (57, '0101000020E6100000A2EA930351695A400076A71150EC2440', 10.461548377697, 105.64556970067);
INSERT INTO public.vertices VALUES (58, '0101000020E6100000C0FA8E7E50695A40B463777A4DEC2440', 10.461528613161, 105.645537986401);
INSERT INTO public.vertices VALUES (59, '0101000020E6100000E95F620650695A4026AC02764BEC2440', 10.461513221575, 105.64550933463);
INSERT INTO public.vertices VALUES (60, '0101000020E6100000FB18310450695A40D1825FAA48EC2440', 10.46149189392, 105.6455088119);
INSERT INTO public.vertices VALUES (61, '0101000020E61000005B5E6F9A4F695A407E441FEE48EC2440', 10.461493912999, 105.645483597525);
INSERT INTO public.vertices VALUES (62, '0101000020E61000006FD89E2B4F695A404C68AB7746EC2440', 10.461475124048, 105.645457177279);
INSERT INTO public.vertices VALUES (63, '0101000020E6100000D9CA0EBE4E695A4099D0293E44EC2440', 10.46145815144, 105.645431055494);
INSERT INTO public.vertices VALUES (64, '0101000020E61000002CEB36464E695A409FFADBC241EC2440', 10.461439217904, 105.645402482635);
INSERT INTO public.vertices VALUES (65, '0101000020E6100000C57B13E84D695A404BBD0FC13FEC2440', 10.461423905536, 105.645380038287);
INSERT INTO public.vertices VALUES (66, '0101000020E6100000415169824D695A40B8177EC83DEC2440', 10.46140886821, 105.645355799531);
INSERT INTO public.vertices VALUES (67, '0101000020E6100000AF45D50D4D695A404B907C793CEC2440', 10.461398884254, 105.645328005098);
INSERT INTO public.vertices VALUES (68, '0101000020E610000083AC140C4C695A402FF6376740EC2440', 10.461428857404, 105.645266552152);
INSERT INTO public.vertices VALUES (69, '0101000020E6100000B7A1D3E24B695A40D89B96A048EC2440', 10.461491602311, 105.645256716415);
INSERT INTO public.vertices VALUES (70, '0101000020E6100000126168CB4B695A40EF75FCB04FEC2440', 10.461545496767, 105.645251132901);
INSERT INTO public.vertices VALUES (71, '0101000020E6100000F8B4A1814C695A40C57EC4274CEC2440', 10.46151851915, 105.645294578473);
INSERT INTO public.vertices VALUES (72, '0101000020E6100000683D956C4C695A40B941418452EC2440', 10.461567051855, 105.645289560072);
INSERT INTO public.vertices VALUES (73, '0101000020E610000026B627D44C695A40B0CC1B5454EC2440', 10.461580875772, 105.645314253598);
INSERT INTO public.vertices VALUES (74, '0101000020E6100000F9AA009B4D695A400ABA754552EC2440', 10.461565180417, 105.645361662533);
INSERT INTO public.vertices VALUES (75, '0101000020E61000002CBF16874D695A403FFFF3BE58EC2440', 10.461614577565, 105.645356914724);
INSERT INTO public.vertices VALUES (76, '0101000020E610000073E4F4354E695A405B97D5EC54EC2440', 10.461585427354, 105.645398606446);
INSERT INTO public.vertices VALUES (77, '0101000020E610000053CEE82D4E695A40D3C28B7A5BEC2440', 10.461635427056, 105.645396687841);
INSERT INTO public.vertices VALUES (78, '0101000020E610000017917EAB4E695A4025490EA65DEC2440', 10.46165198254, 105.645426629639);
INSERT INTO public.vertices VALUES (79, '0101000020E6100000AEA8B2614F695A40365EED1A5BEC2440', 10.461632577396, 105.645470070335);
INSERT INTO public.vertices VALUES (80, '0101000020E6100000797DB84B4F695A4003FB145A61EC2440', 10.461680235921, 105.645464830557);
INSERT INTO public.vertices VALUES (81, '0101000020E6100000651C950850695A4077C29F625EEC2440', 10.461657602312, 105.645509858719);
INSERT INTO public.vertices VALUES (82, '0101000020E61000001741C1F94F695A407ACEF4B964EC2440', 10.461705981382, 105.645506323552);
INSERT INTO public.vertices VALUES (83, '0101000020E61000002BCC6E6250695A404997FC4D67EC2440', 10.461725651821, 105.645531280709);
INSERT INTO public.vertices VALUES (84, '0101000020E610000092C0AFF050695A40DD8AD34C67EC2440', 10.46172561724, 105.645565196641);
INSERT INTO public.vertices VALUES (85, '0101000020E61000007AB38AB850695A40C00C6A126CEC2440', 10.461762023397, 105.645551810694);
INSERT INTO public.vertices VALUES (86, '0101000020E6100000DA0D72D853695A40D6637D1974EC2440', 10.461823269421, 105.645742522603);
INSERT INTO public.vertices VALUES (87, '0101000020E61000000DA91E0454695A40C1A891436EEC2440', 10.461778747111, 105.645752935354);
INSERT INTO public.vertices VALUES (88, '0101000020E610000039C8A51E54695A40784AC1EE68EC2440', 10.461738072486, 105.645759260079);
INSERT INTO public.vertices VALUES (89, '0101000020E610000056B7BB8154695A40DE76A2B85BEC2440', 10.461637277443, 105.645782883946);
INSERT INTO public.vertices VALUES (90, '0101000020E61000009C428EA954695A4059D2733B52EC2440', 10.461564882172, 105.645792378355);
INSERT INTO public.vertices VALUES (91, '0101000020E61000008CCE5B7B54695A40ED5F78F14BEC2440', 10.461516900963, 105.645781364112);
INSERT INTO public.vertices VALUES (92, '0101000020E61000004A93932954695A4057B614D047EC2440', 10.461485388306, 105.645761865727);
INSERT INTO public.vertices VALUES (93, '0101000020E61000005E6D9FC553695A407D14101A45EC2440', 10.461464704955, 105.645738034907);
INSERT INTO public.vertices VALUES (94, '0101000020E6100000B4CADC5D53695A40EA947AA342EC2440', 10.461445912088, 105.645713296525);
INSERT INTO public.vertices VALUES (95, '0101000020E61000001EA13FE452695A40111F9ACB3FEC2440', 10.461424219669, 105.645684301508);
INSERT INTO public.vertices VALUES (96, '0101000020E610000079620C7D52695A40B02AC48E3DEC2440', 10.461407147833, 105.645659696669);
INSERT INTO public.vertices VALUES (97, '0101000020E610000098BEE41452695A400A7A6C5E3BEC2440', 10.461390448324, 105.645634864219);
INSERT INTO public.vertices VALUES (98, '0101000020E6100000713A94B651695A401B79998F39EC2440', 10.461376655087, 105.645612377886);
INSERT INTO public.vertices VALUES (99, '0101000020E61000001A0AD02B51695A402687A59936EC2440', 10.46135406633, 105.645579293407);
INSERT INTO public.vertices VALUES (100, '0101000020E6100000BEC4CDB950695A402A83BBB134EC2440', 10.461339525356, 105.645552111574);
INSERT INTO public.vertices VALUES (101, '0101000020E61000005C61A45150695A409DF45CD632EC2440', 10.461325358245, 105.645527277496);
INSERT INTO public.vertices VALUES (102, '0101000020E6100000192B1B754F695A4015E204F035EC2440', 10.461349011036, 105.64547469762);
INSERT INTO public.vertices VALUES (103, '0101000020E610000008582C694F695A406526C39D3EEC2440', 10.461415224144, 105.645471852593);
INSERT INTO public.vertices VALUES (104, '0101000020E6100000CF0102D14F695A40B32598EE40EC2440', 10.461432891915, 105.645496608696);
INSERT INTO public.vertices VALUES (105, '0101000020E6100000B0E4793950695A408CFF6B5343EC2440', 10.461451155599, 105.645521515881);
INSERT INTO public.vertices VALUES (106, '0101000020E6100000B6C5444350695A404DCEC00746EC2440', 10.461471788679, 105.645523850594);
INSERT INTO public.vertices VALUES (107, '0101000020E61000005AE3BEAC50695A403B9C4DB845EC2440', 10.461469420885, 105.645548998274);
INSERT INTO public.vertices VALUES (108, '0101000020E61000007EE7470F51695A40F870F6B047EC2440', 10.46148446091, 105.645572490901);
INSERT INTO public.vertices VALUES (109, '0101000020E6100000D8741B7E51695A4001CCD6DE49EC2440', 10.461501086922, 105.645598913968);
INSERT INTO public.vertices VALUES (110, '0101000020E6100000A4C5FAEB51695A403AEB34194CEC2440', 10.461518085203, 105.645625109572);
INSERT INTO public.vertices VALUES (111, '0101000020E610000088C5ED5E52695A400278939E4EEC2440', 10.461537318708, 105.645652515601);
INSERT INTO public.vertices VALUES (112, '0101000020E61000006887ED7152695A40C7B66DA051EC2440', 10.461560262101, 105.645657045328);
INSERT INTO public.vertices VALUES (113, '0101000020E61000004FAAC1C652695A40D93A614451EC2440', 10.461557518834, 105.645677270056);
INSERT INTO public.vertices VALUES (114, '0101000020E610000072B8222353695A401C7F148054EC2440', 10.461582186224, 105.645699294955);
INSERT INTO public.vertices VALUES (115, '0101000020E61000006E634B7653695A409260341858EC2440', 10.461609608072, 105.645719121572);
INSERT INTO public.vertices VALUES (116, '0101000020E6100000DEBCC6BB53695A408D16B27F5CEC2440', 10.461643209924, 105.645735687332);
INSERT INTO public.vertices VALUES (117, '0101000020E6100000233E7DF553695A404514929D61EC2440', 10.46168224724, 105.645749447162);
INSERT INTO public.vertices VALUES (118, '0101000020E6100000B71504A754695A4092CC53B16EEC2440', 10.461782018165, 105.645791772832);
INSERT INTO public.vertices VALUES (119, '0101000020E6100000B2D2BFF554695A40B29D61106BEC2440', 10.461754333416, 105.645810544326);
INSERT INTO public.vertices VALUES (120, '0101000020E6100000160EC44955695A402A8D4DE560EC2440', 10.461676755635, 105.645830575428);
INSERT INTO public.vertices VALUES (121, '0101000020E61000008233BA3456695A403D1494A65AEC2440', 10.461629109932, 105.645886594617);
INSERT INTO public.vertices VALUES (122, '0101000020E6100000F58BE0B256695A40C7C6712B5AEC2440', 10.461625440253, 105.64591667107);
INSERT INTO public.vertices VALUES (123, '0101000020E61000007FEFAB6957695A403A7A142E59EC2440', 10.461617889404, 105.645960252672);
INSERT INTO public.vertices VALUES (124, '0101000020E6100000B32397C657695A40CD5FD7315BEC2440', 10.461633260289, 105.645982406232);
INSERT INTO public.vertices VALUES (125, '0101000020E610000022D3C31358695A4004FDC9D05DEC2440', 10.461653256089, 105.646000806079);
INSERT INTO public.vertices VALUES (126, '0101000020E6100000963CE76658695A40C91E118562EC2440', 10.461689146366, 105.646020627801);
INSERT INTO public.vertices VALUES (127, '0101000020E610000057ADA48B58695A40A70DAF316AEC2440', 10.461747696513, 105.6460293873);
INSERT INTO public.vertices VALUES (128, '0101000020E61000008131E05458695A40FC0BD2C670EC2440', 10.4617979175, 105.646016329707);
INSERT INTO public.vertices VALUES (129, '0101000020E610000068B03EC758695A40F0CB70E372EC2440', 10.461814029235, 105.646043597431);
INSERT INTO public.vertices VALUES (130, '0101000020E6100000682C5B3759695A405A89038673EC2440', 10.461818874294, 105.64607032684);
INSERT INTO public.vertices VALUES (131, '0101000020E6100000EB07260F59695A40614681737BEC2440', 10.461879357844, 105.646060740604);
INSERT INTO public.vertices VALUES (132, '0101000020E6100000AF0E9B2758695A400D44C56A82EC2440', 10.4619325033, 105.646005536483);
INSERT INTO public.vertices VALUES (133, '0101000020E6100000854097DB57695A409FA14F0A7FEC2440', 10.461906740399, 105.645987413127);
INSERT INTO public.vertices VALUES (134, '0101000020E61000006127F3BF57695A40AB3E4DFC79EC2440', 10.461868175916, 105.645980822997);
INSERT INTO public.vertices VALUES (135, '0101000020E61000001849684658695A40D7B371E178EC2440', 10.461859746103, 105.646012880174);
INSERT INTO public.vertices VALUES (136, '0101000020E61000007B06CCBC57695A40D234F5696CEC2440', 10.461764632399, 105.6459800713);
INSERT INTO public.vertices VALUES (137, '0101000020E6100000196A074C57695A40F6167BE46FEC2440', 10.461791172052, 105.645953185311);
INSERT INTO public.vertices VALUES (138, '0101000020E6100000DC15DD4B57695A406D9196076AEC2440', 10.461746441965, 105.645953145889);
INSERT INTO public.vertices VALUES (139, '0101000020E61000003219BDCF56695A40F3A0746969EC2440', 10.461741729247, 105.645923552195);
INSERT INTO public.vertices VALUES (140, '0101000020E61000007FB6A98C56695A40DD9DCA6C70EC2440', 10.461795234426, 105.645907560096);
INSERT INTO public.vertices VALUES (141, '0101000020E61000000AE7693456695A4009C171E469EC2440', 10.461745394598, 105.645886519833);
INSERT INTO public.vertices VALUES (142, '0101000020E6100000DB5F6E9255695A407A6F3E326EEC2440', 10.461778230783, 105.645847900188);
INSERT INTO public.vertices VALUES (143, '0101000020E6100000718543E954695A4086D74B2974EC2440', 10.46182374049, 105.645807567538);
INSERT INTO public.vertices VALUES (144, '0101000020E610000019F5026E4C695A4098B3AD27ADEC2440', 10.462258567766, 105.645289900673);
INSERT INTO public.vertices VALUES (145, '0101000020E6100000A550CC8F4C695A40922ABD51B1EC2440', 10.462290338842, 105.645297956015);
INSERT INTO public.vertices VALUES (146, '0101000020E61000004DE5D0CD4C695A4079A96C44B5EC2440', 10.462320459618, 105.645312742233);
INSERT INTO public.vertices VALUES (147, '0101000020E6100000534EB7854C695A40BF4E142ABBEC2440', 10.462365450839, 105.645295552263);
INSERT INTO public.vertices VALUES (148, '0101000020E610000090B5816D4B695A40A9BAD4F4BDEC2440', 10.462386752098, 105.645228745145);
INSERT INTO public.vertices VALUES (149, '0101000020E6100000B8199CBF4A695A40FC1A97BCBDEC2440', 10.462385075994, 105.645187284891);
INSERT INTO public.vertices VALUES (150, '0101000020E610000069B9A7344A695A4061761FAFBCEC2440', 10.462377045241, 105.645154155534);
INSERT INTO public.vertices VALUES (151, '0101000020E6100000FD7A43CD49695A400E1B1B0BBEEC2440', 10.462387415942, 105.645129505061);
INSERT INTO public.vertices VALUES (152, '0101000020E6100000409807AC49695A40B64D3902BBEC2440', 10.462364263053, 105.645121581475);
INSERT INTO public.vertices VALUES (153, '0101000020E61000002C5EB83049695A40B1494775B9EC2440', 10.462352433159, 105.645092182204);
INSERT INTO public.vertices VALUES (154, '0101000020E61000002A193EBD48695A4085146E34B7EC2440', 10.462335241735, 105.645064650195);
INSERT INTO public.vertices VALUES (155, '0101000020E6100000FF322E5448695A4013A64C53B5EC2440', 10.462320902926, 105.645039601437);
INSERT INTO public.vertices VALUES (156, '0101000020E6100000C3F137DD47695A40CBC96E8DB3EC2440', 10.462307376646, 105.645011238702);
INSERT INTO public.vertices VALUES (157, '0101000020E61000006476366D47695A4010807D6CB1EC2440', 10.462291136093, 105.644984534441);
INSERT INTO public.vertices VALUES (158, '0101000020E61000003E6DC81747695A408CF37344B2EC2440', 10.462297572283, 105.644964166383);
INSERT INTO public.vertices VALUES (159, '0101000020E6100000D06379FB46695A40778ADF14AFEC2440', 10.462273266113, 105.644957417054);
INSERT INTO public.vertices VALUES (160, '0101000020E6100000B609078A46695A40CB6FA59FACEC2440', 10.462254513688, 105.644930369256);
INSERT INTO public.vertices VALUES (161, '0101000020E6100000514D481346695A40AA751848AAEC2440', 10.462236645685, 105.644902058227);
INSERT INTO public.vertices VALUES (162, '0101000020E61000008A90F8B045695A40C8536177A8EC2440', 10.462222796088, 105.644878618945);
INSERT INTO public.vertices VALUES (163, '0101000020E6100000101FF93845695A401C702740A6EC2440', 10.462205891432, 105.644850009234);
INSERT INTO public.vertices VALUES (164, '0101000020E61000000B6B7EE944695A40282A0EF8A2EC2440', 10.462180854539, 105.64483105989);
INSERT INTO public.vertices VALUES (165, '0101000020E61000009A83D80445695A40747D18219BEC2440', 10.46212104248, 105.6448375811);
INSERT INTO public.vertices VALUES (166, '0101000020E6100000527046B845695A40EF1B3EE296EC2440', 10.462088651735, 105.644880360401);
INSERT INTO public.vertices VALUES (167, '0101000020E61000002585077046695A409739A25293EC2440', 10.462061483672, 105.644924170822);
INSERT INTO public.vertices VALUES (168, '0101000020E6100000C7E2C34D46695A40B3995BB499EC2440', 10.462110172445, 105.644916001601);
INSERT INTO public.vertices VALUES (169, '0101000020E61000004014F11147695A408927CAEA96EC2440', 10.462088906457, 105.644962773732);
INSERT INTO public.vertices VALUES (170, '0101000020E610000001B9EE7147695A40417C6A0D99EC2440', 10.46210519719, 105.644985659721);
INSERT INTO public.vertices VALUES (171, '0101000020E6100000BFBB367C47695A40C1C776789FEC2440', 10.462154163837, 105.644988110972);
INSERT INTO public.vertices VALUES (172, '0101000020E61000000E70FC4048695A405B0EFED89BEC2440', 10.46212652303, 105.64503502514);
INSERT INTO public.vertices VALUES (173, '0101000020E6100000B9EA2A2048695A40BEDD8C41A2EC2440', 10.462175415464, 105.645027200614);
INSERT INTO public.vertices VALUES (174, '0101000020E6100000567DF7E848695A404BCF45BC9FEC2440', 10.462156184694, 105.645075074853);
INSERT INTO public.vertices VALUES (175, '0101000020E610000028A3875449695A40F34533C8A1EC2440', 10.462171798953, 105.645100719889);
INSERT INTO public.vertices VALUES (176, '0101000020E6100000D765895349695A403B77FEDEA7EC2440', 10.462218254626, 105.64510048311);
INSERT INTO public.vertices VALUES (177, '0101000020E6100000363AFE0A4A695A40F78A56BAA4EC2440', 10.46219427401, 105.645144222516);
INSERT INTO public.vertices VALUES (178, '0101000020E6100000B5D848F249695A406534F39EAAEC2440', 10.46223923415, 105.645138331546);
INSERT INTO public.vertices VALUES (179, '0101000020E6100000A7A3C2A54A695A40FC4BF1D8A7EC2440', 10.462218074279, 105.6451811219);
INSERT INTO public.vertices VALUES (180, '0101000020E6100000B3C3890E4B695A40CFFAC5D4A9EC2440', 10.462233208816, 105.645206102882);
INSERT INTO public.vertices VALUES (181, '0101000020E6100000AE8766624B695A40AE79D706AEEC2440', 10.462265218547, 105.645226097228);
INSERT INTO public.vertices VALUES (182, '0101000020E61000007159B0D84B695A403CF75D40AAEC2440', 10.462236415358, 105.64525429937);
INSERT INTO public.vertices VALUES (183, '0101000020E61000003586D8014E695A4019A70F39BDEC2440', 10.462381156121, 105.64538618226);
INSERT INTO public.vertices VALUES (184, '0101000020E6100000BB0C1A1A4D695A407B8E067BC2EC2440', 10.462421268988, 105.645330930175);
INSERT INTO public.vertices VALUES (185, '0101000020E61000009ECB48724C695A40D9DCA80BC8EC2440', 10.46246372639, 105.645290919389);
INSERT INTO public.vertices VALUES (186, '0101000020E6100000354841864B695A40C03DFB2ECBEC2440', 10.462487667245, 105.645234645607);
INSERT INTO public.vertices VALUES (187, '0101000020E6100000029A4D904A695A408692EBC9CFEC2440', 10.462522802359, 105.64517600611);
INSERT INTO public.vertices VALUES (188, '0101000020E6100000ABA2C1CD49695A40D8579B9AD1EC2440', 10.462536651099, 105.645129622552);
INSERT INTO public.vertices VALUES (189, '0101000020E6100000BE09F72E49695A4031733FF8D0EC2440', 10.462531812425, 105.645091763733);
INSERT INTO public.vertices VALUES (190, '0101000020E6100000F2801BAD48695A400D5675F6CFEC2440', 10.462524129699, 105.645060803279);
INSERT INTO public.vertices VALUES (191, '0101000020E6100000AD4D3D2948695A405144E240CEEC2440', 10.462511088963, 105.645029363505);
INSERT INTO public.vertices VALUES (192, '0101000020E6100000BF1A81AF47695A407F9F6720CCEC2440', 10.462494862222, 105.645000339583);
INSERT INTO public.vertices VALUES (193, '0101000020E6100000E3D77E4247695A40F4C8A40DCAEC2440', 10.462479044309, 105.644974349852);
INSERT INTO public.vertices VALUES (194, '0101000020E6100000A01B1BBB46695A40F58F5AEAC7EC2440', 10.462462733798, 105.644942070458);
INSERT INTO public.vertices VALUES (195, '0101000020E6100000FBC1085546695A40A62B5817C6EC2440', 10.462448815835, 105.644917734673);
INSERT INTO public.vertices VALUES (196, '0101000020E61000002B39F9E345695A4033DBDE1FC4EC2440', 10.462433811144, 105.644890778906);
INSERT INTO public.vertices VALUES (197, '0101000020E61000003FC1327345695A40099A2F58C2EC2440', 10.462420230685, 105.644863891187);
INSERT INTO public.vertices VALUES (198, '0101000020E610000053496C0245695A40E0588090C0EC2440', 10.462406650226, 105.644837003468);
INSERT INTO public.vertices VALUES (199, '0101000020E61000003DB1112C45695A404547F756B9EC2440', 10.462351529775, 105.644846932676);
INSERT INTO public.vertices VALUES (200, '0101000020E6100000CA83F9F045695A404CC21BAAB4EC2440', 10.462315860642, 105.644893878619);
INSERT INTO public.vertices VALUES (201, '0101000020E6100000544E655846695A40C55ED744B6EC2440', 10.462328101435, 105.644918536121);
INSERT INTO public.vertices VALUES (202, '0101000020E61000000F0CBDC646695A40DD35D5FEB5EC2440', 10.462326015021, 105.64494484388);
INSERT INTO public.vertices VALUES (203, '0101000020E6100000597146CB46695A40C3F95B85B8EC2440', 10.46234528301, 105.644945925514);
INSERT INTO public.vertices VALUES (204, '0101000020E61000001691553947695A4001C16FB8BAEC2440', 10.46236206402, 105.644972165643);
INSERT INTO public.vertices VALUES (205, '0101000020E61000009F92FCA547695A404A5F7E6EBCEC2440', 10.462375119139, 105.644998070386);
INSERT INTO public.vertices VALUES (206, '0101000020E610000086DF883248695A40D773AC60BEEC2440', 10.46238996606, 105.645031579652);
INSERT INTO public.vertices VALUES (207, '0101000020E610000066C2789F48695A401D51DCF9BFEC2440', 10.462402160782, 105.64505755227);
INSERT INTO public.vertices VALUES (208, '0101000020E6100000E1516A2249695A4035D38037C2EC2440', 10.462419256664, 105.645088771656);
INSERT INTO public.vertices VALUES (209, '0101000020E610000075FBA98449695A40EC350AE8C1EC2440', 10.462416888472, 105.645112195967);
INSERT INTO public.vertices VALUES (210, '0101000020E61000006A5CABA349695A406823D53FC4EC2440', 10.462434763687, 105.645119588227);
INSERT INTO public.vertices VALUES (211, '0101000020E61000009AEEF70A4A695A40F082D472C5EC2440', 10.462443912927, 105.645144216653);
INSERT INTO public.vertices VALUES (212, '0101000020E61000001AE6099E4A695A40DE5D09FBC5EC2440', 10.462447972196, 105.645179280917);
INSERT INTO public.vertices VALUES (213, '0101000020E61000003FC076434B695A4026B0ED42C6EC2440', 10.462450114741, 105.645218721359);
INSERT INTO public.vertices VALUES (214, '0101000020E61000007488B4FA4B695A4075B3B10AC5EC2440', 10.462440809433, 105.645262409498);
INSERT INTO public.vertices VALUES (215, '0101000020E6100000F3C9C4C54C695A40B97BE520CAEC2440', 10.462479618085, 105.645310823609);
INSERT INTO public.vertices VALUES (216, '0101000020E6100000BD16C8884C695A40FA34808ECFEC2440', 10.462521031523, 105.645296283149);
INSERT INTO public.vertices VALUES (217, '0101000020E610000096C721234C695A4090950470D7EC2440', 10.462581158218, 105.645272047985);
INSERT INTO public.vertices VALUES (218, '0101000020E610000015333D3F4C695A40621459DFDCEC2440', 10.462622623085, 105.645278749242);
INSERT INTO public.vertices VALUES (219, '0101000020E61000002600DC784C695A4000C88F5CE0EC2440', 10.462649242927, 105.645292486996);
INSERT INTO public.vertices VALUES (220, '0101000020E61000006DF73DE64C695A40D72D2B83E2EC2440', 10.462665652295, 105.645318565859);
INSERT INTO public.vertices VALUES (221, '0101000020E6100000593FC4664D695A407E7301E7E3EC2440', 10.462676257064, 105.645349208496);
INSERT INTO public.vertices VALUES (222, '0101000020E6100000667DED374E695A401C9B1D96E2EC2440', 10.462666216959, 105.645399076389);
INSERT INTO public.vertices VALUES (223, '0101000020E6100000D1E2E3964F695A404BCA5666DDEC2440', 10.462626646132, 105.645482752366);
INSERT INTO public.vertices VALUES (224, '0101000020E610000047944B1E50695A40BE8346A3DFEC2440', 10.462643720968, 105.645515035446);
INSERT INTO public.vertices VALUES (225, '0101000020E61000007A8F968D50695A40A5E0C261E0EC2440', 10.462649397887, 105.64554156974);
INSERT INTO public.vertices VALUES (226, '0101000020E61000007B5BB86051695A40D2A3F4B5DAEC2440', 10.462606130708, 105.645591907536);
INSERT INTO public.vertices VALUES (227, '0101000020E6100000C55E7DC651695A409AC4F1E7D1EC2440', 10.462538955939, 105.645616171295);
INSERT INTO public.vertices VALUES (228, '0101000020E6100000EA9D062A51695A40CEEBC329D2EC2440', 10.462540917555, 105.645578867399);
INSERT INTO public.vertices VALUES (229, '0101000020E610000083DF1FA950695A40DF9DC9D8D3EC2440', 10.462553763019, 105.645548134924);
INSERT INTO public.vertices VALUES (230, '0101000020E61000007899A09F50695A40C83E7742D8EC2440', 10.462587430054, 105.645545870624);
INSERT INTO public.vertices VALUES (231, '0101000020E61000004B048C194F695A40817641C6D9EC2440', 10.462598987094, 105.645452868209);
INSERT INTO public.vertices VALUES (232, '0101000020E6100000E281542E4F695A408AEB5D70D5EC2440', 10.462565909829, 105.645457823302);
INSERT INTO public.vertices VALUES (233, '0101000020E61000007B608DAB4E695A40221E2EE4D6EC2440', 10.462576990728, 105.645426643432);
INSERT INTO public.vertices VALUES (234, '0101000020E6100000AFC63D724E695A406E76C49AD3EC2440', 10.462551914675, 105.645412979439);
INSERT INTO public.vertices VALUES (235, '0101000020E610000091858F1C4F695A4052410575D0EC2440', 10.462527901546, 105.645453586729);
INSERT INTO public.vertices VALUES (236, '0101000020E6100000E225B1274E695A40B394DEFFCFEC2440', 10.462524410172, 105.645395205494);
INSERT INTO public.vertices VALUES (237, '0101000020E61000003586CF2C4E695A40C36A090CCBEC2440', 10.462486625814, 105.645396425877);
INSERT INTO public.vertices VALUES (238, '0101000020E610000077CE747E4E695A40CEE75104C5EC2440', 10.462440619467, 105.645415891713);
INSERT INTO public.vertices VALUES (239, '0101000020E61000009265119B4D695A4054B71D5BC8EC2440', 10.462466094377, 105.645361678113);


--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 229
-- Name: vertices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vertices_id_seq', 1000, false);


--
-- TOC entry 4257 (class 2606 OID 74020)
-- Name: cell_vertices cell_vertices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cell_vertices
    ADD CONSTRAINT cell_vertices_pkey PRIMARY KEY (cell_id, vertex_id);


--
-- TOC entry 4259 (class 2606 OID 74025)
-- Name: cells cells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cells
    ADD CONSTRAINT cells_pkey PRIMARY KEY (id);


--
-- TOC entry 4261 (class 2606 OID 74030)
-- Name: contributions contributions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributions
    ADD CONSTRAINT contributions_pkey PRIMARY KEY (id);


--
-- TOC entry 4263 (class 2606 OID 74036)
-- Name: edges edges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.edges
    ADD CONSTRAINT edges_pkey PRIMARY KEY (id);



--
-- TOC entry 4265 (class 2606 OID 74043)
-- Name: grave_rows grave_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grave_rows
    ADD CONSTRAINT grave_rows_pkey PRIMARY KEY (id);


--
-- TOC entry 4269 (class 2606 OID 74050)
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- TOC entry 4274 (class 2606 OID 74057)
-- Name: martyr_graves martyr_graves_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.martyr_graves
    ADD CONSTRAINT martyr_graves_pkey PRIMARY KEY (id);


--
-- TOC entry 4276 (class 2606 OID 74065)
-- Name: paths paths_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT paths_pkey PRIMARY KEY (id);


--
-- TOC entry 4278 (class 2606 OID 74070)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4267 (class 2606 OID 74091)
-- Name: grave_rows uk6ewfi6hv1frw3gv713sen1s8q; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grave_rows
    ADD CONSTRAINT uk6ewfi6hv1frw3gv713sen1s8q UNIQUE (row_name, area_name);


--
-- TOC entry 4280 (class 2606 OID 74096)
-- Name: users uk_6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- TOC entry 4282 (class 2606 OID 74098)
-- Name: users uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- TOC entry 4284 (class 2606 OID 74077)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4286 (class 2606 OID 74082)
-- Name: verify_codes verify_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.verify_codes
    ADD CONSTRAINT verify_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 4288 (class 2606 OID 74089)
-- Name: vertices vertices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vertices
    ADD CONSTRAINT vertices_pkey PRIMARY KEY (id);


--
-- TOC entry 4270 (class 1259 OID 74094)
-- Name: index_martyr_graves_code_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_martyr_graves_code_name ON public.martyr_graves USING btree (code_name);


--
-- TOC entry 4271 (class 1259 OID 74092)
-- Name: index_martyr_graves_full_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_martyr_graves_full_name ON public.martyr_graves USING btree (full_name);


--
-- TOC entry 4272 (class 1259 OID 74093)
-- Name: index_martyr_graves_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_martyr_graves_name ON public.martyr_graves USING btree (name);


--
-- TOC entry 4298 (class 2606 OID 74149)
-- Name: path_vertices fkcoeqse0o6ngw3bm7w4altjhqc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.path_vertices
    ADD CONSTRAINT fkcoeqse0o6ngw3bm7w4altjhqc FOREIGN KEY (path_id) REFERENCES public.paths(id);


--
-- TOC entry 4300 (class 2606 OID 74154)
-- Name: verify_codes fkf1n7fjkm7j0eslijxj7fsw65i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.verify_codes
    ADD CONSTRAINT fkf1n7fjkm7j0eslijxj7fsw65i FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4297 (class 2606 OID 74139)
-- Name: martyr_graves fkfqqvd8jjsxvqiga0fu0hpq3h; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.martyr_graves
    ADD CONSTRAINT fkfqqvd8jjsxvqiga0fu0hpq3h FOREIGN KEY (grave_row_id) REFERENCES public.grave_rows(id);


--
-- TOC entry 4296 (class 2606 OID 74134)
-- Name: logs fkgqy8beil5y4almtq1tiyofije; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT fkgqy8beil5y4almtq1tiyofije FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4294 (class 2606 OID 74129)
-- Name: grave_rows fkjlfj59pnenm5j08dn1n3g58i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grave_rows
    ADD CONSTRAINT fkjlfj59pnenm5j08dn1n3g58i FOREIGN KEY (vertex2_id) REFERENCES public.vertices(id);


--
-- TOC entry 4295 (class 2606 OID 74124)
-- Name: grave_rows fklfyhij8eogxwtmptyqv51x9ih; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grave_rows
    ADD CONSTRAINT fklfyhij8eogxwtmptyqv51x9ih FOREIGN KEY (vertex1_id) REFERENCES public.vertices(id);


--
-- TOC entry 4289 (class 2606 OID 74104)
-- Name: cell_vertices fkmasnk7lu46ra5g41ej9j7e2yd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cell_vertices
    ADD CONSTRAINT fkmasnk7lu46ra5g41ej9j7e2yd FOREIGN KEY (cell_id) REFERENCES public.cells(id);


--
-- TOC entry 4292 (class 2606 OID 74114)
-- Name: edges fkotpid9fxvloaw5w7dnme0eh24; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.edges
    ADD CONSTRAINT fkotpid9fxvloaw5w7dnme0eh24 FOREIGN KEY (vertex1_id) REFERENCES public.vertices(id);


--
-- TOC entry 4291 (class 2606 OID 74109)
-- Name: contributions fkplqalfn8re1lxx53mgw2nj6bp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributions
    ADD CONSTRAINT fkplqalfn8re1lxx53mgw2nj6bp FOREIGN KEY (martyr_id) REFERENCES public.martyr_graves(id);


--
-- TOC entry 4290 (class 2606 OID 74099)
-- Name: cell_vertices fkpo6parm5dxty4k835r3ufkky8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cell_vertices
    ADD CONSTRAINT fkpo6parm5dxty4k835r3ufkky8 FOREIGN KEY (vertex_id) REFERENCES public.vertices(id);


--
-- TOC entry 4299 (class 2606 OID 74144)
-- Name: path_vertices fkqfohy19cc6gfylg9fhfwbyxm7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.path_vertices
    ADD CONSTRAINT fkqfohy19cc6gfylg9fhfwbyxm7 FOREIGN KEY (vertex_id) REFERENCES public.vertices(id);


--
-- TOC entry 4293 (class 2606 OID 74119)
-- Name: edges fkrukpw7m8mbede38xpw5n5ec50; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.edges
    ADD CONSTRAINT fkrukpw7m8mbede38xpw5n5ec50 FOREIGN KEY (vertex2_id) REFERENCES public.vertices(id);


-- Completed on 2024-12-26 08:17:13

--
-- PostgreSQL database dump complete
--

