class ApiController < ApplicationController
  # skip_before_action :require_login # or whatever callback was
                                    # set up to require login
  # http_basic_authenticate_with name: ENV["API_USERNAME"]
  #                              password: ENV["API_PASSWORD"]
end