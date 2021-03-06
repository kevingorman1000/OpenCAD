--
-- Table structure for table `active_users`
--

CREATE TABLE `active_users` (
  `identifier` varchar(255) NOT NULL,
  `callsign` varchar(255) NOT NULL COMMENT 'Unit Callsign',
  `status` int(11) NOT NULL COMMENT 'Unit status, 0=busy/unavailable, 1=available, 2=dispatcher',
  `status_detail` int(11) NOT NULL COMMENT 'Paired to Statuses table',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Table structure for table `aop`
--

CREATE TABLE `aop` (
  `aop` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO `aop` (`aop`) VALUES
('INIT AOP');

--
-- Table structure for table `bolos_persons`
--

CREATE TABLE `bolos_persons` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL COMMENT 'First name of BOLO suspect.',
  `last_name` varchar(255) NOT NULL COMMENT 'Last name of BOLO suspect.',
  `gender` varchar(255) NOT NULL COMMENT 'Gender of BOLO suspect.',
  `physical_description` varchar(255) NOT NULL COMMENT 'Physical description of BOLO suspect.',
  `reason_wanted` varchar(255) NOT NULL COMMENT 'Reason BOLO suspect is wanted.',
  `last_seen` varchar(255) NOT NULL COMMENT 'Last observed location of BOLO suspect.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Table structure for table `bolos_vehicles`
--

CREATE TABLE `bolos_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle_make` varchar(255) NOT NULL COMMENT 'Make of BOLO vehicle.',
  `vehicle_model` varchar(255) NOT NULL COMMENT 'Model of BOLO vehicle.',
  `vehicle_plate` varchar(255) NOT NULL COMMENT 'License of BOLO vehicle.',
  `primary_color` varchar(255) NOT NULL COMMENT 'Primary color of BOLO vehicle.',
  `secondary_color` varchar(255) NOT NULL COMMENT 'Secondary color of BOLO vehicle.',
  `reason_wanted` varchar(255) NOT NULL COMMENT 'Reason BOLO suspect is wanted.',
  `last_seen` varchar(255) NOT NULL COMMENT 'Last observed location of BOLO vehicle.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE `calls` (
  `call_id` int(11) NOT NULL,
  `call_type` text NOT NULL,
  `call_primary` text,
  `call_street1` text NOT NULL,
  `call_street2` text,
  `call_street3` text,
  `call_narrative` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `calls_users`
--

CREATE TABLE `calls_users` (
  `call_id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `callsign` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `call_history`
--

CREATE TABLE `call_history` (
  `call_id` int(11) NOT NULL,
  `call_type` text NOT NULL,
  `call_primary` text,
  `call_street1` text NOT NULL,
  `call_street2` text,
  `call_street3` text,
  `call_narrative` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `call_list`
--

CREATE TABLE `call_list` (
  `call_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `citations`
--

CREATE TABLE `citations` (
  `id` int(11) NOT NULL,
  `citation_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `civilian_names`
--

CREATE TABLE `civilian_names` (
  `user_id` int(11) NOT NULL COMMENT 'Links to users table',
  `names_id` int(11) NOT NULL COMMENT 'Links to names table'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `color_group` varchar(255) DEFAULT NULL,
  `color_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL COMMENT 'The functional name of the department. (eg. Police, Fire, EMS)',
  `department_short_name` varchar(10) NOT NULL COMMENT 'The name of the department. (eg. Los Angeles Police Department, Blaine County Sheriffs'' Office',
  `department_long_name` varchar(255) NOT NULL COMMENT 'The acronym of the department name. (eg. BCSO, LAPD, LAFD)',
  `allow_department` int(11) NOT NULL COMMENT 'If 0 then department is disabled, if 1 then department is enabled.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `dispatchers`
--

CREATE TABLE `dispatchers` (
  `identifier` varchar(255) NOT NULL,
  `callsign` varchar(255) NOT NULL COMMENT 'Unit Callsign',
  `status` int(11) NOT NULL COMMENT 'Unit status, 0=offline, 1=online'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` int(11) NOT NULL,
  `genders` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

CREATE TABLE `incident_type` (
  `code_id` varchar(255) NOT NULL DEFAULT '',
  `code_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_arrests`
--

CREATE TABLE `ncic_arrests` (
  `id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL COMMENT 'Paired to ID of ncic_names table',
  `arrest_reason` varchar(255) NOT NULL,
  `arrest_fine` int(11) NOT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_citations`
--

CREATE TABLE `ncic_citations` (
  `id` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 = Pending, 1 = Approved/Active',
  `name_id` int(11) NOT NULL COMMENT 'Paired to ID of ncic_names table',
  `citation_name` varchar(255) NOT NULL,
  `citation_fine` int(11) NOT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_names`
--

CREATE TABLE `ncic_names` (
  `id` int(11) NOT NULL,
  `submittedByName` varchar(255) NOT NULL,
  `submittedById` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` date NOT NULL COMMENT 'Date of birth',
  `address` text NOT NULL,
  `gender` varchar(255) NOT NULL,
  `race` text NOT NULL,
  `dl_status` set('Unobtained','Valid','Suspended','Expired') NOT NULL,
  `hair_color` text NOT NULL,
  `build` text NOT NULL,
  `weapon_permit` varchar(255) NOT NULL,
  `deceased` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_plates`
--

CREATE TABLE `ncic_plates` (
  `id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL COMMENT 'Links to ncic_names db for driver information',
  `veh_plate` text NOT NULL,
  `veh_make` text NOT NULL,
  `veh_model` text NOT NULL,
  `veh_pcolor` text NOT NULL,
  `veh_scolor` text NOT NULL,
  `veh_insurance` set('VALID','EXPIRED') NOT NULL DEFAULT 'VALID',
  `flags` set('NONE','STOLEN','WANTED','SUSPENDED REGISTRATION','UC FLAG','HPIU FLAG') NOT NULL DEFAULT 'NONE',
  `veh_reg_state` text NOT NULL,
  `notes` text COMMENT 'Any special flags visible to dispatchers',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_warnings`
--

CREATE TABLE `ncic_warnings` (
  `id` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 = Pending, 1 = Approved/Active',
  `name_id` int(11) NOT NULL COMMENT 'Paired to ID of ncic_names table',
  `warning_name` varchar(255) NOT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_warrants`
--

CREATE TABLE `ncic_warrants` (
  `id` int(11) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `warrant_name` varchar(255) NOT NULL,
  `issuing_agency` varchar(255) NOT NULL,
  `name_id` int(11) NOT NULL COMMENT 'Key that pairs to the ncic_name id',
  `issued_date` date DEFAULT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_weapons`
--

CREATE TABLE `ncic_weapons` (
  `id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL COMMENT 'Links to ncic_names db for driver information',
  `weapon_type` varchar(255) NOT NULL,
  `weapon_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `perm_id` int(11) NOT NULL,
  `perm_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `status_id` int(11) NOT NULL,
  `status_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `streets`
--

CREATE TABLE `streets` (
  `id` int(11) NOT NULL COMMENT 'Primary key for each street',
  `name` text NOT NULL COMMENT 'Street name',
  `county` text NOT NULL COMMENT 'County name'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tones`
--

CREATE TABLE `tones` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` set('0','1') NOT NULL DEFAULT '0' COMMENT '0 = inactive, 1 = active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tones table. DO NOT ADD ROWS TO THIS TABLE' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text,
  `identifier` varchar(255) DEFAULT NULL,
  `admin_privilege` int(1) NOT NULL DEFAULT '0' COMMENT 'If 0 then user does not possess any administrative permissions, else if 1 then user possess Moderator privileges, else if 2 then user possess Administrator privileges.',
  `supervisor_privilege` int(1) NOT NULL DEFAULT '0' COMMENT 'If 0 then user does not possess any supervisor privileges, else 1 then user possess supervisor privileges.',
  `password_reset` int(1) NOT NULL DEFAULT '0' COMMENT '1 means password reset required. 0 means it''s not.',
  `approved` int(1) NOT NULL DEFAULT '0' COMMENT 'Three main statuses: 0 means pending approval. 1 means has access. 2 means suspended',
  `suspend_reason` tinytext COMMENT 'Stores the reason why a user is Suspended',
  `suspend_duration` date DEFAULT NULL COMMENT 'Stores the duration a user is Suspended for'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='User table' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `user_departments`
--

CREATE TABLE `user_departments` (
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `user_departments_temp`
--

CREATE TABLE `user_departments_temp` (
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Temporary table - stores user departments for non-approved users' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `Make` varchar(100) NOT NULL,
  `Model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `weapons`
--

CREATE TABLE `weapons` (
  `id` int(11) NOT NULL,
  `weapon_type` varchar(255) NOT NULL,
  `weapon_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--


--
-- Indexes for table `active_users`
--
ALTER TABLE `active_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`) USING BTREE;


--
-- Indexes for table `bolos_persons`
--
ALTER TABLE `bolos_persons`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bolos_vehicles`
--
ALTER TABLE `bolos_vehicles`
  ADD PRIMARY KEY (`id`);


  --
  -- Indexes for table `dispatchers`
  --
  ALTER TABLE `dispatchers`
    ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Indexes for table `ncic_arrests`
--
ALTER TABLE `ncic_arrests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ncic_citations`
--
ALTER TABLE `ncic_citations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ncic_names`
--
ALTER TABLE `ncic_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ncic_plates`
--
ALTER TABLE `ncic_plates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ncic_warnings`
--
ALTER TABLE `ncic_warnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ncic_warrants`
--
ALTER TABLE `ncic_warrants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ncic_weapons`
--
ALTER TABLE `ncic_weapons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bolos_persons`
--
ALTER TABLE `bolos_persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bolos_vehicles`
--
ALTER TABLE `bolos_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ncic_arrests`
--
ALTER TABLE `ncic_arrests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ncic_citations`
--
ALTER TABLE `ncic_citations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ncic_names`
--
ALTER TABLE `ncic_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ncic_plates`
--
ALTER TABLE `ncic_plates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ncic_warnings`
--
ALTER TABLE `ncic_warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ncic_warrants`
--
ALTER TABLE `ncic_warrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ncic_weapons`
--
ALTER TABLE `ncic_weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `streets`
--
ALTER TABLE `streets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for each street', AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- AUTO_INCREMENT for table `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `color_group`, `color_name`) VALUES
(1, 'Chrome', 'Chrome'),
(2, 'Classic', 'Black'),
(3, 'Classic', 'Carbon Black'),
(4, 'Classic', 'Graphite'),
(5, 'Classic', 'Anthracite Black'),
(6, 'Classic', 'Black Steel'),
(7, 'Classic', 'Dark Steel'),
(8, 'Classic', 'Silver'),
(9, 'Classic', 'Bluish Silver'),
(10, 'Classic', 'Rolled Steel'),
(11, 'Classic', 'Shadow Silver'),
(12, 'Classic', 'Midnight Silver'),
(13, 'Classic', 'Cast Iron Silver'),
(14, 'Classic', 'Red'),
(15, 'Classic', 'Torino Red'),
(16, 'Classic', 'Forumula Red'),
(17, 'Classic', 'Lava Red'),
(18, 'Classic', 'Blaze Red'),
(19, 'Classic', 'Grace Red'),
(20, 'Classic', 'Garnet Red'),
(21, 'Classic', 'Sunset Red'),
(22, 'Classic', 'Cabernet Red'),
(23, 'Classic', 'Wine Red'),
(24, 'Classic', 'Candy Red'),
(25, 'Classic', 'Hot Pink'),
(26, 'Classic', 'Pfister Pink'),
(27, 'Classic', 'Salmon Pink'),
(28, 'Classic', 'Sunrise Orange'),
(29, 'Classic', 'Orange'),
(30, 'Classic', 'Bright Orange'),
(31, 'Classic', 'Gold'),
(32, 'Classic', 'Bronze'),
(33, 'Classic', 'Yellow'),
(34, 'Classic', 'Race Yellow'),
(35, 'Classic', 'Dew Yellow'),
(36, 'Classic', 'Dark Green'),
(37, 'Classic', 'Racing Green'),
(38, 'Classic', 'Sea Green'),
(39, 'Classic', 'Olive Green'),
(40, 'Classic', 'Bright Green'),
(41, 'Classic', 'Gasoline Green'),
(42, 'Classic', 'Lime Green'),
(43, 'Classic', 'Midnight Blue'),
(44, 'Classic', 'Galaxy Blue'),
(45, 'Classic', 'Dark Blue'),
(46, 'Classic', 'Saxon Blue'),
(47, 'Classic', 'Blue'),
(48, 'Classic', 'Mariner Blue'),
(49, 'Classic', 'Harbor Blue'),
(50, 'Classic', 'Diamond Blue'),
(51, 'Classic', 'Surf Blue'),
(52, 'Classic', 'Nautical Blue'),
(53, 'Classic', 'Racaing Blue'),
(54, 'Classic', 'Ultra Blue'),
(55, 'Classic', 'Light Blue'),
(56, 'Classic', 'Chocolate Brown'),
(57, 'Classic', 'Bison Brown'),
(58, 'Classic', 'Creek Brown'),
(59, 'Classic', 'Feltzer Brown'),
(60, 'Classic', 'Maple Brown'),
(61, 'Classic', 'Beechwood Brown'),
(62, 'Classic', 'Sienna Brown'),
(63, 'Classic', 'Saddle Brown'),
(64, 'Classic', 'Moss Brown'),
(65, 'Classic', 'Woodbeech Brown'),
(66, 'Classic', 'Straw Brown'),
(67, 'Classic', 'Sandy Brown'),
(68, 'Classic', 'Bleached Brown'),
(69, 'Classic', 'Schafter Purple'),
(70, 'Classic', 'Spinnaker Purple'),
(71, 'Classic', 'Midnight Purple'),
(72, 'Classic', 'Bright Purple'),
(73, 'Classic', 'Cream'),
(74, 'Classic', 'Ice White'),
(75, 'Classic', 'Frost White'),
(76, 'Matte', 'Black'),
(77, 'Matte', 'Gray'),
(78, 'Matte', 'Light Gray'),
(79, 'Matte', 'Ice White'),
(80, 'Matte', 'Blue'),
(81, 'Matte', 'Dark Blue'),
(82, 'Matte', 'Midnight Blue'),
(83, 'Matte', 'Midnight Purple'),
(84, 'Matte', 'Shafter Purple'),
(85, 'Matte', 'Red'),
(86, 'Matte', 'Dark Red'),
(87, 'Matte', 'Orange'),
(88, 'Matte', 'Yellow'),
(89, 'Matte', 'Lime Green'),
(90, 'Matte', 'Green'),
(91, 'Matte', 'Forest Green'),
(92, 'Matte', 'Foliage Green'),
(93, 'Matte', 'Olive Drag'),
(94, 'Matte', 'Dark Earch'),
(95, 'Matte', 'Desert Tan'),
(96, 'Metallic', 'Black'),
(97, 'Metallic', 'Carbon Black'),
(98, 'Metallic', 'Graphite'),
(99, 'Metallic', 'Anthracite Black'),
(100, 'Metallic', 'Black Steel'),
(101, 'Metallic', 'Dark Steel'),
(102, 'Metallic', 'Silver'),
(103, 'Metallic', 'Bluish Silver'),
(104, 'Metallic', 'Rolled Steel'),
(105, 'Metallic', 'Shadow Silver'),
(106, 'Metallic', 'Stone Silver'),
(107, 'Metallic', 'Midnight Silver'),
(108, 'Metallic', 'Cast Iron Silver'),
(109, 'Metallic', 'Red'),
(110, 'Metallic', 'Torino Red'),
(111, 'Metallic', 'Formula Red'),
(112, 'Metallic', 'Lava Red'),
(113, 'Metallic', 'Blaze Red'),
(114, 'Metallic', 'Grace Red'),
(115, 'Metallic', 'Garnet Red'),
(116, 'Metallic', 'Sunset Red'),
(117, 'Metallic', 'Cabernet Red'),
(118, 'Metallic', 'Wine Red'),
(119, 'Metallic', 'Candy Red'),
(120, 'Metallic', 'Hot Pink'),
(121, 'Metallic', 'Pfister Pink'),
(122, 'Metallic', 'Salmon Pink'),
(123, 'Metallic', 'Sunrise Orange'),
(124, 'Metallic', 'Orange'),
(125, 'Metallic', 'Bright Orange'),
(126, 'Metallic', 'Gold Bronze'),
(127, 'Metallic', 'Yellow'),
(128, 'Metallic', 'Race Yellow'),
(129, 'Metallic', 'Dew Yellow'),
(130, 'Metallic', 'Dark Green'),
(131, 'Metallic', 'Racing Green'),
(132, 'Metallic', 'Sea Green'),
(133, 'Metallic', 'Olive Green'),
(134, 'Metallic', 'Bright Green'),
(135, 'Metallic', 'Gasoline Green'),
(136, 'Metallic', 'Lime Green'),
(137, 'Metallic', 'Midnight Blue'),
(138, 'Metallic', 'Galazy BLue'),
(139, 'Metallic', 'Dark Blue'),
(140, 'Metallic', 'Saxon Blue'),
(141, 'Metallic', 'Blue'),
(142, 'Metallic', 'Mariner Bue'),
(143, 'Metallic', 'Harbor Blue'),
(144, 'Metallic', 'Diamond BLue'),
(145, 'Metallic', 'Surf Blue'),
(146, 'Metallic', 'Nauical Blue'),
(147, 'Metallic', 'Racing Blue'),
(148, 'Metallic', 'Ultra Blue'),
(149, 'Metallic', 'Light Blue'),
(150, 'Metallic', 'Chocolate Brown'),
(151, 'Metallic', 'Bison Brown'),
(152, 'Metallic', 'Creek Brown'),
(153, 'Metallic', 'Feltzer Brown'),
(154, 'Metallic', 'Maple Brown'),
(155, 'Metallic', 'Beechwood Brown'),
(156, 'Metallic', 'Sienna Brown'),
(157, 'Metallic', 'Saddle Brown'),
(158, 'Metallic', 'Moss Brown'),
(159, 'Metallic', 'Woodbeech Brown'),
(160, 'Metallic', 'Straw Brown'),
(161, 'Metallic', 'Sandy BRown'),
(162, 'Metallic', 'Bleached Brown'),
(163, 'Metallic', 'Schafter Purple'),
(164, 'Metallic', 'Spinnaker Purple'),
(165, 'Metallic', 'Midnight Purple'),
(166, 'Metallic', 'Bright Purple'),
(167, 'Metallic', 'Cream'),
(168, 'Metallic', 'Ice White'),
(169, 'Metallic', 'Frost White'),
(170, 'Metals', 'Brushed Steel'),
(171, 'Metals', 'Brushed Black Steel'),
(172, 'Metals', 'Brushed Aluminium'),
(173, 'Metals', 'Pure Gold'),
(174, 'Metals', 'Brushed Gold'),
(175, 'Pearlescent', 'Black'),
(176, 'Pearlescent', 'Carbon Black'),
(177, 'Pearlescent', 'Graphite'),
(178, 'Pearlescent', 'Anthracite Black'),
(179, 'Pearlescent', 'Black Steel'),
(180, 'Pearlescent', 'Dark Steel'),
(181, 'Pearlescent', 'Silver'),
(182, 'Pearlescent', 'Bluish Silver'),
(183, 'Pearlescent', 'Rolled Steel'),
(184, 'Pearlescent', 'Shadow Silver'),
(185, 'Pearlescent', 'Stone Silver'),
(186, 'Pearlescent', 'Midnight Silver'),
(187, 'Pearlescent', 'Cast Iron Silver'),
(188, 'Pearlescent', 'Red'),
(189, 'Pearlescent', 'Torino Red'),
(190, 'Pearlescent', 'Formula Red'),
(191, 'Pearlescent', 'Lava Red'),
(192, 'Pearlescent', 'Blaze Red'),
(193, 'Pearlescent', 'Grace Red'),
(194, 'Pearlescent', 'Garnet Red'),
(195, 'Pearlescent', 'Sunset Red'),
(196, 'Pearlescent', 'Cabernet Red'),
(197, 'Pearlescent', 'Wine Red'),
(198, 'Pearlescent', 'Candy Red'),
(199, 'Pearlescent', 'Hot Pink'),
(200, 'Pearlescent', 'Pfister Pink'),
(201, 'Pearlescent', 'Salmon Pink'),
(202, 'Pearlescent', 'Sunrise Orange'),
(203, 'Pearlescent', 'Orange'),
(204, 'Pearlescent', 'Bright Orange'),
(205, 'Pearlescent', 'Gold Bronze'),
(206, 'Pearlescent', 'Yellow'),
(207, 'Pearlescent', 'Race Yellow'),
(208, 'Pearlescent', 'Dew Yellow'),
(209, 'Pearlescent', 'Dark Green'),
(210, 'Pearlescent', 'Racing Green'),
(211, 'Pearlescent', 'Sea Green'),
(212, 'Pearlescent', 'Olive Green'),
(213, 'Pearlescent', 'Bright Green'),
(214, 'Pearlescent', 'Gasoline Green'),
(215, 'Pearlescent', 'Lime Green'),
(216, 'Pearlescent', 'Midnight Blue'),
(217, 'Pearlescent', 'Galazy BLue'),
(218, 'Pearlescent', 'Dark Blue'),
(219, 'Pearlescent', 'Saxon Blue'),
(220, 'Pearlescent', 'Blue'),
(221, 'Pearlescent', 'Mariner Bue'),
(222, 'Pearlescent', 'Harbor Blue'),
(223, 'Pearlescent', 'Diamond BLue'),
(224, 'Pearlescent', 'Surf Blue'),
(225, 'Pearlescent', 'Nauical Blue'),
(226, 'Pearlescent', 'Racing BLue'),
(227, 'Pearlescent', 'Ultra BLue'),
(228, 'Pearlescent', 'Light BLue'),
(229, 'Pearlescent', 'Chocolate Brown'),
(230, 'Pearlescent', 'Bison Brown'),
(231, 'Pearlescent', 'Creek Brown'),
(232, 'Pearlescent', 'Feltzer Brown'),
(233, 'Pearlescent', 'Maple Brown'),
(234, 'Pearlescent', 'Beechwood Brown'),
(235, 'Pearlescent', 'Sienna Brown'),
(236, 'Pearlescent', 'Saddle Brown'),
(237, 'Pearlescent', 'Moss Brown'),
(238, 'Pearlescent', 'Woodbeech Brown'),
(239, 'Pearlescent', 'Straw Brown'),
(240, 'Pearlescent', 'Sandy Brown'),
(241, 'Pearlescent', 'Bleached Brown'),
(242, 'Pearlescent', 'Schafter Purple'),
(243, 'Pearlescent', 'Spinnaker Purple'),
(244, 'Pearlescent', 'Midnight Purple'),
(245, 'Pearlescent', 'Bright Purple'),
(246, 'Pearlescent', 'Cream'),
(247, 'Pearlescent', 'Ice White'),
(248, 'Pearlescent', 'Frost White');

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `department_short_name`, `department_long_name`, `allow_department`) VALUES
(1, 'Communications', 'SAECOMM', 'San Andreas Emergency Communications', 0),
(2, 'State', 'SASP', 'San Andreas State Police', 0),
(3, 'Highway', 'SAHP', 'San Andreas Highway Patrol', 0),
(4, 'Sheriff', 'BCSO', 'Blaine County Sheriffs\' Office', 0),
(5, 'Police', 'SAPD', 'San Andreas Police Department', 0),
(6, 'Fire', 'SAFD', 'San Andreas Fire Department', 0),
(7, 'EMS', 'SAEMS', 'San Andreas Emergency Services', 0),
(8, 'Civilian', 'SACS', 'San Andreas Civilian Services', 0),
(9, 'Roadside Assistance', 'SARA', 'San Andreas Roadside Assistance', 0);

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `genders`) VALUES
(0, 'Male'),
(1, 'Female');

--
-- Dumping data for table `incident_type`
--

INSERT INTO `incident_type` (`code_id`, `code_name`) VALUES
('1', 'Bribery'),
('2', 'Reception of a Bribe'),
('3', 'Obstruction of Public Official'),
('4', 'Aggravated Obstruction of Public Official'),
('5', 'Assisting in a prisoner escape'),
('6', 'Aiding Escape'),
('7', 'Failure to identify'),
('8', 'Obstruction of a Government Employee'),
('9', 'Misuse of a Government Hotline'),
('10', 'Tampering with evidence'),
('11', 'Forgery of Public Record'),
('12', 'Perjury'),
('13', 'Falsfication of Evidence'),
('14', 'Dissuading a witness'),
('15', 'Evading'),
('16', 'Felony reckless evading'),
('17', 'Refusal to Sign'),
('18', 'Failure to pay fine'),
('19', 'Contempt of Court'),
('20', 'Provision of false information to a state employee'),
('21', 'Human trafficking'),
('22', 'Violation of parole or probation'),
('23', 'False personation'),
('24', 'Police Officer Refusing to Arrest'),
('25', 'False report of crime or emergency'),
('26', 'Intimidation'),
('27', 'Assault'),
('28', 'Assault with a deadly weapon'),
('29', 'Mutual Combat'),
('30', 'Attempted Murder'),
('31', 'Attempted Murder of an LEO'),
('32', 'Manslaughter'),
('33', 'False imprisonment'),
('34', 'Kidnapping'),
('35', 'Hostage Taking'),
('36', 'Indecent Exposure'),
('37', 'Obscene Exhibitation'),
('38', 'Bawdy or Disorderly House'),
('39', 'Prostitution'),
('40', 'Pandering (PIMPING)'),
('41', 'Stalking'),
('42', 'Disorderly Conduct'),
('43', 'Possession of a Controlled Substance'),
('44', 'Possession of a controlled Substance with intent to distribute'),
('45', 'Possession of drug paraphernalia'),
('46', 'Maintaining a place for purpose of distribution'),
('47', 'Sale of Controlled Substance'),
('48', 'Manufacture of a controlled substance'),
('49', 'Possession of an open container'),
('50', 'Public Intoxication'),
('51', 'Public influence of a controlled Substance'),
('52', 'Possession in Excess'),
('53', 'Criminal Threats'),
('54', 'Reckless Endangerment'),
('55', 'Littering'),
('56', 'Obstruction of Assembly'),
('57', 'Riot'),
('58', 'Incitement to Riot'),
('59', 'Unlawful Assembly'),
('60', 'Breach of the peace'),
('61', 'Obstruction of rightful passage'),
('62', 'Arson'),
('63', 'Armed Robbery'),
('64', 'Robbery'),
('65', 'Burglary'),
('66', 'Possession of Burglary Tools'),
('67', 'Forgery'),
('68', 'Petty Theft'),
('69', 'Grand Theft Auto'),
('70', 'Grand Theft by false pretense'),
('71', 'Embezzlement'),
('72', 'Tresspassing'),
('73', 'Receiving Stolen Property'),
('74', 'Vandalism'),
('75', 'Criminal Damage'),
('76', 'Grand Larceny'),
('77', 'Endangering the safety of an aircraft'),
('78', 'Hate Crime'),
('79', 'Extortion'),
('80', 'Money Laundering'),
('81', 'Unlawful Posession of a firearm'),
('82', 'Unlawful Concealment of a firearm'),
('83', 'Unlawful carry of a firearm'),
('84', 'Unlawful display of a firearm'),
('85', 'Unlawful discharge of a firearm'),
('86', 'Unlawful Possesion of a deadly weapon'),
('87', 'Unlawful display of a deadly weapon'),
('88', 'Unlawful concealment of a deadly weapon'),
('89', 'Unlawful concealment of a deadly weapon'),
('90', 'Unlawful distribution of a firearm'),
('91', 'Manufacture of an explosive device'),
('92', 'Unlawful possesion of a firearm with intent to sell'),
('93', 'Unlawful modification of a firearm'),
('94', 'Reckless Driving'),
('95', 'Reckless Driving causing bodily injury'),
('96', 'Eluding/Evading Police Officer'),
('97', 'Failure to Yield to a TCD'),
('98', 'Speeding'),
('99', 'Exceeding Speeds > 5 mph'),
('100', 'Exceeding Speeds 5-15 mph'),
('101', 'Exceeding Speeds 15-30 mph'),
('102', 'Exceeding Speeds > 30 mph'),
('103', 'Driving Wrong Way'),
('104', 'Illegal Window Tint'),
('105', 'Failure to maintain lane'),
('106', 'Impeading Traffic'),
('107', 'Open Alcohol'),
('108', 'Open Alcohol container under 21'),
('109', 'Driving while in possesion of marijuana'),
('110', 'Exhibitation of speed'),
('111', 'Illegal vehicle modifications'),
('112', 'Operating an unroadworthy vehicle'),
('113', 'Failure to display license plate'),
('114', 'Failure to yield to emergency vehicles'),
('115', 'Unsafe vehicle load'),
('116', 'Driving on sidewalk'),
('117', 'Interfering with drivers control vehicle'),
('118', 'Following too closely'),
('119', 'Impaired Driving'),
('120', 'Illegal Passing'),
('121', 'Unsafe Operation of an emergency vehicle'),
('122', 'Driving without headlights at night'),
('123', 'Failure to dim lights'),
('124', 'Driving without a valid license'),
('125', 'Failure to show a drivers license'),
('126', 'Illegal parking'),
('127', 'Driving under the influence of alcohol'),
('128', 'Driving under the influence of drugs'),
('129', 'Broken taillights/headlights'),
('130', 'Jaywalking'),
('131', 'Possession of sirens & Emergency lights'),
('132', 'Possession of Sirens & Emergency lights with the intent to impersonate'),
('133', 'Failure to signal lane change'),
('134', 'Hitchhiking'),
('135', 'Driving with a suspended license'),
('136', 'Use of hydraulics on public Roadside'),
('137', 'Intentionally altering or destroying VIN'),
('138', 'Buying or possessing a vehicle with an altered VIN'),
('139', 'Felony Speeding'),
('140', 'Hit and Run'),
('141', 'Hit and Run with injury'),
('142', 'Shots Fired');

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`status_id`, `status_text`) VALUES
(1, '10-8 | Available'),
(2, '10-6 | Busy'),
(3, '10-7 | On Call'),
(4, '10-5 | Meal Break'),
(5, 'Signal 11'),
(6, '10-7 | Unavailable'),
(7, '10-23 | Arrived on Scene'),
(8, '10-65 | Transporting Prisoner'),
(9, '10-76 Code 1 | Responding Low Priority'),
(10, '10-76 Code 2 | Responding Medium Priority'),
(11, '10-76 Code 3 | Responding High Priority'),
(12, '10-42 Off-Duty');

--
-- Dumping data for table `streets`
--

INSERT INTO `streets` (`id`, `name`, `county`) VALUES
(1, 'Abattoir Avenue', 'Los Santos County'),
(2, 'Abe Milton Parkway', 'Los Santos County'),
(3, 'Ace Jones Drive', 'Los Santos County'),
(4, 'Adam\'s Apple Boulevard', 'Los Santos County'),
(5, 'Aguja Street', 'Los Santos County'),
(6, 'Alta Place', 'Los Santos County'),
(7, 'Alta Street', 'Los Santos County'),
(8, 'Amarillo Vista', 'Los Santos County'),
(9, 'Amarillo Way', 'Los Santos County'),
(10, 'Americano Way', 'Los Santos County'),
(11, 'Atlee Street', 'Los Santos County'),
(12, 'Autopia Parkway', 'Los Santos County'),
(13, 'Banham Canyon Drive', 'Los Santos County'),
(14, 'Barbareno Road', 'Los Santos County'),
(15, 'Bay City Avenue', 'Los Santos County'),
(16, 'Bay City Incline', 'Los Santos County'),
(17, 'Baytree Canyon Road (City)', 'Los Santos County'),
(18, 'Boulevard Del Perro', 'Los Santos County'),
(19, 'Bridge Street', 'Los Santos County'),
(20, 'Brouge Avenue', 'Los Santos County'),
(21, 'Buccaneer Way', 'Los Santos County'),
(22, 'Buen Vino Road', 'Los Santos County'),
(23, 'Caesars Place', 'Los Santos County'),
(24, 'Calais Avenue', 'Los Santos County'),
(25, 'Capital Boulevard', 'Los Santos County'),
(26, 'Carcer Way', 'Los Santos County'),
(27, 'Carson Avenue', 'Los Santos County'),
(28, 'Chum Street', 'Los Santos County'),
(29, 'Chupacabra Street', 'Los Santos County'),
(30, 'Clinton Avenue', 'Los Santos County'),
(31, 'Cockingend Drive', 'Los Santos County'),
(32, 'Conquistador Street', 'Los Santos County'),
(33, 'Cortes Street', 'Los Santos County'),
(34, 'Cougar Avenue', 'Los Santos County'),
(35, 'Covenant Avenue', 'Los Santos County'),
(36, 'Cox Way', 'Los Santos County'),
(37, 'Crusade Road', 'Los Santos County'),
(38, 'Davis Avenue', 'Los Santos County'),
(39, 'Decker Street', 'Los Santos County'),
(40, 'Didion Drive', 'Los Santos County'),
(41, 'Dorset Drive', 'Los Santos County'),
(42, 'Dorset Place', 'Los Santos County'),
(43, 'Dry Dock Street', 'Los Santos County'),
(44, 'Dunstable Drive', 'Los Santos County'),
(45, 'Dunstable Lane', 'Los Santos County'),
(46, 'Dutch London Street', 'Los Santos County'),
(47, 'Eastbourne Way', 'Los Santos County'),
(48, 'East Galileo Avenue', 'Los Santos County'),
(49, 'East Mirror Drive', 'Los Santos County'),
(50, 'Eclipse Boulevard', 'Los Santos County'),
(51, 'Edwood Way', 'Los Santos County'),
(52, 'Elgin Avenue', 'Los Santos County'),
(53, 'El Burro Boulevard', 'Los Santos County'),
(54, 'El Rancho Boulevard', 'Los Santos County'),
(55, 'Equality Way', 'Los Santos County'),
(56, 'Exceptionalists Way', 'Los Santos County'),
(57, 'Fantastic Place', 'Los Santos County'),
(58, 'Fenwell Place', 'Los Santos County'),
(59, 'Forum Drive', 'Los Santos County'),
(60, 'Fudge Lane', 'Los Santos County'),
(61, 'Galileo Road', 'Los Santos County'),
(62, 'Gentry Lane', 'Los Santos County'),
(63, 'Ginger Street', 'Los Santos County'),
(64, 'Glory Way', 'Los Santos County'),
(65, 'Goma Street', 'Los Santos County'),
(66, 'Greenwich Parkway', 'Los Santos County'),
(67, 'Greenwich Place', 'Los Santos County'),
(68, 'Greenwich Way', 'Los Santos County'),
(69, 'Grove Street', 'Los Santos County'),
(70, 'Hanger Way', 'Los Santos County'),
(71, 'Hangman Avenue', 'Los Santos County'),
(72, 'Hardy Way', 'Los Santos County'),
(73, 'Hawick Avenue', 'Los Santos County'),
(74, 'Heritage Way', 'Los Santos County'),
(75, 'Hillcrest Avenue', 'Los Santos County'),
(76, 'Hillcrest Ridge Access Road', 'Los Santos County'),
(77, 'Imagination Court', 'Los Santos County'),
(78, 'Industry Passage', 'Los Santos County'),
(79, 'Ineseno Road', 'Los Santos County'),
(80, 'Integrity Way', 'Los Santos County'),
(81, 'Invention Court', 'Los Santos County'),
(82, 'Innocence Boulevard', 'Los Santos County'),
(83, 'Jamestown Street', 'Los Santos County'),
(84, 'Kimble Hill Drive', 'Los Santos County'),
(85, 'Kortz Drive', 'Los Santos County'),
(86, 'Labor Place', 'Los Santos County'),
(87, 'Laguna Place', 'Los Santos County'),
(88, 'Lake Vinewood Drive', 'Los Santos County'),
(89, 'Las Lagunas Boulevard', 'Los Santos County'),
(90, 'Liberty Street', 'Los Santos County'),
(91, 'Lindsay Circus', 'Los Santos County'),
(92, 'Little Bighorn Avenue', 'Los Santos County'),
(93, 'Low Power Street', 'Los Santos County'),
(94, 'Macdonald Street', 'Los Santos County'),
(95, 'Mad Wayne Thunder Drive', 'Los Santos County'),
(96, 'Magellan Avenue', 'Los Santos County'),
(97, 'Marathon Avenue', 'Los Santos County'),
(98, 'Marlowe Drive', 'Los Santos County'),
(99, 'Melanoma Street', 'Los Santos County'),
(100, 'Meteor Street', 'Los Santos County'),
(101, 'Milton Road', 'Los Santos County'),
(102, 'Mirror Park Boulevard', 'Los Santos County'),
(103, 'Mirror Place', 'Los Santos County'),
(104, 'Morningwood Boulevard', 'Los Santos County'),
(105, 'Mount Haan Drive', 'Los Santos County'),
(106, 'Mount Haan Road', 'Los Santos County'),
(107, 'Mount Vinewood Drive', 'Los Santos County'),
(108, 'Movie Star Way', 'Los Santos County'),
(109, 'Mutiny Road', 'Los Santos County'),
(110, 'New Empire Way', 'Los Santos County'),
(111, 'Nikola Avenue', 'Los Santos County'),
(112, 'Nikola Place', 'Los Santos County'),
(113, 'Normandy Drive', 'Los Santos County'),
(114, 'North Archer Avenue', 'Los Santos County'),
(115, 'North Conker Avenue', 'Los Santos County'),
(116, 'North Sheldon Avenue', 'Los Santos County'),
(117, 'North Rockford Drive', 'Los Santos County'),
(118, 'Occupation Avenue', 'Los Santos County'),
(119, 'Orchardville Avenue', 'Los Santos County'),
(120, 'Palomino Avenue', 'Los Santos County'),
(121, 'Peaceful Street', 'Los Santos County'),
(122, 'Perth Street', 'Los Santos County'),
(123, 'Picture Perfect Drive', 'Los Santos County'),
(124, 'Plaice Place', 'Los Santos County'),
(125, 'Playa Vista', 'Los Santos County'),
(126, 'Popular Street', 'Los Santos County'),
(127, 'Portola Drive', 'Los Santos County'),
(128, 'Power Street', 'Los Santos County'),
(129, 'Prosperity Street', 'Los Santos County'),
(130, 'Prosperity Street Promenade', 'Los Santos County'),
(131, 'Red Desert Avenue', 'Los Santos County'),
(132, 'Richman Street', 'Los Santos County'),
(133, 'Rockford Drive', 'Los Santos County'),
(134, 'Roy Lowenstein Boulevard', 'Los Santos County'),
(135, 'Rub Street', 'Los Santos County'),
(136, 'Sam Austin Drive', 'Los Santos County'),
(137, 'San Andreas Avenue', 'Los Santos County'),
(138, 'Sandcastle Way', 'Los Santos County'),
(139, 'San Vitus Boulevard', 'Los Santos County'),
(140, 'Senora Road', 'Los Santos County'),
(141, 'Shank Street', 'Los Santos County'),
(142, 'Signal Street', 'Los Santos County'),
(143, 'Sinner Street', 'Los Santos County'),
(144, 'Sinners Passage', 'Los Santos County'),
(145, 'South Arsenal Street', 'Los Santos County'),
(146, 'South Boulevard Del Perro', 'Los Santos County'),
(147, 'South Mo Milton Drive', 'Los Santos County'),
(148, 'South Rockford Drive', 'Los Santos County'),
(149, 'South Shambles Street', 'Los Santos County'),
(150, 'Spanish Avenue', 'Los Santos County'),
(151, 'Steele Way', 'Los Santos County'),
(152, 'Strangeways Drive', 'Los Santos County'),
(153, 'Strawberry Avenue', 'Los Santos County'),
(154, 'Supply Street', 'Los Santos County'),
(155, 'Sustancia Road', 'Los Santos County'),
(156, 'Swiss Street', 'Los Santos County'),
(157, 'Tackle Street', 'Los Santos County'),
(158, 'Tangerine Street', 'Los Santos County'),
(159, 'Tongva Drive', 'Los Santos County'),
(160, 'Tower Way', 'Los Santos County'),
(161, 'Tug Street', 'Los Santos County'),
(162, 'Utopia Gardens', 'Los Santos County'),
(163, 'Vespucci Boulevard', 'Los Santos County'),
(164, 'Vinewood Boulevard', 'Los Santos County'),
(165, 'Vinewood Park Drive', 'Los Santos County'),
(166, 'Vitus Street', 'Los Santos County'),
(167, 'Voodoo Place', 'Los Santos County'),
(168, 'West Eclipse Boulevard', 'Los Santos County'),
(169, 'West Galileo Avenue', 'Los Santos County'),
(170, 'West Mirror Drive', 'Los Santos County'),
(171, 'Whispymound Drive', 'Los Santos County'),
(172, 'Wild Oats Drive', 'Los Santos County'),
(173, 'York Street', 'Los Santos County'),
(174, 'Zancudo Barranca', 'LOS Santos'),
(175, 'Algonquin Boulevard', 'Blaine County'),
(176, 'Alhambra Drive', 'Blaine County'),
(177, 'Armadillo Avenue', 'Blaine County'),
(178, 'Baytree Canyon Road (County)', 'Blaine County'),
(179, 'Calafia Road', 'Blaine County'),
(180, 'Cascabel Avenue', 'Blaine County'),
(181, 'Cassidy Trail', 'Blaine County'),
(182, 'Cat-Claw Avenue', 'Blaine County'),
(183, 'Chianski Passage', 'Blaine County'),
(184, 'Cholla Road', 'Blaine County'),
(185, 'Cholla Springs Avenue', 'Blaine County'),
(186, 'Duluoz Avenue', 'Blaine County'),
(187, 'East Joshua Road', 'Blaine County'),
(188, 'Fort Zancudo Approach Road', 'Blaine County'),
(189, 'Galileo Road', 'Blaine County'),
(190, 'Grapeseed Avenue', 'Blaine County'),
(191, 'Grapeseed Main Street', 'Blaine County'),
(192, 'Joad Lane', 'Blaine County'),
(193, 'Joshua Road', 'Blaine County'),
(194, 'Lesbos Lane', 'Blaine County'),
(195, 'Lolita Avenue', 'Blaine County'),
(196, 'Marina Drive', 'Blaine County'),
(197, 'Meringue Lane', 'Blaine County'),
(198, 'Mount Haan Road', 'Blaine County'),
(199, 'Mountain View Drive', 'Blaine County'),
(200, 'Niland Avenue', 'Blaine County'),
(201, 'North Calafia Way', 'Blaine County'),
(202, 'Nowhere Road', 'Blaine County'),
(203, 'O\'Neil Way', 'Blaine County'),
(204, 'Paleto Boulevard', 'Blaine County'),
(205, 'Panorama Drive', 'Blaine County'),
(206, 'Procopio Drive', 'Blaine County'),
(207, 'Procopio Promenade', 'Blaine County'),
(208, 'Pyrite Avenue', 'Blaine County'),
(209, 'Raton Pass', 'Blaine County'),
(210, 'Route 68 Approach', 'Blaine County'),
(211, 'Seaview Road', 'Blaine County'),
(212, 'Senora Way', 'Blaine County'),
(213, 'Smoke Tree Road', 'Blaine County'),
(214, 'Union Road', 'Blaine County'),
(215, 'Zancudo Avenue', 'Blaine County'),
(216, 'Zancudo Road', 'Blaine County'),
(217, 'Zancudo Trail', 'Blaine County'),
(218, 'Interstate 1', 'State'),
(219, 'Interstate 2', 'State'),
(220, 'Interstate 4', 'State'),
(221, 'Interstate 5', 'State'),
(222, 'Route 1', 'State'),
(223, 'Route 11', 'State'),
(224, 'Route 13', 'State'),
(225, 'Route 14', 'State'),
(226, 'Route 15', 'State'),
(227, 'Route 16', 'State'),
(228, 'Route 17', 'State'),
(229, 'Route 18', 'State'),
(230, 'Route 19', 'State'),
(231, 'Route 20', 'State'),
(232, 'Route 22', 'State'),
(233, 'Route 23', 'State'),
(234, 'Route 68', 'State');

--
-- Dumping data for table `tones`
--

INSERT INTO `tones` (`id`, `name`, `active`) VALUES
(0, 'priority', '0'),
(1, 'recurring', '0'),
(2, 'panic', '0');

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `Make`, `Model`) VALUES
  (1, 'Albany', 'Alpha'),
  (2, 'Albany', 'Buccaneer'),
  (3, 'Albany', 'Buccaneer Custom'),
  (4, 'Albany', 'Cavalcade'),
  (5, 'Albany', 'Cavalcade FXT'),
  (6, 'Albany', 'Emperor'),
  (7, 'Albany', 'Esperanto'),
  (8, 'Albany', 'Franken Stange'),
  (9, 'Albany', 'Hermes'),
  (10, 'Albany', 'Lurcher'),
  (11, 'Albany', 'Manana'),
  (12, 'Albany', 'Police Roadcruiser'),
  (13, 'Albany', 'Presidente'),
  (14, 'Albany', 'Primo'),
  (15, 'Albany', 'Primo Custom'),
  (16, 'Albany', 'Taxi Cab'),
  (17, 'Albany', 'Romero'),
  (18, 'Albany', 'Roosevelt'),
  (19, 'Albany', 'Roosevelt Valor'),
  (20, 'Albany', 'Stretch'),
  (21, 'Albany', 'Virgo'),
  (22, 'Albany', 'Washington'),
  (23, 'Annis', 'Elergy Retro Custom'),
  (24, 'Annis', 'Elergy RH8'),
  (25, 'Annis', 'RE7B'),
  (26, 'Annis', 'Savestra'),
  (27, 'Benefactor', 'Dubsta'),
  (28, 'Benefactor', 'Dubsta 6X6'),
  (29, 'Benefactor', 'Feltzer'),
  (30, 'Benefactor', 'Glendale'),
  (31, 'Benefactor', 'Panto'),
  (32, 'Benefactor', 'Schafter'),
  (33, 'Benefactor', 'Schafter LWB'),
  (34, 'Benefactor', 'Schafter LWB Armored'),
  (35, 'Benefactor', 'Schafter V12'),
  (36, 'Benefactor', 'Schafter V12 Armored'),
  (455, 'Benefactor', 'Schlagen GT'),
  (37, 'Benefactor', 'Schwartzer'),
  (38, 'Benefactor', 'Serrano'),
  (39, 'Benefactor', 'Stirling GT'),
  (40, 'Benefactor', 'Streiter'),
  (41, 'Benefactor', 'Surano'),
  (42, 'Benefactor', 'Terrorbyte'),
  (43, 'Benefactor', 'Turreted Limo'),
  (44, 'Benefactor', 'XLS'),
  (45, 'Benefactor', 'XLS Armored'),
  (46, 'BF', 'Bifta'),
  (47, 'BF', 'Dune Buggy'),
  (48, 'BF', 'Dune FAV'),
  (49, 'BF', 'Injection'),
  (50, 'BF', 'Ramp Buggy'),
  (51, 'BF', 'Raptor'),
  (52, 'BF', 'Space Docker'),
  (53, 'BF', 'Surfer'),
  (54, 'Bollokan', 'Prairie'),
  (55, 'Bravado', 'Banshee'),
  (56, 'Bravado', 'Banshee Topless'),
  (57, 'Bravado', 'Banshee 900R'),
  (58, 'Bravado', 'Bison'),
  (59, 'Bravado', 'Buffalo'),
  (60, 'Bravado', 'Buffalo S'),
  (61, 'Bravado', 'Duneloader'),
  (62, 'Bravado', 'FIB Buffalo'),
  (63, 'Bravado', 'Gauntlet'),
  (64, 'Bravado', 'Gresley'),
  (65, 'Bravado', 'HalfTrack'),
  (66, 'Bravado', 'Paradise'),
  (67, 'Bravado', 'Police Cruiser Buffalo'),
  (68, 'Bravado', 'RatLoader'),
  (69, 'Bravado', 'RatTruck'),
  (70, 'Bravado', 'Redwood Gauntlet'),
  (71, 'Bravado', 'Rumpo'),
  (72, 'Bravado', 'Rumpo Custom'),
  (73, 'Bravado', 'Sprunk Buffalo'),
  (74, 'Bravado', 'Verlierer'),
  (75, 'Bravado', 'Youga'),
  (76, 'Bravado', 'Youga Classic'),
  (77, 'Brute', 'Airport Bus'),
  (78, 'Brute', 'Ambulance'),
  (79, 'Brute', 'Boxville'),
  (80, 'Brute', 'Boxville Armored'),
  (81, 'Brute', 'Bus'),
  (82, 'Brute', 'Camper'),
  (83, 'Brute', 'Dashound'),
  (84, 'Brute', 'Police Riot'),
  (85, 'Brute', 'Pony'),
  (86, 'Brute', 'Rental Shuttle Bus'),
  (87, 'Brute', 'Stockade'),
  (88, 'Brute', 'Taco Van'),
  (89, 'Brute', 'Tipper'),
  (90, 'Brute', 'Tipper Classic'),
  (91, 'Brute', 'Tour Bus'),
  (92, 'Brute', 'Utility Truck'),
  (93, 'Brute', 'Cherry Picker Utility Truck'),
  (94, 'Canis', 'Bohdi'),
  (95, 'Canis', 'Crusader'),
  (96, 'Canis', 'Kalahari'),
  (97, 'Canis', 'Kalahari Topless'),
  (98, 'Canis', 'Kamacho'),
  (99, 'Canis', 'Mesa'),
  (100, 'Canis', 'Merryweather Mesa'),
  (101, 'Canis', 'Seminole'),
  (102, 'Chariot', 'Romero Hearse'),
  (103, 'Cheval', 'Fugitive'),
  (104, 'Cheval', 'Marshall'),
  (105, 'Cheval', 'Picador'),
  (106, 'Cheval', 'Surge'),
  (107, 'Cheval', 'Taipan'),
  (108, 'Coil', 'Brawler'),
  (109, 'Coil', 'Cyclone'),
  (110, 'Coil', 'Raiden'),
  (111, 'Coil', 'Rocket Voltic'),
  (112, 'Coil', 'Voltic'),
  (113, 'Coil', 'Topless Voltic'),
  (114, 'Declasse', 'Asea'),
  (115, 'Declasse', 'Burger Shot Stallion'),
  (116, 'Declasse', 'Burrito'),
  (117, 'Declasse', 'Drift Tampa'),
  (118, 'Declasse', 'FIB Granger'),
  (119, 'Declasse', 'LMC Biker Burrito'),
  (120, 'Declasse', 'Granger'),
  (121, 'Declasse', 'Hotring Sabre'),
  (122, 'Declasse', 'Lifegaurd Granger'),
  (123, 'Declasse', 'Mamba'),
  (124, 'Declasse', 'Moonbeam'),
  (125, 'Declasse', 'Moonbeam Custom'),
  (126, 'Declasse', 'Park Ranger Granger'),
  (127, 'Declasse', 'Police Rancher'),
  (128, 'Declasse', 'Police Transport Van'),
  (129, 'Declasse', 'Premier'),
  (130, 'Declasse', 'Rancher XL'),
  (131, 'Declasse', 'Rhapsody'),
  (132, 'Declasse', 'Sabre Turbo'),
  (133, 'Declasse', 'Sabre Turbo Custom'),
  (134, 'Declasse', 'Sheriff Granger'),
  (135, 'Declasse', 'Stallion'),
  (136, 'Declasse', 'Tampa'),
  (137, 'Declasse', 'Tornado'),
  (138, 'Declasse', 'Tornado Convertible'),
  (139, 'Declasse', 'Tornado Custom'),
  (140, 'Declasse', 'Tornado Rat Rod'),
  (454, 'Declasse', 'Tulip'),
  (458, 'Declasse', 'Vamos'),
  (141, 'Declasse', 'Vigero'),
  (142, 'Declasse', 'Voodoo'),
  (143, 'Declasse', 'Voodoo Custom'),
  (144, 'Declasse', 'Weaponized Tampa'),
  (145, 'Declasse', 'Yosemite'),
  (146, 'Dewbauchee', 'Exemplar'),
  (147, 'Dewbauchee', 'JB 700'),
  (148, 'Dewbauchee', 'Massacro'),
  (149, 'Dewbauchee', 'Massacro RaceCar'),
  (150, 'Dewbauchee', 'Rapid GT'),
  (151, 'Dewbauchee', 'Rapid GT Classic'),
  (152, 'Dewbauchee', 'Rapid GT Sports'),
  (153, 'Dewbauchee', 'Seven-70'),
  (154, 'Dewbauchee', 'Specter'),
  (155, 'Dewbauchee', 'Specter Custom'),
  (156, 'Dewbauchee', 'Vagner'),
  (157, 'Dinka', 'Akuma'),
  (158, 'Dinka', 'Blista'),
  (159, 'Dinka', 'Blista Compact'),
  (160, 'Dinka', 'Double-T'),
  (161, 'Dinka', 'Enduro'),
  (162, 'Dinka', 'Go-Go Monkey Blista'),
  (163, 'Dinka', 'Jester'),
  (164, 'Dinka', 'Jester RaceCar'),
  (165, 'Dinka', 'Jester Classic'),
  (166, 'Dinka', 'Thrust'),
  (167, 'Dinka', 'Vindicator'),
  (168, 'Dundreary', 'Landstalker'),
  (169, 'Dundreary', 'Regina'),
  (170, 'Dundreary', 'Stretch'),
  (171, 'Dundreary', 'Virgo Classic'),
  (172, 'Dundreary', 'Virgo Classic Custom'),
  (173, 'Emperor', 'ETR1'),
  (174, 'Emperor', 'Habanero'),
  (175, 'Enus', 'Cognoscenti'),
  (176, 'Enus', 'Cognoscenti Armored'),
  (177, 'Enus', 'Cognoscenti 55'),
  (178, 'Enus', 'Cognoscenti 55 Armored'),
  (179, 'Enus', 'Cognoscenti Cabrio'),
  (180, 'Enus', 'Huntley S'),
  (181, 'Enus', 'Stafford'),
  (182, 'Enus', 'Super Diamond'),
  (183, 'Enus', 'Windsor'),
  (184, 'Enus', 'Windsor Drop'),
  (185, 'Fathom', 'FQ 2'),
  (186, 'Gallivanter', 'Baller Classic'),
  (187, 'Gallivanter', 'Baller'),
  (188, 'Gallivanter', 'Baller LE'),
  (189, 'Gallivanter', 'Baller LE Armored'),
  (190, 'Gallivanter', 'Baller LE LWB'),
  (191, 'Gallivanter', 'Baller LE LWB Armored'),
  (192, 'Grotti', 'Bestia GTS'),
  (193, 'Grotti', 'Brioso R/A'),
  (194, 'Grotti', 'Carbonizzare'),
  (195, 'Grotti', 'Cheetah'),
  (196, 'Grotti', 'Cheetah Classic'),
  (197, 'Grotti', 'GT500'),
  (453, 'Grotti', 'Itali GTO'),
  (198, 'Grotti', 'Stinger'),
  (199, 'Grotti', 'Topless Stinger'),
  (200, 'Grotti', 'Stinger GT'),
  (201, 'Grotti', 'Turismo Classic'),
  (202, 'Grotti', 'Turismo R'),
  (203, 'Grotti', 'Vigilante'),
  (204, 'Grotti', 'Visione'),
  (205, 'Grotti', 'X80 Proto'),
  (206, 'Hijak', 'Khamelion'),
  (207, 'Hijak', 'Ruston'),
  (208, 'HVY', 'Airtug'),
  (209, 'HVY', 'APC Tank'),
  (210, 'HVY', 'Barracks'),
  (211, 'HVY', 'Barracks Semi'),
  (212, 'HVY', 'Biff'),
  (213, 'HVY', 'Chernobog'),
  (214, 'HVY', 'Crane'),
  (215, 'HVY', 'Cutter'),
  (216, 'HVY', 'Dock Handler'),
  (217, 'HVY', 'Docktug'),
  (218, 'HVY', 'Dozer'),
  (219, 'HVY', 'Dump'),
  (220, 'HVY', 'Forklift'),
  (221, 'HVY', 'Insurgent'),
  (222, 'HVY', 'Insurgent Pick-Up'),
  (223, 'HVY', 'Insurgent Pick-up Custom'),
  (224, 'HVY', 'Mixer Classic'),
  (225, 'HVY', 'Mixer'),
  (226, 'HVY', 'Nightshark'),
  (227, 'HVY', 'Ripley'),
  (228, 'HVY', 'Skylift'),
  (229, 'Imponte', 'Deluxo'),
  (230, 'Imponte', 'Duke O Death'),
  (231, 'Imponte', 'Dukes'),
  (232, 'Imponte', 'Nightshade'),
  (233, 'Imponte', 'Phoenix'),
  (234, 'Imponte', 'Ruiner'),
  (235, 'Imponte', 'Ruiner 2000'),
  (236, 'Invetero', 'Coquette'),
  (237, 'Invetero', 'Coquette Topless'),
  (238, 'Invetero', 'Coquette BlackFin'),
  (239, 'Invetero', 'Coquette Classic'),
  (240, 'Invetero', 'Coquette Classic Topless'),
  (241, 'Jacksheepe', 'Lawn Mower'),
  (242, 'JoBuilt', 'Hauler'),
  (243, 'JoBuilt', 'Hauler Custom'),
  (244, 'JoBuilt', 'Phantom'),
  (245, 'JoBuilt', 'Phantom Custom'),
  (246, 'JoBuilt', 'Phantom Wedge'),
  (247, 'JoBuilt', 'Rubble'),
  (248, 'JoBuilt', 'Trashmaster'),
  (249, 'Karin', '190z'),
  (250, 'Karin', 'Asterope'),
  (251, 'Karin', 'BeeJay XL'),
  (252, 'Karin', 'Dilettante'),
  (253, 'Karin', 'Dilettante Patrol Vehicle'),
  (254, 'Karin', 'Futo'),
  (255, 'Karin', 'Intruder'),
  (256, 'Karin', 'Kuruma'),
  (257, 'Karin', 'Kuruma Armored'),
  (258, 'Karin', 'Rebel'),
  (259, 'Karin', 'Sultan'),
  (260, 'Karin', 'Sultan RS'),
  (261, 'Karin', 'Technical'),
  (262, 'Karin', 'Technical Aqua'),
  (263, 'Karin', 'Technical Custom'),
  (264, 'Lampadati', 'Casco'),
  (265, 'Lampadati', 'Felon'),
  (266, 'Lampadati', 'Felon GT'),
  (267, 'Lampadati', 'Furore GT'),
  (268, 'Lampadati', 'Michelli GT'),
  (269, 'Lampadati', 'Pigalle'),
  (270, 'Lampadati', 'Tropos Rallye'),
  (271, 'Lampadati', 'Viseris'),
  (272, 'LCC', 'Avarus'),
  (273, 'LCC', 'Hexer'),
  (274, 'LCC', 'Innovation'),
  (275, 'LCC', 'Sanctus'),
  (276, 'Maibatsu', 'Manchez'),
  (277, 'Maibatsu', 'Mule'),
  (278, 'Maibatsu', 'Mule Armored'),
  (279, 'Maibatsu', 'Mule Custom'),
  (280, 'Maibatsu', 'Penumbra'),
  (281, 'Maibatsu', 'Sanchez'),
  (282, 'Maibatsu', 'Sanchez w/ Livery'),
  (283, 'Mammoth', 'Patriot'),
  (284, 'Mammoth', 'Patriot Stretch'),
  (285, 'Mammoth', 'Thruster Jetpack'),
  (286, 'MTL', 'Brickade'),
  (287, 'MTL', 'Dune'),
  (288, 'MTL', 'Fire Truck'),
  (289, 'MTL', 'Flatbed'),
  (290, 'MTL', 'Packer'),
  (291, 'MTL', 'Pounder'),
  (292, 'MTL', 'Pounder Custom'),
  (293, 'MTL', 'Wastelander'),
  (294, 'Nagasaki', 'BF400'),
  (295, 'Nagasaki', 'Blazer'),
  (296, 'Nagasaki', 'Blazer Aqua'),
  (297, 'Nagasaki', 'Blazer Lifeguard'),
  (298, 'Nagasaki', 'Caddy'),
  (299, 'Nagasaki', 'Bunker Caddy'),
  (300, 'Nagasaki', 'Caddy Utility'),
  (301, 'Nagasaki', 'Carbon RS'),
  (302, 'Nagasaki', 'Chimera'),
  (303, 'Nagasaki', 'Hot Rod Blazer'),
  (304, 'Nagasaki', 'Shotaro'),
  (305, 'Nagasaki', 'Street Blazer'),
  (306, 'Obey', '9F'),
  (307, 'Obey', '9F Cabrio'),
  (308, 'Obey', 'Omnis'),
  (309, 'Obey', 'Rocoto'),
  (310, 'Obey', 'Tailgater'),
  (311, 'Ocelot', 'Ardent'),
  (312, 'Ocelet', 'F620'),
  (313, 'Ocelet', 'Jackal'),
  (314, 'Ocelet', 'Lynx'),
  (315, 'Ocelet', 'Pariah'),
  (316, 'Ocelet', 'Penetrator'),
  (317, 'Ocelet', 'Stromberg'),
  (318, 'Ocelet', 'Swinger'),
  (319, 'Ocelet', 'XA-21'),
  (320, 'Overflod', 'Autarch'),
  (321, 'Overflod', 'Entity XF'),
  (322, 'Overflod', 'Entity XXR'),
  (323, 'Overflod', 'Tyrant'),
  (324, 'Pegassi', 'Bati 801'),
  (325, 'Pegassi', 'Bati 801RR'),
  (326, 'Pegassi', 'Esskey'),
  (327, 'Pegassi', 'Faggio'),
  (328, 'Pegassi', 'Faggio Mod'),
  (329, 'Pegassi', 'Faggio Sport'),
  (330, 'Pegassi', 'FCR 1000'),
  (331, 'Pegassi', 'FCR 1000 Custom'),
  (332, 'Pegassi', 'Infernus'),
  (333, 'Pegassi', 'Infernus Classic'),
  (334, 'Pegassi', 'Monroe'),
  (335, 'Pegassi', 'Oppressor'),
  (336, 'Pegassi', 'Oppressor MK II'),
  (337, 'Pegassi', 'Osiris'),
  (338, 'Pegassi', 'Reaper'),
  (339, 'Pegassi', 'Ruffian'),
  (340, 'Pegassi', 'Tempesta'),
  (341, 'Pegassi', 'Tezeract'),
  (342, 'Pegassi', 'Torero'),
  (451, 'Pegassi', 'Toros'),
  (343, 'Pegassi', 'Vacca'),
  (344, 'Pegassi', 'Vortex'),
  (345, 'Pegassi', 'Zentorno'),
  (346, 'Pfister', '811'),
  (347, 'Pfister', 'Comet'),
  (348, 'Pfister', 'Comet Retro Custom'),
  (349, 'Pfister', 'Comet Safari'),
  (350, 'Pfister', 'Comet SR'),
  (351, 'Pfister', 'Neon'),
  (457, 'Principe', 'Deveste Eight'),
  (352, 'Principe', 'Diabolus'),
  (353, 'Principe', 'Diabolus Custom'),
  (354, 'Principe', 'Lectro'),
  (355, 'Principe', 'Nemesis'),
  (356, 'Progen', 'GP1'),
  (357, 'Progen', 'Itali GTB'),
  (358, 'Progen', 'Itali GTB Custom'),
  (359, 'Progen', 'T20'),
  (360, 'Progen', 'Tyrus'),
  (361, 'RUNE', 'Cheburek'),
  (362, 'Schyster', 'Fusilade'),
  (456, 'Schyster', 'Deviant'),
  (363, 'Shitzu', 'Defiler'),
  (364, 'Shitzu', 'Hakuchou'),
  (365, 'Shitzu', 'Hakuchou Drag Bike'),
  (366, 'Shitzu', 'PCJ 600'),
  (367, 'Shitzu', 'Vader'),
  (368, 'Stanley', 'Fieldmaster'),
  (369, 'Stanley', 'Tractor'),
  (370, 'Truffade', 'Adder'),
  (371, 'Truffade', 'Nero'),
  (372, 'Truffade', 'Nero Custom'),
  (373, 'Truffade', 'Z-Type'),
  (374, 'Ubermacht', 'Oracle'),
  (375, 'Ubermacht', 'Oracle XS'),
  (376, 'Ubermacht', 'Revolter'),
  (377, 'Ubermacht', 'SC1'),
  (378, 'Ubermacht', 'Sentinel'),
  (379, 'Ubermacht', 'Sentinel Classic'),
  (380, 'Ubermacht', 'Sentinel XS'),
  (381, 'Ubermacht', 'Zion'),
  (382, 'Ubermacht', 'Zion Cabrio'),
  (383, 'Vapid', 'Benson'),
  (384, 'Vapid', 'Blade'),
  (385, 'Vapid', 'Bobcat XL'),
  (386, 'Vapid', 'Bullet'),
  (387, 'Vapid', 'Caracara'),
  (388, 'Vapid', 'Chino'),
  (389, 'Vapid', 'Chino Custom'),
  (390, 'Vapid', 'Clown Van'),
  (452, 'Vapid', 'Clique'),
  (391, 'Vapid', 'Contender'),
  (392, 'Vapid', 'Desert Raid'),
  (393, 'Vapid', 'Dominator'),
  (394, 'Vapid', 'Dominator GTX'),
  (395, 'Vapid', 'Ellie'),
  (396, 'Vapid', 'Flash GT'),
  (397, 'Vapid', 'FMJ'),
  (398, 'Vapid', 'GB200'),
  (399, 'Vapid', 'Guardian'),
  (400, 'Vapid', 'Hotknife'),
  (401, 'Vapid', 'Hustler'),
  (402, 'Vapid', 'Minivan'),
  (403, 'Vapid', 'Minivan Custom'),
  (404, 'Vapid', 'Peyote'),
  (405, 'Vapid', 'Pibwasser'),
  (406, 'Vapid', 'Police Cruiser'),
  (407, 'Vapid', 'Police Interceptor'),
  (408, 'Vapid', 'Police Prison Bus'),
  (409, 'Vapid', 'Radius'),
  (410, 'Vapid', 'Retinue'),
  (411, 'Vapid', 'Riata'),
  (412, 'Vapid', 'Sadler'),
  (413, 'Vapid', 'Sandking SWB'),
  (414, 'Vapid', 'Sandking XL'),
  (415, 'Vapid', 'Scrap Truck'),
  (416, 'Vapid', 'Sheriff Cruiser'),
  (417, 'Vapid', 'Slamvan'),
  (418, 'Vapid', 'Slamvan Custom'),
  (419, 'Vapid', 'Speedo'),
  (420, 'Vapid', 'Speedo Custom'),
  (421, 'Vapid', 'Stanier'),
  (422, 'Vapid', 'Taxi'),
  (423, 'Vapid', 'Liberator'),
  (424, 'Vapid', 'Tow Truck'),
  (425, 'Vapid', 'Large Tow Truck'),
  (426, 'Vapid', 'Trophy Truck'),
  (427, 'Vapid', 'Unmarked Cruiser'),
  (428, 'Vapid', 'Utility Truck'),
  (429, 'Vulcar', 'Fagaloa'),
  (430, 'Vulcar', 'Ingot'),
  (431, 'Vulcar', 'Warrener'),
  (432, 'Weeny', 'Issi'),
  (433, 'Weeny', 'Issi Classic'),
  (434, 'Western Motorcycle Company', 'Bagger'),
  (435, 'Western Motorcycle Company', 'Cliffhanger'),
  (436, 'Western Motorcycle Company', 'Daemon'),
  (437, 'Western Motorcycle Company', 'Daemon Custom'),
  (438, 'Western Motorcycle Company', 'Gargoyle'),
  (439, 'Western Motorcycle Company', 'Nightblade'),
  (440, 'Western Motorcycle Company', 'Police Bike'),
  (441, 'Western Motorcycle Company', 'Rat Bike'),
  (442, 'Western Motorcycle Company', 'Sovereign'),
  (443, 'Western Motorcycle Company', 'Wolfsbane'),
  (444, 'Western Motorcycle Company', 'Zombie Bobber'),
  (445, 'Western Motorcycle Company', 'Zombie Chopper'),
  (446, 'Willard', 'Faction'),
  (447, 'Willard', 'Faction Custom'),
  (448, 'Willard', 'Faction Custom Donk'),
  (449, 'Zirconium', 'Journey'),
  (450, 'Zirconium', 'Stratum');

--
-- Dumping data for table `weapons`
--

INSERT INTO `weapons` (`id`, `weapon_type`, `weapon_name`) VALUES
(1, 'Pistols', 'Pistol'),
(2, 'Pistols', 'Combat-Pistol'),
(3, 'Pistols', 'AP-Pistol'),
(4, 'Pistols', 'Pistol-.50'),
(5, 'Pistols', 'SNS-Pistol'),
(6, 'Pistols', 'Heavy-Pistol'),
(7, 'Pistols', 'Vintage-Pistol'),
(8, 'Sub-Machine-Guns', 'Micro-SMG'),
(9, 'Sub-Machine-Guns', 'SMG'),
(10, 'Sub-Machine-Guns', 'Assault-SMG'),
(11, 'Sub-Machine-Guns', 'Gusenberg-Sweeper'),
(12, 'Shotguns', 'Pump-Shotgun'),
(13, 'Shotguns', 'Sawed-off-Shotgun'),
(14, 'Shotguns', 'Assault-Shotgun'),
(15, 'Shotguns', 'Bullpup-Shotgun'),
(16, 'Shotguns', 'Heavy-Shotgun'),
(17, 'Shotguns', 'Musket'),
(18, 'Light-Machine-Guns', 'MG'),
(19, 'Light-Machine-Guns', 'Combat-MG'),
(20, 'Assault-Rifles', 'Assault-Rifle'),
(21, 'Assault-Rifles', 'Carbine-Rifle'),
(22, 'Assault-Rifles', 'Advanced-Rifle'),
(23, 'Assault-Rifles', 'Special-Carbine'),
(24, 'Assault-Rifles', 'Bullpup-Rifle'),
(25, 'Sniper-Rifles', 'Sniper-Rifle'),
(26, 'Sniper-Rifles', 'Heavy-Sniper'),
(27, 'Sniper-Rifles', 'Marksman-Rifle'),
(28, 'Heavy', 'RPG'),
(29, 'Heavy', 'Minigun'),
(30, 'Heavy', 'Homing-Launcher'),
(31, 'Heavy', 'Grenade-Launcher'),
(32, 'Heavy', 'Firework-Launcher');

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `identifier`, `admin_privilege`, `supervisor_privilege`, `password_reset`, `approved`, `suspend_reason`, `suspend_duration`) VALUES
(1, 'Default Admin', 'admin@test.com', '$2y$10$xHvogGcqQs8jhTPbFEDHJO9KWu2FCLgJ5XGxH.hHMA0BY1brgCkSG', '1A-1', 2, 1, 0, 1, NULL, NULL);
