def parse_invoices(invoice_data)
  # Regular expression pattern to match each line of the invoice entries
  pattern = /^(\d{4}-\d{2}-\d{2}) - (\w+) - ([\w\s]+) - \$([0-9,.]+)$/

  # Iterate over each line of the invoice data
  invoice_data.each_line do |line|
    # Match the pattern against each line
    match = line.match(pattern)

    # If the line matches the pattern, extract and display the details
    if match
      date = match[1]
      invoice_number = match[2]
      client_name = match[3]
      amount = match[4]

      # Display the extracted details in a structured format
      puts "Date: #{date}"
      puts "Invoice Number: #{invoice_number}"
      puts "Client Name: #{client_name}"
      puts "Amount: $#{amount}"
      puts "-" * 20
    end
  end
end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries)
