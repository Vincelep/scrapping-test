require 'rubygems'
require 'nokogiri' 
require 'open-uri'


PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_the_email (page)
	page = Nokogiri::HTML(open(page))
	text = page.xpath('html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
	if text != ""
		return text
	else
		return "aucun email"
	end	
end

def get_the_url (page)
	url = page.chomp("val-d-oise.html")
	page = Nokogiri::HTML(open(page))
	villes = []
	page.css("a.lientxt").each do |city|
		villes << {city.text => get_the_email(url + city['href'].sub!("./", ""))}
	end
		return villes
end

def perform
	villes = get_the_url(PAGE_URL)
	for city in villes
		puts city
	end
end
perform