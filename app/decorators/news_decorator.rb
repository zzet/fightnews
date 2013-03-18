class NewsDecorator < ApplicationDecorator
  decorate :news
  delegate_all

end
