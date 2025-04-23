#!/bin/bash

echo "Testing MetaMCP server..."
curl -I --max-time 5 http://localhost:12006/sse
echo ""
echo "If you see HTTP headers above, the server is accessible."
