# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def new_post_notification
    @user = params[:recipient]
    @post = params[:post]

    mail(to: @user.email, subject: "There is been a new reply in #{@post.discussion.name}")
  end
end
