class Movie < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, presence: true
  validates :overview, presence: true

  has_many :bookmarks

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    if bookmarks.count.positive?
      false
    end
  end
end
