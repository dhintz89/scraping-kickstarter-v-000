require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  # projects: kickstarter.css('li.project.grid_4')
  # title: project.css("h2.bbcard_name strong a").text
  # image link: project.css("div.project-thumbnail a img").attribute("src").value
  binding.pry

  projects_list = kickstarter.css("li.project.grid_4")
  projects_list.each do |project|
    Hash.new = {
    :title => project.css("h2.bbcard_name strong a").text
    :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
    :description => item.css("p.bbcard_blurb").text,
    :location => item.css("ul.project-meta span.location-name").text,
    :percent_funded => item.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
    :projects << project

end

create_project_hash