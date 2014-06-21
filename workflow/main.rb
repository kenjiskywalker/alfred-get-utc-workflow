#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require_relative "bundle/bundler/setup"
require 'alfred'
require 'time'

Alfred.with_friendly_error do |alfred|
  fb = alfred.feedback

  if ARGV[0].nil?
    utc = Time.now.utc
    time = Time.now
  else
    begin
      utc = Time.parse(ARGV[0]).utc
      time = Time.parse(ARGV[0])
    rescue
      utc = "Please Input HH:MM"
    end
  end

  # add an arbitrary feedback
  fb.add_item({
    :uid      => "",
    :title    => utc,
    :subtitle => time,
    :arg      => "",
    :valid    => "yes",
  })

  puts fb.to_xml
end
