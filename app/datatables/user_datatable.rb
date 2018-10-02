class UserDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: {source: "User.id"},
      name: {source: "User.name", cond: :like, searchable: true, orderable: true},
      email: {source: "User.email", formatter: ->(email){email.downcase}},
      sign_in_count: {source: "User.sign_in_count"},
      last_sign_in_at: {source: "User.last_sign_in_at"},
      last_sign_in_ip: {source: "User.last_sign_in_ip"},
      role: {source: "User.role"}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        email: record.email,
        sign_in_count: record.sign_in_count,
        last_sign_in_at: record.last_sign_in_at,
        last_sign_in_ip: record.last_sign_in_ip,
        role: record.role,
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    # insert query here
    User.all
  end
end
