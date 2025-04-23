# MetaMCP Docker Installation Guide

This guide will help you set up the MetaMCP MCP Server using Docker containers.

## Prerequisites

- Docker and Docker Compose installed on your system
- A valid MetaMCP API key (get one from [metamcp.com/api-keys](https://metamcp.com/api-keys))

## Installation Steps

1. **Configure Environment Variables**

   Edit the `.env.production.local` file and set your MetaMCP API key:

   ```
   METAMCP_API_KEY=your_api_key_here
   ```

   Replace `your_api_key_here` with your actual API key.

2. **Run the Setup Script**

   ```bash
   ./setup.sh
   ```

   This script will:
   - Verify your API key is set
   - Build and start the Docker container
   - Provide instructions for viewing logs and stopping the container

3. **Verify Installation**

   The MetaMCP server will be available at:

   ```
   http://localhost:12006/sse
   ```

## Manual Setup (Alternative to Setup Script)

If you prefer to run the commands manually:

1. Build and start the container:

   ```bash
   docker-compose up --build -d
   ```

2. View logs:

   ```bash
   docker-compose logs -f
   ```

3. Stop the container:

   ```bash
   docker-compose down
   ```

## Configuration Options

You can modify the following files to customize your installation:

- `.env.production.local`: Environment variables
- `docker-compose.yml`: Container configuration
- `Dockerfile`: Container build instructions

## Troubleshooting

- **Container fails to start**: Check the logs with `docker-compose logs`
- **Connection issues**: Ensure port 12006 is not being used by another application
- **API key errors**: Verify your API key is correctly set in `.env.production.local`

## Additional Information

For more details about MetaMCP, visit [metamcp.com](https://metamcp.com).
