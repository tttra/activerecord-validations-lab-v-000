class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: %w(Fiction Non-Fiction)
  validate :is_clickbait?

  CLICKBAIT = [/ Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def is_clickbait?
    errors.add(:title, "More clickbait-y, puh-lease!") unless CLICKBAIT.any? { |p| p.match(title) }
  end
end
