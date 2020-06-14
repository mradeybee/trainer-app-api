class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :firstname, :lastname, :username, :email_confirmed,

  def email_confirmed
    confirmation = object.confirmation 
    confirmation ? confirmation.completed? : false 
  end
end
