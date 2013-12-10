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

## A Note on Acquirer Reference Numbers (ARNs)

The MeS detailed report APIs return an acquirer reference number for every
transaction. Take a look at the MeS reporting API documentation under 'Links'
for more.

One issue we've seen is that the MeS API always returns reference numbers
pre-pended with an apostrophe. Instead of `123456789`, we consistently see
`'123456789`.

The MeS docs are inconsistent in its examples, showing apostrophes pre-pended
to some and none pre-pended to others. The MeS reporting front-end never shows
apostrophes in reference numbers, and the apostrophe is never addressed in the
documentation.

Further, the reference number is documented as a 23-character field. The apostrophe
consistently brings this field's length to 24 characters.

This is probably sloppiness on MeS' end, so by default this library removes these
apostrophes. If you want to keep the apostrophe for any reason -- personal preference,
interfacing with legacy records that have them -- you can get the reference number
unchanged from a record thusly:

    reference_number = record.reference_number(:unchanged => true)

## Links

* [MeS Reporting API documentation](http://resources.merchante-solutions.com/display/TPGPUB/MeS+Payment+Gateway+Developer's+Guide#MeSPaymentGatewayDeveloper%27sGuide-5.ReportingOptions)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Need a different report?
Adding new reports is easy! Each report consists of two classes, the report and the report record:

Creating a report requires the ```#report_type``` and ```#report_id``` methods to be defined as the params you would pass into the API. Additional default parameters can be specified in ```#report_specific_params```. ```includeTridentTranId```, ```includePurchaseId```, ```includeClientRefNum``` are turned on by default right now, because they would change the order of the columns in some reports. The report class must also specify its ```#record class```. If a report has both a summary and detail version, they should be defined as different classes. The [BatchDetailReport](https://github.com/harrystech/merchant_e_solutions/blob/master/lib/merchant_e_solutions/batch_detail_report.rb) is a good example to reference.

For each row in a report available in the web view there is an instance of a report's report record. Report records specify their attributes, and the order in which the attributes are pulled off of the report CSV. Report record classes also a good place to add co convenience methods. [DetailRecord](https://github.com/harrystech/merchant_e_solutions/blob/master/lib/merchant_e_solutions/detail_record.rb) is a good example to reference.

###TODO
1. Instances of reports can write out CSVs
2. Instances of reports can be generated by passing in CSVs(instead of having to pull CSVs directly from the API)
3. Report records pull their attributes from CSV column names instead of column orders
