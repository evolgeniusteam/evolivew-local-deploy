## instructions for deploying [evolview] (http://www.evolgenius.info/evolview) to a local computer

EvolView is an easy-to-use online tool for displaying, managing and customizing phylogenetic trees.

Here is a very short tutorial for deploying Evolview to your local computer.

First, you may have to install the following softwares (all are free and cross-platform):
 * Tomcat 7+
 * MySQL 5.7.9+
 * JAVA 1.8+

#### 1. install Tomcat


For Mac users please see [instructions here](https://wolfpaulus.com/journal/mac/tomcat8/).

For Windows users, see [here](https://www.mulesoft.com/tcat/tomcat-windows)

for Linux users, depending on your distribution, see the following links:
* for [Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-7-on-ubuntu-14-04-via-apt-get)
* for [Debian](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-apache-tomcat-on-a-debian-server)
* for [Redhat/CentOS](https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-7-on-centos-7-via-yum)

At the end, if the installation is successful, open the following link in a browser:
```
## -- if access from the computer where Tomcat is installed:
http://127.0.0.1:8080
## -- or access the server from another computer
http://server_IP_address:8080
```

and you will see a page that says "It works!", in addition to other information.

#### 2. install MySQL
* for [Ubuntu users](https://help.ubuntu.com/lts/serverguide/mysql.html)
* for [Debian users](http://www.cyberciti.biz/faq/howto-debian-mysql-install-apt-get-commands/)
* for [Redhat users](http://www.cyberciti.biz/faq/how-to-install-mysql-under-rhel/)
* for [CentOS users](https://www.linode.com/docs/databases/mysql/how-to-install-mysql-on-centos-6)
* for [MacOS users](http://simonmerrick.co.uk/blog/installing-mysql-on-mac-os-x-el-capitan-10-11)
* for [Windows users](https://dev.mysql.com/tech-resources/articles/mysql-installer-for-windows.html)

#### 3. download and deploy Evolview
##### 3.1 download two files from the 'downloads/' folder:
```
## 1. table schema file
eviewer_ver1.schema.sql
## 2. compiled and packed codes
evolview.war
```

##### 3.2 connect to your MySQL server

On Windows, I recommend MySQL Workbench for MySQL connection.

On Mac and Linux, enter the following command in Terminal to connect to MySQL:
```
mysql -u root -p
```

##### 3.3 prepare the database

3.3.1 create a new database for Evolview, and load the database schema
```
## run this in mysql
create database eviewer_ver1;
use eviewer_ver1;

## -- for linux / mac users
source /path/to/eviewer_ver1.schema.sql

## -- for windows users
source C:/path/to/eviewer_ver1.schema.sql

```

3.3.2 create a new user, and grant some privileges
```
##-- create a new user 'evuser', set password to 'evuserpass'
## -- you may need root privileges to do it
create user `evuser`@`localhost` identified by 'evuserpass';
grant all on eviewer_ver1.* to `evuser`@`localhost`;
```

##### 3.4 deploy Evolview

On Mac OS, if you installed Tomcat as instructed, you can copy the downloaded .war file to to the 'webapp/' folder:
```
sudo cp /path/to/evolview.war /Library/Tomcat/
```

Wait a few minutes for Tomcat to unzip the app, then open the following URL in your browser (Google chrome is recommended; firefox also works):
```
http://localhost:8080/evolview
```

The familiar login page will appear!!

For Linux users, the 'webapps/' folder can often be found at : /var/lib/tomcat7/webappps/:
```
## if tomcat7 is installed; change the version number
## if you have other version of tomcat installed.
cp /path/to/evolview.ar /var/lib/tomcat7/webapps/
```

Enjoy!

*Note:*
 * please go check our ["what's new" page](https://github.com/evolgeniusteam/EvolviewDocumentation/blob/master/whatisnew/WhatsNew.md) regularly for new features and update your version of Evolview accordingly
 * please contact us (evolgenius.team@gmail.com) to report problems and send us your comments, corrections, suggestions and feature requests
 * attach your tree and datasets to your email if necessary
