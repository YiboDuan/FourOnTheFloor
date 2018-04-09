module Actions
  module Influencer
    class GetCollection
      include Verbalize::Action

      def call
        [
          {
            id: 1,
            username: 'Ronald Mcdonald',
            posts: [
              {
                id: 1,
                date: Date.current,
                caption: 'I am amazing.'
              }
            ]
          }
        ]
      end
    end
  end
end
