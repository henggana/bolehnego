class Usertype
  include DataMapper::Resource
  
  property :id, Integer, :key => true, :min => 0, :max => 11
  property :name, String, :required => true, :length => 255
  
  has n, :userlogins

end
