SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone="+00:00";

CREATE TABLE `airlines_list`(
    `id` int(30) NOT NULL,
    `airlines` text NOT NULL,
    `logo_path` text NOT NULL
)ENGINE= InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `airlines_list` (`id`,`airlines`,`logo_path`) VALUES
(1, 'AirAsia', '1600999080_kisspng-flight-indonesia-airasia-airasia-japan-airline-tic-asia-5abad146966736.8321896415221927106161.jpg'),
(2, 'Philippine Airlines', '1600999200_Philippine-Airlines-Logo.jpg'),
(3, 'Cebu Pacific', '1600999200_43cada0008538e3c1a1f4675e5a7aabe.jpeg');
/*
(1,'Vistara','vistara.png'),
(2,'Indigo','indigo.png'),
(3,'Air India','air_india.png');

*/
CREATE TABLE `airport_list` (
    `id` int(30) NOT NULL,
    `airport` text NOT NULL,
    `location` text NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `airport_list` (`id`,`airport`,`location`) VALUES
(1,'Indira Gandhi International Airport','New Delhi'),
(2,'Chhatrapati Shivaji International Airport','Mumbai'),
(3,'Kempegowda International Airport','Bangalore'),
(4,'Rajiv Gandhi Airport','Hyderabad'),
(5,'Netaji Subhash Chandrabose International Airport','Kolkata'),
(6,'Chennai International Airport','Chennai');

CREATE TABLE `booked_flight` (
    `id` int(30) NOT NULL,
    `flight_id` int(30) NOT NULL,
    `name` text NOT NULL,
    `address` text NOT NULL,
    `contact` text NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `booked_flight` (`id`,`flight_id`,`name`,`address`,`contact`) VALUES
(2,3,'Seetha Ram','Sample Address','+91 78954 62354'),
(3,4,'Radha Krishna','Sample Address','+91 63541 85963');

CREATE TABLE `flight_list` (
  `id` int(30) NOT NULL,
  `airline_id` int(30) NOT NULL,
  `plane_no` text NOT NULL,
  `departure_airport_id` int(30) NOT NULL,
  `arrival_airport_id` int(30) NOT NULL,
  `departure_datetime` datetime NOT NULL,
  `arrival_datetime` datetime NOT NULL,
  `seats` int(10) NOT NULL DEFAULT 0,
  `price` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `flight_list` (`id`, `airline_id`, `plane_no`, `departure_airport_id`, `arrival_airport_id`, `departure_datetime`, `arrival_datetime`, `seats`, `price`, `date_created`) VALUES
(1, 1, 'GB623-14', 1, 3, '2023-06-23 04:00:00', '2023-06-23 10:00:00', 60, 7500, '2020-09-25 11:23:52'),
(2, 2, 'TIPS14-15', 1, 2, '2023-07-14 11:00:00', '2023-07-16 09:00:00', 60, 5000, '2020-09-25 11:46:12'),
(3, 3, 'CEB-1101', 5, 1, '2023-06-30 08:00:00', '2023-06-30 08:45:00', 60, 2500, '2020-09-25 11:57:31'),
(4, 3, 'CEB10023', 1, 5, '2023-10-07 01:00:00', '2023-10-07 01:45:00', 60, 2500, '2020-09-25 14:50:47');


CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Online Flight Booking System', 'info@sample.com', '+91 96585 42623', '1600998360_travel-cover.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;b style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Online FLight Booking &lt;/b&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;This page gives the details of Online Flight booking system and displays the different airlines offering their services along with the different flights');


CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = doctor,3=patient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 'admin123', 1),
(7, 0, 'Chandana', 'Chittoor', '+91 98743 45632', 'chandana12@gmail.com', 'cherry23', 3),
(9, 2, 'Tarun', 'Clinic Address', '+91 98554 55623', 'tarun@gmail.com', 'tarun55', 2),
(10, 3, 'RamCharan', 'Hyderabad', '+91 97555 52623', 'cherry@gmail.com', 'ram235', 2),
(11, 0, 'Kajal', 'Delhi', '+91 89564 44556', 'kajal@gmail.com', 'agarwal22', 3),
(15, 9, 'Rajamouli', 'Jubilee Hills', '+91 87456 57895', 'raja@gmail.com', 'mouli223', 2);


ALTER TABLE `airlines_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `airport_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `booked_flight`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `flight_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `airlines_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `airport_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `booked_flight`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `flight_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

