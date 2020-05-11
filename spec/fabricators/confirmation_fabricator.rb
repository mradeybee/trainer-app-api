Fabricator(:confirmation) do
  user         {Fabricate(:user)}
  token        ""
  confirmed_at nil
  status       0
end