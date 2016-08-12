#  esearch_solr::config class
#  Installs solr, inherits parameters from the main class.

class esearch_solr::config inherits esearch_solr {
  # create node #1.
  file { 'copy-node1':
    path    => '/apps/solr/node1',
    recurse => true,
    source  => $esearch_solr::copy_dir,
    purge   => false,
    replace => false,
    owner   => $esearch_solr::user,
    group   => $esearch_solr::group,
    mode    => '0755',
  }
  
  # create node #2.
  file { 'copy-node2':
    path    => '/apps/solr/node2',
    recurse => true,
    source  => $esearch_solr::copy_dir,
    purge   => false,
    replace => false,
    owner   => $esearch_solr::user,
    group   => $esearch_solr::group,
    mode    => '0755',
  }
  
  # create node #3.
  file { 'copy-node3':
    path    => '/apps/solr/node3',
    recurse => true,
    source  => $esearch_solr::copy_dir,
    purge   => false,
    replace => false,
    owner   => $esearch_solr::user,
    group   => $esearch_solr::group,
    mode    => '0755',
  }

  # chain the objects.
  File['copy-node1'] ->
  File['copy-node2'] ->
  File['copy-node3']
}