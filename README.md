# Imagefetcher
This "command line script" can be used to download the images listed in a plain text file and to store them on the local hard disk.

Approach:

	The "Initialize" method will receive arguments from command line script.

	The "Downloader" method is responsible for iterating file line by line, here each line will be verified whether it has any content or not. Any line with content will be processed for next step where as empty lines will not be processed.

	In the next steps encoding(using CGI to encode) and parsing(URI to parse) the url will be done. To save the images from URL a directory named "images" will be created. However the system will also check whether directory already exists or not.

	"Net::HTTP.get_response()" will fetch the response from URL, if the response is success then it copies the content into images folder.

	In case of exceptions "rescue StandardError" will catch the errors and give the relevant failure message.

Input:

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
