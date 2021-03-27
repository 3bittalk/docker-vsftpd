# vsftpd in docker

## Usage

Create file `ftp-passwords.env` with the following content:

```
USER_ONE_PASSW=CtPd#YQiZF$c#Tp76k
```

Start docker conteiner
```
docker run -d \
    -p 21:21 \
    -p 21000-21010:21000-21010 \
    --env-file ftp-passwords.env \
    -e USERS="2000|one" \
    -e ADDRESS=localhost \
    3bittalk/docker-vsftpd
```

## Configuration

### Environment variables:
- `USERS` - space and `|` separated list (optional, default: `21|ftp"`)
  - format `uid1|name1[|folder1] uid2|name2[|folder2]`
- `ADDRESS` - external address witch clients can connect passive ports (optional)
- `MIN_PORT` - minimum port number to be used for passive connections (optional, default `21000`)
- `MAX_PORT` - maximum port number to be used for passive connections (optional, default `21010`)


#### Passwords:

- Passwords should be saved as env variable use the following format `USER_<user name>_PASSW=<user password>`
- Otherwise, the password will be generated (for each user without a defined password) and displayed in the log.

## Docker compose

example:

```
version: '3.0'

services:

  ftp:
    image: 3bittalk/docker-vsftpd
    container_name: ftp
    restart: unless-stopped
    environment:
      - USERS="2000|one"
    env_file:
      - ftp-passwords.env
    networks:
      - ftp
    volumes:
      - ftp-one-volume:/ftp/one

volumes:
  ftp-one-volume:

networks:
  ftp:
    driver: bridge
```