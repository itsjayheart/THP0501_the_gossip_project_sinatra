require 'bundler'
Bundler.require
require 'csv'

$:.unshift File.expand_path("./../lib", __FILE__)
$:.unshift File.expand_path("./../db", __FILE__)
require 'controller'
require 'gossip'

run ApplicationController