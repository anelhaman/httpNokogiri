#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require 'nokogiri'
require 'net/http'
require 'uri'

uri = URI.parse("https://www.kapook.com/")
response = Net::HTTP.get_response(uri)

parsed_data = Nokogiri::HTML.parse(response.body)

cat = [
    "tophit_box",
    "vdo_box",
    "photo_box",
    "women_box",
    "variety_box",
    "cooking_box",
    "health_box",
    "travel_box",
    "home_box",
    "men_box",
    "mobile_box",
    "money_box",
    "xfile_box"
]
msg = "\r\n"

for count in 0..(cat.length - 1)

    title1div = parsed_data.xpath('//*[@id="'"#{cat[count]}"'"]/div/div[1]/h2').text 
    title2div = parsed_data.xpath('//*[@id="'"#{cat[count]}"'"]/div/div[1]/div[1]/h2').text 
    title3div = parsed_data.xpath('//*[@id="'"#{cat[count]}"'"]/div/div[2]/div[1]/h2').text 

    if !(title1div.nil? || title1div.empty?)
        puts title1div
        msg = msg + title1div
        for i in 1..10
            keyword = parsed_data.xpath('//*[@id="'"#{cat[count]}"'"]/div/div[1]/span/a['+"#{i}"+']')
            if !(keyword.text.nil? || keyword.text.empty?)
                puts "#{i}. "+keyword.text
                msg = msg+"\r\n" +"#{i}. "+keyword.text
            else
                break
            end
        end
        
        
        system("curl -X POST -H 'Authorization: Bearer H1obvLvPTlktNLcrMEOv3rEKqteYhP8SJSFZyC73FJJ' -F 'message=#{msg}' https://notify-api.line.me/api/notify --silent --output /dev/null")
        msg = "\r\n"
    end    
    if !(title2div.nil? || title2div.empty?)
        puts title2div
        msg = msg + title2div
        for i in 1..10
            keyword = parsed_data.xpath('//*[@id="'"#{cat[count]}"'"]/div/div[1]/div[1]/span/a['+"#{i}"+']')
            if !(keyword.text.nil? || keyword.text.empty?)
                puts "#{i}. "+keyword.text
                msg = msg+"\r\n" +"#{i}. "+keyword.text
            else
                break
            end
        end
        system("curl -X POST -H 'Authorization: Bearer H1obvLvPTlktNLcrMEOv3rEKqteYhP8SJSFZyC73FJJ' -F 'message=#{msg}' https://notify-api.line.me/api/notify --silent --output /dev/null")
        msg = "\r\n"
    end    
    if !(title3div.nil? || title3div.empty?)
        puts "=============\r\n";    
        puts title3div
        msg = msg + title3div
        for i in 1..10
            keyword = parsed_data.xpath('//*[@id="'"#{cat[count]}"'"]/div/div[2]/div[1]/span/a['+"#{i}"+']')
            if !(keyword.text.nil? || keyword.text.empty?)
                puts "#{i}. "+keyword.text
                msg = msg+"\r\n" +"#{i}. "+keyword.text
            else
                break
            end
        end
        system("curl -X POST -H 'Authorization: Bearer H1obvLvPTlktNLcrMEOv3rEKqteYhP8SJSFZyC73FJJ' -F 'message=#{msg}' https://notify-api.line.me/api/notify --silent --output /dev/null")
        msg = "\r\n"
    end
        
    puts "=============\r\n";    
    sleep 10
end

goodbyetext = 'message='+"\r\n"+'Have a nice day : '+`date`
system("curl -X POST -H 'Authorization: Bearer H1obvLvPTlktNLcrMEOv3rEKqteYhP8SJSFZyC73FJJ' -F '#{goodbyetext}' -F 'stickerPackageId=4' -F 'stickerId=282' https://notify-api.line.me/api/notify --silent --output /dev/null")