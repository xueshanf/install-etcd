#!/bin/sh

ETCD_VER=${ETCD_VER:-v3.2.8}
DOWNLOAD_URL=https://storage.googleapis.com/etcd

echo "Install ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz"
apk update -q && apk add -q --no-cache wget openssl ca-certificates
mkdir -p /shared /tmp/download
cd /tmp/download
wget -q ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzf etcd-${ETCD_VER}-linux-amd64.tar.gz --strip-components=1
chmod 755 etcd etcdctl

# Test
etcd_version=$(./etcd --version | grep -i -oE 'etcd Version: (\d+\.\d+\.\d+)' | awk '{print $3}' )
etcdctl_version=$(./etcdctl --version | grep -i -oE 'etcdctl Version: (\d+\.\d+\.\d+)' | awk '{print $3}' )
if [ "v$etcd_version" != "$ETCD_VER" ] || [ "v$etcdctl_version" != "$ETCD_VER" ]
then
  echo $etcd_version or $etcdctl_version does not match "$ETCD_VER".
  exit 1
else
  cp -v etcd etcdctl /shared
fi
