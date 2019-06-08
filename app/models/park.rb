class Park < ApplicationRecord
    belongs_to :resort
    has_many :attractions
    has_many :entertainments

    def url
        Rails.application.routes.url_helpers.park_url(resort.slug, self.slug)
    end

    def resort_name
        resort.name
    end

    def as_json(options={})
        options.merge! :methods => [:url, :resort_name], :only => [:name], :include => {
            :attractions => {:methods => [:url], :only => [:name]},
            :entertainments => {:methods => [:url], :only => [:name]},
        }
        super(options)
    end
end
