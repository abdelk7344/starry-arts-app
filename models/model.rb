require 'net/http'
require 'json'
require 'uri'



def get_pic(topic)
    begin
        url = "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.exhibitions.getObjects&access_token=#{ENV["ACCESS_TOKEN"]}&tag=#{topic}&page=1&per_page=100"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        results = JSON.parse(response)
        random_art_data = results['objects'].sample
        image = random_art_data["images"].first["b"]["url"]
        credit= random_art_data["creditline"]
        description= random_art_data["description"]
        gallery_text= random_art_data["gallery_text"]
        title= random_art_data["title_raw"]
        type= random_art_data["type"]
        {"title"=> title,"type"=> type,"image"=>image, "credit"=> credit, "description"=> description, "gallery_text"=> gallery_text}
    rescue
        {"title"=> "No results found for #{topic}","type"=> "Error","image"=>"https://www.publicdomainpictures.net/pictures/30000/velka/plain-white-background.jpg", "credit"=> " ", "description"=> " ", "gallery_text"=> " "}
    end
end