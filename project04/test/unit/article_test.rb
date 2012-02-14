require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "num_edits must be 0 upon creation and must increment upon update" do
    article = Article.new
    assert article.num_edits = 0
    Article.update :article, :title => "Hello"
    assert article.num_edits = 1
  end
end
