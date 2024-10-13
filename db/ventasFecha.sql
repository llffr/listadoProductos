use Northwind
SET LANGUAGE ESPA�OL
SET DATEFORMAT DMY

--alter
alter
CREATE PROCEDURE PA_VENTASFECHA
@F1 DATE, @F2 DATE
AS
BEGIN

SELECT O.ORDERID,C.COMPANYNAME,CONCAT(E.FIRSTNAME, ' ',E.LASTNAME) AS EMPLEADO,
YEAR(ORDERDATE) AS A�O,PRODUCTID,UNITPRICE,QUANTITY
FROM ORDERS O INNER JOIN [ORDER DETAILS] OD ON
O.ORDERID=OD.ORDERID INNER JOIN CUSTOMERS C ON 
O.CUSTOMERID=C.CUSTOMERID INNER JOIN EMPLOYEES E ON
O.EMPLOYEEID=E.EMPLOYEEID WHERE O.ORDERDATE BETWEEN @F1 AND @F2
ORDER BY O.ORDERDATE ASC
END

--VERIFICAR
EXEC PA_VENTASFECHA '01/07/1996', '30/07/1996'
EXEC PA_VENTASFECHA '04/08/1996', '30/09/1996'
--SELECT ORDERDATE FROM ORDERS


-- Crear procedimiento
CREATE PROCEDURE PA_EMPLEADOS_CIUDAD_PAIS
AS
BEGIN
    SELECT E.EMPLOYEEID, CONCAT(E.FIRSTNAME, ' ', E.LASTNAME) AS EMPLEADO, 
           E.CITY AS CIUDAD, E.COUNTRY AS PAIS
    FROM EMPLOYEES E
    ORDER BY E.COUNTRY, E.CITY
END

-- Verificar
EXEC PA_EMPLEADOS_CIUDAD_PAIS
