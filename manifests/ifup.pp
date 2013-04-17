define network::ifup($script) {
	file { "/etc/network/if-up.d/$script":
		source  => "puppet:///modules/network/$script",
		mode    => "0750",
		notify  => Exec["network-restart"],
	}
	
	exec { "network-restart":
		command     => "/etc/init.d/networking restart",
		path        => "/bin:/usr/bin:/sbin:/usr/sbin",
		refreshonly => true,
	}
}
