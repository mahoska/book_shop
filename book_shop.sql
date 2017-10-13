-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 13 2017 г., 11:01
-- Версия сервера: 10.1.19-MariaDB
-- Версия PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `book_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `surname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id`, `name`, `surname`) VALUES
(1, 'Александр', 'Грин'),
(2, 'Достоевский', 'Фёдор'),
(3, 'Роджер', 'Желязны'),
(4, 'Патрик', 'Зюскинд'),
(5, 'Франц', 'Кафка'),
(6, 'Сергей', 'Лукьяненко'),
(7, 'Николай', 'Носов'),
(8, 'Эрнест', 'Хемингуэй'),
(9, 'Джон', 'Толкин');

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` text,
  `discount` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `name`, `price`, `description`, `discount`) VALUES
(1, 'Алые паруса', 135, '«А́лые паруса́» — повесть-феерия Александра Грина о непоколебимой вере и всепобеждающей, возвышенной мечте, о том, что каждый может сделать для близкого чудо.', 10),
(2, 'Братья Карамазовы', 200.25, NULL, 0),
(3, 'Средний пол', 450.8, NULL, 0),
(4, 'Хроники Амбера', 320.25, 'Хроники Амбера» (англ. The Chronicles of Amber) — фэнтезийная серия из десяти романов знаменитого американского писателя-фантаста Роджера Желязны. Серия делится на два тома по пять частей в каждом, в первом томе главным действующим лицом является Корвин, во втором — его сын Мерлин. В различных переводах Амбер (англ. amber — янтарь) называется также «Эмбер», «Янтарь», «Янтарное королевство»', 0),
(5, 'Парфюмер', 400, '«История одного убийцы» рассказывает о жизни человека, чьи «гениальность и феноменальное тщеславие ограничивались сферой, не оставляющей следов в истории, — летучим царством запахов».', 0),
(6, 'Процесс', 305.25, NULL, 0),
(7, 'Ночной дозор', 375, 'Улицы ночного города несут опасность – именно в это время на охоту отправляются Иные: вампиры, маги, оборотни и другая нечисть. Они опаснее самых жестоких преступников. Ведь справиться с ними очень сложно.', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `book_author`
--

CREATE TABLE `book_author` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book_author`
--

INSERT INTO `book_author` (`book_id`, `author_id`) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `book_ganre`
--

CREATE TABLE `book_ganre` (
  `book_id` int(11) NOT NULL,
  `ganre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `count` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `surname` varchar(30) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `disable` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fullinfoorder`
--

CREATE TABLE `fullinfoorder` (
  `order_id` int(11) NOT NULL,
  `book_price` double NOT NULL,
  `book_id` int(11) NOT NULL,
  `count` smallint(6) NOT NULL,
  `discount_book` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ganre`
--

CREATE TABLE `ganre` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ganre`
--

INSERT INTO `ganre` (`id`, `name`) VALUES
(1, 'детские'),
(2, 'классика'),
(3, 'приключения'),
(4, 'рассказы'),
(5, 'поэзия'),
(6, 'повести'),
(7, 'роман'),
(8, 'фентези');

-- --------------------------------------------------------

--
-- Структура таблицы `historybook`
--

CREATE TABLE `historybook` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `authors` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_book`
--

CREATE TABLE `order_book` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `payment_id` tinyint(4) NOT NULL,
  `status_id` tinyint(4) NOT NULL,
  `skidka_client` float NOT NULL DEFAULT '0',
  `date_order_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `statusorder`
--

CREATE TABLE `statusorder` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `book_author`
--
ALTER TABLE `book_author`
  ADD KEY `BookAuthor_fk0` (`book_id`),
  ADD KEY `BookAuthor_fk1` (`author_id`);

--
-- Индексы таблицы `book_ganre`
--
ALTER TABLE `book_ganre`
  ADD KEY `BookGanre_fk0` (`book_id`),
  ADD KEY `BookGanre_fk1` (`ganre_id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Bin_fk0` (`client_id`),
  ADD KEY `Bin_fk1` (`book_id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `fullinfoorder`
--
ALTER TABLE `fullinfoorder`
  ADD KEY `FullInfoOrder_fk0` (`order_id`),
  ADD KEY `FullInfoOrder_fk1` (`book_id`);

--
-- Индексы таблицы `ganre`
--
ALTER TABLE `ganre`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_book`
--
ALTER TABLE `order_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_fk0` (`client_id`),
  ADD KEY `Order_fk1` (`payment_id`),
  ADD KEY `Order_fk2` (`status_id`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `statusorder`
--
ALTER TABLE `statusorder`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `ganre`
--
ALTER TABLE `ganre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `order_book`
--
ALTER TABLE `order_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `statusorder`
--
ALTER TABLE `statusorder`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `BookAuthor_fk0` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `BookAuthor_fk1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Ограничения внешнего ключа таблицы `book_ganre`
--
ALTER TABLE `book_ganre`
  ADD CONSTRAINT `BookGanre_fk0` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `BookGanre_fk1` FOREIGN KEY (`ganre_id`) REFERENCES `ganre` (`id`);

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `Bin_fk0` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `Bin_fk1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Ограничения внешнего ключа таблицы `fullinfoorder`
--
ALTER TABLE `fullinfoorder`
  ADD CONSTRAINT `FullInfoOrder_fk0` FOREIGN KEY (`order_id`) REFERENCES `order_book` (`id`),
  ADD CONSTRAINT `FullInfoOrder_fk1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_book`
--
ALTER TABLE `order_book`
  ADD CONSTRAINT `Order_fk0` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `Order_fk1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `Order_fk2` FOREIGN KEY (`status_id`) REFERENCES `statusorder` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
