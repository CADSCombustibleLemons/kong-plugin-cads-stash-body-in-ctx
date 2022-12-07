#Kong plugin Stash Body in CTX

A plugin for stashing the request body in the kong.ctx.shared table. Main use case is so you can access this during the log phase.  For example in the htt-log plugin you can use it with custom_fields_by_lua `"return kong.ctx.shared.request_body"`
