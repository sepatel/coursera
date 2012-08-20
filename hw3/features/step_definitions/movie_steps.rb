# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  assert page.body.match(/.*#{e1}.*#{e2}/m)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(/ *, */).each {|chosen|
    step "I #{uncheck}check \"ratings_#{chosen}\""
  }
end

Then /I should see (none|all) of the movies/ do |amount|
  negative = "not " if amount == "none"
  Movie.find(:all).each {|movie|
    step "I should #{negative}see \"#{movie.title}\""
  }
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie_name, director_name|
  movie = Movie.first(:conditions => ['title = ?', movie_name])
  assert !movie.nil?
  assert movie.director == director_name
end
