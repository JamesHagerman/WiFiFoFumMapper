class AccessPoint < ActiveRecord::Base
  attr_accessible :ap_type, :channel, :encryption_type, :first_seen, :last_seen, :mac, :ssid, :strength
end
