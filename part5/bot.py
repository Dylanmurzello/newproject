import praw
import time
import pyfiglet
import random
import requests
import sys
from sys import exit

reddit = praw.Reddit(client_id="S2myvCT6T4YP0Q",
                     client_secret="hGJuOgAxA8onyZ99cSSIyMUrvZildVQ",
                     password="Special-Addition2345",
                     user_agent="posted by u/Special-Addition2345",
                     username="Special-Addition2345")

result = pyfiglet.figlet_format("Dylan OP")
print(result)

print("Starting Magic............")

print(reddit.user.me())

title = input("Enter an epic title: ") 
url = input("Enter a sassy link: ") 
comment = input ("Enter your comment : ")

title2 = input("Enter an epic title: ") 
url2 = input("Enter a sassy link: ") 
comment2 = input ("Enter your comment : ")


title3 = input("Enter an epic title: ") 
url3 = input("Enter a sassy link: ") 
comment3 = input ("Enter your comment : ")


print("Reading reddit list")
subredit_list = open("datac.txt", "r")
subreddits = subredit_list.read().split(',')

for subreddit in subreddits:
  try:
    print(subreddit)
    reddit.validate_on_submit = True
    submission = reddit.subreddit(subreddit).submit(title,url=url)
    com = "#{}".format(comment)
    time.sleep(10)
    submission.reply(com)
    print ("done")
  except Exception as err:
    print("Exception for subreddit {}, {}".format(subreddit, err))
  t= random.randint(950,2150)
  seconds = "Sleeping for {} seconds before proceeding".format(t)
  print(seconds)
  time.sleep(t)

print("Reading reddit list")
subredit_list = open("datac.txt", "r")
subreddits = subredit_list.read().split(',')
t= random.randint(6650,7150)
for subreddit in subreddits:
  try:
    print(subreddit)
    reddit.validate_on_submit = True
    submission = reddit.subreddit(subreddit).submit(title2,url=url2)
    com = "#{}".format(comment2)
    time.sleep(10)
    submission.reply(com)
    print ("done")
  except Exception as err:
    print("Exception for subreddit {}, {}".format(subreddit, err))
  t= random.randint(950,2100)
  seconds = "Sleeping for {} seconds before proceeding".format(t)
  print(seconds)
  time.sleep(t)
  t= random.randint(6650,7150)
print("Reading reddit list")
subredit_list = open("datac.txt", "r")
subreddits = subredit_list.read().split(',')

for subreddit in subreddits:
  try:
    print(subreddit)
    reddit.validate_on_submit = True
    submission = reddit.subreddit(subreddit).submit(title3,url=url3)
    com = "#{}".format(comment3)
    time.sleep(10)
    submission.reply(com)
    print ("done")
  except Exception as err:
    print("Exception for subreddit {}, {}".format(subreddit, err))
  t= random.randint(900,2120)
  seconds = "Sleeping for {} seconds before proceeding".format(t)
  print(seconds)
  time.sleep(t)
  t= random.randint(6650,7150)

data = {}
count = 0
subredit_list = []
title_list = []
url_list = []
comment_list = []

print("Reading reddit list")
subredit = open("data.txt", "r")
for line in subredit:
    subredit_list.append(line.strip())

print("Reading title list")
title = open("title.txt", "r",  encoding="utf8")

for line in title:
    title_list.append(line.strip())

print("Reading url list")
url = open("url.txt", "r")
for line in url:
    url_list.append(line.strip())

print("Reading comment list")
comment = open("comment.txt", "r")
for line in comment:
    comment_list.append(line.strip())

for i in range(0, len(title_list)):
    for k in range(0, len(subredit_list)):
        try:
            # added code from above
            REDDIT_USERNAME = (reddit.user.me())

            response = requests.get("https://www.reddit.com/user/{}/about.json".format(REDDIT_USERNAME),
                                    headers={'User-agent': 'hiiii its {}'.format(REDDIT_USERNAME)}).json()
            if "error" in response:
                if response["error"] == 404:
                    print("account {} is shadowbanned. poor bot :( shutting down the script...".format(REDDIT_USERNAME))
                    sys.exit()
                else:
                    print(response)
            else:
                print("{} is not shadowbanned! We think..".format(REDDIT_USERNAME))

            print(subredit_list[k])
            print(title_list[i])
            print(url_list[i])
            print(comment_list[i])
            reddit.validate_on_submit = True
            submission = reddit.subreddit(subredit_list[k]).submit(title_list[i], url=url_list[i])
            com = "#[Meg@ l1ink]({})".format(comment_list[i])
            time.sleep(10)
            submission.reply(com)
            print("done")
        except Exception as err:
            print("Exception for subreddit {}, {}".format(subredit_list[k], err))
        t = random.randint(600, 750)
        seconds = "Sleeping for {} seconds before proceeding".format(t)
        print(seconds)
        time.sleep(t)
