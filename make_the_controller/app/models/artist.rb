class Artist < ActiveRecord::Base
  attr_accessible :name, :birth_year
  has_many :songs

  def songs_attributes=(data)
    data.each do |attribute_values|
      self.songs.build(name: attribute_values)
    end
  end

end


  # def songs_attributes=(data)
  #   data.each do |index, song_data|
  #     self.songs.build(song_data)
  #   end
  # end