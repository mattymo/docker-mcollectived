docker-mcollectived
===================

Fuel docker-mcollectived container


```bash
cp /etc/astute.yaml ./

# build
docker build -t fuel/mcollectived ./

# run AFTER storage-puppet and docker-rabbitmq
docker run \
  -h $(hostname -f) \
  --volumes-from storage-puppet \
  --volumes-from storage-log \
  -d -t \
  fuel/mcollectived
```
