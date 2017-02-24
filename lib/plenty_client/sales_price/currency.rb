module PlentyClient
  module SalesPrice
    class Currency
      extend PlentyClient::Endpoint
      extend PlentyClient::Request

      LIST_SALES_PRICE_CURRENCIES      = '/items/sales_prices/{salesPriceId}/currencies'.freeze
      ACTIVATE_SALES_PRICE_CURRENCY    = '/items/sales_prices/{salesPriceId}/currencies'.freeze
      DEACTIVATE_SALES_PRICE_CURRENCY  = '/items/sales_prices/{salesPriceId}/currencies/{currencyIso}'.freeze

      class << self
        def list(sales_price_id, headers = {}, &block)
          get(build_endpoint(LIST_SALES_PRICE_CURRENCIES, sales_price: sales_price_id), headers, &block)
        end

        def activate(sales_price_id, headers = {})
          post(build_endpoint(ACTIVATE_SALES_PRICE_CURRENCY, sales_price: sales_price_id), headers)
        end

        def deactivate(sales_price_id, currency_iso)
          delete(build_endpoint(DEACTIVATE_SALES_PRICE_CURRENCY, sales_price: sales_price_id, currency: currency_iso))
        end
      end
    end
  end
end
