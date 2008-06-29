class Note < ActiveRecord::Base
  
  belongs_to :user

  before_create :random_give_points
  named_scope :latest, :order => "id DESC"
  named_scope :hotest, :order => "points DESC, id DESC"
  validates_presence_of :nickname, :message =>" cant be null"

  validates_presence_of :content, :message => "cant be null"
  validates_length_of :nickname,:maximum =>20, :message =>"太長了！短一點！"
  validates_length_of :content,:maximum =>40, :message =>"太長了！短一點！"

  def self.pick
    self.latest.rand
  end
  protected
  def random_give_points
    self.points = rand(9999)
  end
end
