class Show < ActiveRecord::Base
  has_many :characters
  belongs_to :network
  has_many :actors, through: :characters

  def actors_list
    characters = self.characters
    actors = []
    characters.each do |ch|
        actors << Actor.find(ch.actor_id).full_name
   end
    actors

end

end