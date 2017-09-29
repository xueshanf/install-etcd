# Install CoreOS etcd

An Alpine based image to install etcd from CoreOS official binary release site. 
The etcd and etcdctl binaries (linux/amd64) are installed in /shared volume which you can mount on host's installation directory.

The container accepts  environment ETCD_VER. The default is v3.2.8.

## Usage

* Install the default etcd version

```console
$ docker run --rm -v /opt/bin:/shared xueshanf/install-etcd
Install https://storage.googleapis.com/etcd/v3.2.8/etcd-v3.2.8-linux-amd64.tar.gz
'etcd' -> '/shared/etcd'
'etcdctl' -> '/shared/etcdctl'
```

* Install specific version

```console
$ docker run --rm --env=ETCD_VER="v3.2.7" -v /opt/bin:/shared xueshanf/install-etcd
Install https://storage.googleapis.com/etcd/v3.2.7/etcd-v3.2.7-linux-amd64.tar.gz
'etcd' -> '/shared/etcd'
```

    After this run, you should have *etc* and *etcdctl* in /opt/bin/ directory.
