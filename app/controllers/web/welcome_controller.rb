class Web::WelcomeController < Web::ApplicationController
  def index
    @hot_news = News.web.hot.limit(5)
    @last_news = News.web.exclude(@hot_news).limit(5)
  end
end
