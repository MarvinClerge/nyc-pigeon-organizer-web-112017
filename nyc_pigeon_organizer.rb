require 'pry'

# pigeon_data = {
#   :color => {
#     :purple => ["Theo", "Peter Jr.", "Lucky"],
#     :grey => ["Theo", "Peter Jr.", "Ms. K"],
#     :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
#     :brown => ["Queenie", "Alex"]
#   },
#   :gender => {
#     :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
#     :female => ["Queenie", "Ms. K"]
#   },
#   :lives => {
#     "Subway" => ["Theo", "Queenie"],
#     "Central Park" => ["Alex", "Ms. K", "Lucky"],
#     "Library" => ["Peter Jr."],
#     "City Hall" => ["Andrew"]
#   }
# }

def nyc_pigeon_organizer(data)
  arr = {}

  #create our nested hashes and array with iteration
  data.each do |cata, c_hash| #:gender, {:purple=>["Theo", "Peter Jr.", "Lucky"], etc}
    c_hash.each do |prop, p_array| #:male, ["Theo", etc]
      p_array.map do |x| #"Theo"
        arr[x] ||= {}
        arr[x][cata] ||= []
      end
    end
  end

  #if the catagory of the array is empty create first index, else push into array
  data.each do |cata, c_hash| #:gender, {:purple=>["Theo", "Peter Jr.", "Lucky"], etc}
    c_hash.each do |prop, p_array| #:male, ["Theo", etc]
      p_array.each do |x,i| #"Theo"
        if arr[x][cata].empty?
          arr[x][cata] = [prop.to_s]
        else
          arr[x][cata] << prop.to_s
        end
      end
    end
  end
  arr
end
