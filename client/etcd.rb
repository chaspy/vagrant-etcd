require 'etcd'

client=Etcd.client(
  :host => "localhost",
  :port => 2379,
  :use_ssl => false,
)
p client.set('/foo', value: 'bar')
p client.get('/foo').value
