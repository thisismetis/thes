class ThesLinkedInClient < LinkedIn::Client
  def companies(options = {})
    options.merge!(is_admin: "true")
    path = company_path(options)
    Rails.logger.debug "Thing2: #{path}"
    simple_query(path, options)
  end

  def company_path(options)
    path = super
    if fields = options.delete(:fields)
      path = strip_tilda path
      path += company_profile_fields fields
    else
      path
    end
  end

  def company_profile(options={})
    path = company_path(options)
    simple_query(path, options)
  end

  private

  def strip_tilda(path)
    if path.last == "~"
      path.chop!
    end
    path
  end

  def company_profile_fields(fields)
    id = fields[:id]
    fields_string = fields[:all].join(",")
    "#{id}:(#{fields_string})"
  end
end
