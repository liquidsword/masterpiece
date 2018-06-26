class Artist < ActiveRecord::Base
    has_secure_password
    has_many :drawings
    
    validates :email, :presence => true
    validates :email, :uniqueness => true
    
    def slug
        artist.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
        Artist.all.find{|artist| artist.slug == slug}
    end
 
end