resource "vagrant_vm" "my_vagrant_vm" {
   vagrantfile_dir = "../vagrant_ansible/"
  env = {
    # force terraform to re-run vagrant if the Vagrantfile changes
    VAGRANTFILE_HASH = md5(file("../vagrant_ansible/Vagrantfile")),
  }
  get_ports = true
  # see schema for additional options
}