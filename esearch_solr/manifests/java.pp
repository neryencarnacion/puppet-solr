#  esearch_solr::install class
#  Installs java, inherits parameters from the main class

class esearch_solr::java (
  $install        = $esearch_solr::install_java,
  $package_name   = $esearch_solr::version_java
) inherits esearch_solr {
	notify { 'Class esearch::java started': }
	notify { "this is Java Install Dir -  $esearch_solr::install_java_Dir": }
	
	if $install == true {
	  # ensure /tmp/java directory
	  file {  $esearch_solr::tmpDir_java :
        ensure => 'directory',
        owner  => $esearch_solr::user,
        group  => $esearch_solr::group,
        mode   => '0755',
        # ensure NAS location and downlown.
	  }
	
      file { "${esearch_solr::tmp_source_java}${esearch_solr::source_filename_java}":
        path   => "${esearch_solr::tmp_source_java}${esearch_solr::source_filename_java}",
        source => $esearch_solr::nas_source_java,
        owner  => $esearch_solr::user,
        group  => $esearch_solr::group,
        mode   => '0755',
      }
   archive { "${esearch_solr::tmp_source_java}${esearch_solr::source_filename_java}":
       ensure           => present,
       extract          => true,
       extract_command  => 'tar xfz % --strip-components=1',
       extract_path     => $esearch_solr::install_java_Dir,
       cleanup          => true,
       creates          => "$esearch_solr::install_java_Dir/test",
       user             => $esearch_solr::user,
       group            => $esearch_solr::group,
    }
      
	  
  
      File["${esearch_solr::tmp_source_java}${esearch_solr::source_filename_java}"] -> Archive["${esearch_solr::tmp_source_java}${esearch_solr::source_filename_java}"]	
   }
}