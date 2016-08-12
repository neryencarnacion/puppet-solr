#  esearch_solr::java class
#  Installs Java, inherits parameters from the main class.

class esearch_solr::java ($install = $esearch_solr::install_java, $package_name = $esearch_solr::version_java) inherits esearch_solr 
{
  # determine if Java needs to be installed.
  if $install == true {
    file { $esearch_solr::tmp_dir_java:
      ensure => 'directory',
      owner  => $esearch_solr::user,
      group  => $esearch_solr::group,
      mode   => '0755',
    }
    
    # copy the archive from the NAS location to the server.
    file { "${esearch_solr::tmp_source_java}${esearch_solr::source_filename_java}":
      path   => "${esearch_solr::tmp_source_java}${esearch_solr::source_filename_java}",
      source => $esearch_solr::nas_source_java,
      owner  => $esearch_solr::user,
      group  => $esearch_solr::group,
      mode   => '0755',
    }
    
    # un-archive the Java file.
    archive { "${esearch_solr::tmp_source_java}${esearch_solr::source_filename_java}":
      ensure          => present,
      extract         => true,
      extract_command => 'tar xfz % --strip-components=1',
      extract_path    => $esearch_solr::install_dir_java,
      cleanup         => true,
      creates         => $esearch_solr::install_dir_java,
      user            => $esearch_solr::user,
      group           => $esearch_solr::group,
    }

    File["${esearch_solr::tmp_source_java}${esearch_solr::source_filename_java}"] -> 
    Archive["${esearch_solr::tmp_source_java}${esearch_solr::source_filename_java}"]
  }
}