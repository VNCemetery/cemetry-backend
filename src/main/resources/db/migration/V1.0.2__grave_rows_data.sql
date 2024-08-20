CREATE TABLE IF NOT EXISTS `grave_rows` (
                                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                            `created_at` datetime(6) DEFAULT NULL,
                                            `updated_at` datetime(6) DEFAULT NULL,
                                            `area_name` varchar(255) DEFAULT NULL,
                                            `left_latitude` decimal(20,15) DEFAULT 0.000000000000000,
                                            `left_longitude` decimal(20,15) DEFAULT 0.000000000000000,
                                            `right_latitude` decimal(20,15) DEFAULT 0.000000000000000,
                                            `right_longitude` decimal(20,15) DEFAULT 0.000000000000000,
                                            `row_name` varchar(255) DEFAULT NULL,
                                            PRIMARY KEY (`id`),
                                            UNIQUE KEY `UK6ewfi6hv1frw3gv713sen1s8q` (`row_name`,`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dumping data for table lietsi.grave_rows: ~87 rows (approximately)
INSERT IGNORE INTO `grave_rows` (`id`, `created_at`, `updated_at`, `area_name`, `left_latitude`, `left_longitude`, `right_latitude`, `right_longitude`, `row_name`) VALUES
                                                                                                                                                                        (1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461545500000000, 105.645251100000000, 10.461545500000000, 105.645251100000000, 'VH- Số1'),
                                                                                                                                                                        (2, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461614580000000, 105.645356900000000, 10.461614580000000, 105.645356900000000, 'VH- Số2'),
                                                                                                                                                                        (3, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461680240000000, 105.645464800000000, 10.461680240000000, 105.645464800000000, 'VH- Số3'),
                                                                                                                                                                        (4, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461783050000000, 105.645586400000000, 10.461783050000000, 105.645586400000000, 'VH- Số4'),
                                                                                                                                                                        (5, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461780290000000, 105.645622300000000, 10.461780290000000, 105.645622300000000, 'VH- Số5'),
                                                                                                                                                                        (6, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461780070000000, 105.645663900000000, 10.461743970000000, 105.645697200000000, 'VH- Số6'),
                                                                                                                                                                        (7, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461491600000000, 105.645256700000000, 10.461398880000000, 105.645328000000000, 'Hàng 1'),
                                                                                                                                                                        (8, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461518520000000, 105.645294600000000, 10.461408870000000, 105.645355800000000, 'Hàng 2'),
                                                                                                                                                                        (9, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461567050000000, 105.645289600000000, 10.461423910000000, 105.645380000000000, 'Hàng 3'),
                                                                                                                                                                        (10, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461580880000000, 105.645314300000000, 10.461439220000000, 105.645402500000000, 'Hàng 4'),
                                                                                                                                                                        (11, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461565180000000, 105.645361700000000, 10.461458150000000, 105.645431100000000, 'Hàng 5'),
                                                                                                                                                                        (12, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461585430000000, 105.645398600000000, 10.461475120000000, 105.645457200000000, 'Hàng 6'),
                                                                                                                                                                        (13, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461635430000000, 105.645396700000000, 10.461493910000000, 105.645483600000000, 'Hàng 7'),
                                                                                                                                                                        (14, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461651980000000, 105.645426600000000, 10.461513220000000, 105.645509300000000, 'Hàng 8'),
                                                                                                                                                                        (15, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461632580000000, 105.645470100000000, 10.461528610000000, 105.645538000000000, 'Hàng 9'),
                                                                                                                                                                        (16, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461657600000000, 105.645509900000000, 10.461548380000000, 105.645569700000000, 'Hàng 10'),
                                                                                                                                                                        (17, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461705980000000, 105.645506300000000, 10.461564370000000, 105.645595900000000, 'Hàng 11'),
                                                                                                                                                                        (18, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461725650000000, 105.645531300000000, 10.461581570000000, 105.645617200000000, 'Hàng 12'),
                                                                                                                                                                        (19, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461725620000000, 105.645565200000000, 10.461605020000000, 105.645645600000000, 'Hàng 13'),
                                                                                                                                                                        (20, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461633450000000, 105.645666800000000, 10.461633450000000, 105.645666800000000, 'Hàng 14'),
                                                                                                                                                                        (21, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 1', 10.461671060000000, 105.645684500000000, 10.461671060000000, 105.645684500000000, 'Hàng 15'),
                                                                                                                                                                        (22, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462061480000000, 105.644924200000000, 10.462061480000000, 105.644924200000000, 'VH- Số1'),
                                                                                                                                                                        (23, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462126520000000, 105.645035000000000, 10.462126520000000, 105.645035000000000, 'VH- Số2'),
                                                                                                                                                                        (24, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462194270000000, 105.645144200000000, 10.462194270000000, 105.645144200000000, 'VH- Số3'),
                                                                                                                                                                        (25, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462258570000000, 105.645289900000000, 10.462258570000000, 105.645289900000000, 'VH- Số4'),
                                                                                                                                                                        (26, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462290340000000, 105.645298000000000, 10.462290340000000, 105.645298000000000, 'VH- Số5'),
                                                                                                                                                                        (27, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462320460000000, 105.645312700000000, 10.462365450000000, 105.645295600000000, 'VH- Số6'),
                                                                                                                                                                        (28, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462180850000000, 105.644831100000000, 10.462088650000000, 105.644880400000000, 'Hàng 1'),
                                                                                                                                                                        (29, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462205890000000, 105.644850000000000, 10.462110170000000, 105.644916000000000, 'Hàng 2'),
                                                                                                                                                                        (30, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462222800000000, 105.644878600000000, 10.462088910000000, 105.644962800000000, 'Hàng 3'),
                                                                                                                                                                        (31, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462236650000000, 105.644902100000000, 10.462105200000000, 105.644985700000000, 'Hàng 4'),
                                                                                                                                                                        (32, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462254510000000, 105.644930400000000, 10.462154160000000, 105.644988100000000, 'Hàng 5'),
                                                                                                                                                                        (33, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462273270000000, 105.644957400000000, 10.462175420000000, 105.645027200000000, 'Hàng 6'),
                                                                                                                                                                        (34, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462291140000000, 105.644984500000000, 10.462156180000000, 105.645075100000000, 'Hàng 7'),
                                                                                                                                                                        (35, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462307380000000, 105.645011200000000, 10.462171800000000, 105.645100700000000, 'Hàng 8'),
                                                                                                                                                                        (36, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462320900000000, 105.645039600000000, 10.462218250000000, 105.645100500000000, 'Hàng 9'),
                                                                                                                                                                        (37, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462335240000000, 105.645064700000000, 10.462239230000000, 105.645138300000000, 'Hàng 10'),
                                                                                                                                                                        (38, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462352430000000, 105.645092200000000, 10.462218070000000, 105.645181100000000, 'Hàng 11'),
                                                                                                                                                                        (39, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462364260000000, 105.645121600000000, 10.462233210000000, 105.645206100000000, 'Hàng 12'),
                                                                                                                                                                        (40, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462377050000000, 105.645154200000000, 10.462265220000000, 105.645226100000000, 'Hàng 13'),
                                                                                                                                                                        (41, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462385080000000, 105.645187300000000, 10.462385080000000, 105.645187300000000, 'Hàng 14'),
                                                                                                                                                                        (42, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'A 2', 10.462386750000000, 105.645228700000000, 10.462386750000000, 105.645228700000000, 'Hàng 15'),
                                                                                                                                                                        (43, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461415220000000, 105.645471900000000, 10.461325360000000, 105.645527300000000, 'Hàng 1'),
                                                                                                                                                                        (44, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461432890000000, 105.645496600000000, 10.461339530000000, 105.645552100000000, 'Hàng 2'),
                                                                                                                                                                        (45, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461451160000000, 105.645521500000000, 10.461354070000000, 105.645579300000000, 'Hàng 3'),
                                                                                                                                                                        (46, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461469420000000, 105.645549000000000, 10.461376660000000, 105.645612400000000, 'Hàng 4'),
                                                                                                                                                                        (47, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461484460000000, 105.645572500000000, 10.461390450000000, 105.645634900000000, 'Hàng 5'),
                                                                                                                                                                        (48, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461501090000000, 105.645598900000000, 10.461407150000000, 105.645659700000000, 'Hàng 6'),
                                                                                                                                                                        (49, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461518090000000, 105.645625100000000, 10.461424220000000, 105.645684300000000, 'Hàng 7'),
                                                                                                                                                                        (50, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461537320000000, 105.645652500000000, 10.461445910000000, 105.645713300000000, 'Hàng 8'),
                                                                                                                                                                        (51, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461557520000000, 105.645677300000000, 10.461464700000000, 105.645738000000000, 'Hàng 9'),
                                                                                                                                                                        (52, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461582190000000, 105.645699300000000, 10.461485390000000, 105.645761900000000, 'Hàng 10'),
                                                                                                                                                                        (53, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461609610000000, 105.645719100000000, 10.461516900000000, 105.645781400000000, 'Hàng 11'),
                                                                                                                                                                        (54, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461643210000000, 105.645735700000000, 10.461564880000000, 105.645792400000000, 'Hàng 12'),
                                                                                                                                                                        (55, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 1', 10.461682250000000, 105.645749400000000, 10.461637280000000, 105.645782900000000, 'Hàng 13'),
                                                                                                                                                                        (56, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462406650000000, 105.644837000000000, 10.462315860000000, 105.644893900000000, 'Hàng 1'),
                                                                                                                                                                        (57, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462420230000000, 105.644863900000000, 10.462328100000000, 105.644918500000000, 'Hàng 2'),
                                                                                                                                                                        (58, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462433810000000, 105.644890800000000, 10.462345280000000, 105.644945900000000, 'Hàng 3'),
                                                                                                                                                                        (59, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462448820000000, 105.644917700000000, 10.462362060000000, 105.644972200000000, 'Hàng 4'),
                                                                                                                                                                        (60, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462462730000000, 105.644942100000000, 10.462375120000000, 105.644998100000000, 'Hàng 5'),
                                                                                                                                                                        (61, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462479040000000, 105.644974300000000, 10.462389970000000, 105.645031600000000, 'Hàng 6'),
                                                                                                                                                                        (62, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462494860000000, 105.645000300000000, 10.462402160000000, 105.645057600000000, 'Hàng 7'),
                                                                                                                                                                        (63, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462511090000000, 105.645029400000000, 10.462419260000000, 105.645088800000000, 'Hàng 8'),
                                                                                                                                                                        (64, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462524130000000, 105.645060800000000, 10.462434760000000, 105.645119600000000, 'Hàng 9'),
                                                                                                                                                                        (65, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462531810000000, 105.645091800000000, 10.462443910000000, 105.645144200000000, 'Hàng 10'),
                                                                                                                                                                        (66, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462536650000000, 105.645129600000000, 10.462447970000000, 105.645179300000000, 'Hàng 11'),
                                                                                                                                                                        (67, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462522800000000, 105.645176000000000, 10.462450110000000, 105.645218700000000, 'Hàng 12'),
                                                                                                                                                                        (68, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'B 2', 10.462487670000000, 105.645234600000000, 10.462440810000000, 105.645262400000000, 'Hàng 13'),
                                                                                                                                                                        (69, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 1', 10.461782020000000, 105.645791800000000, 10.461823740000000, 105.645807600000000, 'VH Số 1'),
                                                                                                                                                                        (70, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 1', 10.461754330000000, 105.645810500000000, 10.461629110000000, 105.645886600000000, 'Hàng 1'),
                                                                                                                                                                        (71, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 1', 10.461778230000000, 105.645847900000000, 10.461625440000000, 105.645916700000000, 'Hàng 2'),
                                                                                                                                                                        (72, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 1', 10.461745390000000, 105.645886500000000, 10.461617890000000, 105.645960300000000, 'Hàng 3'),
                                                                                                                                                                        (73, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 1', 10.461741730000000, 105.645923600000000, 10.461633260000000, 105.645982400000000, 'Hàng 4'),
                                                                                                                                                                        (74, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 1', 10.461746440000000, 105.645953100000000, 10.461653260000000, 105.646000800000000, 'Hàng 5'),
                                                                                                                                                                        (75, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 1', 10.461764630000000, 105.645980100000000, 10.461689150000000, 105.646020600000000, 'Hàng 6'),
                                                                                                                                                                        (76, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 2', 10.462440620000000, 105.645415900000000, 10.462440620000000, 105.645415900000000, 'VH Số 1'),
                                                                                                                                                                        (77, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 2', 10.462581160000000, 105.645272000000000, 10.462466090000000, 105.645361700000000, 'Hàng 1'),
                                                                                                                                                                        (78, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 2', 10.462622620000000, 105.645278700000000, 10.462486630000000, 105.645396400000000, 'Hàng 2'),
                                                                                                                                                                        (79, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 2', 10.462649240000000, 105.645292500000000, 10.462524410000000, 105.645395200000000, 'Hàng 3'),
                                                                                                                                                                        (80, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 2', 10.462665650000000, 105.645318600000000, 10.462551910000000, 105.645413000000000, 'Hàng 4'),
                                                                                                                                                                        (81, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 2', 10.462676260000000, 105.645349200000000, 10.462576990000000, 105.645426600000000, 'Hàng 5'),
                                                                                                                                                                        (82, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'C 2', 10.462666220000000, 105.645399100000000, 10.462598990000000, 105.645452900000000, 'Hàng 6'),
                                                                                                                                                                        (83, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'D 1', 10.461906740000000, 105.645987400000000, 10.461859750000000, 105.646012900000000, 'Hàng 1'),
                                                                                                                                                                        (84, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'D 1', 10.461932500000000, 105.646005500000000, 10.461818870000000, 105.646070300000000, 'Hàng 2'),
                                                                                                                                                                        (85, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'D 2', 10.462587430000000, 105.645545900000000, 10.462540920000000, 105.645578900000000, 'Hàng 1'),
                                                                                                                                                                        (86, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'D 2', 10.462649400000000, 105.645541600000000, 10.462538960000000, 105.645616200000000, 'Hàng 2'),
                                                                                                                                                                        (87, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'khu 8', 0.000000000000000, 0.000000000000000, 0.000000000000000, 0.000000000000000, 'hàng 9');