module PlentyClient
  module Item
    module Manufacturer
      class Commission
        extend PlentyClient::Endpoint
        extend PlentyClient::Request

        ITEM_MANUFACTURER_COMMISSION          = '/items/manufacturers/{manufacturerId}'.freeze

        LIST_ITEM_MANUFACTURER_COMMISSION     = '/commissions'.freeze
        GET_ITEMS_MANUFACTURER_COMMISSION     = '/commissions/{commissionId}'.freeze
        CREATE_ITEM_MANUFACTURER_COMMISSION   = '/commissions'.freeze
        UPDATE_ITEMS_MANUFACTURER_COMMISSION  = '/commissions/{commissionId}'.freeze
        DELETE_ITEMS_MANUFACTURER_COMMISSION  = '/commissions/{commissionId}'.freeze

        class << self
          def list(manufacturer_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_MANUFACTURER_COMMISSION}#{LIST_ITEM_MANUFACTURER_COMMISSION}",
                               manufacturer: manufacturer_id),
                headers, &block)
          end

          def find(manufacturer_id, commission_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_MANUFACTURER_COMMISSION}#{GET_ITEMS_MANUFACTURER_COMMISSION}",
                               manufacturer: manufacturer_id,
                               commission: commission_id),
                headers, &block)
          end

          def create(manufacturer_id, headers = {})
            post(build_endpoint("#{ITEM_MANUFACTURER_COMMISSION}#{CREATE_ITEM_MANUFACTURER_COMMISSION}",
                                manufacturer: manufacturer_id),
                 headers)
          end

          def update(manufacturer_id, commission_id, body = {})
            put(build_endpoint("#{ITEM_MANUFACTURER_COMMISSION}#{UPDATE_ITEMS_MANUFACTURER_COMMISSION}",
                               manufacturer: manufacturer_id,
                               commission: commission_id),
                body)
          end

          def delete(manufacturer_id, commission_id)
            delete(build_endpoint("#{ITEM_MANUFACTURER_COMMISSION}#{DELETE_ITEMS_MANUFACTURER_COMMISSION}",
                                  manufacturer: manufacturer_id,
                                  commission: commission_id))
          end
        end
      end
    end
  end
end
