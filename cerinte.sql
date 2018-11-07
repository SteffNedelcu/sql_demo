-- #1 Afiseaza pentru fiecare comanda: id-ul comenzii, numele, prenumele si email-ul cumparatorului si data comenzii
-- | id | first_name | last_name | email | date_order |

-- #2 Afiseaza toate comenzile din 2017
-- A Se folosi functia COUNT()
-- | total_comenzi |


-- #3 Afiseaza numarul total al comenzilor valide
-- A Se folosi functia COUNT()
-- | total_comenzi |


-- #4 Afiseaza numarul total de comenzi pe luna 
-- A se folosi Group By
-- Si functia MONTH() - returneaza luna dintr-o data pe care o dai ca argument

-- | luna | nr_comenzi |


-- #5 Sa se afiseze cate produse sunt comandate in fiecare comanda
--  A se folosi GROUP BY si COUNT()
-- | id | date_order |  nr_products |


-- #6 Sa se slecteze cele mai populare 3 produse dupa numarul de comenzi
--  A se folosi GROUP BY si COUNT()
-- | id_product | nr_comenzi |  name |


-- #7 Sa se afiseze TOP 10 clienti in functie de numarul de comenzi
-- | id | first_name | last_name  | nr_orders |


-- #8 Sa se afiseze suma totala a comenzilor valide (status=1) din anul 2018
-- | id | order_value |

-- #9 Sa se afiseze pentru un utilizator ( cautat dupa id, ex: 149) toate prousele comandate si cantitatea
-- | name | total_quantity |

-- #10 Dezactiveaza toate comenzile (status=0) clientii barbati
-- Trebuie folosita o subcerere si conditia IN in clauza WHERE


