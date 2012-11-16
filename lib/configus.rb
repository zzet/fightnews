# encoding: utf-8

Configus.build Rails.env do
  env :production do
    pagination do
      per_page_values [5, 10, 20, 50]
    end
  end

  env :staging, :parent => :production do
  end

  env :development, :parent => :production do
  end

  env :test, :parent => :development
end
