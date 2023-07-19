#!/bin/sh

bin/simple_ms_blocklist eval "MsClientsApi.Release.migrate" && \
bin/simple_ms_blocklist eval "MsClientsApi.Release.seed" && \
bin/simple_ms_blocklist start
