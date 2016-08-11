#
# Class: solr
#
# This module manages Apache Solr.
# It has support for running multiple Solr node on the same machine.

class esearch_solr (
  $extension             = $::params::extension,
  $checksum              = $::params::checksum,
  $user                  = $::params::user,
  $group                 = $::params::group,
  $manage_user           = $::params::manage_user,
  $tmpDir                = $::params::tmpDir,
  $nas_source            = $::params::nas_source,
  $tmp_source            = $::params::tmp_source,
  $source_filename       = $::params::source_filename,
  $version               = $::params::version,
  $baseDirs              = $::params::baseDirs,
  $installDir            = $::params::installDir,
  $copyDir               = $::params::copyDir,
  $solr_in_sh            = $::params::solr_in_sh,
  $solr                  = $::params::solr,
  $solr_xml              = $::params::solr_xml,
  # Java Parameters
  $nas_source_java       = $::params::nas_source_java,
  $tmp_source_java       = $::params::tmp_source_java,
  $source_filename_java  = $::params::source_filename_java,
  $follow_redirects_java = $::params::follow_redirects_java,
  $extension_java        = $::params::extension_java,
  $checksum_java         = $::params::checksum_java,
  $user_java             = $::params::user_java,
  $manage_user_java      = $::params::manage_user_java,
  $tmpDir_java           = $::params::tmpDir_java,
  $version_java          = $::params::version_java,
  $install_java          = $::params::install_java) inherits params {
  class { 'esearch_solr::security': } ->
  class { 'esearch_solr::install': } ->
  class { 'esearch_solr::java': } ->
  class { 'esearch_solr::config': } ->
  class { 'esearch_solr::service': }
}