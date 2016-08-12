#
# Class: esearch_solr
#
# This module manages Apache Solr.
# It has support for running multiple Solr node on the same machine.

class esearch_solr (
  $extension             = $::params::extension,
  $user                  = $::params::user,
  $group                 = $::params::group,
  $tmp_dir               = $::params::tmp_dir,
  $nas_source            = $::params::nas_source,
  $tmp_source            = $::params::tmp_source,
  $source_filename       = $::params::source_filename,
  $version               = $::params::version,
  $base_dirs             = $::params::base_dirs,
  $install_dir           = $::params::install_dir,
  $copy_dir              = $::params::copy_dir,
  $solr_in_sh            = $::params::solr_in_sh,
  $solr                  = $::params::solr,
  $solr_xml              = $::params::solr_xml,
  
  # Java Parameters
  $nas_source_java       = $::params::nas_source_java,
  $tmp_source_java       = $::params::tmp_source_java,
  $source_filename_java  = $::params::source_filename_java,
  $extension_java        = $::params::extension_java,
  $tmp_dir_java          = $::params::tmp_dir_java,
  $version_java          = $::params::version_java,
  $install_java          = $::params::install_java,
  $install_dir_java      = $::params::install_dir_java) inherits params {
  class { 'esearch_solr::security': } ->
  class { 'esearch_solr::java': } ->
  class { 'esearch_solr::install': } ->
  class { 'esearch_solr::config': } ->
  class { 'esearch_solr::service': }
}
