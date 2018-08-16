import os
import socket
import sys
import urllib
import urllib2
import re
import time
from collections import Counter

def get_chrome_url_x86():
    """ Retrieve Chrome URL """
    # legacy URL
    default_url = "http://www.google.com/dl/release2/chrome/APY30-uZTbgf_68.0.3440.106/68.0.3440.106_chrome_installer.exe"
    try:
        # read API
        api = urllib2.urlopen("https://api.shuax.com/tools/getchrome").read()
        api = api.split('<blockquote style="overflow:hidden;text-overflow:ellipsis;">')[1].split("</blockquote>")[0]
        # regex and grab first likely URL
        api = re.findall(r'(https?://\S+)"', api)
        api = [i for i in api if i.startswith("https://www.google.com/dl/release2/chrome/")]
        return api[0]
    except:
        return default_url

def parse_dns(domain):
    """ Fuck CKIS. """
    result = []
    print(domain)
    # dns lookup
    _dns = ['210.220.163.82', '219.250.36.130', '164.124.107.9', '203.248.242.2', '8.8.8.8', '8.8.4.4', '192.203.138.11']
    for _dns_server in _dns:
        _res = os.popen("nslookup %s %s -timeout=1"%(domain, _dns_server)).read()
        try:
            result.append(_res.split("Non-authoritative answer")[1])
        except IndexError:
            pass
    # parse valid ones among results
    temp = []
    for i in result:
        if i:
            try:
                _ip = i.split("Address:")[1].strip().split()[0]
                socket.inet_aton(_ip) # check validity of the given IP by native lib
                temp.append(_ip)
            except:
                pass
    result = [i for i in temp if not i.startswith("172.") or not i.startswith("192.")] # nope for this A class
    print(result)
    # return the most common IP
    try:
        return Counter(result).most_common(1)[0][0]
    except:
        return parse_dns(domain) # try again, fuck

if __name__ == "__main__":
    k = open("/home/stypr/mil/build/bypass.bat", "rb")
    k = k.read()

    d = "www.google.co.kr accounts.google.co.kr google.co.kr"
    f = parse_dns("www.google.co.kr")
    t = "echo %s %s\r\n" % (f, d)

    d = "www.tensorflow.org www.android.com developer.android.com source.android.com"
    f = parse_dns("www.android.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "accounts.google.com www.google.com developers.google.com store.google.com api.google.com google.com play.google.com firebase.google.com docs.google.com"
    f = parse_dns("www.google.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "youtube.com accounts.youtube.com www.youtube.com"
    f = parse_dns("youtube.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "mail.google.com"
    f = parse_dns("mail.google.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "ssl.gstatic.com"
    f = parse_dns("ssl.gstatic.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "www.gstatic.co www.gstatic.com"
    f = parse_dns("www.gstatic.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "analytics.google.com"
    f = parse_dns("analytics.google.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "s.youtube.com"
    f = parse_dns("s.youtube.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "goo.gl"
    f = parse_dns("goo.gl")
    t += "echo %s %s\r\n" % (f, d)

    d = "manifest.googlevideo.com"
    f = parse_dns("manifest.googlevideo.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "cache.pack.google.com"
    f = parse_dns("cache.pack.google.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "dl.google.com"
    f = parse_dns("dl.google.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "tools.google.com"
    f = parse_dns("tools.google.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "fonts.googleapis.com"
    f = parse_dns("fonts.googleapis.com")
    t += "echo %s %s\r\n" % (f, d)

    d = "s.ytimg.com"
    f = parse_dns("s.ytimg.com")
    t += "echo %s %s\r\n" % (f, d)

    u = get_chrome_url_x86()
    k = k.replace("__FUCK__", t)
    k = k.replace("__CHROME__", get_chrome_url_x86())
    s = open("/home/stypr/mil/build.bat", "wb")
    s.write(k)
    s.close()

    print("DONE!")
    s = open("/home/stypr/mil/build.stat", "wb")
    s.write(u + "," + str(time.time()))
    s.close()

    sys.exit(0)

