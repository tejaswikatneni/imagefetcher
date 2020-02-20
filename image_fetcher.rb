require 'cgi'
require 'net/http'
# frozen_string_literal: true
# Image Fetcher used to download images from urls from given text file
class ImageFetcher
  def initialize(arguments)
    @arguments = arguments
  end

  def downloader
    return do_exit_downloder if @arguments.empty?

    Dir.mkdir('images') unless Dir.exist?('images')
    File.open(@arguments[0]).each_line do |line|
      next if line.match(/^[\s]*$\n/)

      encoded_url = CGI.unescape(line.chomp)
      host_uri = URI.parse(encoded_url)
      http_image_downloader(host_uri)
    end
  end

  def do_exit_downloader
    puts 'Please enter plain text file as an' \
                'argument Example: text_list.txt'
  end

  def http_image_downloader(host_uri)
    resp = Net::HTTP.get_response(host_uri)
    if resp.is_a?(Net::HTTPSuccess)
      path = File.join('images', host_uri.path.split('/')[-1])
      File.open(path, 'wb') { |f| f.write(resp.body) }
      puts "#{host_uri} ----File downloaded 100%---"
    else
      puts "#{host_uri} --- There is no content to download here"
    end
  rescue StandardError => e
    puts "Error Message: #{host_uri} #{e}"
  end
end
p = ImageFetcher.new(ARGV)
p.downloader
