module UmichLDAP
  
  def self.get_name_parts_by_uniqname(uniqname)
    ldap_handle = Net::LDAP.new
    ldap_handle.host = "ldap.umich.edu"
    ldap_handle.port = 389
    
    filter = Net::LDAP::Filter.eq "uid", uniqname
    entry = ldap_handle.search(base: "dc=umich, dc=edu", attributes: ["givenName", "sn"], filter: filter)
    
    raise "The uniqname you entered is invalid." if entry.empty?
    entry = entry.first
    
    {
      first_name: entry.givenName.any? ? entry.givenName.first : "", 
      last_name: entry.sn.any? ? entry.sn.first : ""
    }
  end
  
end