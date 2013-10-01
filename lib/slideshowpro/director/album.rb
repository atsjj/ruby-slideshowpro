module Slideshowpro
  class Album < Director
    class << self
      def find(id, options = {})
        options = {
          method: 'get_album',
          only_active: true,
          data: { album_id: id }
        }.merge(options)

        get options
      end

      def all(options = {})
        options = {
          method: 'get_album_list',
          only_published: true,
          only_active: true,
          list_only: false,
          only_smart: false,
          exclude_smart: false,
          tags: []
        }.merge(options)

        get options
      end
    end
  end
end
