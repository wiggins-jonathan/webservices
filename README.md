# Self-hosted webservices

## Services
- [docker](https://www.docker.com/) & docker-compose for containerization
- [adguard-home](https://adguard.com/en/adguard-home/overview.html)
- [authelia](https://www.authelia.com/)
- [lldap](https://github.com/nitnelave/lldap)
- [vaultwarden](https://github.com/dani-garcia/vaultwarden)
- [ntfy](https://ntfy.sh/)
- [watchtower](https://containrrr.dev/watchtower/)
- [uptime-kuma](https://uptime.kuma.pet/)
- [navidrome](https://www.navidrome.org/)
- [home-assistant](https://www.home-assistant.io/)
- [transmission](https://transmissionbt.com/)
- [jellyfin](https://jellyfin.org/)

Secrets are managed with [sops](https://github.com/mozilla/sops)

## Installation
- Clone repo
- Replace the .env file with one of your own.
  * Each key will be used in the `docker-compose.yml`, & set as environment
    variables in the container environments.
- `docker-compose up -d`
