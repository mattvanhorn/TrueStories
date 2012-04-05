module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page$/
      root_path

    when /the sign in page/
      '/auth/developer'

    when /the sign up page/
      '/identities/new'

    else
      begin
        page_name =~ /the (.*) page( for that (.+))?/
        page_helper, qualifier = $1, ($3.gsub(/\W+/, '_') if $3)
        obj = Fabrication::Cucumber::Fabrications[qualifier.to_sym] if qualifier

        self.send(*[path_helper_from(page_helper).to_sym, obj].compact)

      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end

  def path_helper_from(words)
    words.split(/\W+/).push('path').join('_')
  end


end

World(NavigationHelpers)