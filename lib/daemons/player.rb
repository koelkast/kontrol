#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
require File.join(root, "config", "environment")

require 'eventmachine'

playback = Playback.new

module PlayerServer
  def receive_data(data)
    playback.receive_message(data)
  end
end

EventMachine::run {
  EventMachine::start_server "0.0.0.0", 4000, PlayerServer
}