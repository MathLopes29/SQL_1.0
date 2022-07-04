-- Order By --
SELECT*
FROM person.Person;
ORDER BY FirstName asc

-- Count --
SELECT count(lastname)
FROM person.Person
WHERE LastName like'p%'

-- Distinct --
SELECT distinct(city)
FROM person.Address

-- Between --
SELECT COUNT(*)
FROM Production.Product
WHERE color = 'red'
AND ListPrice BETWEEN 500 AND 100