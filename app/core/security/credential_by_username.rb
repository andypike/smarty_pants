module Security
  class CredentialByUsername < Rectify::Query
    def initialize(username)
      @username = username
    end

    def query
      Credential.where(
        "lower(username) = lower(:username)", :username => username
      )
    end

    private

    attr_reader :username
  end
end
