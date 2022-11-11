#! /bin/bash

echo "******************"
echo "start set-proxy script"

# wsl2 proxy configuration
export windows_host=`cat /etc/resolv.conf|grep nameserver|awk '{print $2}'`
export ALL_PROXY=socks5://$windows_host:14332
export HTTP_PROXY=$ALL_PROXY
export http_proxy=$ALL_PROXY
export HTTPS_PROXY=$ALL_PROXY
export https_proxy=$ALL_PROXY

# git in wsl2 proxy
git config --global proxy.https socks5://$windows_host:14332

echo "******************"
