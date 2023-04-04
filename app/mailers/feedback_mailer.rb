class FeedbackMailer < ApplicationMailer
  def new_feedback(feedback)
    @feedback = feedback
    @greeting = "Заявка отправлена"
    mail(to: "vadimkozelskij28@gmail.com", subject: "New Feedback")
  end
end
