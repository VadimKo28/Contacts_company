class FeedbackMailer < ApplicationMailer

  def new_feedback(feedback)
    @feedback = feedback
    @greeting = "Заявка отправлена"
    mail to: "vadim.kozelskij@mail.ru", subject: "New Feedback"
  end
end
