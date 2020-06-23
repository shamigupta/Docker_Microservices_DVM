library(RJDBC)
library(rJava)


.jaddClassPath( "\\jdbc\\dv-jdbc-3.1.jar" )



#Then we need to load the DB2 JDBC driver:

#driver <- JDBC("com.ddtek.jdbc.shadow.ShadowDriver","com.rs.jdbc.dv.DvDriver",Sys.glob("\\jdbc\\dv-jdbc-3.1.jar"))
driver <- JDBC("com.rs.jdbc.dv.DvDriver",Sys.glob("\\jdbc\\*.jar"))

#At this point we can establish a database connection:

conn = dbConnect(driver,"jdbc:rs:dv://192.86.33.48:1200;DatabaseType=DVS; user=ashissa, password=73e613cc896030ac3e  ", user="ashissa", password="73e613cc896030ac3e")

query1 = "SELECT A.DEPTNO, COUNT(B.EMPNO) AS NUM_EMPS FROM VDEPARTMENT A INNER JOIN VEMPLOYEE B ON A.DEPTNO=B.WORKDEPT GROUP BY A.DEPTNO"
query2 = "SELECT DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION FROM VDEPARTMENT "
query3 = "SELECT * FROM JKEBANK"
query4 = "SELECT * FROM VEMPLOYEE"
q5 = "SELECT * FROM  VEMPLOYEE LIMIT 1"


result <- dbFetch(dbSendQuery(conn, q5), -1)
