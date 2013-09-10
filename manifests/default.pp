group { 'puppet': ensure => present }
Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
File { owner => 0, group => 0, mode => 0644 }

class {'apt':
  always_apt_update => true,
}

Class['::apt::update'] -> Package <|
    title != 'python-software-properties'
and title != 'software-properties-common'
|>

package { [
    'build-essential',
    'vim',
    'curl',	
	'ruby1.9.3',
    'git-core',
	'libicu-dev',
	'imagemagick',
	'rake',
	'fontconfig',
	'libfreetype6'
  ]:
  ensure  => 'installed',
  notify => Exec['ruby config'],
}

exec { 'ruby config':
  command => 'update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.3 500; sudo rm /etc/alternatives/gem; sudo ln -s /usr/bin/gem1.9.3 /etc/alternatives/gem',
}

package { 'bundle':
    ensure   => 'installed',
    provider => 'gem',
	require  => Exec['ruby config'],
}

package { 'image_size':
    ensure   => 'installed',
    provider => 'gem',
	require  => Exec['ruby config'],
}

exec { 'phantom setup':
  cwd => '/usr/local/share',
  command => 'sudo wget https://phantomjs.googlecode.com/files/phantomjs-1.9.0-linux-x86_64.tar.bz2; sudo tar xjf phantomjs-1.9.0-linux-x86_64.tar.bz2; sudo ln -s /usr/local/share/phantomjs-1.9.0-linux-x8664/bin/phantomjs /usr/local/share/phantomjs; sudo ln -s /usr/local/share/phantomjs-1.9.0-linux-x8664/bin/phantomjs /usr/local/bin/phantomjs; sudo ln -s /usr/local/share/phantomjs-1.9.0-linux-x86_64/bin/phantomjs /usr/bin/phantomjs',
  require => Package['curl']
}

exec { 'wraith setup':
	cwd => '/usr/local/apps',
	command => 'sudo curl -fsSL https://raw.github.com/bbc-news/wraith/go/install | sudo bash',
	require => Package['curl']
}

