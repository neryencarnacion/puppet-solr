#
# Class: solr::params
#
# This module contains all the parameters for the main class.
#

class esearch_solr::params {
  $nas_source            = '/nas/apps/enterprise_search/lucidworks/sw_repo/solr/solr-5.5.1.tgz'
  $extension             = 'tgz'
  $user                  = 'lwfadmin'
  $group                 = 'srchadmn'
  $tmp_dir               = '/tmp/solr'
  $tmp_source            = '/tmp'
  $source_filename       = '/solr-5.5.1.tgz'
  $version               = 'solr-5.5.1'
  $base_dirs             = [ "$tmp_dir", "$tmp_dir_java", '/apps/solr', '/var/solr', '/var/solr/data', '/var/solr/logs' ]
  $install_dir           = '/apps/enterprise_search/solr/solr-5.5.1'
  $src_copy_dir          = '/apps/enterprise_search/solr/solr-5.5.1/server'
  $solr_in_sh            = [ 'solr.in.sh', 'solr2.in.sh', 'solr3.in.sh' ]
  $solr                  = [ 'solr', 'solr2', 'solr3' ]
  $solr_xml              = [ 'solr.xml', 'solr2.xml', 'solr3.xml' ]

  # Java parameters
  $nas_source_java       = '/nas/apps/enterprise_search/lucidworks/sw_repo/jdk/jdk-8u77-linux-x64.tar.gz'
  $tmp_source_java       = '/tmp/java'
  $source_filename_java  = '/jdk-8u77-linux-x64.tar.gz'
  $extension_java        = 'tar.gz'
  $install_java          = true
  $tmp_dir_java          = '/tmp/java'
  $version_java          = 'jdk-8u77-linux-x64'
  $install_dir_java      = '/apps/enterprise_search/java/jdk-8u77'
}
