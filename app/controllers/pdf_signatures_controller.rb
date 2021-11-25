class PdfSignaturesController < ApplicationController
  layout "pdf"
  def show
    render :show, locals: { individual: current_user.individual }
  end
end
