require 'rubygems'
require 'nokogiri' 
require 'open-uri'


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   




#prix de la monnaies
def price_currencies
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	devise = []
	page.css('td:nth-child(5) > a').each do |price|
		devise << price.text
	end	
		return devise
end
#puts devise.inspect

#puts price_currencies


#symbol de la crypto
def name_crypto
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	name = []
	page.css('td.text-left.col-symbol').each do |symbol|
		name << symbol.text
	end
		return name
end 
#puts name.inspect	

#puts name_crypto	


def concatenate (devise, name)
	array_name_devise = name.zip(devise)
	#puts array_name_devise.inspect


	array_of_hashes = []
	array_name_devise.each {|record| array_of_hashes <<  {record[0] => record[1]}}
	#puts array_of_hashes.inspect
	return array_of_hashes
end


def perform
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	name = price_currencies
	devise = name_crypto
	puts concatenate(name, devise)
end

perform



