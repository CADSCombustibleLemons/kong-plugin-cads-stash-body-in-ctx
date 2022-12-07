PLUGIN_VERSION?=1.0.0-1
PLUGIN_NAME?=kong-plugin-stash-body-in-ctx

lua-build:
	@luarocks make ;\
	luarocks pack ${PLUGIN_NAME} ${PLUGIN_VERSION}

lua-install: lua-build
	@luarocks install ${PLUGIN_NAME}-${PLUGIN_VERSION}.all.rock