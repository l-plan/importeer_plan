#more on configuration on http://juanitofatas.com/2015/05/19/rubygem-configuration-pattern/

module ImporteerPlan
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(configuration)
    @configuration = configuration
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :dir

    def initialize

      @dir = Rails.root.join('public/imports/')
     

    end
  end
end