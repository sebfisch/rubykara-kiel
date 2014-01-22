rubykara-kiel.jar: rubykara-x.jar lib/ruby/1.8/rubykara-kiel.rb rubykara-kiel.patch \
		kappsresources/language.de.xml META-INF/NOTICE.txt
	patch -p1 < rubykara-kiel.patch
	cp $< $@
	jar uf $@ lib/ruby/1.8/rubykara-kiel.rb \
		kappsresources/language.de.xml META-INF/NOTICE.txt
	rm -rf kappsresources META-INF

rubykara-x.jar:
	wget http://www.swisseduc.ch/informatik/karatojava/rubykara/classes/rubykara-x.jar

kappsresources/language.de.xml: rubykara-x.jar
	jar xf $< $@

META-INF/NOTICE.txt: rubykara-x.jar
	jar xf $< $@

clean:
	rm -rf kappsresources META-INF old new

clean-all: clean
	rm *.jar

patch-folders: clean kappsresources/language.de.xml META-INF/NOTICE.txt
	mkdir old
	cp -r kappsresources META-INF old/
	patch -p1 < rubykara-kiel.patch
	mkdir new
	mv kappsresources META-INF new/

patch-file:
	diff -rupN old/ new/ > rubykara-kiel.patch || test $$? = 1
