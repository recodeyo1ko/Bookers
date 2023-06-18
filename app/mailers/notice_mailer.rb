class NoticeMailer < ApplicationMailer
  def send_notification(member, event)
    @group = event[:group]
    @title = event[:title]
    @body = event[:body]
    
    @mail = EventMailer.new()
    mail(
      to:   member.email
    )
  end
end
