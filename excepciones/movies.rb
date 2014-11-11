require 'open-uri'
require 'json'
class Movies

  def search(**hash)
    web_page = open (absolute_uri(hash[:title],hash[:year]))
    result = parse_data web_page
    {title: result['Title'], year: result['Year'], imdbID: result['imdbID'], type: result['Type']}
  rescue OpenURI::HTTPError => e
    puts e.message
  end

  def parse_data(web_page)
    response = web_page.gets
    hash=JSON.parse(response)
    if hash['Response']=="False"
      raise StandardError.new(hash['Error'])
    end
    hash
  end

  def search_uri
     "http://www.omdbapi.com/"
  end

  def absolute_uri(title, year)
    "#{search_uri}?t=#{title}&y=#{year}&plot=short&r=json"
  end

end

movies = Movies.new
p movies.search(title: "superman")

#error de respuesta de la web:  "Response: false"
#error 400: bad request 
