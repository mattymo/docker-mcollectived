docker-mcollectived
===================

docker-mcollectived


```bash
cp /etc/astute.yaml ./

# build
docker build -t fuel/mcollectived ./

# run AFTER storage-puppet and docker-rabbitmq
docker run \
  -h $(hostname -f) \
  --volumes-from storage-puppet \
  -d -t \
  fuel/mcollectived
```
