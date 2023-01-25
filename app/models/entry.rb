class Entry < ApplicationRecord
  validates :song_title, presence: true
  validates :year, presence: true
  validates :composer, presence: true
  validates :key, presence: true
  validates :video_url, presence: true
end
