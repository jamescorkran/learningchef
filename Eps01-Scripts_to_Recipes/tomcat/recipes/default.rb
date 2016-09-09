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
	group 'tomcat'
end

# unzip the tar file, TODO: NOT DESIRED STATE
execute 'tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'

# TODO: NOT DESIRED STATE
execute 'chgrp -R tomcat conf'

# execute sudo chmod g+rwx conf
directory '/opt/tomcat/conf' do
	mode '0070'
end

# TODO: NOT DESIRED STATE
execute 'chmod g+r conf/*'

# TODO: NOT DESIRED STATE
execute 'chown -R tomcat webapps/ work/ temp/ logs/'