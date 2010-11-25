class Game < ActiveRecord::Base
  validates :gameid , :presence => true, :uniqueness => true, :format => {:with => /[a-z0-9]+/i}
end
