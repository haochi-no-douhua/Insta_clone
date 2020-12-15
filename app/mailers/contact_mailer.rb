class ContactMailer < ApplicationMailer
  before_action :set_contact, only:[:show, :edit, :update, :destroy]

  def contact_mail(contact)
    @contact = contact
    mail(from: "haochi.no.douhua@gmail.com", to: ['haochi.no.douhua@gmail.com'], subject: "お問い合わせ確認メール")
  end

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

end
