# we will need to load the RepoHeroSchema and for that
# reason  we'll run this script not using ruby excutable but
# rails runner
require 'pry'
operation = <<~GQL
  query {
    testField
  }
  GQL


  result = RepoHeroSchema.execute(operation)

  puts JSON.pretty_generate(result)
