local typedefs = require "kong.db.schema.typedefs"

return {
  name = "stash-body-in-ctx",
  fields = {
    { consumer = typedefs.no_consumer },
    { config = {
        type = "record",
        fields = {
          { stash_request_body = { type = "boolean", default = false }, },
          { stash_response_body = { type = "boolean", default = false }, },
        },
      },
    },
  },
}