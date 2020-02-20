# imagefetcher
Command line script that takes plain text file as an argument and download all images listed in each line and storing them on a local hard disk


Usage:

	Example text file named "test_list.txt" contains these lines

	https://homepages.cae.wisc.edu/~ece533/images/airplane.png

	https://homepages.cae.wisc.edu/~ece533/images/arctichare.png

	https://homepages.cae.wisc.edu/~ece533/images/cat.png
	www.google.com
	http://www.abc.com
	hgfhgfgfh

Command:

	ruby foo.rb test_list.txt

Output: 

	https://homepages.cae.wisc.edu/~ece533/images/airplane.png----File downloaded 100%---
	https://homepages.cae.wisc.edu/~ece533/images/arctichare.png----File downloaded 100%---
	https://homepages.cae.wisc.edu/~ece533/images/cat.png----File downloaded 100%---
	----UNKNOWNError----www.google.com
	---HTTPRedirectionError---http://www.abc.com
	----UNKNOWNError----hgfhgfgfh



