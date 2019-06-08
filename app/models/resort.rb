class Resort < ApplicationRecord
    has_many :parks

    def url
        Rails.application.routes.url_helpers.resort_url(self.slug)
    end

    def as_json(options={})
        options.merge! :methods => [:url], :only => [:name]
        super(options)
    end
end
