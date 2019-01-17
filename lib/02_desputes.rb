require 'rubygems'
require 'nokogiri' 
require 'open-uri'


#PAGE_URL = "https://www.nosdeputes.fr/deputes/enmandat/xml"


page = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))

PAGE = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))

arr_last_name = [] 
page.xpath('//deputes/depute/nom_de_famille').each do |last_name|
	arr_last_name << last_name.text
end	

#puts arr_last_name.inspect

arr_first_name = []
page.xpath('deputes/depute/prenom').each do |first_name|
	arr_first_name << first_name.text
end

#puts arr_first_name.inspect

arr_email = []
page.xpath('deputes/depute/emails/email[1]').each do |mail|
	arr_email << mail.text
end

#puts arr_email.inspect


	list_depute = []
	list_depute = arr_first_name.zip(arr_last_name,arr_email)
#puts arr_first_last_name_email.inspect

	info_depute_complete = []
	list_depute.each {|record| info_depute_complete << {"prenom" => record[0], "nom_de_famille" => record[1], "email" => record[2]}}

puts info_depute_complete.inspect


#collapsible1 > div.expanded > div.collapsible-content > div:nth-child(4) > span.text

#collapsible1 > div.expanded > div.collapsible-content > div:nth-child(4) > span.text

=begin

def get_the_email (page)
	page = Nokogiri::HTML(open(page))
	text = page.xpath('//*[@id="b1"]/ul[1]/li[5]/ul/li[4]').text
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

=end