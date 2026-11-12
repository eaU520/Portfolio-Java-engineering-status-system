
Skip to content
DEV Community
Find related posts...
Powered by Algolia 
Log in
Create account

9

8


Cover image for Quick And Dirty Java Makefile
Ben Lovy
Ben Lovy
Posted on Apr 8, 2020
•
Edited on Apr 8, 2020



13


2
Quick And Dirty Java Makefile
#
java
#
makefile
#
beginners
#
devjournal
I'm not a Java user and know next to nothing about it. Today was my first time ever running a line of Java directly. If you've ever used Java before, this is not going to blow your mind.

As part of my Ruby learning journey I'm working on translating some Java (specifically from the excellent Crafting Interpeters book), and while my Ruby implementation is the focus I want to be able to follow along locally with both languages. However, I didn't want to spend a ton of time learning about a whole ecosystem that I'm not targeting. Previously, I'd always assumed Java required bulky build tools and IDEs and lots of peripheral knowledge to hook everything up. I thought I needed use a full-fledged tool like Eclipse or IDEA to set up all the details for you and had no sense of how the build process worked.

As it turns out, while you can lean on tooling, you can of course also just pop some Java code in a text file and build and run it by hand! There is a javac CLI tool. Either use it directly or use GNU make to invoke it automatically.

Here's what I'm starting with:

JAVAC=javac
sources = $(wildcard *.java)
classes = $(sources:.java=.class)

all: program

program: $(classes)

clean:
    rm -f *.class

%.class: %.java
    $(JAVAC) $<

jar: $(classes)
    jar cvf program.jar $(classes)

.PHONY: all program clean jar
edit: added phony targets! Thanks Michael.

With this, you can invoke make to compile a Thing.class bytecode file for each Thing.java source file present. Then you get to run java Thing to execute it! You can also use make jar to roll everything together into a jar file.

All in all, not so different from anything else I've ever used!

This is, as promised, "quick and dirty". You can go forth from here and further customize your makefile, but if you want to do more than just quick experimentation, I do still think the IDE/Java-specific build tool route (Maven, Gradle, etc) is gonna be the way to go. For non-Java-users who just want to plunk about without wasting too much time on peripherals, though, this'll do you just fine.

Photo by Jakub Dziubak on Unsplash

💜 DEV is hiring

We're hiring a DEV Community Manager

Want to make DEV your full-time job?
We're hiring a full-time Community Manager to look after DEV every day: reading, posting, moderating, and helping members get fast, thoughtful answers.

See the role

Top comments (9)
Subscribe
pic
Add to the discussion

Submit
Preview
 
 
rpalo profile image
Ryan Palo
•
Apr 8 '20

I love this! I went through basically the exact same process for the exact same reasons 😁 the only difference is that I used some bash scripts instead of a makefile.

It’s hard to describe exactly how much I love that Crafting Interpreters book. So. Good. His teaching style lines up exactly with how I learn things.


2
 likes
Like

Reply
 
 
deciduously profile image
Ben Lovy 
•
Apr 8 '20

I'm just kicking myself for sitting on it for so long! Just the right pace, tone, and level of detail.


2
 likes
Like

Reply
 
 
uminer profile image
Moshe Uminer
•
Apr 8 '20

Interesting! I never thought to use a makefile for Java!

(And +1 for crafting interpreters - it's on my short list of things to do.)


2
 likes
Like

Reply
 
 
deciduously profile image
Ben Lovy 
•
Apr 8 '20

It'd been on my "to-do" for a long time - could not be happier I finally cracked it open.


2
 likes
Like

Reply
 
 
uminer profile image
Moshe Uminer
•
Apr 8 '20

Yeah, I'm almost ready to start, just wanted to finish writing a toy sqlite first - cstack.github.io/db_tutorial/

There are a lot of overlaps (parsing etc.), I think.


2
 likes
Like
Thread
 
deciduously profile image
Ben Lovy 
•
Apr 8 '20

welp, there's another for the stack... sounds fun!


2
 likes
Like

Reply
 
 
vlasales profile image
Vlastimil Pospichal
•
Apr 12 '20

I have integrated Vim and Makefile. When I invoke make from Vim, the .java is compiled and unit tested.


2
 likes
Like

Reply
 
 
wrldwzrd89 profile image
Eric Ahnell
•
Apr 8 '20

This is an interesting way to combine learning Makefiles with learning Java, should that ever come up in education or elsewhere.


2
 likes
Like

Reply
 
 
deciduously profile image
Ben Lovy 
•
Apr 8 '20

Yikes, true enough! Thanks


1
 like
Like

Reply
Code of Conduct • Report abuse
Google Cloud
Google Cloud
Promoted
Custom VMs From 1 to 96 vCPUs With 99.95% Uptime

Custom VMs From 1 to 96 vCPUs With 99.95% Uptime
Run VMs on high-performance and reliable cloud infrastructure. Choose from preset or custom machine types for web servers, databases, and applications that fuel your agents.

Learn More →


Ben Lovy
Follow
Just this guy, you know?
Location
Boston, MA, USA
Education
Currently enrolled @ Champlain College Online
Work
Rust Developer @ Tangram.dev
Joined
Mar 18, 2018
More from Ben Lovy
Oops, I Did It Again...I Made A Rust Web API And It Was Not That Difficult
#rust #beginners #tutorial #webdev
Prepare your Rust API docs for Github Pages
#beginners #tutorial #rust #github
Google Cloud
Google Cloud
Promoted
Ship Agents Faster

Ship Agents Faster
Rapidly deploy, scale, govern and optimize production-ready agents grounded in your organization’s data. Choose to build with Google’s latest multimodal models like Gemini 4 Argon, third-party models like Anthropic's Claude Model Family, and open models like Gemma in Model Garden.

Learn More →

JAVAC=javac
sources = $(wildcard *.java)
classes = $(sources:.java=.class)

all: ess

ess: $(classes)

clean:
    rm -f *.class

%.class: %.java
    $(JAVAC) $<

jar: $(classes)
    jar cvf ess.jar $(classes)

.PHONY: all ess clean jar