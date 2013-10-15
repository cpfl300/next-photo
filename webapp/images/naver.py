from threading import Thread
import urllib
import re
def fetch(url):
  regex="<title>.+?</title>"
  pattern=re.compile(regex)
  htmltext=urllib.urlopen(url).read()
  results=re.findall(pattern,htmltext)
  print results[0]
urls=["http://google.com","http://cnn.com","http://wikipedia.org","http://yahoo.com","http://naver.com","http://daum.net"]
threadlist=[]
for u in urls:
  tv=Thread(target=fetch,args=(u,))
  tv.start()
  threadlist.append(tv)
for b in threadlist:
  b.join()
