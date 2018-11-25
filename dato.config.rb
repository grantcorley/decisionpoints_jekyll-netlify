# dato.config.rb

# Create a YAML data file to store global data about the site
create_data_file "src/_data/settings.yml", :yaml,
  name: dato.site.global_seo.site_name,
  language: dato.site.locales.first




  # inside a "_posts" directory...
  directory "_posts" do

    # ...iterate over the "Blog post" records...
    dato.posts.each do |article|

      # ...and create a markdown file for each article!
      create_post "#{article.updated_at.strftime("%Y-%m-%d")}-#{article.headline}.md" do
        frontmatter(
          :yaml,
          layout:"post",
          title: article.headline,
        )

        content(article.content)
      end
    end
  end




    # ...iterate over the pages...
    dato.pages.each do |article|

      # ...and create a markdown file for each article!
      create_post "#{article.headline}.md" do
        frontmatter(
          :yaml,
          layout:"page",
          title: article.headline,
        )

        content(article.content)
      end
    end
