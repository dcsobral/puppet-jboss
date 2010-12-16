class jboss::conf::default {
    jboss::conf { 'jboss':
        ensure => present,
        source => [
		    "puppet:///files/jboss/default/host/jboss.$fqdn",
		    "puppet:///files/jboss/default/host/jboss.$hostname",
		    "puppet:///files/jboss/default/domain/jboss.$domain",
		    "puppet:///files/jboss/default/enc/jboss.$environment",
		    "puppet:///files/jboss/default/jboss",
		    "puppet:///modules/jboss/default/jboss",
	    ],
    }
}

# vi:syntax=puppet:filetype=puppet:ts=4:et:
