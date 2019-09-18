
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_211")
install.packages("rJava")
install.packages("RJDBC")

library(rJava)
library(RJDBC)

drv <- JDBC("oracle.jdbc.driver.OracleDriver","C:/app/CPB02GameN/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar")

conn<- dbConnect(drv,
              "jdbc:oracle:thin:localhost:1512:orcl",
              "SCOTT","tiger")

query <- "select * from emp"

result <- dbGetQuery(conn,query)

head(result)

dbDisconnect(conn)

# dbListTables(conn)
