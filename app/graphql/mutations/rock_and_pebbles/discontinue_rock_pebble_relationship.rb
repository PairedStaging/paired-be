module Mutations
    module RockAndPebbles
      class DiscontinueRockPebbleRelationship < ::Mutations::BaseMutation
        argument :id, ID, required: true
        argument :reason, String, required: true
        argument :relationship, ID, required: true
        type Types::RockAndPebbleType
  
        def resolve(attributes)
          rock_and_pebble = RockAndPebble.find(attributes[:relationship])
          send_pebble_email(rock_and_pebble, attributes)
  
          rock_and_pebble.update(active: false)
        end
  
        private
  
        def send_pebble_email(rock_and_pebble, attributes)
          user = User.find(attributes[:id])
          if user.id == rock_and_pebble.rock_id
            reason = attributes[:reason]
            info = rock_and_pebble.rock_pebble_info
            NotificationsWorker.rock_pebble_message(info, reason, :rock_denied_message)
          else 
            reason = attributes[:reason]
            info = rock_and_pebble.rock_pebble_info
            NotificationsWorker.rock_pebble_message(info, reason, :rock_denied_message)
          end 
        end
      end
    end
  end
  