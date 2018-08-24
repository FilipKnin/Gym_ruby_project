class Booking
  attr_accessor(:gymclass_id, :member_id)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @description = options['description']
  end

end
