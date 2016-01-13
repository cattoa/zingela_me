#!/usr/bin/ruby

require 'rubygems'
require 'json'
require 'pp'

json = File.read("#{Rails.root}/db/zingela_data.json")
obj = JSON.parse(json)

pp obj
