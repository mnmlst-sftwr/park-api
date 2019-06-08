require 'park_info'

def sluggify(name)
    name.split.collect {|p| p.gsub(/[\W]/, '') }.join('-').downcase
end

def load_all(resort_slug, park_slug, attractions)
    resort = Resort.find_by_slug(resort_slug)
    park = resort.parks.find_by_slug(park_slug)

    attractions.each do |a|
        api_id, etype = a.id.split(';entityType=')
        model = nil

        name = a.name.sub(' - Temporarily Closed', '')

        next if api_id.blank? || name.blank?

        if etype == 'Attraction'
            if park.attractions.find_by_api_key(api_id).nil?
                model = Attraction.new(park_id: park.id, api_key: api_id, name: name, slug: sluggify(name))
            end
        elsif etype == 'Entertainment'
            if park.entertainments.find_by_api_key(api_id).nil?
                model = Entertainment.new(park_id: park.id, api_key: api_id, name: name, slug: sluggify(name))
            end
        else
            p "? #{name}"
        end

        unless model.nil?
            if !model.save
                p model
                p model.errors.full_messages
                break
            end
        end
    end

end

namespace :disney do
  desc "Load Disney Attractions and Entertainment"
  task :load_attractions => :environment do
    load_all('disney-world', 'animal-kingdom', ParkInfo::DisneyWorld::AnimalKingdom.new.attractions)
    load_all('disney-world', 'epcot', ParkInfo::DisneyWorld::Epcot.new.attractions)
    load_all('disney-world', 'hollywood-studios', ParkInfo::DisneyWorld::HollywoodStudios.new.attractions)
    load_all('disney-world', 'magic-kingdom', ParkInfo::DisneyWorld::MagicKingdom.new.attractions)

    load_all('disneyland', 'california-adventure', ParkInfo::Disneyland::CaliforniaAdventure.new.attractions)
    load_all('disneyland', 'disneyland-park', ParkInfo::Disneyland::DisneylandPark.new.attractions)

    #load_all('disneyland-paris', 'disneyland-park', ParkInfo::DisneylandParis::DisneylandPark.new.attractions)
    #load_all('disneyland-paris', 'walt-disney-studios', ParkInfo::DisneylandParis::WaltDisneyStudios.new.attractions)

    #load_all('hong-kong-disneyland', 'disneyland-park', ParkInfo::HongKongDisneyland::DisneylandPark.new.attractions)
    
  end
end