class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :non_clickbait

  def non_clickbait
    if title.present?
      errors.add(:title, "need to be clickbait") unless title.include?("Won't Believe") || title.include?("Secret") ||  title.include?("Top [number]") || title.include?("Guess")
    end
  end
end
