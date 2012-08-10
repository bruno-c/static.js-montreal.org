require 'pp'

module JsMtl

  class Meetups

    def initialize
      @meetups = Awestruct::AStruct.new(YAML.load(File.read(File.join(config_dir, 'meetups.yml'))))
      @production = true
    end

    def execute(site)
      site.meetups = @meetups.meetups      
    end

    private

    def config_dir
      File.absolute_path(File.join(File.dirname(__FILE__), '..', '_config'))
    end
  end

  module Helpers
    def gravaturl(email)
      hash = Digest::MD5.hexdigest(email.downcase)
      "http://www.gravatar.com/avatar/#{hash}"
    end

    # Is this meetup happening in the past?
    def past?(meetup)
      Date.parse(meetup["on"]) < Date.today
    end

    # Do we have enough speakers for the next meetup (ie, more than 1)
    # If not we're gonna change the header a bit..
    def booked?(meetup)
      meetup.speakers.size > 1
    end

    def gogodate( yyyymmdd )
      "#{yyyymmdd[0..3]}.#{yyyymmdd[4..5]}.#{yyyymmdd[6..7]}"
    end

    def zedate(meetup)
      Date.parse(meetup.on).strftime("%A, %B %d")
    end

  end
end
