class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def income
    @invoices = Invoice.where(invoice_type: "Ingreso")

    render :index
  end

  def expense
    @invoices = Invoice.where(invoice_type: "Egreso")

    render :index
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    invoice = Invoice.create(invoice_params)

    if invoice.save
      redirect_to invoices_path, notice: "La factura #{invoice.id} se agregó al sistema."
    else
      redirect_to invoice_new_path, alert: "La factura #{invoice.id} no pudo agregarse al sistema."
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(
      :issuer,
      :recipient,
      :description,
      :invoice_type,
      :date,
      :subtotal
      )
  end
end