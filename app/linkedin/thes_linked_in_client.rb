class ThesLinkedInClient < LinkedIn::Client
  def companies(options = {})
    options.merge!(is_admin: "true")
    path = company_path(options)
    simple_query(path, options)
  end

  def company_profile(company_id, options={})
    path = company_path({}).chop + "#{company_id}:(#{fields(options[:fields])})"
    simple_query(path, {})
  end

  def fields(fields)
    fields.join(",")
  end
end
