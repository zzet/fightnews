# encoding: UTF-8
require File.expand_path('../../../config/environment', __FILE__)
begin
  namespace :import do

    desc "Import data from old DB"
    task :all do

#      count = Legacy::User.count
      #puts "We need import #{count} users"
      #puts "Start"

      #start = Time.now

      #Legacy::User.find_each do |legacy_user|
        #unless legacy_user.uid == 0
          #unless NewOldRelationship.find_by_old_item_id_and_new_item_type(legacy_user.uid, "User")

            #@user = User.new
            #@user.email = legacy_user.mail
            #@user.init_email = legacy_user.init
            #@user.nickname = legacy_user.name
            #@user.created_at = Time.at(legacy_user.created)
            ##@user.updated_at = Time.at(legacy_user.changed)
            #@user.state = :banned if legacy_user.banned?

            #if @user.save
              #@user.create_new_old_relationship(old_item_id: legacy_user.uid)
              #puts "USER:: Move user #{legacy_user.name} in #{Time.now}"
            #else
              #puts "USER:: Error while move user #{legacy_user.name} in #{Time.now}"
              #p @user.errors
            #end
          #else
            #puts "USER:: Skip user #{legacy_user.name} in #{Time.now}"
          #end
        #end
      #end

      #endwork = Time.now
      #puts "USER:: Import was in #{endwork - start} times"

      # Import Articles

      count = Legacy::Story.actual.count
      puts "We need import #{count} article"
      puts "Start"
      step = 0


      Legacy::Story.actual.find_each do |legacy_article|
        categories = legacy_article.categories
        step += 1

        article = nil

        is_hot = false
        is_news = false
        is_interview = false
        is_article = true
        categories.each do |cat|
          if cat
            case cat.name
            when "Горячая тема"
              is_hot = true
              categories.delete(cat)
            when "Интервью"
              is_interview = true
              is_article = false
              categories.delete(cat)
            when "Статьи"
              is_article = true
              categories.delete(cat)
            when "Новости"
              is_news = true
              is_article = false
              categories.delete(cat)
            #when "Ring card girls"
            #when "Рейтинги"
            else
              p "UNDEFINED:: Category #{cat.name}"
            end
          end
        end

        article = Article.new if is_article
        article = Interview.new if is_interview
        article = News.new if is_news

        old_rel = NewOldRelationship.find_by_old_item_id(legacy_article.nid)
        unless old_rel && (["Article", "News", "Interview"].include? old_rel.new_item_type)

          p "PROCESSED:: Node nid #{legacy_article.nid} type #{legacy_article.sti}"

          article.title = legacy_article.title
          article.body = legacy_article.body
          article.description = legacy_article.description
          article.source = legacy_article.source
          article.created_at = Time.at(legacy_article.created)
          article.hot = is_hot
          #article.updated_at = Time.at(legacy_article.changed)
          article.autor_id = User.find_by_old_id(legacy_article.uid)

          article.state = :unpublished
          article.state = :published if legacy_article.status == "1"

          if article.save

            legacy_article.tags.each do |legacy_tag|
              if legacy_tag
                tag = Tag.find_by_name(legacy_tag.name)
                if tag
                  if is_article
                    article.article_tags.create(tag_id: tag.id) unless article.article_tags.find_by_tag_id(tag.id)
                  end
                  if is_news
                    article.news_tags.create(tag_id: tag.id) unless article.news_tags.find_by_tag_id(tag.id)
                  end
                  if is_interview
                    article.interview_tags.create(tag_id: tag.id) unless article.interview_tags.find_by_tag_id(tag.id)
                  end
                else
                  new_tag = Tag.create(name: legacy_tag.name)
                  new_tag.create_new_old_relationship(old_item_id: legacy_tag.tid)

                  article.article_tags.create(tag_id: new_tag.id) if is_article
                  article.news_tags.create(tag_id: new_tag.id) if is_news
                  article.interview_tags.create(tag_id: new_tag.id) if is_interview

                  puts "TAG: Move tag #{legacy_tag.name} in #{Time.now}"
                end
              end
            end
            if legacy_article.categories.count > 1
              legacy_article.categories.each do |legacy_category|
                if legacy_category
                  category = Category.find_by_name(legacy_category.name)
                  if category
                    if is_article
                      article.article_categories.create(category_id: category.id) unless article.article_categories.find_by_category_id(category.id)
                    end
                    if is_news
                      article.news_categories.create(category_id: category.id) unless article.news_categories.find_by_category_id(category.id)
                    end
                    if is_interview
                      article.interview_categories.create(category_id: category.id) unless article.interview_categories.find_by_category_id(category.id)
                    end
                  else
                    new_category = Category.create(name: legacy_category.name)
                    new_category.create_new_old_relationship(old_item_id: legacy_category.tid)

                    article.article_categories.create(category_id: new_category.id) if is_article
                    article.news_categories.create(category_id: new_category.id) if is_news
                    article.interview_categories.create(category_id: new_category.id) if is_interview

                    puts "CATEGORY: Move tag #{legacy_category.name} in #{Time.now}"
                  end
                end
              end
            end

            article.create_new_old_relationship(old_item_id: legacy_article.nid)
            puts "ARTICLE: Move article #{article.title} in #{Time.now}" if is_article
            puts "NEWS: Move news #{article.title} in #{Time.now}" if is_news
            puts "INTERVIEW: Move interview #{article.title} in #{Time.now}" if is_interview
          else
            puts "ARTICLE: Error while move article #{legacy_article.title} in #{Time.now}" if is_article
            puts "NEWS: Error while move news #{legacy_article.title} in #{Time.now}" if is_news
            puts "INTERVIEW: Error while move interview #{legacy_article.title} in #{Time.now}" if is_interview
            p article.errors
          end
        else
          puts "ARTICLE: Skip article #{legacy_article.title}" if is_article
          puts "NEWS: Skip news #{legacy_article.title}" if is_news
          puts "INTERVIEW: Skip interview #{legacy_article.title}" if is_interview
        end
        p "INFO:: #{count - step} left"
        #image
        #file
        #UrlAliase
      end

      #Legacy::Story.actual.find_each do |legacy_article|
      #atricle = Article.new

      #article.title = legacy_article.title
      #article.body = legacy_article.body
      #article.description = legacy_article.description
      #article.source = legacy_article.source
      #legacy_article.tags.each do |legacy_tag|
      #tag = Tag.find_by_name(legacy_tag)
      #if tag
      #article.article_tags.crate(tag_id: tag.id) unless article.tags.find(tag.id)
      #else
      #article.tags.create(name: legacy_tag.name)
      #end
      #end
      #legacy_article.categories.each do |legacy_category|
      #category = Category.find_by_name(legacy_category)
      #if category
      #article.article_categories.crate(category_id: category.id) unless article.categories.find(category.id)
      #else
      #article.categories.create(name: legacy_category.name)
      #end
      #end
      #article.state = :unpublished
      #article.state = :published if legacy_article.status == "1"
      ##image
      ##file
      ##UrlAliase
      #end


    end
  end
end
