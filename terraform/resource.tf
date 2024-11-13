resource "vagrant_vm" "my_vagrant_vm" {
   vagrantfile_dir = "${var.vagrantfile_dir}"
  env = {
    # force terraform to re-run vagrant if the Vagrantfile changes
    VAGRANTFILE_HASH = md5(file("${var.vagrantfile_dir}Vagrantfile")),
  }
  get_ports = true
  # see schema for additional options
}