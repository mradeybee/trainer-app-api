class ApplicationMailer < ActionMailer::Base
  default from: 'no_reply@example.com'
  layout 'mailer'
  helper 'mailer'

  def catch_mailer_exceptions(options = {}, &block)
    if Rails.env.production? || Rails.env.test?
      begin
        yield
      rescue  EOFError,
          IOError,
          Timeout::Error,
          Errno::ECONNRESET,
          Errno::ECONNABORTED,
          Errno::EPIPE,
          Errno::ETIMEDOUT,
          Net::SMTPAuthenticationError,
          Net::SMTPServerBusy,
          Net::SMTPSyntaxError,
          Net::SMTPUnknownError,
          OpenSSL::SSL::SSLError => e
        raise e
      rescue Exception => e
        Rails.logger.error "Error while sending email: #{e}"
      end
    else
      yield
    end
  end

  def send_mail(*args)
    mailer_name = caller_locations(1, 1)[0].label.sub('block in ', '')

    mail(*args) do |format|
      format.html { render "#{mailer_name}.erb" }
      format.text { render "#{mailer_name}.erb" }
    end
  end
end
