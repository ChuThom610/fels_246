class Word < ApplicationRecord
  belongs_to :language
  belongs_to :category, optional: true
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
  has_many :results
  has_many :lesson_words
  has_many :lessons, through: :lesson_words

  validates :name, presence: true,
    length: {maximum: Settings.model.words.name.maximum}
  validates :meaning, presence: true,
    length: {maximum: Settings.model.words.meaning.maximum}

  scope :load_words, (lambda do
    select(:id, :name, :meaning).order :name
  end)
end
