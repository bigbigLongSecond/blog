#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# xshell session to mobaxterm session file
# Support: TELNET, serial, SSH
# Usage: xshell2mobaxterm.py Xshell_Session_Direcotry
# Example: python3 xshell2mobaxterm.py D:\Xshell\Session >mobaxterm.mxtsessions
# Linux platform enviroment: LANG=zh_CN.utf8/en_US.utf8
# Windows: python3.6 cmd run it.

import os, sys


def convert_x2m(xshell_session_file, num):
    #print(xshell_session_file)
    ssh_format = (
        '[{BookMarks}]\n'
        'SubRep={Directory}\n'
        'ImgNum=41\n'
        '{SessionName} ({UserName})=#109#0%{Host}%{Port}%{UserName}%%-1%-1%%%%%0%0%0%%%-1%0%0%0%%1080%%0%0%1#DejaVu Sans Mono%{FontSize}%0%0%-1%15%236,236,236%30,30,30%180,180,192%0%-1%0%%xterm%-1%-1%_Std_Colors_0_%80%24%0%1%-1%<none>%%0%1%-1#0# #-1\n'
    )
    
    telnet_format = (
        '[{BookMarks}]\n'
        'SubRep={Directory}\n'
        'ImgNum=41\n'
        '{SessionName} ()= #98#1%{Host}%{Port}%%%2%%%%%0%0%%1080%#DejaVu Sans Mono%{FontSize}%0%0%-1%15%236,236,236%30,30,30%180,180,192%0%-1%0%%xterm%-1%-1%_Std_Colors_0_%80%24%0%1%-1%<none>%%0%1%-1#0# #-1\n'
    )
    
    serial_format = (
        '[{BookMarks}]\n'
        'SubRep={Directory}\n'
        'ImgNum=42\n'
        '{SessionName}= #131#8%-2%100{Speed}%3%0%0%1%2%{Port}#DejaVu Sans Mono%{FontSize}%0%0%-1%15%236,236,236%30,30,30%180,180,192%0%-1%0%%xterm%-1%-1%_Std_Colors_0_%80%24%0%1%-1%<none>%%0%1%-1#0# #-1\n'
    )

    session_file = open(xshell_session_file, 'r')
    session_lines = session_file.readlines()
    xshell_attr = {'num': num}
    xshell_attr['Directory'] = os.path.dirname(xshell_session_file.replace(sys.argv[1], '').strip('\\'))
    xshell_attr['SessionName'] = os.path.basename(xshell_session_file).rsplit('.',1)[0]

    if num == 0:
        xshell_attr['BookMarks'] = 'Bookmarks'
    else:
        xshell_attr['BookMarks'] = 'Bookmarks_{num}'.format(num=num)

    for line in session_lines:
        if line.startswith('UserName='):
            xshell_attr['UserName'] = line.split('=')[1].strip('\n')
        elif line.startswith('Port='):
            xshell_attr['Port'] = line.split('=')[1].strip('\n')
        elif line.startswith('FontSize='):
            xshell_attr['FontSize'] = line.split('=')[1].strip('\n')
        elif line.startswith('Host='):
            xshell_attr['Host'] = line.split('=')[1].strip('\n')
        elif line.startswith('Protocol='):
            xshell_attr['Protocol'] = line.split('=')[1].strip('\n')
        elif line.startswith('BaudRate='):
            xshell_attr['Speed'] = line.split('=')[1].strip('\n')

    #print(xshell_attr)
    x = 1
    if xshell_attr.get('Protocol').lower().startswith('ssh'):
        x = ssh_format.format(
            Directory = xshell_attr.get('Directory') or '',
            SessionName = xshell_attr.get('SessionName') or 'default',
            UserName = xshell_attr.get('UserName') or '',
            Port = xshell_attr.get('Port') or '22',
            FontSize = xshell_attr.get('FontSize') or '12',
            num=xshell_attr['num'],
            Host=xshell_attr.get('Host') or '',
            BookMarks=xshell_attr['BookMarks']
        )
    elif xshell_attr.get('Protocol').lower() == 'telnet':
        x = telnet_format.format(
            Directory = xshell_attr.get('Directory') or '',
            SessionName = xshell_attr.get('SessionName') or 'default',
            UserName = xshell_attr.get('UserName') or '',
            FontSize = xshell_attr.get('FontSize') or '12',
            Port = xshell_attr.get('Port') or '23',
            num=xshell_attr['num'],
            Host=xshell_attr.get('Host') or '',
            BookMarks=xshell_attr['BookMarks']
        )
    elif xshell_attr.get('Protocol').lower() == 'serial':
        x = serial_format.format(
            Directory = xshell_attr.get('Directory') or '',
            SessionName = xshell_attr.get('SessionName') or 'default',
            FontSize = xshell_attr.get('FontSize') or '12',
            Port = xshell_attr.get('Port') or '',
            Speed = xshell_attr.get('Speed') or '9600',
            num = xshell_attr['num'],
            BookMarks = xshell_attr['BookMarks']
        )
    #print(x.replace('/', '\\'))
    return x.replace('/', '\\')


def generate_mobaxterm_sessions(xshell_session_path, count):
    #print(session_path)
    base_dir = os.listdir(xshell_session_path)
    for file in base_dir:
        file = os.path.join(xshell_session_path, file)
        try:
            os.listdir(file)
            #print(file)
            generate_mobaxterm_sessions(file, count)
        except:
            if not file.endswith('.xsh'): continue
            print(convert_x2m(file, count[0]))
            count[0] += 1


if __name__ == '__main__':
    count = [0]
    generate_mobaxterm_sessions(sys.argv[1], count)