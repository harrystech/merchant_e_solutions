# MerchantESolutions

A gem to more easily interact with the Merchant e-Solutions API[(v2.3)](http://resources.merchante-solutions.com/download/attachments/1411006/MeS+Reporting+API+ver2.3+March+2013.pdf).

## Installation

Add this line to your application's Gemfile:

    gem 'merchant_e_solutions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install merchant_e_solutions

## Usage
Request a report:
```ruby
report = MerchantESolutions.settlement_detail_report
```
Each report has records which hold all the data passed back and some convience methods:
```
record = report.records.first

record.card_code        # => "MD"
record.credit_company   # => "MasterCard"
record.credit_type      # => "Debit"
```

## Configuration

Add your user id and password in an initializer:
```ruby
MerchantESolutions.configure do |config|
  config.user_id = "yourUserID"
  config.password = "yourPassword"
end
```
or as environment variables:
```bash
echo $MERCHANT_E_SOLUTIONS_USER_ID  # yourUserID
echo $MERCHANT_E_SOLUTIONS_PASSWORD # yourPassword
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
