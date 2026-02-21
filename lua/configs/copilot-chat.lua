return {
  model = "gemini-3.1-pro-preview",
  Rename = {
    prompt = "Please rename the variable correctly in given selection based on context",
    selection = function(source)
      local select = require "CopilotChat.select"
      return select.visual(source)
    end,
  },
  -- Core configuration
  debug = false, -- Enable debug logging
  proxy = nil, -- Configure proxy for GitHub API requests
  allow_insecure = false, -- Allow insecure server connections
}
