module MailerHelper
  # include ApplicationHelper

  def button(href, text, title)
    render(partial: 'mailer/button', locals: {href: href, text: text.html_safe, title: title})
  end

  def image(alt_text, src, width)
    render(partial: 'mailer/image', locals: {alt_text: alt_text, src: src, width: width})
  end

  def li(text)
    render(partial: 'mailer/li', locals: {text: text.html_safe})
  end

  def link(text, url, options = {})
    render(partial: 'mailer/link', locals: {text: text, url: url, options: options})
  end

  def paragraph(text)
    render(partial: 'mailer/paragraph', locals: {text: text.html_safe})
  end

  def ul(items)
    render(partial: 'mailer/ul', locals: {items: items.compact}) if items.try(:compact).present?
  end

  def hr
    render(partial: 'mailer/paragraph', locals: { text: render( partial: 'responsive/responsive_hr') })
  end
 
  def ui_url(path)
   "#{Rails.configuration.x.urls.ui_app}/#{path}"
  end
end
