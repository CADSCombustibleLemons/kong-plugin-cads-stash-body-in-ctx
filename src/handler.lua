local StashBodyInCtxHandler = {
  VERSION  = "1.1.0",
  PRIORITY = 12,
}

function StashBodyInCtxHandler:access(conf)
    if conf.stash_request_body
    then
        kong.ctx.shared.request_body = kong.request.get_raw_body();
    end
end

function StashBodyInCtxHandler:body_filter(conf)
    if conf.stash_response_body
    then
        local ctx = kong.ctx.shared;
        local chunk, eof = ngx.arg[1], ngx.arg[2];
        if not eof then
            ctx.response_body = (ctx.response_body or "") .. (chunk or "")
        end
    end
end

return StashBodyInCtxHandler
