#
# Cookbook Name:: psiprobe
# Recipe:: default
#
# Copyright 2012, FLEETING CLOUDS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# include recipe "tomcat::server"

def find(file_name, key)
	if not File.exist?(file_name) then return "CAUTION : version file not found." end

	open(file_name) do |sf|
		while line = sf.gets
			break if not line.index(key).nil?
  	end
		if line.nil? then return "CAUTION : no version record found in version file" end
		return line [  key.length + line.index(key)..-1  ]
	end
end

TOMCAT_HOME="#{node[:psiprobe][:tomcat_home]}"
SUCCESS_FILE="version.properties"

SUCCESS_FILE_PATH=TOMCAT_HOME + "/webapps/probe/WEB-INF/" + SUCCESS_FILE
SEARCH_KEY='probe.version='

$version=find(SUCCESS_FILE_PATH, SEARCH_KEY)

remote_file "psi_probe_pkg" do
  path "#{Chef::Config['file_cache_path']}/probe-#{node[:psiprobe][:version]}.zip"
  source "#{node[:psiprobe][:mirror]}/probe-#{node[:psiprobe][:version]}.zip"
  mode "0644"
  not_if do File.exist?("#{Chef::Config['file_cache_path']}/probe-#{node[:psiprobe][:version]}.zip")
  end
end

bash "unzip-psiprobe" do
  code <<-EOH
  cd #{node[:psiprobe][:tomcat_home]}/webapps
  rm -f probe.war
  rm -f Changelog.txt
  unzip "#{Chef::Config['file_cache_path']}/probe-#{node[:psiprobe][:version]}.zip"
  EOH
  not_if do $version .eql? "#{node[:psiprobe][:version]}"
  end
end

ruby_block "how_did_it_go" do
  block do
		if $version .eql? "#{node[:psiprobe][:version]}" 
			puts "* Did nothing. Version " + $version + " seemed to be installed already. * "
		end
		if not File.exist?("#{node[:psiprobe][:tomcat_home]}") 
			puts "* * * Could not install Psi Probe since TomCat is not installed! * * * "
		end
  end
  action :create
end



