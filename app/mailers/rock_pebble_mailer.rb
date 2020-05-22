class RockPebbleMailer < ApplicationMailer
  def confirmation_message(address, info)
    pebble = info[:name]
    @message = "#{pebble} has requested you as a Rock through the Rock and Pebble
                Program on Paired.tech. Please visit #{paired_link} to accept or deny
                this request."
    mail(to: address, subject: "Someone has requested you as a Rock!")
  end

  def rock_accepted_message(address, info)
    rock = info[:name]
    @message = "#{rock} has accepted your Rock request. Please use their contact
                information provided in your Paired Rock and Pebble dashboard
                to get in touch with them and say Hi!"
    mail(to: address, subject: "Your Rock request has been accepted!")
  end

  def rock_denied_message(address, reason)
    @message = "Your Rock request was unfortunately not accepted. The reason
                given was: #{reason}. Even though this request did not work out
                please go to #{paired_link} and request someone else as your Rock!"
    mail(to: address, subject: "Your Rock request was not accepted.")
  end

  def pebble_relationship_terminated(address, reason)
    @message = "Your Rock has decided to end your Rock and Pebble relationship.
                The reason given is: #{reason}. Please feel free to follow up with
                any feedback that you may have (always be specific, actionable and kind!)
                or just to say 'Thanks' for the time given mentoring. You can go
                to #{paired_link} to sign up for a new Rock at any time!"
    mail(to: address, subject: "Your Rock & Pebble relationship has come to an end.")
  end

  def rock_relationship_terminated(address, reason)
    @message = "Your Pebble has decided to end your Rock and Pebble relationship.
                The reason given is: #{reason}. You can go to #{paired_link}
                if you wish to opt out of being a Rock otherwise you will be added
                back into the list of available people."
    mail(to: address, subject: "Your Rock & Pebble relationship has come to an end.")
  end

  def paired_link
    'https://www.paired.tech'
  end
end
