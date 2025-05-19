require 'json'
require 'net/http'

def fetch_supportedCurrencies

    api_key = 'copy-your-api-key-here'
    url = "https://openexchangerates.org/api/currencies.json?prettyprint=false&show_alternative=false&show_inactive=false&app_id=#{api_key}"
    uri = URI(url)

    response = Net::HTTP.get(uri)
    rates = JSON.parse(response)
end

def fetch_exchangeinfo(baseCurrency, targetCurrency)
    
    api_key = 'copy-your-api-key-here'
    url = "https://openexchangerates.org/api/latest.json?app_id=#{api_key}"
    uri = URI(url)

    response = Net::HTTP.get(uri)
    rates = JSON.parse(response)['rates']

    baseRate = rates[baseCurrency]
    targetRate = rates[targetCurrency]

    if baseRate && targetRate
        conversionRate = targetRate / baseRate
        return conversionRate
    else
        return nil
    end
end

def convertCurrency(amount, baseCurrency, targetCurrency)
    
    currencyToConvert = fetch_exchangeinfo(baseCurrency, targetCurrency)

    if currencyToConvert
        convertedAmount = amount * currencyToConvert
        return convertedAmount.round(2)
    else
        return nil
    end
end

def prompt(message)
    print "#{message}: "
    gets.chomp
end

def currenciesFormat
    sorted = fetch_supportedCurrencies.sort
    sorted.each do |code, country| puts "#{code} - #{country}"
    end
end

def converterStart

    loop do

        puts
        supportedYN = prompt("Would you like to see the list of supported currencies? (Y/N)")
        answer = supportedYN.upcase
        puts

        case answer
            when 'Y' 
            currenciesFormat
        break
            when 'N'
        break
        else
            puts "Please enter Y or N"
        end
    end

    puts
    amount = prompt('Enter the amount to convert ')
    baseCurrency = prompt('Enter the base currency (e.g., CAD, USD)')
    targetCurrency = prompt('Enter the target currency')

    convertedAmount = convertCurrency(amount.to_f, baseCurrency.upcase, targetCurrency.upcase)

    if convertedAmount
        puts "#{amount} #{baseCurrency} is equal to #{convertedAmount} #{targetCurrency}"
    else
        puts "Sorry, currency conversion is not available for the specified currencies."
    end
end

converterStart




