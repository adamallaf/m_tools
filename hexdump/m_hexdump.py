#!/bin/env python3
import argparse
import os
import sys


def createHexData(data):
    hex_data = ""
    i = 1
    for b in data:
        hex_data += "{:02x}".format(b)
        if i % 4 == 0 and i < 16:
            hex_data += " "
        i += 1
    return hex_data


def createAsciiData(data):
    ascii_data = ""
    for b in data:
        ascii_data += chr(b) if int(b) >= 0x20 and int(b) < 128 else '.'
    return ascii_data


def createLine(offset, hex_data, ascii_data):
    line = "{:08x}  {:35}  {}".format(offset, hex_data, ascii_data)
    return line


def main(*args, **kwargs):
    if len(sys.argv) < 2:
        return 1
    input_file = sys.argv[1]
    if not os.path.isfile(input_file):
        print("File \"{}\" not found!".format(input_file))
        return 2
    offset = 0
    last_hex_data = ''
    skip_line = False
    f_size = os.path.getsize(input_file)
    with open(input_file, "rb") as f:
        for i in range(f_size // 16):
            data = f.read(16)
            hex_data = createHexData(data)
            ascii_data = createAsciiData(data)
            if hex_data == last_hex_data:
                if not skip_line:
                    print('*')
                    skip_line = True
            else:
                print(createLine(offset, hex_data, ascii_data))
                last_hex_data = hex_data
                skip_line = False
            offset += 16
        data = f.read(16)
        hex_data = createHexData(data)
        ascii_data = createAsciiData(data)
        print(createLine(offset, hex_data, ascii_data))
        offset += len(data)
    return 0


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog="hexdump", description="hexdump by Adam Allaf; 24.12.2017")
    parser.add_argument('input_file', metavar='file', type=str, help='the name of the file you want to hexdump')
    args = parser.parse_args()
    sys.exit(main())
