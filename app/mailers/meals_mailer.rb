class MealsMailer < ActionMailer::Base
  # Create an attachment file with some paperclip aware features
  class AttachmentFile < Tempfile
    attr_accessor :original_filename, :content_type
  end

  # Called whenever a message is received on the movies controller
  def receive(message)
    # For now just take the first attachment and assume there is only one
    attachment = message.attachments.first

#    logger.debug(message.subject)
#    logger.debug(message.attachments.count)

    # Create the micropost
    @email = message.from[0].to_s    # first email address in 'from' array
    @user = User.find_by_email(@email)	# find user by email

puts "***************************"
puts @email

    if @user != nil
puts @user.email

        Micropost.create do |micropost|
 
            micropost.content = message.subject
            micropost.user_id = @user.id

            # Create an AttachmentFile subclass of a tempfile with paperclip aware features and add it
            image_file = AttachmentFile.new('test.jpg')
            image_file.write attachment.decoded.force_encoding("utf-8")
            image_file.flush
            image_file.original_filename = attachment.filename
            image_file.content_type = attachment.mime_type
            micropost.image = image_file
	end
puts "***************************"

#      UserMailer.registration_confirmation(user).deliver

    end
  end
end

