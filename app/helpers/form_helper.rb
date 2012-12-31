module FormHelper
  def setup_richtext_block(block)
    block.richtext ||= Richtext.new
    block.video ||= Video.new
    block.twitter_board ||= TwitterBoard.new
    block.image ||= Image.new
    block
  end
end