module PlentyClient
  module Item
    module Manufacturer
      extend PlentyClient::Endpoint
      extend PlentyClient::Request

      LIST_ALL_MANUFACTURERS  = '/items/manufacturers'.freeze
      GET_MANUFACTURER        = '/items/manufacturers/{manufacturerId}'.freeze
      CREATE_MANUFACTURER     = '/items/manufacturers'.freeze
      UPDATE_MANUFACTURER     = '/items/manufacturers/{manufacturerId}'.freeze
      DELETE_MANUFACTURER     = '/items/manufacturers/{manufacturerId}'.freeze

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_ALL_MANUFACTURER), headers, &block)
        end

        def find(manufacturer_id, headers = {}, &block)
          get(build_endpoint(GET_MANUFACTURER, manufacturer: manufacturer_id), headers, &block)
        end

        def create(headers = {})
          post(build_endpoint(CREATE_MANUFACTURER), headers)
        end

        def update(manufacturer_id, headers = {})
          put(build_endpoint(UPDATE_MANUFACTURER, manufacturer: manufacturer_id), headers)
        end

        def delete(manufacturer_id)
          delete(build_endpoint(DELETE_MANUFACTURER, manufacturer: manufacturer_id))
        end
      end
    end
  end
end
