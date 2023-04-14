resource_group_name     = "multi-vm-tf-rg"
location                = "EastUS"
storage_account_name    = "testsa20230413"
virtual_network_name    = "test-vnet-01"
virtual_network_address = ["172.16.0.0/24", "192.168.0.0/24"]
subnet_name             = "test-snet-01"
subnet_address          = ["172.16.0.0/24"]
nsg_name                = "test-nsg"
publicip_name           = "test-pubip"
nic_name                = "test-nic"
virtual_machine_name    = "test-vm"
virtual_machine_size    = "Standard_Ds1_v2"
adminUser               = "azureuser"
count_value             = 4
 