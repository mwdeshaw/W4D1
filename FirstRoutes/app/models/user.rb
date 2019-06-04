# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    primary_key: :id, 
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :shared_with_others,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_with_me,
    through: :shared_with_others,
    source: :artwork

end
