#!/bin/sh

bin/simple_ms_blocklist eval "MsSuspendedClients.Release.migrate" && \
bin/simple_ms_blocklist eval "MsSuspendedClients.Release.seed" && \
bin/simple_ms_blocklist start
