####################################################
# == Class: esearch_solr::security
####################################################
# DO NOT MODIFY THIS FILE
#
class esearch_solr::security (
  $ensure_user = 'present',
  $ensure_base = 'present',
){

  $modpath = get_module_path($module_name)
  $basepath = "${modpath}/data/solr"

  $user_data   = loadyaml("${basepath}/user.yaml")
  $group_data  = loadyaml("${basepath}/group.yaml")
  $sudo_data   = loadyaml("${basepath}/sudo.yaml")
  $access_data = loadyaml("${basepath}/access.yaml")

  # default parameters
  $user_defaults = {
    ensure     => $ensure_user,
    forcelocal => true,
    groups     => [],
    ssh_keys   => {},
  }
  $group_defaults = {
    ensure     => $ensure_base,
    forcelocal => true,
  }
  $access_defaults = {
    ensure => $ensure_base,
    path   => '/etc/security/access.conf',
    after  => ':@ENT_UX_HST_UNIX_ALL:',
  }
  $sudo_defaults = {
    ensure => $ensure_base,
    path   => '/etc/sudoers',
  }

  if $ensure_user == 'present' and $ensure_base == 'present' {
    if empty($group_data) == false {
      create_resources(group, $group_data, $group_defaults)
    }
    if empty($user_data) == false {
      create_resources(all_security::user, $user_data, $user_defaults)
    }
    if empty($access_data) == false {
      create_resources(file_line, $access_data, $access_defaults)
    }
    if empty($sudo_data) == false {
      create_resources(file_line, $sudo_data, $sudo_defaults)
    }
  }
  if $ensure_user == 'absent' and $ensure_base == 'present' {
    if empty($user_data) == false {
      create_resources(all_security::user, $user_data, $user_defaults)
    }
  }
  if $ensure_user == 'absent' and $ensure_base == 'absent' {
    if empty($user_data) == false {
      create_resources(all_security::user, $user_data, $user_defaults)
    }
    if empty($group_data) == false {
      create_resources(group, $group_data, $group_defaults)
    }
    if empty($access_data) == false {
      create_resources(file_line, $access_data, $access_defaults)
    }
    if empty($sudo_data) == false {
      create_resources(file_line, $sudo_data, $sudo_defaults)
    }
  }

}