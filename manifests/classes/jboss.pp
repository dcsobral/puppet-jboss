class jboss {
    Exec { path => '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin' }
    include java::v6

    file { '/etc/init.d/jboss':
        ensure => present,
        mode   => 555,
        owner  => 'root',
        group  => 'root',
        source => [
		    "puppet:///files/jboss/init.d/host/jboss.$fqdn",
		    "puppet:///files/jboss/init.d/host/jboss.$hostname",
		    "puppet:///files/jboss/init.d/domain/jboss.$domain",
		    "puppet:///files/jboss/init.d/enc/jboss.$environment",
		    "puppet:///files/jboss/init.d/jboss",
		    "puppet:///modules/jboss/init.d/jboss",
	    ],
    }

    file { '/var/lock/subsys':
        ensure => directory,
        mode   => 755,
        owner  => 'root',
        group  => 'root',
    }

    service { 'jboss':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => [
		    File['/etc/init.d/jboss'],
		    File['/var/lock/subsys'],
	    ],
    }
}

# vi:syntax=puppet:filetype=puppet:ts=4:et:
