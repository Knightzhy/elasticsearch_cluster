.PHONY: all clean


CWD = $(shell pwd)
THIRDPARTY = $(shell cd ../thirdparty && pwd)
THIRDPARTYSOURCE = $(shell cd ../thirdparty-sources && pwd)
STAGING = $(CWD)/staging
ES_TAR=elasticsearch-6.6.2.tar.gz
ES=elasticsearch-6.6.2
JAVA_TAR=jdk-8u201-linux-x64.tar.gz
JAVA=jdk1.8.0_201

CD = cd
CP = cp -pdr
RM = rm -f -r
MD = mkdir
TAR = tar -xf
MV = mv

all: clean
	$(MD) $(STAGING)
	$(CD) $(STAGING) && $(MD) bin etc lib log tmp
	$(CP) $(THIRDPARTYSOURCE)/sources/$(ES_TAR) $(STAGING)/tmp/
	$(CP) $(THIRDPARTYSOURCE)/sources/$(JAVA_TAR) $(STAGING)/tmp/
	$(CD) $(STAGING)/tmp/ && $(TAR) $(ES_TAR)
	$(CD) $(STAGING)/tmp/ && $(TAR) $(JAVA_TAR)
	$(MV) $(STAGING)/tmp/$(ES)/* $(STAGING)/
	$(MV) $(STAGING)/tmp/$(JAVA) $(STAGING)/jdk/
	$(CP) $(CWD)/bin/* $(STAGING)/bin/
	$(CP) $(CWD)/etc/elasticsearch.yml $(STAGING)/config/
	$(RM) $(STAGING)/tmp/



clean:
	$(RM) $(STAGING)
