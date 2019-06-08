class AddDisneyResorts < ActiveRecord::Migration[5.2]
  def change
    resort = Resort.new(name: "Disney World", slug: "disney-world")
    resort.save
    Park.new(name:"Animal Kingdom", slug: "animal-kingdom", resort_id: resort.id).save
    Park.new(name:"Epcot", slug: "epcot", resort_id: resort.id).save
    Park.new(name:"Hollywood Studios", slug: "hollywood-studios", resort_id: resort.id).save
    Park.new(name:"Magic Kingdom", slug: "magic-kingdom", resort_id: resort.id).save

    resort = Resort.new(name: "Disneyland", slug: "disneyland")
    resort.save
    Park.new(name:"California Adventure", slug: "california-adventure", resort_id: resort.id).save
    Park.new(name:"Disneyland Park", slug: "disneyland-park", resort_id: resort.id).save

    resort = Resort.new(name: "Disneyland Paris", slug: "disneyland-paris")
    resort.save
    Park.new(name:"Disneyland Park", slug: "disneyland-park", resort_id: resort.id).save
    Park.new(name:"Walt Disney Studios", slug: "walt-disney-studios", resort_id: resort.id).save

    resort = Resort.new(name: "Hong Kong Disneyland", slug: "hong-kong-disneyland")
    resort.save
    Park.new(name:"Disneyland Park", slug: "disneyland-park", resort_id: resort.id).save
  end
end
