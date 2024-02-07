# docker-nchan

__Attention: This Docker image is specifically designed for the
[gaming platform](https://github.com/gaming-platform)
and shouldn't be used in other projects. Tags may undergo
breaking changes and could be subject to removal.__

This repository provides a `Nchan` image for the
[gaming platform](https://github.com/gaming-platform).

## Usage

__Name__  
`ghcr.io/gaming-platform/docker-nchan:1.3`

__Environment variables__  
Below is a summary of the environment variables available for this image.

| Name                            | Default |
|---------------------------------|---------|
| `NCHAN_SHARED_MEMORY_SIZE`      | 256M    |
| `NCHAN_MESSAGE_BUFFER_LENGTH`   | 10      |
| `NCHAN_MESSAGE_TIMEOUT`         | 10s     |
| `NCHAN_HTTP_KEEPALIVE_REQUESTS` | 10000   |

__Endpoints__  
Below is a list of available endpoints.

| Path       | Port | Description                                                                                                       |
|------------|------|-------------------------------------------------------------------------------------------------------------------|
| `/sub`     | 80   | Subscribe to one or more channels using the `id` (comma-separated list of channel names) query parameter.         |
| `/pub`     | 81   | Publish a message to one or more channels using the `id` (comma-separated list of channel names) query parameter. |
| `/metrics` | 81   | Metrics are exposed in the `Prometheus` format.                                                                   |
