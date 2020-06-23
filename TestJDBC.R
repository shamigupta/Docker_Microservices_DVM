library(RJDBC)
library(rJava)


.jaddClassPath( "\\jdbc\\dv-jdbc-3.1.jar" )



#Then we need to load the DB2 JDBC driver:

#driver <- JDBC("com.ddtek.jdbc.shadow.ShadowDriver","com.rs.jdbc.dv.DvDriver",Sys.glob("\\jdbc\\dv-jdbc-3.1.jar"))
driver <- JDBC("com.rs.jdbc.dv.DvDriver",Sys.glob("\\jdbc\\*.jar"))

#At this point we can establish a database connection:

conn = dbConnect(driver,"jdbc:rs:dv://192.86.33.143:1200;DatabaseType=DVS; user=ashissa, password=73e613cc896030ac3e  ", user="ashissa", password="73e613cc896030ac3e")
#conn = dbConnect(driver,"jdbc:rs:dv://10.149.60.157:1200;DatabaseType=DVS; user=ibmuser, password=sys1  ", user="ibmuser", password="sys1")




query1 = "SELECT A.DEPTNO, COUNT(B.EMPNO) AS NUM_EMPS FROM VDEPARTMENT A INNER JOIN VEMPLOYEE B ON A.DEPTNO=B.WORKDEPT GROUP BY A.DEPTNO"
query2 = "SELECT DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION FROM VDEPARTMENT "
query3 = "SELECT * FROM JKEBANK"
query4 = "SELECT * FROM VEMPLOYEE"
query5 = "SELECT  CLAIMNUMBER FROM VCLAIM WHERE OBSERVATIONS = ''  ORDER BY CLAIMDATE ASC"

#query6 = "SELECT * FROM VCUSTOMER WHERE LASTNAME = 'Gupta' "

result <- dbFetch(dbSendQuery(conn, query5), -1)
