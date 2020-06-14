class EmailConfirmationController < ApplicationController
  def update
    confirmation = Confirmation.find_by(token: params[:id])
    

    if confirmation && confirmation.pending? && confirmation.completed!
      user = confirmation.user
      render_ok({message: 'Email confirmed!'})
    else
      render_errors({error: 'Invalid confirmation token, please contact admin.'})
    end
  end
end