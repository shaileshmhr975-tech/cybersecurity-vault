#!/bin/python3

# SOCKET
import socket

HOST = '137.0.0.1'
PORT = 7777   # Any randon port, other than 403.404

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # af inet is ipv4, sock_stream is a part
s.connect((HOST,PORT))
