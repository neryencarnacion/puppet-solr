#
# Class: solr::params
#
# This module contains all the parameters for the main class.
#

class esearch_solr::params {
  $nas_source            = '/nas/apps/enterprise_search/lucidworks/sw_repo/solr/solr-5.5.1.tgz'
  $follow_redirects      = true
  $extension             = 'tgz'
  $checksum              = false
  $user                  = 'lwfadmin'
  $group                 = 'srchadmn'
  $manage_user           = false
  $timeout               = 5800
  $tmpDir                = '/tmp/solr'
  $tmp_source            = '/tmp'
  $source_filename       = '/solr-5.5.1.tgz'
  $version        		 = 'solr-5.5.1'
  $baseDirs              = ['/tmp/solr', '/apps/solr', '/tmp/solr5.5.1', '/var/solr', '/var/solr/data', '/var/solr/logs']
  $installDir            = '/apps/enterprise_search/solr/solr-5.5.1'
  $copyDir               = '/apps/enterprise_search/solr/solr-5.5.1/server'
  $solr_in_sh            = [ 'solr.in.sh', 'solr2.in.sh', 'solr3.in.sh' ]
  $solr                  = [ 'solr', 'solr2', 'solr3' ]
  $solr_xml              = [ 'solr.xml', 'solr2.xml', 'solr3.xml' ]
  
  # Java parameters
  $nas_source_java       = '/nas/apps/enterprise_search/lucidworks/sw_repo/jdk/jdk-8u77-linux-x64.tar.gz'
  $tmp_source_java       = '/tmp/java'
  $source_filename_java  = '/jdk-8u77-linux-x64.tar.gz'
  $follow_redirects_java = true
  $extension_java        = 'tar.gz'
  $checksum_java         = false
  $user_java             = 'lwfadmin'
  $manage_user_java      = false
  $timeout_java          = 5800
  $install_java          = true
  $tmpDir_java           = '/tmp/java'
  $version_java          = 'jdk-8u77-linux-x64'
  $install_java_Dir      = '/apps/enterprise_search/java/jdk-8u77'
}