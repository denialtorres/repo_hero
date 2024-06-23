# we will need to load the RepoHeroSchema and for that
# reason  we'll run this script not using ruby excutable but
# rails runner
query = <<~QUERY
query {
  repos {
  name
  url
  }
}
QUERY
result = RepoHeroSchema.execute(query)
puts JSON.pretty_generate(result)
