module ApplicationHelper
  def card_image_url(card)
    prefix = card.number.split('-')[0].downcase
    "http://www.yugiohcardguide.com/images/#{prefix}/#{card.number}.jpg"
  end
end
