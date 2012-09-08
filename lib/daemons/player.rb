#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
require File.join(root, "config", "environment")

require 'faye'

$playback = Playback.new


require 'eventmachine'

EM.run {
  client = Faye::Client.new('http://localhost:4000/faye')

  client.subscribe('/foo') do |message|
    puts message.inspect
  end

  client.publish('/foo', 'text' => 'Hello world')
}
