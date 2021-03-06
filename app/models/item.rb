class Item < ApplicationRecord
    belongs_to :genre
    
    has_one_attached :image
    
    enum is_active: {"販売中": true,"販売準備中": false}
    
    def add_tax_price
        (self.price*1.10).round
    end
    
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
