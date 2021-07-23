class Event < ApplicationRecord
 
 belongs_to :actor
 belongs_to :repo

 enum event_type: [:PushEvent, :ReleaseEvent, :WatchEvent] 

 validates :event_type, inclusion: { in: event_types.keys }
 validates :repo, presence: true
 validates :event_type, presence: true


end
