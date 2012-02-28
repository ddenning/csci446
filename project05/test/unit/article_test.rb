require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "num_edits must be 0 upon creation" do
    article = new_article
    assert article.num_edits = 0
  end

  test "num_edits must increment upon update" do
  	article = new_article
  	article.save
  	assert article.num_edits = 1
  	article.save
  	assert article.num_edits = 2
  end

  test "article attributes must not be empty" do
  	article = Article.new

  	assert article.invalid?
  	assert article.errors[:title].any?
  	assert article.errors[:author].any?
  	assert article.errors[:body].any?
  end

  test "article author must not be pat" do
  	article = Article.new( title: "title",
  												body: "body")

  	article.author = "pat"
  	assert article.invalid?

  	article.author = "Me"
  	assert article.valid?
  end

  def new_article
  	Article.new(title: "title",
  							author: "author",
  							body: "body")
  end

end
