module PlentyClient
  module Item
    module Variation
      class DefaultCategory
        extend PlentyClient::Endpoint
        extend PlentyClient::Request

        ITEM_VARIATION_DEFAULT_CATEGORY_PATH    = '/items/{itemId}/variations/{variationId}'.freeze

        LIST_ITEM_VARIATIONS_DEFAULT_CATEGORY   = '/variation_default_categories'.freeze
        GET_ITEM_VARIATIONS_DEFAULT_CATEGORY    = '/variation_default_categories/{plentyId}'.freeze
        CREATE_ITEM_VARIATIONS_DEFAULT_CATEGORY = '/variation_default_categories'.freeze
        DELETE_ITEM_VARIATIONS_DEFAULT_CATEGORY = '/variation_default_categories/{plentyId}'.freeze

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_DEFAULT_CATEGORY_PATH}#{LIST_ITEM_VARIATIONS_DEFAULT_CATEGORY}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def find(item_id, variation_id, plenty_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_DEFAULT_CATEGORY_PATH}#{GET_ITEM_VARIATIONS_DEFAULT_CATEGORY}",
                               item: item_id,
                               variation: variation_id,
                               plenty: plenty_id), headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_DEFAULT_CATEGORY_PATH}#{CREATE_ITEM_VARIATIONS_DEFAULT_CATEGORY}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def delete(item_id, variation_id, marketplace_id)
            delete(build_endpoint("#{ITEM_VARIATION_DEFAULT_CATEGORY_PATH}#{DELETE_ITEM_VARIATIONS_DEFAULT_CATEGORY}",
                                  item: item_id,
                                  variation: variation_id,
                                  marketplace: marketplace_id))
          end
        end
      end
    end
  end
end
