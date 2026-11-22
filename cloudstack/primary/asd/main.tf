resource "cloudstack_instance" "asd" {
  name               = "asd"
  display_name       = "aaa"
  zone               = "2afe86b2-dab4-48e3-80c3-3b3924a5eda6"
  service_offering   = "de346bc4-2ea2-4625-bec2-bd59d42fce51"
  template           = "9ae135e5-c884-49bf-9e45-051a4982cd10"
  project            = "b38aaf55-9695-4cd1-aa31-06208d9c6c1b"
  network_id         = "0e41167b-6b22-4adc-aa8f-68fd5670ec03"
  disk_offering      = "0013d60e-40b7-4e40-8d48-fd6539a63822"
  keypair            = "palette-pcg-key"
  start_vm           = false
}
