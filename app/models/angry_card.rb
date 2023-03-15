class AngryCard < ApplicationRecord
  mount_uploader :image, AngryCardUploader
  mount_uploader :card_ogp, AngryCardUploader
  belongs_to :user


end
