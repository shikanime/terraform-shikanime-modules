resource "vercel_project" "default" {
  for_each = {
    links = {
      name           = "links"
      root_directory = "pkgs/links"
    }
    infinity_horizons = {
      name           = "infinity-horizons"
      root_directory = "pkgs/infinity-horizons"
    }
  }
  name                       = each.value.name
  framework                  = "nextjs"
  serverless_function_region = "fra1"
  root_directory             = each.value.root_directory
  git_repository = {
    type = "github"
    repo = "shikanime/shikanime"
  }
}

resource "vercel_project_domain" "default" {
  for_each = {
    links = {
      domain = "links.shikanime.studio"
    }
    infinity_horizons = {
      domain = "infinityhorizons.shikanime.studio"
    }
  }
  project_id = vercel_project.default[each.key].id
  domain     = each.value.domain
}
