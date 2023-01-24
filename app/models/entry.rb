class Entry < ApplicationRecord
  validates :song_title, presence: true
  validates :year, presence: true
  validates :composer, presence: true
  validates :key, presence: true
end
