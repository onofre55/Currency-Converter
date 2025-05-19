# Currency Converter
An introductory project I built to get started with Ruby. This is a command-line application that fetches live exchange rates from OpenExchangeRates.org and converts a specified amount from any currency into another.
I followed a tutorial from [Batoul Alkarim](https://medium.com/@batoulalkarim1) to build the core, then added a feature to list all supported currencies.

# What I learned

* Making HTTP requests in Ruby with Net::HTTP and parsing JSON.
* Structuring a command-line app with prompts and helper methods.
* Validating user input and handling unknown currency codes.
* Sorting and printing data in a readable format.

# Preview

### List of Supported Currencies 
![image](https://github.com/user-attachments/assets/c821ee6b-76ca-4790-bc48-4e59da3ee016)

### Conversion
![image](https://github.com/user-attachments/assets/fc63a91a-2917-4fab-89de-3a4d9c3b4c9b)

# How to Use

1. **Get your API Key:**
   - Sign up on OpenExchangeRates.org: https://openexchangerates.org/signup
   - Copy your API key from the "App IDs" section in your account settings.

2. **Configure the API Key:**
   - Open the `currencyconv.rb` file.
   - Find the line:
     ```api_key = 'copy-your-api-key-here'``` and replace it with your own API key.

3. **Run the App:**
   - After configuring the API key, open the terminal and navigate into the project folder by entering `cd .\currencyConverter`
   - To run it enter `ruby currencyconv.rb`, now you can convert any amount from any currency into the one you need!
