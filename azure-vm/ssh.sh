# Create for bastion host VM.
ssh-keygen -t rsa -b 4096 -C "nguyenmanhcuong382@outlook.com" -f $HOME/.ssh/azurebstn -N ''

# Create for worker host VM.
# ssh-keygen -t rsa -b 4096 -C "nguyenmanhcuong382@outlook.com" -f $HOME/.ssh/azurewrkr -N ''

# Get the SSH public key value for bastion host.
cat ~/.ssh/id_rsa_azurebstn.pub

# Get the SSH public key value for worker host.
# cat ~/.ssh/id_rsa_azurewrkr.pub