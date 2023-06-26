class User < ApplicationRecord

  ROLE = { developer: 0, tester: 1, designer: 2, manager: 3 }.freeze
  enum role: ROLE

  has_many :assigned_task, class_name: 'Log', foreign_key: :assignee_id
  has_many :tasks, through: :assigned_task

  validates :name, :email, :role, presence: true

end



