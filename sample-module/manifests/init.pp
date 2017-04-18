# Class: exam
# ===========================
#
# Full description of class exam here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'exam':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class exam {
package { 'httpd':
        ensure => 'present',
        }
package { 'php':
        ensure => 'present',
        }

service { 'httpd':
        ensure => 'running',
        enable => true,
        }

case $::hostname {
        'node1': {
                user { 'sara':
                        ensure => 'present',
                        home => '/var/www/',
                        shell => '/bin/bash',
                        }
                file { '/var/www/sara':
                        ensure => 'directory',
                        mode => '0755',
                        owner => 'sara',
                        group => 'sara',
                        }
                file { '/var/www/sara/index.php':
                        mode => '0644',
                        owner => 'sara',
                        group => 'sara',
                        source => 'puppet:///modules/exam/index.php',
                        }

                user { 'satish':
                        ensure => 'present',
                        home => '/var/www',
                        shell => '/bin/bash',
                        }
                file { '/var/www/satish':
                        ensure => 'directory',
                        mode => '0755',
                        owner => 'satish',
                        group => 'satish',
                        }
                file { '/var/www/satish/index.php':
                        mode => '0644',
                        owner => 'satish',
                        group => 'satish',
                        source => 'puppet:///modules/exam/index.php',
                        }

                user { 'kanna':
                        ensure => 'present',    
                        home => '/var/www',
                        shell => '/bin/bash',
                        }
                file { '/var/www/kanna':
                        ensure => 'directory',
                        mode => '0755',
                        owner => 'kanna',
                        group => 'kanna',
                        }

                file { '/var/www/kanna/index.php':
                        mode => '0644',
                        owner => 'kanna',
                        group => 'kanna',
                        source => 'puppet:///modules/exam/index.php',
                        }
                }
        'node2': { 
                user { 'kanna':
                        ensure => 'present',
                        home => '/var/www',
                        shell => '/bin/bash',  
                        }
                file { '/var/www/kanna':
                        ensure => 'directory',
                        mode => '0755',
                        owner => 'kanna', 
                        group => 'kanna',
                        }
                file { '/var/www/kanna/index.php':
                        mode => '0644',
                        owner => 'kanna',
                        group => 'kanna',
                        source => 'puppet:///modules/exam/index.php',
                                                        }
                user { 'sara':
                        ensure => 'present',
                        home => '/var/www',
                        shell => '/bin/bash',
                        }
                file { '/var/www/sara':
                        ensure => 'directory',
                        mode => '0755',
                        owner => 'sara',
                        group => 'sara',        
                        }
                file { '/var/www/sara/index.php':
                        mode => '0644',
                        owner => 'sara',
                        group => 'sara',
                        source => 'puppet:///modules/exam/index.php',
                       }
                }
                }

}
