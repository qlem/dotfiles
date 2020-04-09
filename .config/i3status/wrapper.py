#!/usr/bin/env python

import sys
import json

def get_file_content(path):
    try:
        f = open(path)
        raw = f.readlines()[0].strip()
        if not raw:
            return -1
        return int(raw)
    except OSError:
        return -1

def get_backlight():
    curr = get_file_content('/sys/class/backlight/intel_backlight/brightness')
    maxb = get_file_content('/sys/class/backlight/intel_backlight/max_brightness')
    if curr < 0 or maxb <= 0:
        return ' err'
    val = curr * 100 / maxb
    return ' %d%%' % val

def print_line(msg):
    sys.stdout.write(msg + '\n')
    sys.stdout.flush()

def read_line():
    try:
        line = sys.stdin.readline().strip()
        if not line:
            sys.exit(3)
        return line
    except KeyboardInterrupt:
        sys.exit()

if __name__ == '__main__':
    print_line(read_line())
    print_line(read_line())
    while True:
        line, prefix = read_line(), ''
        if line.startswith(','):
            line, prefix = line[1:], ','
        data = json.loads(line)
        data.insert(2, {'name': 'backlight', 'markup': 'none', 'full_text': '%s' % get_backlight()})
        print_line(prefix + json.dumps(data))
