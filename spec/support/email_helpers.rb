module EmailHelpers
  def emails_with_subject(subject)
    ActionMailer::Base
      .deliveries
      .select { |m| m.subject.include?(subject) }
  end

  def email_with_subject(subject)
    emails_with_subject(subject).last
  end
end
