docker-mcollectived
===================

docker-mcollectived


```bash
cp /etc/astute.yaml ./

# build
docker build -t fuel/mcollectived docker-mcollectived

# run AFTER storage-puppet
docker run \
  -h $(hostname -f) \
  --volumes-from storage-puppet \
  -d -t \
  fuel/mcollectived
```
