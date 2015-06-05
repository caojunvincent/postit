class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true,
                   length: {minimum: 5},
                   uniqueness: true

  before_save :generate_slug

  def to_param
    self.slug
  end

  private
  def generate_slug
    self.slug = self.name.gsub(" ", "-").downcase
  end


end
