#!/usr/bin/env ruby
 # allows listing user survey results and deleting products
 require 'optparse'
 require 'rubygems'
 require 'active_record'
 require 'yaml'
 Dir["app/models/*.rb"].each {|file| require_relative file }

 options = {}

 opt_parser = OptionParser.new do |opt|
   opt.banner = "Usage: survey product system COMMAND [OPTIONS]"
   opt.separator  ""
   opt.separator  "Commands"
   opt.separator  "     list_survey_results: list_survey_results"
   opt.separator  "     delete_product: delete_product name"
   opt.separator  "     list_products: list_products"
   opt.separator  ""
   opt.separator  "Options"  
   
   opt.on("-n","--name PRODUCTNAME","product name") do |product_name|
     options[:product_name] = product_name
   end
   
   opt.on("-h","--help","help") do
     puts opt_parser
   end
 end
 
 opt_parser.parse!
 
 ActiveRecord::Base.establish_connection(YAML.load(File.read(File.join('config','database.yml')))[ENV['ENV'] ? ENV['ENV'] : 'development'])
 
 case ARGV[0]
   when "list_survey_results"
     Answer.summary_of_responses
   when "delete_product"
     destroyed = Product.destroy_all(name: options[:product_name])
     if destroyed.any?
       puts "Deleted #{options[:product_name]}"
     else
       puts "We didn't have any product named: #{options[:product_name]}"
     end   
   when "list_products"
     puts Product.all.map(&:name)
   else
     puts opt_parser
   end