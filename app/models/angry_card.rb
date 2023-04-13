class AngryCard < ApplicationRecord
  mount_uploader :image, AngryCardUploader
  mount_uploader :generated_card, AngryCardUploader
  belongs_to :user

  validates :title, presence: true, length: { maximum: 12 }
  validates :body, presence: true, length: { maximum: 52 }

  require 'base64'
  require 'net/http'
  require 'rmagick'
  require 'mini_magick'

  def create_image

    uri = URI('https://api.rinna.co.jp/models/tti/v2')
    request = Net::HTTP::Post.new(uri.request_uri)
    
    request['Content-Type'] = 'application/json'
    request['Cache-Control'] = 'no-cache'
    request['Ocp-Apim-Subscription-Key'] = ENV['JAPANESE_STABELE_DEFUTION_KEY']

    
    request.body = {
      "prompts": title,
      "scale": 7.5
    }.to_json
    
    
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end
    #binding.pry
    status = response.code
    res_body = JSON.parse(response.body)
    b64_image = res_body['image']

    #start = b64_image.index(',') + 1
    #bin = Base64.decode64 b64_image[start .. -1]
    #k = 1
    #File.open("%04d.png" % k, 'wb') do |f|
      #f.write bin
    #end 
    
    # base64エンコード文字をcarrierwaveで画像に変換し保存する
    start = b64_image.index(',') + 1
    bin = Base64.decode64 b64_image[start .. -1]
    file = Tempfile.new(['img', '.png'])
    #binding.pry
    file.binmode
    file << bin
    file.rewind

    file = MiniMagick::Image.read(file)
    file = file.combine_options do |c|
      c.resize '1000x900'
    end

    self.image = file
   #binding.pry
  end
  
  def generate_image
    #binding.pry
    self_id = self.id
    content = add_line_breaks(body)
    #binding.pry

    base_image = MiniMagick::Image.open("app/assets/images/angry_card.png") 
    #binding.pry
    
    #s3_resource = Aws::S3::Resource.new
    #card_image = s3_resource.bucket('angrycard-generator').object(key).get.body.read
    result = base_image.composite(MiniMagick::Image.open("https://angrycard-generator.s3.ap-northeast-1.amazonaws.com/#{self.image.file.path}")) do |config|
      #binding.pry
      config.compose 'Over'
      config.gravity 'center'
      config.geometry '+2-98'
      #binding.pry
    end
  
    result.combine_options do |config|
      #binding.pry
      config.font 'app/assets/fonts/komorebi-gothic.ttf'
      config.fill 'black'
      config.gravity 'NorthWest'  #左上に合わせる
      config.pointsize 85
      config.draw "text 90, 100 '#{title}'"
      config.pointsize 75
      #binding.pry
      config.draw "text 100, 1300 '#{content}'"
    end
    
    # ランダム背景 集中線背景

    # carrierwaveで保存する処理
    self.generated_card = result
  end

  def add_line_breaks(body, n = 13)
    body.scan(/.{1,#{n}}/).join("\n")
  end

  #def prepare_text(text, indention_count)
    #text.to_s.scan(/.{1,#{indention_count}}/)[0..ROW_LIMIT].join("\n")
  #end
    
 

  #def generate_image
    # ogp_creatorでやってるようなことを書く
    
    #from_image = MiniMagick::Image.read(self.image.file.file)
    #frame_image = MiniMagick::Image.read('app/assets/images/angry_card.png')
    #result = from_image.composite(frame_image) do |config|
      #config.compose 'Over'
      #config.gravity 'NorthWest'
      #config.geometry '+0+0'
    #end

    #result.format('png')
    #result.write('public/uploads/angry_card/generated/#{image.id}.png')
    #self.card_ogp = result
  #end

    #from_image = Magick::ImageList.new(self.image.file.file)
    #frame_image = Magick::ImageList.new('app/assets/images/angry_card.png')
    #g_image = from_image.composite(frame_image, 0, 0, Magick::OverCompositeOp)
    
   
    #g_image.write('public/uploads/angry_card/generated/image.png')
    #g_image.to_blob
    
    #file_ogp = Tempfile.new(['ogp', '.png'])
    #file_ogp.binmode
    #file_ogp << g_image
    #file_ogp.rewind

    #self.card_ogp = g_image
    # send_data from_image.to_blob
    #binding.pry
  #end
end
