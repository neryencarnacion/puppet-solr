#  esearch_solr::install class
#  Installs Solr, inherits parameters from the main class.

class esearch_solr::install inherits esearch_solr {
  # ensure base directories are present.
  file { $esearch_solr::base_dirs:
    ensure => 'directory',
    owner  => $esearch_solr::user,
    group  => $esearch_solr::group,
    mode   => '0755',
  }

  # ensure NAS location and download to the server.
  file { "${esearch_solr::tmp_source}${esearch_solr::source_filename}":
    path   => "${esearch_solr::tmp_source}${esearch_solr::source_filename}",
    source => $esearch_solr::nas_source,
    owner  => $esearch_solr::user,
    group  => $esearch_solr::group,
    mode   => '0755'
  }
  
  # uncompress the Solr archive on the local server.
  archive {"${esearch_solr::tmp_source}${esearch_solr::source_filename}":
    ensure          => present,
    extract         => true,
    extract_command => 'tar xfz % --strip-components=1',
    extract_path    => $esearch_solr::install_dir,
    cleanup         => true,
    creates         => "$esearch_solr::install_dir/test",
    user            => $esearch_solr::user,
    group           => $esearch_solr::group,
  }

  # chain the objects.
  File["${esearch_solr::tmp_source}${esearch_solr::source_filename}"] -> 
  File[$esearch_solr::base_dirs] -> 
  Archive["${esearch_solr::tmp_source}${esearch_solr::source_filename}"]
}