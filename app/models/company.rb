class Company < User
  has_one :profile, class_name: "CompanyProfile"
end
