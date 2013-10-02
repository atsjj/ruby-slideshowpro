module Slideshowpro
  class Gallery < Director
    class << self
      def find(id, options = {})
        options = {
          gallery_id: id,
          limit: nil,
          method: 'get_gallery',
          order: 'display',
          with_content: true
        }.merge(options)

        get options
      end

      def all(options = {})
        options = {
          method: 'get_album_list'
        }.merge(options)

        get options
      end
    end
  end
end
