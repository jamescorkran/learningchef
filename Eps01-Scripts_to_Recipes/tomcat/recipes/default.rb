#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# execute "sudo yum install java-1.7.0-openjdk-devel"
package 'java-1.7.0-openjdk-devel'

# execute "sudo groupadd tomcat"
group 'tomcat'

# execute "sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat"
user 'tomcat' do
	manage_home false
	shell '/bin/nologin'
	group 'tomcat'
	home '/opt/tomcat'
end