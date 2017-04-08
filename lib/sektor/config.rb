module Sektor
  class Config
    attr_accessor :domain, :proxy

    def initialize
      @domain = "www.my-free-mp3.website"
      @proxy = nil
    end
  end
end
