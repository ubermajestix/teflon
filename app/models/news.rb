class News < ActiveRecord::Base
  belongs_to :user
  
  before_save :add_user
  
  def add_user
    self.user_id = 2
  end
  
  def body_html
     RedCloth.new(self.body).to_html
  end

end
