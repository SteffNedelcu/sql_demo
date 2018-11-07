-- #1 Afiseaza pentru fiecare comanda numele si email-ul cumoaratorului si data comenzii
SELECT ord.id, c.first_name, c.last_name,  c.email, ord.date_order
FROM `orders` as ord 
LEFT JOIN `customers` as c ON (ord.`id_customer` = c.`id`)    
WHERE 1


-- #2 Afiseaza toate comenzile din 2017

SELECT COUNT(`id`) as total_comenzi
FROM `orders` 
WHERE `date_order`>'2017-01-01' AND `date_order`<'2017-12-31'

-- #3 Afiseaza numarul total al comenzilor valide
-- A Se folosi functia COUNT()
SELECT COUNT(`id`) as total_comenzi
FROM `orders` 
WHERE `status`='1'

-- #4 Afiseaza numarul total de comenzi pe luna
-- A se folosi Group By
-- Si functia MONTH() - imi returneaza luna dintr-o data
SELECT  MONTH(date_order), COUNT(`id`) as nr_comenzi 
FROM `orders` 
WHERE `date_order`>'2018-01-01' AND `date_order`<'2018-12-31'
GROUP BY MONTH(date_order)

-- #5 Sa se afiseze cate produse sunt comandate in fiecare comanda
-- Folosim GROUP BY le grupezi dupa un criteriu, in cazul asta id-ul comenzii.
-- Cu COUNT() numar cate produse apartin fiecarei comenzi
-- Folosesc abrevieri pentru a usura scrierea query-ului

SELECT ord.`id`, ord.`date_order` ,COUNT(op.`id_product`) as nr_products
FROM `orders` as ord
LEFT JOIN `orders_products` as op ON (ord.`id` = op.`id_order`)
WHERE 1
GROUP BY ord.`id`  
ORDER BY `nr_products`  DESC

-- #6 Sa se slecteze cele mai populare 3 produse dupa numarul de comenzi
-- Folosim GROUP BY le grupezi dupa un criteriu, in cazul asta id-ul produsului.
-- Cu COUNT() numar cate comenzi sunt pentru fiecare produs
-- Folosesc abrevieri pentru a usura scrierea query-ului
SELECT op.`id_product`,COUNT(op.`id_order`) as nr_comenzi, p.`name` 
FROM `orders_products` as op
LEFT JOIN `products` as p ON (p.`id` = op.`id_product`)
WHERE 1
GROUP BY `id_product`  
ORDER BY `nr_comenzi`  DESC
LIMIT 3

-- #7 Sa se afiseze TOP 10 clienti in functie de numarul de comenzi

SELECT c.id, c.first_name, c.last_name, COUNT(ord.id) as nr_orders
FROM `orders` as ord 
LEFT JOIN `customers` as c ON (ord.`id_customer` = c.`id`)    
WHERE 1
GROUP BY c.id
ORDER BY nr_orders DESC
LIMIT 10

-- #8 Sa se afiseze suma totala a comenzilor valide (status=1) din anul 2018
-- pretul_total al unui produs este pret * cantitate, deci trebuie sa adunam pretul_total al produselor dintr-o comanda
-- order_value este suma totala cosului


SELECT ord.`id`, SUM(p.price*op.quantity) as order_value
FROM `orders` as ord
LEFT JOIN `orders_products` as op ON (ord.`id` = op.`id_order`)
LEFT JOIN `products` as p ON (p.`id` = op.`id_product`)
WHERE ord.`date_order`>'2018-01-01' AND ord.`date_order`<'2018-12-31'
GROUP BY ord.`id`  
ORDER BY `ord`.`id` ASC

-- #9 Sa se afiseze pentru un utilizator ( cautat dupa id, ex: 149) toate prousele comandate si cantitatea

SELECT p.name, SUM(op.quantity) as total_quantity
FROM `orders_products` AS op
LEFT JOIN `products` as p ON (p.id = op.id_product)
LEFT JOIN `orders` as ord ON (ord.id = op.id_order)
LEFT JOIN `customers` as c ON (ord.id_customer = c.id)
WHERE c.id = '149'
GROUP BY op.id_product