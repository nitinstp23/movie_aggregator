class Aggregator < Thor
  module Constants

    SETTINGS = YAML.load_file('config/settings.yml')

  end
end
