class Travel < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  attachment :image
  #has_one_attached :image

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end

end
