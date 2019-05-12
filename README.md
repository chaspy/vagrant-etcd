# vagrant-etcd

|host |IP address    |
|-----|--------------|
|etcd0|192.168.33.200|
|etcd1|192.168.33.201|
|etcd2|192.168.33.202|

## Usage

```
$ vagrant up
```

```
$ vagrant ssh etcd0
(etcd0) $ sudo systemctl start etcd
# ---
$ vagrant ssh etcd1
(etcd1) $ sudo systemctl start etcd
# ---
$ vagrant ssh etcd2
(etcd2) $ sudo systemctl start etcd
# ---
