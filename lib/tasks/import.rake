# encoding: UTF-8
require File.expand_path('../../../config/environment', __FILE__)

begin
  namespace :import do

    desc "Import data from old DB"
    task :all do

      count = Legacy::User.count
      puts "We need import #{count} users"
      puts "Start"

      start = Time.now

      Legacy::User.find_each do |legacy_user|
        unless legacy_user.uid == 0
          unless NewOldRelationship.find_by_old_item_id_and_new_item_type(legacy_user.uid, "User")

            @user = User.new
            @user.email = legacy_user.mail
            @user.init_email = legacy_user.init
            @user.nickname = legacy_user.name
            @user.created_at = Time.at(legacy_user.created)
            #@user.updated_at = Time.at(legacy_user.changed)
            @user.state = :active
            @user.state = :banned if legacy_user.banned?

            if @user.save
              @user.create_new_old_relationship(old_item_id: legacy_user.uid)
              puts "USER:: Move user #{legacy_user.name} in #{Time.now}"

              @user.remote_avatar_url = legacy_user.avatar
              if @user.save
                puts "Update user avatar"
              else
                puts "Errors while update user avatar"
                p legacy_user.avatar
                p @user.errors
              end

            else
              puts "USER:: Error while move user #{legacy_user.name} in #{Time.now}"
              p @user.errors
            end
          else
            uonr = NewOldRelationship.find_by_old_item_id_and_new_item_type(legacy_user.uid, "User")
            u = uonr.new_item
            unless u.state
              u.state = :active
              if u.save
                puts "Update user state"
              else
                puts "Error while update user state"
                p u.errors
              end
            end

            if u.avatar.blank?
              u.remote_avatar_url = legacy_user.avatar
              if u.save
                puts "Update user avatar"
              else
                puts "Errors while update user avatar"
                p legacy_user.avatar
                p u.errors
              end
            end

            puts "USER:: Skip user #{legacy_user.name} in #{Time.now}"
          end
        end
      end

      endwork = Time.now
      puts "USER:: Import was in #{endwork - start} times"

      # Import Articles

      count = Legacy::Story.actual.count
      puts "We need import #{count} story"
      puts "Start"
      start_time = Time.now

      step = 0


      Legacy::Story.actual.find_each do |legacy_article|
        categories = legacy_article.categories

        step += 1

        cats = []

        is_hot = false
        is_news = false
        is_interview = false
        is_article = true
        is_undefined = false

        categories.each do |cat|
          if cat
            unless cats.include?(cat.name)
              p "CATEGORY:: #{cat.name}"
              cats << cat.name
            end

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

        unless is_undefined

          Importer.article_from_story(legacy_article, is_hot) if is_article
          Importer.interview_from_story(legacy_article, is_hot) if is_interview
          Importer.news_from_story(legacy_article, is_hot) if is_news

        end

        p "INFO:: #{count - step} left"
        #image
        #file
        #UrlAliase
      end

      end_time = Time.now
      puts "STORY:: Import was in #{end_time - start_time} times"


      count = Legacy::Blog.actual.count
      puts "We need import #{count} blog"
      puts "Start"
      start_time = Time.now

      step = 0


      Legacy::Blog.actual.find_each do |legacy_article|
        categories = legacy_article.categories

        step += 1

        is_hot = false
        is_news = false
        is_interview = false
        is_article = true
        is_undefined = false

        cats = []

        categories.each do |cat|
          if cat
            unless cats.include?(cat.name)
              p "CATEGORY:: #{cat.name}"
              cats << cat.name
            end

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

        unless is_undefined

          Importer.article_from_blog(legacy_article, is_hot) if is_article
          Importer.interview_from_blog(legacy_article, is_hot) if is_interview
          Importer.news_from_blog(legacy_article, is_hot) if is_news

        end

        p "INFO:: #{count - step} left"
        #image
        #file
        #UrlAliase
      end
      end_time = Time.now
      puts "BLOG:: Import was in #{end_time - start_time} times"

    end
  end
end
