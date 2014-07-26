#
# Cookbook Name:: docker-drone-ubuntu14.04
# Recipe:: default
#
# Copyright (C) 2014 Beatrobo, Inc.
#
# All rights reserved - Do Not Redistribute
#

# docker
include_recipe 'docker'
node['docker']['image_cmd_timeout'] = 10000
docker_image 'hideyuki/docker-php54-symfony2'
#docker_image 'bradrydzewski/php:5.5'

# drone.io
include_recipe 'drone'

