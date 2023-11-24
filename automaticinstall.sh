wget https://gitee.com/mindspore/mindspore/raw/r2.2/scripts/install/ubuntu-cpu-pip.sh
# install MindSpore 2.2.0 and Python 3.7
MINDSPORE_VERSION=2.1.0 bash ./ubuntu-cpu-pip.sh
# to specify Python and MindSpore version, taking Python 3.9 and MindSpore 1.6.0 as examples, use the following manners
# PYTHON_VERSION=3.9 MINDSPORE_VERSION=1.6.0 bash ./ubuntu-cpu-pip.sh

git clone https://github.com/JacobACarter/mindrl.git
cd mindrl/
bash build.sh
pip install output/mindspore_rl-0.7.0-py3-none-linux_x86_64.whl

pip install -r requirements.txt

# Install mujoco
cd ~/ 
wget "https://mujoco.org/download/mujoco210-linux-x86_64.tar.gz" 
tar -xvf mujoco210-linux-x86_64.tar.gz 
mkdir ~/.mujoco 
mv ./mujoco210 ~/.mujoco/mujoco210 
rm mujoco210-linux-x86_64.tar.gz
 
# Set bashrc
echo "" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:~/.mujoco/mujoco210/bin" >> ~/.bashrc
echo "export PATH=\"~/.local/bin:\$PATH\"" >> ~/.bashrc
source ~/.bashrc 
sudo apt install libosmesa6-dev libgl1-mesa-glx libglfw3

pip install "cython<3"
sudo apt-get install python3.7-dev
sudo apt-get install patchelf
sudo python3.7 -m pip install decorator 