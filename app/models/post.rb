class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Nonfiction) }
  validate :clickbait
end

CLICKBAIT = ["Won't Believe", "Secret", "Top[0-9]", "Guess"]

  def clickbait
    if CLICKBAIT.none? {|t| t.match title}
      errors.add(:title, "Smells a little clickbait-y!")
    end
  end
end
