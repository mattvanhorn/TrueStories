Fabricator(:story) do
  title 'Some Silly Feature'
  body %~ In order to write some code
  As a developer
  I want some test stories
  ~
  votings(:count => 3) { |voteable, i| Fabricate(:up_vote, :voteable => voteable) }
end