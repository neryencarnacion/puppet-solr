#  esearch_solr::config class
#  Installs solr, inherits parameters from the main class.

class esearch_solr::config inherits esearch_solr {
  # uncompress the solr zip download file, copy to installDir.
  notify { "this is Solr Config Dirs -  ${::baseDirs}": }

  # ensure base directories are present.
  file { $::baseDirs:
    ensure => 'directory',
    owner  => $::user,
    group  => $::group,
    mode   => '0755',
  }

  # ensure NAS location and download.
  file { "${esearch_solr::tmp_source}${esearch_solr::source_filename}":
    path   => "${::tmp_source}${::source_filename}}",
    source => $esearch_solr::nas_source,
    owner  => $esearch_solr::user,
    group  => $esearch_solr::group,
    mode   => '0755'
  }

  # TO-DO: investigate the user of puppet/archive module...
  archive { "${esearch_solr::tmp_source}${esearch_solr::source_filename}":
    ensure          => present,
    extract         => true,
    extract_command => 'tar xfz % --strip-components=1',
    extract_path    => $esearch_solr::installDir,
    cleanup         => true,
    creates         => "$esearch_solr::installDir/test",
    user            => $esearch_solr::user,
    group           => $esearch_solr::group,
  }

  file { 'copy node1':
    path    => '/apps/solr/node1',
    recurse => true,
    source  => $esearch_solr::copyDir,
    purge   => false,
    replace => false,
    owner   => $esearch_solr::user,
    group   => $esearch_solr::group,
    mode    => '0755',
  }

  file { 'copy node2':
    path    => '/apps/solr/node2',
    recurse => true,
    source  => $esearch_solr::copyDir,
    purge   => false,
    replace => false,
    owner   => $esearch_solr::user,
    group   => $esearch_solr::group,
    mode    => '0755',
  }

  file { 'copy node3':
    path    => '/apps/solr/node3',
    recurse => true,
    source  => $esearch_solr::copyDir,
    purge   => false,
    replace => false,
    owner   => $esearch_solr::user,
    group   => $esearch_solr::group,
    mode    => '0755',
  }

  # Chain the Objects
  File["${esearch_solr::tmp_source}${esearch_solr::source_filename}"] ->
  File[$esearch_solr::baseDirs] ->
  Archive["${esearch_solr::tmp_source}${esearch_solr::source_filename}"] ->
  File['copy node1'] ->
  File['copy node2'] ->
  File['copy node3']
}