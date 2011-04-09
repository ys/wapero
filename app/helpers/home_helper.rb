module HomeHelper
  def link_urls_and_users s

      #regexps
      url = /( |^)http:\/\/([^\s]*\.[^\s]*)( |$)/
      user = /@(\w+)/

      #replace @usernames with links to that user
      while s =~ user
          s.sub! "@#{$1}", "<a href='http://twitter.com/#{$1}' >#{$1}</a>"
      end

      #replace urls with links
      while s =~ url
          name = $2
          s.sub! /( |^)http:\/\/#{name}( |$)/, " <a href='http://#{name}' >#{name}</a> "
      end

       s

  end
end
