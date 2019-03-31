class ApplicationController < ActionController::API

  def liveness
    logger.info 'Alive.....'
    head 204
  end

  def readiness
    # Ensure that database is connected
    pg = !!ActiveRecord::Base.connection
    
    if pg
      logger.info 'Ready......'
      head 204
    else
      logger.debug 'Not Ready......'
      render json: { errors: { pgdb: pg } }, status: 500
    end
  end
end
