#
class profile::apache(
  Boolean $default_vhost = false,
  Hash $apache_vhost_servers,
  #Integer $port = 80,
  #String $docroot = "/var/www/${facts['fqdn']}",
){
  class { '::apache':
    default_vhost => $default_vhost,
  }

  create_resources(::apache::vhost, $apache_vhost_servers)
  # ::apache::vhost { $facts['fqdn']:
  #   port    => $port,
  #   docroot => $docroot,
  #   before  => File["${docroot}/index.html"],
  # }

  file { "${docroot}/index.html":
    content => 'Test page This is a test',
  }
}