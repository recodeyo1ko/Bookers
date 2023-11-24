class NoticeMailer < ApplicationMailer
  def send_notification(group, event)
    @group = event[:group]
    @title = event[:title]
    @body = event[:body]
    
    @mail = NoticeMailer.new()
    mail(
      # to:   member.email
      to:'xxxx.test', subject: 'Action Mailerからのお知らせ'
    )
  end

  def self.send_notifications_to_group(event)
    group = event[:group]
    # group.users.each do |member|
    NoticeMailer.send_notification(group, event).deliver_now
    # end
  end
  
end
