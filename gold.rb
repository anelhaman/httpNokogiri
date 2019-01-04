#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require 'nokogiri'
require 'net/http'
require 'uri'

uri = URI.parse("https://www.goldtraders.or.th")
response = Net::HTTP.get_response(uri)

parsed_data = Nokogiri::HTML.parse(response.body)
ทองคำแท่งรับซื้อ    = parsed_data.xpath('//*[@id="DetailPlace_uc_goldprices1_lblBLBuy"]/b/font')
ทองคำแท่งขายออก  = parsed_data.xpath('//*[@id="DetailPlace_uc_goldprices1_lblBLSell"]/b/font')
ทองรูปพรรณรับซื้อ   = parsed_data.xpath('//*[@id="DetailPlace_uc_goldprices1_lblOMBuy"]/b/font')
ทองรูปพรรณขายออก = parsed_data.xpath('//*[@id="DetailPlace_uc_goldprices1_lblOMSell"]/b/font')

puts "ทองคำแท่งรับซื้อ : "+ทองคำแท่งรับซื้อ.text+" บาท"
puts "ทองคำแท่งขายออก : "+ทองคำแท่งขายออก.text+" บาท"
puts "ทองรูปพรรณรับซื้อ : "+ทองรูปพรรณรับซื้อ.text+" บาท"
puts "ทองรูปพรรณขายออก : "+ทองรูปพรรณขายออก.text+" บาท"