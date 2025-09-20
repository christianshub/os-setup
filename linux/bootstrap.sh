# Update and upgrade
sudo apt update -y && sudo apt upgrade -y

# Ensure time is synced
sudo apt install ntpdate -y && sudo ntpdate -s time.nist.gov

# Install ansible
sudo apt install -y ansible

# Run ansible playbook
ansible-playbook -i hosts playbook.yml --become --ask-become-pass
