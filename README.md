# Backup, restore and explore Docker volumes

## Installation

```sh
curl --proto '=https' --tlsv1.2 'https://raw.githubusercontent.com/hectorm/docker-volume-helpers/master/bin/docker-volume-helpers-upgrade' | sudo sh
```

## Usage

### Backup
```sh
docker-volume-backup VOLUME [TARGET.tzst]
```

### Restore
```sh
docker-volume-restore VOLUME [SOURCE.tzst]
```

### Explore
```sh
docker-volume-explore VOLUME
```
