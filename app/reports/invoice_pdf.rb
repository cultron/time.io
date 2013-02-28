class InvoicePdf < Prawn::Document

  def initialize(invoice, view)
    super()
    @invoice = invoice
    @view = view
   # logo
    thanks_message
    subscription_date
    subscription_details
    subscription_amount
    regards_message
  end

  #def logo
  #  logopath =  "#{Rails.root}/app/assets/images/logo.png"
  #  image logopath, :width => 197, :height => 91
  #  move_down 10
  #  draw_text "Receipt", :at => [220, 575], size: 22
  #end

  def thanks_message
    move_down 80
    text "Hello #{@invoice.account.contact_name.capitalize},"
    move_down 15
    text "Thank you for your order.Print this receipt as
    confirmation of your order.",
         :indent_paragraphs => 40, :size => 13
  end

  def subscription_date
    move_down 40
    text "Subscription start date:", :size => 13
    move_down 20
    text "Subscription end date :", :size => 13
  end

  def subscription_details
    move_down 40
    table subscription_item_rows, :width => 500 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      self.column_widths = {0 => 200, 1 => 100, 2 => 100, 3 => 100}
    end
  end

  def subscription_amount
    #subscription_amount = @invoice.calculate_subscription_amount
    #vat = @invoice.calculated_vat
    #delivery_charges = @invoice.calculated_delivery_charges
    #sales_tax =  @invoice.calculated_sales_tax
    table ([["Vat (12.5% of Amount)", "", "", ""] ,
            ["Sales Tax (10.3% of half the Amount)", "", "",
             ""]   ,
            ["Delivery charges", "", "", "  "],
            ["", "", "Total Amount", "  "]]),
          :width => 500 do
      columns(2).align = :left
      columns(3).align = :right
      self.header = true
      self.column_widths = {0 => 200, 1 => 100, 2 => 100, 3 => 100}
      columns(2).font_style = :bold
    end
  end

  def subscription_item_rows
    [["Description", "Quantity", "Rate", "Amount"]] +
        @invoice.time_entries.map do |time_entry|
          [ "#{time_entry.description} ", time_entry.hours,
            "#{precision(time_entry.account.rate)}  ",
            "#{precision(time_entry.hours * time_entry.account.rate)}" ]
        end
  end

  def precision(num)
    #@view.number_with_precision(num, :precision => 2)
  end

  def regards_message
    move_down 50
    text "Thank You," ,:indent_paragraphs => 400
    move_down 6
    text "XYZ",
         :indent_paragraphs => 370, :size => 14, style:  :bold
  end

end