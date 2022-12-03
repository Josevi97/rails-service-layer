class ApplicationError < StandardError

  attr_reader :status

  def initialize(response, status)
    @status = status

    super(response)
  end

end
