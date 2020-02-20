# imagefetcher
Command line script that takes plain text file as an argument and download all images listed in each line and storing them on a local hard disk

Approach:
	System will takes the arguments from command line script those will come to the "initialize" method.

	Downloader method is responsible for iterating file line by line, each line system will verify whether the current line has any content or not. If any content present in that line it allows for next step

	In the next steps encoding(using CGI to encode) and parsing(URI to parse) the url.
	To save the images from URL creating one directory named "images" (system will check whether directory exists or not.)

	Used Net::HTTP to get the response from URL, From that if it get success response then it copies the content into images folder.

	Handled exceptions with rescue StandardError to catch errors

Usage:
	Example content to place in test_list.txt
	https://homepages.cae.wisc.edu/~ece533/images/airplane.png

	https://homepages.cae.wisc.edu/~ece533/images/arctichare.png

	https://homepages.cae.wisc.edu/~ece533/images/cat.png
	www.google.com
	http://www.abc.com
	testabc
	http://mywebserver.com/images/271947.jpg
	http://mywebserver.com/images/24174.jpg
	http://somewebsrv.com/img/992147.jpg

Command:
	ruby image_fetcher.rb 'filepath'
  
	Example:
	ruby image_fetcher.rb test_list.txt
	placed test file in imagefetcher folder for testing purpose.

Output:

	https://homepages.cae.wisc.edu/~ece533/images/airplane.png ----File downloaded 100%---
	https://homepages.cae.wisc.edu/~ece533/images/arctichare.png ----File downloaded 100%---
	https://homepages.cae.wisc.edu/~ece533/images/cat.png ----File downloaded 100%---
	Error Message: www.google.com Failed to open TCP connection to :80 (Connection refused - connect(2) for nil port 80)
	http://www.abc.com --- There is no content to download here
	Error Message: testabc Failed to open TCP connection to :80 (Connection refused - connect(2) for nil port 80)
	http://mywebserver.com/images/271947.jpg --- There is no content to download here
	http://mywebserver.com/images/24174.jpg --- There is no content to download here
	Error Message: http://somewebsrv.com/img/992147.jpg Failed to open TCP connection to somewebsrv.com:80 (getaddrinfo: Name or service not known)
