variable "host_interface" {
  description = "The name of the host interface to use for the network adapter"
  type        = string
  default     = "enp0s3"
}

variable "vm_cpus" {
  description = "The number of CPUs to allocate to each virtual machine"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "The amount of memory to allocate to each virtual machine"
  type        = string
  default     = "2048 mib"
}

variable "vm_image" {
  description = "The amount of OS to allocate to each virtual machine"
  type        = string
  default     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
}

variable "tf_log" {
  description = "Set the log level for Terraform"
  type        = string
  default     = "INFO"  # ou un autre niveau par défaut
}
