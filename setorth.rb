#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require 'nokogiri'
require 'net/http'
require 'uri'

uri = URI.parse("https://marketdata.set.or.th/mkt/marketsummary.do?language=th&country=TH")
response = Net::HTTP.get_response(uri)

parsed_data = Nokogiri::HTML.parse(response.body)

for r in 1..8 do
    header = parsed_data.xpath('//*[@id="maincontent"]/div/div[1]/div/div/table/thead/tr/th['"#{r}"']')
    print header.text.strip+"  "
end

puts ""
for colume in 1..9 do
         
    ชื่อ = parsed_data.xpath('//*[@id="maincontent"]/div/div[1]/div/div/table/tbody/tr['"#{colume}"']/td[1]')
    ล่าสุด = parsed_data.xpath('//*[@id="maincontent"]/div/div[1]/div/div/table/tbody/tr['"#{colume}"']/td[2]')
    เปลี่ยนแปลง = parsed_data.xpath('//*[@id="maincontent"]/div/div[1]/div/div/table/tbody/tr['"#{colume}"']/td[3]')
    เปอร์เซ็นต์เปลี่ยนแปลง = parsed_data.xpath('//*[@id="maincontent"]/div/div[1]/div/div/table/tbody/tr['"#{colume}"']/td[4]')
    สูงสุด = parsed_data.xpath('//*[@id="maincontent"]/div/div[1]/div/div/table/tbody/tr['"#{colume}"']/td[5]')
    ต่ำสุด = parsed_data.xpath('//*[@id="maincontent"]/div/div[1]/div/div/table/tbody/tr['"#{colume}"']/td[6]')
    ปริมาณ = parsed_data.xpath('//*[@id="maincontent"]/div/div[1]/div/div/table/tbody/tr['"#{colume}"']/td[7]')
    มุลค่า = parsed_data.xpath('//*[@id="maincontent"]/div/div[1]/div/div/table/tbody/tr['"#{colume}"']/td[7]')

    print ชื่อ.text.strip+" : "
    print ล่าสุด.text.strip+" : "
    print เปลี่ยนแปลง.text.strip+" : "
    print เปอร์เซ็นต์เปลี่ยนแปลง.text.strip+" "
    print สูงสุด.text.strip+" : "
    print ต่ำสุด.text.strip+" : "
    print ปริมาณ.text.strip+" : "
    puts มุลค่า.text.strip
end
