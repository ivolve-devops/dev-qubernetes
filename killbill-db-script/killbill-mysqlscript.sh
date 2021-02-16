#!/bin/bash

echo "SET GLOBAL binlog_format = 'ROW';" > 000_mysql_config.sql

echo 'CREATE DATABASE IF NOT EXISTS `killbill`;' > 010_killbill.sql
echo 'USE killbill;' >> 010_killbill.sql

echo 'CREATE DATABASE IF NOT EXISTS `kaui`;' > 020_kaui.sql
echo 'USE kaui;' >> 020_kaui.sql
# Install the Kill Bill DDL
wget http://docs.killbill.io/latest/ddl.sql -O - >> 010_killbill.sql
# Install the Kaui DDL (point to latest, rarely changes)
wget https://raw.githubusercontent.com/killbill/killbill-admin-ui/master/db/ddl.sql -O - >> 020_kaui.sql
# Install the DDL of the most popular plugins (point to latest, rarely changes)
wget https://raw.githubusercontent.com/killbill/killbill-stripe-plugin/master/src/main/resources/ddl.sql -O - >> 010_killbill.sql 
wget https://raw.githubusercontent.com/killbill/killbill-analytics-plugin/master/src/main/resources/org/killbill/billing/plugin/analytics/ddl.sql -O - >> 010_killbill.sql 
wget https://raw.githubusercontent.com/killbill/killbill-adyen-plugin/master/src/main/resources/ddl.sql -O - >> 010_killbill.sql
echo "INSERT INTO kaui.kaui_allowed_users (kb_username, description, created_at, updated_at) values ('admin', 'super admin', NOW(), NOW());" > 021_kaui_admin.sql
