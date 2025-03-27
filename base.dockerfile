FROM  ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

SHELL ["/bin/bash", "-c"]

RUN apt-get clean && \
    apt-get autoclean
RUN apt update
RUN apt install -y ca-certificates
RUN update-ca-certificates
COPY apt/sources.list /etc/apt/


RUN apt-get update  && apt-get upgrade -y  && \
    apt install -y \
    htop \
    apt-utils \
    curl \
    cmake \
    git \
    openssh-server \
    build-essential \
    libboost-all-dev \
    net-tools \
    vim \
    stress 

RUN apt-get install -y libc-ares-dev  libssl-dev gcc g++ make 
RUN apt-get install -y  \
    libfreetype6 \
    libdbus-1-3 \
    libfontconfig1 \
    libxkbcommon0   \
    libxkbcommon-x11-0

# RUN apt-get install -y python-dev \
#     python3-dev \
#     python-pip \
#     python-all-dev 

# install zsh
RUN apt-get install -y zsh
RUN chsh -s /bin/zsh
# install oh-my-zsh
RUN sh -c "$(curl -fsSL https://gitee.com/pocmon/ohmyzsh/raw/master/tools/install.sh)"

# RUN echo 'root:lzjros2' | chpasswd  # 设置 root 用户的密码
RUN echo 'root:lzjreproduce' | chpasswd  # 设置 root 用户的密码
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN service ssh start

# RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# RUN sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)/g' ~/.zshrc

# install ros2
RUN apt-get install -y curl gnupg2
# RUN echo "deb [arch=$(dpkg --print-architecture)] https://repo.huaweicloud.com/ros2/ubuntu/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
# RUN curl -Ls https://repo.huaweicloud.com/ros2/key.asc | apt-key add -

# RUN apt update && apt install ros-humble-desktop -y

