class Eventtag < ApplicationRecord

  belongs_to :tag
  belongs_to :event
  
end
