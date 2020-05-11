#!/usr/bin/python

import sys

def convert(shellcode_bin):
	shellcode_str = ""
	for c in shellcode_bin:
		shellcode_str += "\\x%02x" % ord(c)
	return shellcode_str

if __name__ == "__main__":
	if len(sys.argv) != 2:
		print("Usage: %s <shellcode file>" % sys.argv[1])
	try:
		with open(sys.argv[1], "rb") as shellcode_file:
			print convert(shellcode_file.read())
	except:
		print("Error while opening file")
