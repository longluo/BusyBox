#!/bin/bash

# 防止中文乱码
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# git Proxy

git config --global http.proxy 'socks5://192.168.18.224:7893'
git config --global https.proxy 'socks5://192.168.18.224:7893'


# the Network Proxy

export http_proxy="http://192.168.18.224:7893"
export https_proxy="http://192.168.18.224:7893"


# Aliaes

alias ll='ls -alF'


