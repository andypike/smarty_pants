module EmailHelpers
  def mails_with_subject(subject)
    ActionMailer::Base
      .deliveries
      .select { |m| m.subject.include?(subject) }
  end
end
