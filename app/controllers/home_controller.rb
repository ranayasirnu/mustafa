class HomeController < ApplicationController
  #before_filter :authenticate_user!, :validate_authorization!
  skip_authorization_check
  def index
    # TODO base this on provider
    @patient_count = Record.count
    @categories = HealthDataStandards::CQM::Measure.categories([:lower_is_better, :type])
  end

  private
  def validate_authorization!
    authorize! :read, HealthDataStandards::CQM::Measure
  end
end
