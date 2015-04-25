class User < ActiveRecord::Base
  before_create :gen_qrcode
  has_many :invitations
  def gen_qrcode
    RQRCode::QRCode.new( "helloapph.herokuapp.com", :size => 4, :level => :h ).to_img_rgba([0,0,0,0],[0,0,0,255]).resize(500,500).save(Rails.root.to_s + "/public/qr_codes/" + email + ".png")
  end
end
