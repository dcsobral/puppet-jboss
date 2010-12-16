define jboss::conf($ensure, $content = false, $source = false) {
  if $content {
    file {'/etc/default/jboss':
      ensure  => $ensure,
      content => $content,
      before  => Service['jboss'],
      notify  => Service['jboss'],
    }
  }

  if $source {
    file {'/etc/default/jboss':
      ensure => $ensure,
      source => $source,
      before  => Service['jboss'],
      notify  => Service['jboss'],
    }
  }
}

# vi:syntax=puppet:filetype=puppet:ts=4:et:
