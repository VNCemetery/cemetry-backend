CREATE TABLE IF NOT EXISTS `grave_rows` (
                                            `id` bigint(20) NOT NULL,
                                            `created_at` datetime(6) DEFAULT NULL,
                                            `updated_at` datetime(6) DEFAULT NULL,
                                            `area_name` varchar(255) DEFAULT NULL,
                                            `row_name` varchar(255) DEFAULT NULL,
                                            `vertex1_id` bigint(20) DEFAULT NULL,
                                            `vertex2_id` bigint(20) DEFAULT NULL,
                                            PRIMARY KEY (`id`),
                                            UNIQUE KEY `UK6ewfi6hv1frw3gv713sen1s8q` (`row_name`,`area_name`),
                                            KEY `FKlfyhij8eogxwtmptyqv51x9ih` (`vertex1_id`),
                                            KEY `FKjlfj59pnenm5j08dn1n3g58i` (`vertex2_id`),
                                            CONSTRAINT `FKjlfj59pnenm5j08dn1n3g58i` FOREIGN KEY (`vertex2_id`) REFERENCES `vertices` (`id`),
                                            CONSTRAINT `FKlfyhij8eogxwtmptyqv51x9ih` FOREIGN KEY (`vertex1_id`) REFERENCES `vertices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table lietsi.grave_rows: ~87 rows (approximately)
INSERT IGNORE INTO `grave_rows` (`id`, `created_at`, `updated_at`, `area_name`, `row_name`, `vertex1_id`, `vertex2_id`) VALUES
                                                                                                                            (1, NULL, NULL, 'A 1', 'VH- Số1', 70, 70),
                                                                                                                            (2, NULL, NULL, 'A 1', 'VH- Số2', 75, 75),
                                                                                                                            (3, NULL, NULL, 'A 1', 'VH- Số3', 80, 80),
                                                                                                                            (4, NULL, NULL, 'A 1', 'VH- Số4', 47, 47),
                                                                                                                            (5, NULL, NULL, 'A 1', 'VH- Số5', 48, 48),
                                                                                                                            (6, NULL, NULL, 'A 1', 'VH- Số6', 49, 50),
                                                                                                                            (7, NULL, NULL, 'A 1', 'Hàng 1', 69, 67),
                                                                                                                            (8, NULL, NULL, 'A 1', 'Hàng 2', 71, 66),
                                                                                                                            (9, NULL, NULL, 'A 1', 'Hàng 3', 72, 65),
                                                                                                                            (10, NULL, NULL, 'A 1', 'Hàng 4', 73, 64),
                                                                                                                            (11, NULL, NULL, 'A 1', 'Hàng 5', 74, 63),
                                                                                                                            (12, NULL, NULL, 'A 1', 'Hàng 6', 76, 62),
                                                                                                                            (13, NULL, NULL, 'A 1', 'Hàng 7', 77, 61),
                                                                                                                            (14, NULL, NULL, 'A 1', 'Hàng 8', 78, 59),
                                                                                                                            (15, NULL, NULL, 'A 1', 'Hàng 9', 79, 58),
                                                                                                                            (16, NULL, NULL, 'A 1', 'Hàng 10', 81, 57),
                                                                                                                            (17, NULL, NULL, 'A 1', 'Hàng 11', 82, 56),
                                                                                                                            (18, NULL, NULL, 'A 1', 'Hàng 12', 83, 55),
                                                                                                                            (19, NULL, NULL, 'A 1', 'Hàng 13', 84, 53),
                                                                                                                            (20, NULL, NULL, 'A 1', 'Hàng 14', 52, 52),
                                                                                                                            (21, NULL, NULL, 'A 1', 'Hàng 15', 51, 51),
                                                                                                                            (22, NULL, NULL, 'A 2', 'VH- Số1', 167, 167),
                                                                                                                            (23, NULL, NULL, 'A 2', 'VH- Số2', 172, 172),
                                                                                                                            (24, NULL, NULL, 'A 2', 'VH- Số3', 177, 177),
                                                                                                                            (25, NULL, NULL, 'A 2', 'VH- Số4', 144, 144),
                                                                                                                            (26, NULL, NULL, 'A 2', 'VH- Số5', 145, 145),
                                                                                                                            (27, NULL, NULL, 'A 2', 'VH- Số6', 146, 147),
                                                                                                                            (28, NULL, NULL, 'A 2', 'Hàng 1', 164, 166),
                                                                                                                            (29, NULL, NULL, 'A 2', 'Hàng 2', 163, 168),
                                                                                                                            (30, NULL, NULL, 'A 2', 'Hàng 3', 162, 169),
                                                                                                                            (31, NULL, NULL, 'A 2', 'Hàng 4', 161, 170),
                                                                                                                            (32, NULL, NULL, 'A 2', 'Hàng 5', 160, 171),
                                                                                                                            (33, NULL, NULL, 'A 2', 'Hàng 6', 159, 173),
                                                                                                                            (34, NULL, NULL, 'A 2', 'Hàng 7', 157, 174),
                                                                                                                            (35, NULL, NULL, 'A 2', 'Hàng 8', 156, 175),
                                                                                                                            (36, NULL, NULL, 'A 2', 'Hàng 9', 155, 176),
                                                                                                                            (37, NULL, NULL, 'A 2', 'Hàng 10', 154, 178),
                                                                                                                            (38, NULL, NULL, 'A 2', 'Hàng 11', 153, 179),
                                                                                                                            (39, NULL, NULL, 'A 2', 'Hàng 12', 152, 180),
                                                                                                                            (40, NULL, NULL, 'A 2', 'Hàng 13', 150, 181),
                                                                                                                            (41, NULL, NULL, 'A 2', 'Hàng 14', 149, 149),
                                                                                                                            (42, NULL, NULL, 'A 2', 'Hàng 15', 148, 148),
                                                                                                                            (43, NULL, NULL, 'B 1', 'Hàng 1', 103, 101),
                                                                                                                            (44, NULL, NULL, 'B 1', 'Hàng 2', 104, 100),
                                                                                                                            (45, NULL, NULL, 'B 1', 'Hàng 3', 105, 99),
                                                                                                                            (46, NULL, NULL, 'B 1', 'Hàng 4', 107, 98),
                                                                                                                            (47, NULL, NULL, 'B 1', 'Hàng 5', 108, 97),
                                                                                                                            (48, NULL, NULL, 'B 1', 'Hàng 6', 109, 96),
                                                                                                                            (49, NULL, NULL, 'B 1', 'Hàng 7', 110, 95),
                                                                                                                            (50, NULL, NULL, 'B 1', 'Hàng 8', 111, 94),
                                                                                                                            (51, NULL, NULL, 'B 1', 'Hàng 9', 113, 93),
                                                                                                                            (52, NULL, NULL, 'B 1', 'Hàng 10', 114, 92),
                                                                                                                            (53, NULL, NULL, 'B 1', 'Hàng 11', 115, 91),
                                                                                                                            (54, NULL, NULL, 'B 1', 'Hàng 12', 116, 90),
                                                                                                                            (55, NULL, NULL, 'B 1', 'Hàng 13', 117, 89),
                                                                                                                            (56, NULL, NULL, 'B 2', 'Hàng 1', 198, 200),
                                                                                                                            (57, NULL, NULL, 'B 2', 'Hàng 2', 197, 201),
                                                                                                                            (58, NULL, NULL, 'B 2', 'Hàng 3', 196, 203),
                                                                                                                            (59, NULL, NULL, 'B 2', 'Hàng 4', 195, 204),
                                                                                                                            (60, NULL, NULL, 'B 2', 'Hàng 5', 194, 205),
                                                                                                                            (61, NULL, NULL, 'B 2', 'Hàng 6', 193, 206),
                                                                                                                            (62, NULL, NULL, 'B 2', 'Hàng 7', 192, 207),
                                                                                                                            (63, NULL, NULL, 'B 2', 'Hàng 8', 191, 208),
                                                                                                                            (64, NULL, NULL, 'B 2', 'Hàng 9', 190, 210),
                                                                                                                            (65, NULL, NULL, 'B 2', 'Hàng 10', 189, 211),
                                                                                                                            (66, NULL, NULL, 'B 2', 'Hàng 11', 188, 212),
                                                                                                                            (67, NULL, NULL, 'B 2', 'Hàng 12', 187, 213),
                                                                                                                            (68, NULL, NULL, 'B 2', 'Hàng 13', 186, 214),
                                                                                                                            (69, NULL, NULL, 'C 1', 'VH Số 1', 118, 143),
                                                                                                                            (70, NULL, NULL, 'C 1', 'Hàng 1', 119, 121),
                                                                                                                            (71, NULL, NULL, 'C 1', 'Hàng 2', 142, 122),
                                                                                                                            (72, NULL, NULL, 'C 1', 'Hàng 3', 141, 123),
                                                                                                                            (73, NULL, NULL, 'C 1', 'Hàng 4', 139, 124),
                                                                                                                            (74, NULL, NULL, 'C 1', 'Hàng 5', 138, 125),
                                                                                                                            (75, NULL, NULL, 'C 1', 'Hàng 6', 136, 126),
                                                                                                                            (76, NULL, NULL, 'C 2', 'VH Số 1', 238, 238),
                                                                                                                            (77, NULL, NULL, 'C 2', 'Hàng 1', 217, 239),
                                                                                                                            (78, NULL, NULL, 'C 2', 'Hàng 2', 218, 237),
                                                                                                                            (79, NULL, NULL, 'C 2', 'Hàng 3', 219, 236),
                                                                                                                            (80, NULL, NULL, 'C 2', 'Hàng 4', 220, 234),
                                                                                                                            (81, NULL, NULL, 'C 2', 'Hàng 5', 221, 233),
                                                                                                                            (82, NULL, NULL, 'C 2', 'Hàng 6', 222, 231),
                                                                                                                            (83, NULL, NULL, 'D 1', 'Hàng 1', 133, 135),
                                                                                                                            (84, NULL, NULL, 'D 1', 'Hàng 2', 132, 130),
                                                                                                                            (85, NULL, NULL, 'D 2', 'Hàng 1', 230, 228),
                                                                                                                            (86, NULL, NULL, 'D 2', 'Hàng 2', 225, 227),
                                                                                                                            (87, NULL, NULL, 'khu 8', 'hàng 9', NULL, NULL);