class InvoicePdf < Prawn::Document

  def initialize(invoice, view)
    super()
    @invoice = invoice
    @view = view
    header
    details
    item_total
  end

  #def logo
  #  logopath =  "#{Rails.root}/app/assets/images/logo.png"
  #  image logopath, :width => 197, :height => 91
  #  move_down 10
  #  draw_text "Receipt", :at => [220, 575], size: 22
  #end

  def header
    move_down 10
    table header_info, :width => 500, :cell_style => { :borders => []} do
      row(0).font_style = :bold
      columns(0).align = :left
      columns(1).align = :right
      self.header = true
      self.column_widths = {0 => 250,1 => 250}
    end
  end

  def header_info
    [["Matt Cullerton","Invoice #{Time.now.strftime("%m/%d/%Y")}"],
     ["1026 Glen Arbor Dr.", "Please make all checks"],
     ["Encinitas, CA 92024", "payable to Matt Cullerton"],
     ["Phone: (703) 795-1529", "Date Issued: #{Time.now.strftime("%m/%d/%Y")}"],
     ["",""],
     ["Company: #{@invoice.account.name}",""],
     ["Contact: #{@invoice.account.contact_name} #{@invoice.account.contact_email}",""]
    ]
  end

  def details
    move_down 40
    table item_rows, :width => 500 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      self.column_widths = {0 => 200, 1 => 100, 2 => 100, 3 => 100}
    end
  end

  def item_rows
    [["Description", "Hours", "Rate", "Amount"]] +
        @invoice.time_entries.map do |time_entry|
          [ "#{time_entry.description} ", "#{time_entry.hours}",
            "$#{time_entry.account.rate}  ",
            "$#{time_entry.hours * time_entry.account.rate}" ]
        end
  end

  def item_total
    table [["Total:","$#{@invoice.time_entries.sum(:hours)*@invoice.account.rate}"]], :width => 500 do
      row(0).font_style = :bold
      columns(0..1).align = :right
      self.header = true
      self.column_widths = {0 => 400, 1 => 100}
    end
  end
end