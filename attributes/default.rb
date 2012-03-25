#
# Cookbook Name:: psiprobe
# Attributes:: default
#
# Copyright 2011, FLEETING CLOUDS
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

#::Chef::Node::Attribute.send(:include, Opscode::OpenSSL::Password)
#
default[:psiprobe][:version] = "2.3.0"
default[:psiprobe][:tomcat_home] = "/var/lib/tomcat6"
default[:psiprobe][:mirror] = "http://psi-probe.googlecode.com/files"
#default[:psiprobe][:mirror] = "http://openerpns.warehouseman.com/downloads"

