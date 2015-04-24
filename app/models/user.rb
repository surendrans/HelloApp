class User < ActiveRecord::Base
  before_create :gen_qrcode

  def gen_qrcode
  end
end
