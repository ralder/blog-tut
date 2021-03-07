class Article < ApplicationRecord
  include Visible
  include AASM

  aasm(:status) do
    state :inactive, initial: true
    state :published, :archived

    event :archive do
      transitions from: [:published, :inactive], to: :archived
    end

    event :publish do
      transitions from: :inactive, to: :published
    end
  end

  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
