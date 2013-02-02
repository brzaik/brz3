module FormHelper
  def setup_richtext_block(block)
    block.richtext ||= Richtext.new
    block.link ||= Link.new
    block.quote ||= Quote.new
    block.video ||= Video.new
    block.twitter_board ||= TwitterBoard.new
    block.image ||= Image.new
    block
  end
end