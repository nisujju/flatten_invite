require 'json'


class InviteCustomer

  Rad_per_deg = Math::PI/180  
  Rkm = 6371  
  
  def initialize(file_name)
    file = File.read(file_name)
    data_hash = JSON.parse(file)
    @customers = data_hash.sort_by {|x| x["id"]}
  end
  
  def invite
    invited_customers=[]
    @customers.each do |user|
      hash_customer = {}
      user_distance = distance(user["coordinates"])
      if user_distance < 100
         hash_customer["id"] = user["id"]
         hash_customer["name"] = user["name"]
         invited_customers << hash_customer
      end
    end
    invited_customers
  end
       
  
  private
  
  def distance(loc1, loc2=[53.3393, -6.2576841])
  
    dlat_rad = (loc2[0]-loc1[0]) * Rad_per_deg  
    dlon_rad = (loc2[1]-loc1[1]) * Rad_per_deg
  
    lat1_rad, lon1_rad = loc1.map {|i| i * Rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * Rad_per_deg }
  
    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
  
    Rkm * c 
  
  end

end