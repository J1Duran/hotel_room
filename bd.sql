-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-07-2017 a las 01:34:15
-- Versión del servidor: 5.7.18-0ubuntu0.17.04.1
-- Versión de PHP: 7.0.18-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'jesus', 'duran', 'duran22@gmail.com', '2017-07-04', '2017-07-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_08_04_170246_create_table_room_type', 1),
('2015_08_04_170250_create_table_room_calendar', 1),
('2015_08_04_170254_create_table_reservations', 1),
('2015_08_04_170329_create_table_reservation_nights', 1),
('2015_08_04_170359_create_table_customers', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservations`
--

CREATE TABLE `reservations` (
  `id` int(10) UNSIGNED NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `occupancy` int(11) NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `customer_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `reservations`
--

INSERT INTO `reservations` (`id`, `total_price`, `occupancy`, `checkin`, `checkout`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 60000.00, 1, '2017-07-03', '2017-07-06', '1', '2017-07-04', '2017-07-04'),
(2, 200000.00, 5, '2017-07-04', '2017-07-08', '1', '2017-07-04', '2017-07-04'),
(3, 50000.00, 2, '2017-07-04', '2017-07-06', '1', '2017-07-05', '2017-07-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_nights`
--

CREATE TABLE `reservation_nights` (
  `id` int(10) UNSIGNED NOT NULL,
  `rate` double(8,2) NOT NULL,
  `day` date NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `reservation_nights`
--

INSERT INTO `reservation_nights` (`id`, `rate`, `day`, `room_type_id`, `reservation_id`, `created_at`, `updated_at`) VALUES
(1, 20000.00, '2017-07-03', 1, 1, '2017-07-04', '2017-07-04'),
(2, 20000.00, '2017-07-04', 1, 1, '2017-07-04', '2017-07-04'),
(3, 20000.00, '2017-07-05', 1, 1, '2017-07-04', '2017-07-04'),
(4, 50000.00, '2017-07-04', 2, 2, '2017-07-04', '2017-07-04'),
(5, 50000.00, '2017-07-05', 2, 2, '2017-07-04', '2017-07-04'),
(6, 50000.00, '2017-07-06', 2, 2, '2017-07-04', '2017-07-04'),
(7, 50000.00, '2017-07-07', 2, 2, '2017-07-04', '2017-07-04'),
(8, 25000.00, '2017-07-04', 1, 3, '2017-07-05', '2017-07-05'),
(9, 25000.00, '2017-07-05', 1, 3, '2017-07-05', '2017-07-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `room_calendars`
--

CREATE TABLE `room_calendars` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `reservations` int(11) NOT NULL,
  `rate` double(8,2) NOT NULL,
  `day` date NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `room_calendars`
--

INSERT INTO `room_calendars` (`id`, `room_type_id`, `availability`, `reservations`, `rate`, `day`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 0, 25000.00, '2017-07-01', '2017-07-04', '2017-07-04'),
(2, 1, 5, 0, 25000.00, '2017-07-02', '2017-07-04', '2017-07-04'),
(3, 1, 4, 1, 25000.00, '2017-07-03', '2017-07-04', '2017-07-04'),
(4, 1, 3, 2, 25000.00, '2017-07-04', '2017-07-04', '2017-07-05'),
(5, 1, 3, 2, 25000.00, '2017-07-05', '2017-07-04', '2017-07-05'),
(6, 1, 5, 0, 25000.00, '2017-07-06', '2017-07-04', '2017-07-04'),
(7, 1, 5, 0, 25000.00, '2017-07-07', '2017-07-04', '2017-07-04'),
(8, 1, 5, 0, 25000.00, '2017-07-08', '2017-07-04', '2017-07-04'),
(9, 1, 5, 0, 25000.00, '2017-07-09', '2017-07-04', '2017-07-04'),
(10, 1, 5, 0, 25000.00, '2017-07-10', '2017-07-04', '2017-07-04'),
(11, 1, 5, 0, 25000.00, '2017-07-11', '2017-07-04', '2017-07-04'),
(12, 1, 5, 0, 25000.00, '2017-07-12', '2017-07-04', '2017-07-04'),
(13, 1, 5, 0, 25000.00, '2017-07-13', '2017-07-04', '2017-07-04'),
(14, 1, 5, 0, 25000.00, '2017-07-14', '2017-07-04', '2017-07-04'),
(15, 1, 5, 0, 25000.00, '2017-07-15', '2017-07-04', '2017-07-04'),
(16, 1, 5, 0, 25000.00, '2017-07-16', '2017-07-04', '2017-07-04'),
(17, 1, 5, 0, 25000.00, '2017-07-17', '2017-07-04', '2017-07-04'),
(18, 1, 5, 0, 25000.00, '2017-07-18', '2017-07-04', '2017-07-04'),
(19, 1, 5, 0, 25000.00, '2017-07-19', '2017-07-04', '2017-07-04'),
(20, 1, 5, 0, 25000.00, '2017-07-20', '2017-07-04', '2017-07-04'),
(21, 1, 5, 0, 25000.00, '2017-07-21', '2017-07-04', '2017-07-04'),
(22, 1, 5, 0, 25000.00, '2017-07-22', '2017-07-04', '2017-07-04'),
(23, 1, 5, 0, 25000.00, '2017-07-23', '2017-07-04', '2017-07-04'),
(24, 1, 5, 0, 25000.00, '2017-07-24', '2017-07-04', '2017-07-04'),
(25, 1, 5, 0, 25000.00, '2017-07-25', '2017-07-04', '2017-07-04'),
(26, 1, 5, 0, 25000.00, '2017-07-26', '2017-07-04', '2017-07-04'),
(27, 1, 5, 0, 25000.00, '2017-07-27', '2017-07-04', '2017-07-04'),
(28, 1, 5, 0, 25000.00, '2017-07-28', '2017-07-04', '2017-07-04'),
(29, 1, 5, 0, 25000.00, '2017-07-29', '2017-07-04', '2017-07-04'),
(30, 1, 5, 0, 25000.00, '2017-07-30', '2017-07-04', '2017-07-04'),
(31, 1, 5, 0, 25000.00, '2017-07-31', '2017-07-04', '2017-07-04'),
(32, 2, 50, 0, 50000.00, '2017-07-01', '2017-07-04', '2017-07-04'),
(33, 2, 50, 0, 50000.00, '2017-07-02', '2017-07-04', '2017-07-04'),
(34, 2, 50, 0, 50000.00, '2017-07-03', '2017-07-04', '2017-07-04'),
(35, 2, 49, 1, 50000.00, '2017-07-04', '2017-07-04', '2017-07-04'),
(36, 2, 49, 1, 50000.00, '2017-07-05', '2017-07-04', '2017-07-04'),
(37, 2, 49, 1, 50000.00, '2017-07-06', '2017-07-04', '2017-07-04'),
(38, 2, 49, 1, 50000.00, '2017-07-07', '2017-07-04', '2017-07-04'),
(39, 2, 50, 0, 50000.00, '2017-07-08', '2017-07-04', '2017-07-04'),
(40, 2, 50, 0, 50000.00, '2017-07-09', '2017-07-04', '2017-07-04'),
(41, 2, 50, 0, 50000.00, '2017-07-10', '2017-07-04', '2017-07-04'),
(42, 2, 50, 0, 50000.00, '2017-07-11', '2017-07-04', '2017-07-04'),
(43, 2, 50, 0, 50000.00, '2017-07-12', '2017-07-04', '2017-07-04'),
(44, 2, 50, 0, 50000.00, '2017-07-13', '2017-07-04', '2017-07-04'),
(45, 2, 50, 0, 50000.00, '2017-07-14', '2017-07-04', '2017-07-04'),
(46, 2, 50, 0, 50000.00, '2017-07-15', '2017-07-04', '2017-07-04'),
(47, 2, 50, 0, 50000.00, '2017-07-16', '2017-07-04', '2017-07-04'),
(48, 2, 50, 0, 50000.00, '2017-07-17', '2017-07-04', '2017-07-04'),
(49, 2, 50, 0, 50000.00, '2017-07-18', '2017-07-04', '2017-07-04'),
(50, 2, 50, 0, 50000.00, '2017-07-19', '2017-07-04', '2017-07-04'),
(51, 2, 50, 0, 50000.00, '2017-07-20', '2017-07-04', '2017-07-04'),
(52, 2, 50, 0, 50000.00, '2017-07-21', '2017-07-04', '2017-07-04'),
(53, 2, 50, 0, 50000.00, '2017-07-22', '2017-07-04', '2017-07-04'),
(54, 2, 50, 0, 50000.00, '2017-07-23', '2017-07-04', '2017-07-04'),
(55, 2, 50, 0, 50000.00, '2017-07-24', '2017-07-04', '2017-07-04'),
(56, 2, 50, 0, 50000.00, '2017-07-25', '2017-07-04', '2017-07-04'),
(57, 2, 50, 0, 50000.00, '2017-07-26', '2017-07-04', '2017-07-04'),
(58, 2, 50, 0, 50000.00, '2017-07-27', '2017-07-04', '2017-07-04'),
(59, 2, 50, 0, 50000.00, '2017-07-28', '2017-07-04', '2017-07-04'),
(60, 2, 50, 0, 50000.00, '2017-07-29', '2017-07-04', '2017-07-04'),
(61, 2, 50, 0, 50000.00, '2017-07-30', '2017-07-04', '2017-07-04'),
(62, 2, 50, 0, 50000.00, '2017-07-31', '2017-07-04', '2017-07-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `room_types`
--

CREATE TABLE `room_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `base_price` double(8,2) NOT NULL,
  `base_availability` int(11) NOT NULL,
  `max_occupancy` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `room_types`
--

INSERT INTO `room_types` (`id`, `name`, `short_name`, `base_price`, `base_availability`, `max_occupancy`, `created_at`, `updated_at`) VALUES
(1, 'Prueba', 'Delux', 20000.00, 5, 2, '2017-07-04', '2017-07-04'),
(2, 'Orcar Suite', 'Short', 20.00, 50, 5, '2017-07-04', '2017-07-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservation_nights`
--
ALTER TABLE `reservation_nights`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `room_calendars`
--
ALTER TABLE `room_calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `reservation_nights`
--
ALTER TABLE `reservation_nights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `room_calendars`
--
ALTER TABLE `room_calendars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT de la tabla `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;