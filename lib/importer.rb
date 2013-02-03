class Importer
  class << self

    def article_from_story(story, is_hot)
      article = Article.new

      old_rel = NewOldRelationship.find_by_old_item_id_and_new_item_type(story.nid, "Article")
      unless old_rel
        p "PROCESSED:: article nid #{story.nid}"

        article.title = story.title
        article.body = story.body
        article.description = story.description
        article.source = story.source
        article.created_at = Time.at(story.created)
        article.hot = is_hot
        #article.updated_at = Time.at(story.changed)
        article.autor_id = User.find_by_old_id(story.uid)

        article.state = :unpublished
        article.state = :published if story.status.to_s == "1"

        if article.save

          story.tags.each do |legacy_tag|
            if legacy_tag
              tag = Tag.find_by_name(legacy_tag.name)
              if tag
                article.article_tags.create(tag_id: tag.id) unless article.article_tags.find_by_tag_id(tag.id)
              else
                new_tag = Tag.create(name: legacy_tag.name)
                new_tag.create_new_old_relationship(old_item_id: legacy_tag.tid)

                article.article_tags.create(tag_id: new_tag.id)

                puts "TAG: Move tag #{legacy_tag.name} in #{Time.now}"
              end
            end
          end

          story.categories.each do |legacy_category|
            if legacy_category
              category = Category.find_by_name(legacy_category.name)
              if category
                article.article_categories.create(category_id: category.id) unless article.article_categories.find_by_category_id(category.id)
              else
                new_category = Category.create(name: legacy_category.name)
                new_category.create_new_old_relationship(old_item_id: legacy_category.tid)

                article.article_categories.create(category_id: new_category.id)

                puts "CATEGORY: Move tag #{legacy_category.name} in #{Time.now}"
              end
            end
          end

          article.create_new_old_relationship(old_item_id: story.nid)
          puts "ARTICLE: Move article #{article.title} in #{Time.now}"
        else
          puts "ARTICLE: Error while move article #{story.title} in #{Time.now}"
          p article.errors
        end
      else
        article = old_rel.new_item
        #if article.photo.blank?
        if article.photo.blank? && !article.description.blank?
          article.remote_photo_url = story.image
          if article.save
            p "Update article photo image"
          else
            p "Errors while update article photo image"
            p story.image
            p article.errors
          end
        else
          p "Photo exist OR desc blank"
        end
        puts "ARTICLE: Skip article #{story.title}"
      end
    end

    def interview_from_story(story, is_hot)
      interview = Interview.new

      old_rel = NewOldRelationship.find_by_old_item_id_and_new_item_type(story.nid, "Interview")
      unless old_rel
        p "PROCESSED:: interview nid #{story.nid}"

        interview.title = story.title
        interview.body = story.body
        interview.description = story.description
        interview.source = story.source
        interview.created_at = Time.at(story.created)
        interview.hot = is_hot
        #interview.updated_at = Time.at(story.changed)
        interview.autor_id = User.find_by_old_id(story.uid)

        interview.state = :unpublished
        interview.state = :published if story.status.to_s == "1"

        if interview.save

          story.tags.each do |legacy_tag|
            if legacy_tag
              tag = Tag.find_by_name(legacy_tag.name)
              if tag
                interview.interview_tags.create(tag_id: tag.id) unless interview.interview_tags.find_by_tag_id(tag.id)
              else
                new_tag = Tag.create(name: legacy_tag.name)
                new_tag.create_new_old_relationship(old_item_id: legacy_tag.tid)

                interview.interview_tags.create(tag_id: new_tag.id)

                puts "TAG: Move tag #{legacy_tag.name} in #{Time.now}"
              end
            end
          end
          story.categories.each do |legacy_category|
            if legacy_category
              category = Category.find_by_name(legacy_category.name)
              if category
                interview.interview_categories.create(category_id: category.id) unless interview.interview_categories.find_by_category_id(category.id)
              else
                new_category = Category.create(name: legacy_category.name)
                new_category.create_new_old_relationship(old_item_id: legacy_category.tid)

                interview.interview_categories.create(category_id: new_category.id)

                puts "CATEGORY: Move tag #{legacy_category.name} in #{Time.now}"
              end
            end
          end

          interview.create_new_old_relationship(old_item_id: story.nid)
          puts "interview: Move interview #{interview.title} in #{Time.now}"
        else
          puts "interview: Error while move interview #{story.title} in #{Time.now}"
          p interview.errors
        end
      else
        interview = old_rel.new_item
        #if interview.photo.blank?
        if interview.photo.blank? && !interview.description.blank?
          interview.remote_photo_url = story.image
          if interview.save
            p "Update interview photo image"
          else
            p "Errors while update interview photo image"
            p story.image
            p interview.errors
          end
        else
          p "Photo exist OR desc blank"
        end

        puts "interview: Skip interview #{story.title}"
      end
    end

    def news_from_story(story, is_hot)
      news = News.new

      old_rel = NewOldRelationship.find_by_old_item_id_and_new_item_type(story.nid, "News")
      unless old_rel
        p "PROCESSED:: News nid #{story.nid}"

        news.title = story.title
        news.body = story.body
        news.description = story.description
        news.source = story.source
        news.created_at = Time.at(story.created)
        news.hot = is_hot
        #news.updated_at = Time.at(story.changed)
        news.autor_id = User.find_by_old_id(story.uid)

        news.state = :unpublished
        news.state = :published if story.status.to_s == "1"

        if news.save

          story.tags.each do |legacy_tag|
            if legacy_tag
              tag = Tag.find_by_name(legacy_tag.name)
              if tag
                news.news_tags.create(tag_id: tag.id) unless news.news_tags.find_by_tag_id(tag.id)
              else
                new_tag = Tag.create(name: legacy_tag.name)
                new_tag.create_new_old_relationship(old_item_id: legacy_tag.tid)

                news.news_tags.create(tag_id: new_tag.id)

                puts "TAG: Move tag #{legacy_tag.name} in #{Time.now}"
              end
            end
          end
          story.categories.each do |legacy_category|
            if legacy_category
              category = Category.find_by_name(legacy_category.name)
              if category
                news.news_categories.create(category_id: category.id) unless news.news_categories.find_by_category_id(category.id)
              else
                new_category = Category.create(name: legacy_category.name)
                new_category.create_new_old_relationship(old_item_id: legacy_category.tid)

                news.news_categories.create(category_id: new_category.id)

                puts "CATEGORY: Move tag #{legacy_category.name} in #{Time.now}"
              end
            end
          end

          news.create_new_old_relationship(old_item_id: story.nid)
          puts "NEWS: Move news #{news.title} in #{Time.now}"
        else
          puts "NEWS: Error while move news #{story.title} in #{Time.now}"
          p news.errors
        end
      else
        news = old_rel.new_item
        #if news.photo.blank?
        if news.photo.blank? && !news.description.blank?
          news.remote_photo_url = story.image
          if news.save
            p "Update news photo image"
          else
            p "Errors while update news photo image"
            p story.image
            p news.errors
          end
        else
          p "Photo exist OR desc is blank"
        end

        puts "NEWS: Skip news #{story.title}"
      end

    end

    def article_from_blog(blog, is_hot)
      article = Article.new

      old_rel = NewOldRelationship.find_by_old_item_id_and_new_item_type(blog.nid, "Article")
      unless old_rel
        p "PROCESSED:: article nid #{blog.nid}"

        article.title = blog.title
        article.body = blog.body
        article.description = blog.description
        article.source = blog.source
        article.created_at = Time.at(blog.created)
        article.hot = is_hot
        #article.updated_at = Time.at(blog.changed)
        article.autor_id = User.find_by_old_id(blog.uid)

        article.state = :unpublished
        article.state = :published if blog.status.to_s == "1"

        if article.save

          blog.tags.each do |legacy_tag|
            if legacy_tag
              tag = Tag.find_by_name(legacy_tag.name)
              if tag
                article.article_tags.create(tag_id: tag.id) unless article.article_tags.find_by_tag_id(tag.id)
              else
                new_tag = Tag.create(name: legacy_tag.name)
                new_tag.create_new_old_relationship(old_item_id: legacy_tag.tid)

                article.article_tags.create(tag_id: new_tag.id)

                puts "TAG: Move tag #{legacy_tag.name} in #{Time.now}"
              end
            end
          end

          blog.categories.each do |legacy_category|
            if legacy_category
              category = Category.find_by_name(legacy_category.name)
              if category
                article.article_categories.create(category_id: category.id) unless article.article_categories.find_by_category_id(category.id)
              else
                new_category = Category.create(name: legacy_category.name)
                new_category.create_new_old_relationship(old_item_id: legacy_category.tid)

                article.article_categories.create(category_id: new_category.id)

                puts "CATEGORY: Move tag #{legacy_category.name} in #{Time.now}"
              end
            end
          end

          article.create_new_old_relationship(old_item_id: blog.nid)
          puts "article: Move article #{article.title} in #{Time.now}"
        else
          puts "article: Error while move article #{blog.title} in #{Time.now}"
          p article.errors
        end
      else
        article = old_rel.new_item
        #if article.photo.blank?
        if article.photo.blank? && !article.description.blank?
          article.remote_photo_url = blog.image
          if article.save
            p "Update article photo image"
          else
            p "Errors while update article photo image"
            p blog.image
            p article.errors
          end
        else
          p "Photo exist OR description is Blank"
        end

        puts "article: Skip article #{blog.title}"
      end
    end

    def interview_from_blog(blog, is_hot)
      interview = Interview.new

      old_rel = NewOldRelationship.find_by_old_item_id_and_new_item_type(blog.nid, "Interview")
      unless old_rel
        p "PROCESSED:: interview nid #{blog.nid}"

        interview.title = blog.title
        interview.body = blog.body
        interview.description = blog.description
        interview.source = blog.source
        interview.created_at = Time.at(blog.created)
        interview.hot = is_hot
        #interview.updated_at = Time.at(blog.changed)
        interview.autor_id = User.find_by_old_id(blog.uid)

        interview.state = :unpublished
        interview.state = :published if blog.status.to_s == "1"

        if interview.save

          blog.tags.each do |legacy_tag|
            if legacy_tag
              tag = Tag.find_by_name(legacy_tag.name)
              if tag
                interview.interview_tags.create(tag_id: tag.id) unless interview.interview_tags.find_by_tag_id(tag.id)
              else
                new_tag = Tag.create(name: legacy_tag.name)
                new_tag.create_new_old_relationship(old_item_id: legacy_tag.tid)

                interview.interview_tags.create(tag_id: new_tag.id)

                puts "TAG: Move tag #{legacy_tag.name} in #{Time.now}"
              end
            end
          end
          blog.categories.each do |legacy_category|
            if legacy_category
              category = Category.find_by_name(legacy_category.name)
              if category
                interview.interview_categories.create(category_id: category.id) unless interview.interview_categories.find_by_category_id(category.id)
              else
                new_category = Category.create(name: legacy_category.name)
                new_category.create_new_old_relationship(old_item_id: legacy_category.tid)

                interview.interview_categories.create(category_id: new_category.id)

                puts "CATEGORY: Move tag #{legacy_category.name} in #{Time.now}"
              end
            end
          end

          interview.create_new_old_relationship(old_item_id: blog.nid)
          puts "interview: Move interview #{interview.title} in #{Time.now}"
        else
          puts "interview: Error while move interview #{blog.title} in #{Time.now}"
          p interview.errors
        end
      else
        interview = old_rel.new_item
        #if interview.photo.blank?
        if interview.photo.blank? && !interview.description.blank?
          interview.remote_photo_url = blog.image
          if interview.save
            p "Update interview photo image"
          else
            p "Errors while update interview photo image"
            p blog.image
            p interview.errors
          end
        else
          p "Photo exist OR description is Blank"
        end

        puts "interview: Skip interview #{blog.title}"
      end
    end

    def news_from_blog(blog, is_hot)
      news = News.new

      old_rel = NewOldRelationship.find_by_old_item_id_and_new_item_type(blog.nid, "News")
      unless old_rel
        p "PROCESSED:: News nid #{blog.nid}"

        news.title = blog.title
        news.body = blog.body
        news.description = blog.description
        news.source = blog.source
        news.created_at = Time.at(blog.created)
        news.hot = is_hot
        #news.updated_at = Time.at(blog.changed)
        news.autor_id = User.find_by_old_id(blog.uid)

        news.state = :unpublished
        news.state = :published if blog.status.to_s == "1"

        if news.save

          blog.tags.each do |legacy_tag|
            if legacy_tag
              tag = Tag.find_by_name(legacy_tag.name)
              if tag
                news.news_tags.create(tag_id: tag.id) unless news.news_tags.find_by_tag_id(tag.id)
              else
                new_tag = Tag.create(name: legacy_tag.name)
                new_tag.create_new_old_relationship(old_item_id: legacy_tag.tid)

                news.news_tags.create(tag_id: new_tag.id)

                puts "TAG: Move tag #{legacy_tag.name} in #{Time.now}"
              end
            end
          end
          blog.categories.each do |legacy_category|
            if legacy_category
              category = Category.find_by_name(legacy_category.name)
              if category
                news.news_categories.create(category_id: category.id) unless news.news_categories.find_by_category_id(category.id)
              else
                new_category = Category.create(name: legacy_category.name)
                new_category.create_new_old_relationship(old_item_id: legacy_category.tid)

                news.news_categories.create(category_id: new_category.id)

                puts "CATEGORY: Move tag #{legacy_category.name} in #{Time.now}"
              end
            end
          end

          news.create_new_old_relationship(old_item_id: blog.nid)
          puts "news: Move news #{news.title} in #{Time.now}"
        else
          puts "news: Error while move news #{blog.title} in #{Time.now}"
          p news.errors
        end
      else
        news = old_rel.new_item
        #if news.photo.blank?
        if news.photo.blank? && !news.description.blank?
          news.remote_photo_url = blog.image
          if news.save
            p "Update news photo image"
          else
            p "Errors while update news photo image"
            p blog.image
            p news.errors
          end
        else
          p "Photo exist OR desc blank"
        end

        puts "news: Skip news #{blog.title}"
      end
    end


  end
end
