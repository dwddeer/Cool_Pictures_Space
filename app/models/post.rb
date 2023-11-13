class Post < ApplicationRecord
    has_one_attached :image
    validates :image, presence: true
    validate :image_content_type
  
private
  
    def image_content_type
      if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:image, 'must be a JPEG or PNG')
      end
    end
    
end
