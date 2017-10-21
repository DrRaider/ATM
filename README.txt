Used those websites to setup:
https://programmerscuriosity.com/2016/09/27/simple-jersey-example-with-intellij-idea-ultimate-and-tomcat/ 
https://gist.github.com/bluekvirus/29789fe8080e31d84f921241311e567d#file-jersey-hibernate-mariadb-tomcat-md

create a database named "WebService" (user : root, password : <empty>)
and the table "users" with :

CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);


