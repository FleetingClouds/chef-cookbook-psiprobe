Description
===========

Obtains and installs the Psi Probe war file in TomCat.

Preamble
========

This is my first attempt at a simple Chef cookbook, so please don't expect some quirks.

It is only tested on TomCat 6, only as installed by the default TomCat Cookbook, and only on Ubuntu 10.04.

It uses more shell scripting than it should, where Ruby would probably be just as capable, if not more so.

Comments and pulls are encouraged, very much so, please.



Requirements
============

Application
-----------

* TomCat 6 (tested)
* Any other Tomcat understood by Psi Probe ought to be ok.


Platform
--------

* Ubuntu 11.04  (Tested)
* Any other platform that supports TomCat ought to be ok.


Usage
=====

If you are using the default tomcat cookbook on Ubuntu you can run with the defaults.

You have the option to set the attribute  default[:psiprobe][:define_manager] = "true".  That will cause the recipe to edit the file tomcat-user.xml adding a "manager" role, if there is not one already, and adding a "manager" user you specify with   default[:psiprobe][:manager_uid]   and   default[:psiprobe][:manager_pwd]


License and Author
==================

Author:: Martin "Hasan" Bramwell (<martinhbramwell (0) gmail o com>)

Copyright:: 2012, FLEETING CLOUDS

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


