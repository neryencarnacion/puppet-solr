class esearch_solr::service inherits esearch_solr{
  notify { 'Applying class esearch_solr::service': }
  notify { 'Start service!': }
  
  define service_node {
    service { "${name}": 
      ensure => running,
      enable => true,
    }
  }
  
  service_node { $esearch_solr::solr: } 
}