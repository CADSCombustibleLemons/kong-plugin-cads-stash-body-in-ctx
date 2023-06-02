PLUGIN_VERSION?=1.1.0-1
PLUGIN_NAME?=kong-plugin-cads-stash-body-in-ctx

lua-build:
	@luarocks make ;\
	luarocks pack ${PLUGIN_NAME} ${PLUGIN_VERSION}

lua-install: lua-build
	@luarocks install ${PLUGIN_NAME}-${PLUGIN_VERSION}.all.rock

lua-upload: lua-build
	luarocks upload ${PLUGIN_NAME}-${PLUGIN_VERSION}.rockspec --api-key=${API_KEY}
