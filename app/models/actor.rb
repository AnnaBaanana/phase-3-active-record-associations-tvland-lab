class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters
  
    def full_name
        name = "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        characters = Character.where("actor_id = ?", self.id)
        roles = []
        characters.each do |ch|
            roles << "#{ch.name} - #{Show.find(ch.show_id).name}"
        end
        roles
    end
end