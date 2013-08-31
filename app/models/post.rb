class Post < ActiveRecord::Base
  include Voteable

  belongs_to :category
  belongs_to :user

  has_many :comments
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :url, presence: true
  validates :category_id, presence: true

  after_validation :generate_slug

  def generate_slug
    proto_slug = normalize_string

    unless self.class.where(slug: proto_slug) == [self]
      self.slug = proto_slug + "-" + SecureRandom.hex
    end
  end

  def normalize_character(i)
    case i
    when /[A-Z]/ then i.downcase
    when /[a-z]/ then i
    when /[0-9]/ then i
    when "-"     then i
    when "_"     then i
    when " "     then "-"
    else              ""
    end
  end

  def normalize_string
    title_as_array  = self.title.split("")
    title_as_array.map! { |i| normalize_character(i) }
    title_as_string = title_as_array.join
    beg_ltr_or_num  = title_as_string.gsub(/\A[^(a-z|\d)]+/, "")
    end_ltr_or_num  = beg_ltr_or_num.gsub(/[^(a-z|\d]+\z/, "")
    single_dashes   = end_ltr_or_num.gsub(/-+/, "-")
  end
end
