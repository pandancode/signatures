class PdfSignaturesController < ApplicationController
  layout "pdf"
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "signature"
      end
    end
  end
end
