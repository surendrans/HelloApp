class Invitation < ActiveRecord::Base
  belongs_to :user
  before_save :gen_qrcode
  def gen_qrcode
    code =  Time.now.to_i.to_s
    RQRCode::QRCode.new( code,
     :size => 4,
     :level => :h ).to_img_rgba([0,0,0,0],[0,0,0,255]).resize(500,500).save("public/qr_codes/invitations/" + code + ".png")
    self.qr_code_url = "https://helloapph.herokuapp.com/qr_codes/invitations/" + code + ".png"
    self.code = code
  end
end
