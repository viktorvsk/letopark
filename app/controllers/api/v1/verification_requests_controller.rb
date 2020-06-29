# frozen_string_literal: true

module Api
  module V1
    class VerificationRequestsController < ApiController
      def update
        verification_request = VerificationRequest.where(phone: params[:phone]).first_or_initialize
        verification_request.set_code

        if verification_request.save
          Rails.logger.info(verification_request.code)
          # TurboSMS.send_sms(verification_request.phone, verification_request.code)
          render json: { message: :ok }, status: :created
        else
          render json: { errors: verification_request.errors }, status: :bad_request
        end
      end
    end
  end
end
