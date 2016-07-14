#!/bin/bash

yum install -y httpd wget unzip git
chkconfig httpd on

cd /tmp
git clone https://github.com/nullpop/terraform-hands-on-html.git
cd terraform-hands-on-html
mv * /var/www/html/
