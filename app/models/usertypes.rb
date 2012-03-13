class Usertype
  include DataMapper::Resource
  
  property :id, Integer, :key => true, :min => 0, :max => 11
  property :name, String, :required => true, :length => 255
  
  has n, :users
  
  def show_name
    name = self.name.gsub('-',' ').split.map{|s| s.capitalize}.join(' ')
  end

end
