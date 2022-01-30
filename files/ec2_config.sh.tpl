#!/bin/bash

PATH_WEB_PAGES=/opt/project

mkdir $PATH_WEB_PAGES

# Generate template index.html
tee $PATH_WEB_PAGES/index.html << EQT
<!DOCTYPE html>
    <head>
        <title>Task - index</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
        <h1>Welcome to server!</h1>
        <h1>Server status</h1>
    <table>
        <tr>
            <td>Date_creation</td>
            <td>${date_creation}</td>
        </tr>
        <tr>
            <td>OS_type</td>
            <td>${os_type}</td>
        </tr>
        <tr>
            <td>Your_First_Name</td>
            <td>${first_name}</td>
        </tr>
        <tr>
            <td>Your_Last_Name</td>
            <td>${last_name}</td>
        </tr>
        <tr>
            <td>AWS_Account_ID</td>
            <td>${account_id}</td>
        </tr>
    </table>
  </body>
</html>
EQT


# Start web server with apache2

docker run -dit --name my-apache-app -p 80:80 -v $PATH_WEB_PAGES:/usr/local/apache2/htdocs/ httpd:2.4
