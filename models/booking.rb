class Booking
  attr_accessor(:gymclass_id, :member_id)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @gymclass_id = options['gymclass_id'].to_i()
    @member_id = options['member_id'].to_i()
  end


  def save()
    sql = "INSERT INTO bookings
          (gymclass_id, member_id)
          VALUES
          ($1, $2) RETURNING *"
    values = [@gymclass_id, @member_id]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end
end
