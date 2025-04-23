#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}MetaMCP Docker Setup Script${NC}"
echo "==============================="

# Check if .env.production.local exists and has a valid API key
if [ -f .env.production.local ]; then
    API_KEY=$(grep METAMCP_API_KEY .env.production.local | cut -d '=' -f2)
    if [ "$API_KEY" = "your_api_key_here" ] || [ -z "$API_KEY" ]; then
        echo -e "${RED}Error: You need to set a valid METAMCP_API_KEY in .env.production.local${NC}"
        echo "Please edit the .env.production.local file and set your API key from metamcp.com/api-keys"
        exit 1
    fi
else
    echo -e "${RED}Error: .env.production.local file not found${NC}"
    echo "Please create the file with the required environment variables"
    exit 1
fi

# Build and start the Docker container
echo -e "${GREEN}Building and starting the Docker container...${NC}"
docker-compose up --build -d

# Check if the container is running
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Container is now running!${NC}"
    echo "The MetaMCP server is available at: http://localhost:12006/sse"
    echo ""
    echo "To view logs:"
    echo "  docker-compose logs -f"
    echo ""
    echo "To stop the container:"
    echo "  docker-compose down"
else
    echo -e "${RED}Failed to start the container. Check the logs for more information.${NC}"
    echo "docker-compose logs"
fi
