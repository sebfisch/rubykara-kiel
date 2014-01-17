rubykara-kiel.jar: rubykara-x.jar \
					lib/ruby/1.8/rubykara-kiel.rb \
					rubykara-kiel.patch \
					kappsresources/language.de.xml \
					META-INF/NOTICE.txt
	patch -p1 < rubykara-kiel.patch
	cp $< $@
	jar uf $@ lib/ruby/1.8/rubykara-kiel.rb \
		kappsresources/language.de.xml META-INF/NOTICE.txt

rubykara-x.jar:
	wget http://www.swisseduc.ch/informatik/karatojava/rubykara/classes/rubykara-x.jar

kappsresources/language.de.xml: rubykara-x.jar
	jar xf $< $@

META-INF/NOTICE.txt: rubykara-x.jar
	jar xf $< $@
