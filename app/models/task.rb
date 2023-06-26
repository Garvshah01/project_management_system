class Task < ApplicationRecord

  STATUS = { to_do: 0, in_progress: 1, in_review: 2, in_test: 3, done: 4 }.freeze

  enum status: STATUS

  has_many :logs
  accepts_nested_attributes_for :logs
  has_many_attached :assets
  act_as_taggable_on :labels

  validates :description, presence: true
  validate :change_state_after_done

  def change_state_after_done
    errors.add :base, 'Never assign to anyone after task completed' if status_was == 'done'
  end

end

