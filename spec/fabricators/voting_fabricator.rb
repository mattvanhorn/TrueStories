Fabricator(:up_vote, :class_name => "MakeVoteable::Voting") do
  voteable { Fabricate(:story) }
     voter { Fabricate(:user) }
   up_vote true
end

Fabricator(:down_vote, :class_name => "MakeVoteable::Voting") do
  voteable { Fabricate(:story) }
     voter { Fabricate(:user) }
   up_vote false
end

