local BasePlugin = require "kong.plugins.base_plugin"

local StashBodyInCtxHandler = BasePlugin:extend()

StashBodyInCtxHandler.PRIORITY = 12
StashBodyInCtxHandler.VERSION = "1.0.0"

function StashBodyInCtxHandler:new()
    StashBodyInCtxHandler.super.new(self, "stash-body-in-ctx")
end

function StashBodyInCtxHandler:access(conf)
    StashBodyInCtxHandler.super.access(self)
    if conf.stash_request_body
    then
        kong.ctx.shared.request_body = kong.request.get_raw_body();
    end
end

function StashBodyInCtxHandler:body_filter(conf)
    StashBodyInCtxHandler.super.body_filter(self)
    if conf.stash_request_body
    then
        local ctx = kong.ctx.shared;
        local chunk, eof = ngx.arg[1], ngx.arg[2];
        if not eof then
            ctx.response_body = (ctx.response_body or "") .. (chunk or "")
        end
    end
end

return StashBodyInCtxHandler