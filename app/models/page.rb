class Page < ActiveRecord::Base
  has_secure_password
  # validates_uniqueness_of :pagename, :on => :create
  
  before_save :nl2br
  
  private
  
  def nl2br
    # if self.pagebody
    #   self.pagebody = self.pagebody.gsub(/(\r)?\n/, "<br />")
    # end
  end
  
end
