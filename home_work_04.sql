-- 1. Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA

SELECT MARK, color, COUNT(color) AS 'Количество машин' FROM AUTO
WHERE MARK = 'LADA'
GROUP BY color, mark 
UNION SELECT MARK, color, COUNT(color) AS 'Количество машин' FROM AUTO
WHERE MARK = 'BMW'
GROUP BY color, mark;

-- 2. Вывести на экран марку авто(количество) и количество авто не этой марки.

select * from auto;

SELECT MARK, COUNT(MARK) AS Mark_count,
(SELECT COUNT(*) FROM auto) - COUNT(mark) as other_marks
FROM auto
GROUP BY mark;

-- 3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

create table test_a (id INT, test varchar(10));
create table test_b (id INT);

insert into test_a(id, test) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

insert into test_b(id) values
(10),
(30),
(50);

SELECT * FROM test_a
LEFT JOIN test_b 
ON test_b.id = test_a.id 
WHERE test_b.id IS NULL;


