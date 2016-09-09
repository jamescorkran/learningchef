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

# execute 'wget http://apache.mirrors.pair.com/tomcat/tomcat-8/v8.0.37/bin/apache-tomcat-8.0.37.tar.gz'
remote_file 'apache-tomcat-8.0.37.tar.gz' do
	source 'http://apache.mirrors.pair.com/tomcat/tomcat-8/v8.0.37/bin/apache-tomcat-8.0.37.tar.gz'
end

# execute sudo mkdir /opt/tomcat
directory '/opt/tomcat' do
	# action :create
end

# unzip the tar file
execute 'tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'