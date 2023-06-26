class Log < ApplicationRecord

  STATUS = { to_do: 0, in_progress: 1, in_review: 2, in_test: 3, done: 4 }.freeze

  enum status: STATUS

  belongs_to :task
  belongs_to :assigned_user, class_name: 'User', foreign_key: :assignee_id, optional: true
  belongs_to :assignor, class_name: 'User'

  before_save :change_task_status


  private def change_task_status
    task.update_columns(status: status)
  end

end
