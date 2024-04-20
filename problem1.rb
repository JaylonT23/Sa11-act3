def extract_urls(text)
  # Regular expression to match URLs
  url_regex = %r{
    \b
    (                           # Capture group for the URL
      (?:https?|ftp):\/\/      # Match http, https, or ftp
      (?:www\.)?                # Match www. (optional)
      [-\w]+(?:\.\w[-\w]*)+    # Domain name (including subdomains)
      (?::\d+)?                 # Port number (optional)
      (?:\/[^\\/\s?#]*)*       # Path (optional)
      (?:\?(?:[^\\/?#]+=[^\\/?#]+&?)*)?    # Query string (optional)
      (?:#[^\\/?#]+)?          # Fragment (optional)
    )
  }ix

  # Extract URLs using the regex
  urls = text.scan(url_regex).flatten

  # Output each URL found within the string on a new line
  urls.each { |url| puts url }
end

# Sample text
sample_text = "Visit our site at http://www.example.org for more information. Check out our search page at https://example.com/search?q=ruby+regex. Don’t forget to ftp our resources at ftp://example.com/resources."

# Extract and output URLs from the sample text
extract_urls(sample_text)
