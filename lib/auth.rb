require 'jwt'

class Auth

  ALGORITHM = 'HS256'

  def self.issue(payload)
  	    JWT.encode(payload,AUTH_SECRET,ALGORITHM)
  end

  def self.decode(token)
    # auth_secret = "a5b636b63646bba519b8f6ccf531abf1a884e0e168bab669e3455401ae4891a88073b7c4eb3157724228dc34300be4561207cc73ba167958ec7ffadd8a4d79ea"
  	  JWT.decode(token, AUTH_SECRET , true, { algorithm: ALGORITHM }).first
  end

  def self.auth_secret
     # ENV["AUTH_SECRET"]
  end

end  