class Environment
  def get_parameters(env_name)
    # env_name = "dev"
    env_name = ENV['PLATFORM'] || 'dev'
    flunk("Test environment not specified. Set PLATFORM env. variable before running tests.") if env_name.nil? or env_name.empty?
    env_name = env_name.upcase
    parameters = {}
    valid_envs = %w(LOCAL DEV STG PRD DEV2 STG2 PRD2)
    unless valid_envs.include? env_name
      flunk("TEST SCRIPT ERROR: Wrong environment name: #{env_name}. Supported environments: #{valid_envs}")
    end

    case env_name
    when 'LOCAL'
      parameters[:api_host] = "http://python-greetings-app-local:3000"
    when 'DEV'
      parameters[:api_host] = "http://127.0.0.1:3000"
    when 'STG'
      parameters[:api_host] = "http://127.0.0.1:3050"
    when 'PRD'
      parameters[:api_host] = "http://127.0.0.1:4000"
    when 'DEV2'
      parameters[:api_host] = "http://hello-app-dev:8080"
    when 'STG2'
      parameters[:api_host] = "http://hello-app-stg:8080"
    when 'PRD2'
      parameters[:api_host] = "http://hello-app-prd:8080"
    else
      #   nothing
    end
    parameters
  end
end
