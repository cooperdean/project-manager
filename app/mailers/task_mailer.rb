class TaskMailer < ApplicationMailer

  default from: "answersawesome@gmail.com"

  def notify_project_owner(task)

    @task = task
    mail(to: task.project.user_email, subject: "Task Added")

  end

end
