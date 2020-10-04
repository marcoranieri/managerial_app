module ApplicationHelper

  def choose_pic
    controller_name == "tables" ? 'dining-table.svg' : 'chef.svg'
  end

  def build_title(id)
    controller_name == "tables" ? build_tables_title(params[:id]) : ''
  end


  private

  def build_tables_title(table_number=nil)
    table_number ? "Table #{Table.find(table_number).table_number}" : ''
  end

end
