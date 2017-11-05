class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :file,      :attachment => true

  attribute :message
  attribute :nickname,  :captcha  => true

   def headers
    {
      :subject => "Halal Go Where - Contact Form",
      :to => "regent.chien@hotmail.sg",
      :from => %("#{name}" <#{email}>)
    }
  end


end