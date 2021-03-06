#!/usr/bin/env bash

# If the toolchain has builded today
wget https://github.com/wbrn/riscv-gnu-toolchain/releases/download/$(date +"%Y.%m.%d")-rvgt-$(lsb_release -s -r)/rvgt-ubuntu-$(lsb_release -s -r).tar.xz
# download last day builded toolchain
[[ $? != 0 ]] && wget https://github.com/wbrn/riscv-gnu-toolchain/releases/download/$(date +"%Y.%m").$(($(date +%d)-1))-rvgt-$(lsb_release -s -r)/rvgt-ubuntu-$(lsb_release -s -r).tar.xz
[[ $? != 0 ]] && quit 1

# Install to /opt
tar xvf rvgt-ubuntu-$(lsb_release -s -r).tar.xz
sudo mv opt/riscv32_64-multilib-gnu /opt && rmdir opt && chown -R 0:0 /opt/riscv32_64-multilib-gnu

echo "Add '/opt/riscv32_64-multilib-gnu/bin' to your PATH"
#echo $PATH | grep riscv32_64-multilib-gnu >/dev/null
#[[ $? != 0 ]] && echo "export PATH=\$PATH:/opt/riscv32_64-multilib-gnu/bin" >> ~/.profile
