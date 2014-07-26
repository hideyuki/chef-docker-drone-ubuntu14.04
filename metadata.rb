name             'docker-drone-ubuntu14.04'
maintainer       'Hideyuki Takei'
maintainer_email 'takehide22@gmail.com'
license          'All rights reserved'
description      'Installs/Configures chef-beatrobo-users'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
recipe           'docker-drone-ubuntu14.04', 'Drone.io on Ubuntu 14.04'

depends 'docker'
depends 'drone'

