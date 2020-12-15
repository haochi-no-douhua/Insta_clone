class SendgridUtils
  def initialize(settings)
    @settings = settings
  end
  def deliver!(mail)
    from = SendGrid::Email.new(email: mail.from.first)
    mail.to.each do |to_list|
      to = SendGrid::Email.new(email: to_list)
      subject = mail.subject
      content = SendGrid::Content.new(type: 'text/html', value: mail.body.raw_source)
      sg_mail = SendGrid::Mail.new(from, subject, to, content)
      sg = SendGrid::API.new(api_key: @settings[:api_key])
      response = sg.client.mail._('send').post(request_body: sg_mail.to_json)
      puts response.status_code
    end
  end
end
