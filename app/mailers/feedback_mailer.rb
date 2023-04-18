class FeedbackMailer < ApplicationMailer

  def new_feedback(feedback)
    @feedback = feedback
    @greeting = "Заявка отправлена"
    mail to: "", subject: "New Feedback"
  end
end
