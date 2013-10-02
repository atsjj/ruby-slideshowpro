module Slideshowpro
  class Content < Director
    class << self
      def find(id, options = {})
        options = {
          method: 'get_content',
          content_id: id
        }.merge(options)

        get options
      end

      def all(options = {})
        options = {
          limit: 0,
          method: 'get_content_list',
          only_active: true,
          only_images: false,
          scope: [],
          sort_direction: 'DESC',
          sort_on: 'created_on',
          tags: []
        }.merge(options)

        if options[:tags][1] === 'all'
          options[:tags_exclusive] = true
        else
          options[:tags_exclusive] = false
        end

        unless options[:tags].empty?
          options[:tags] = options[:tags].first
        end

        if options[:sort_on] === 'random'
          options[:buster] = Random.rand 1..10
        end

        get options
      end
    end
  end
end
