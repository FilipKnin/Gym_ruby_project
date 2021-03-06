require_relative('../db/sql_runner')

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

  def self.all()
    sql = "SELECT * FROM bookings"
    result = SqlRunner.run(sql)
    return result.map { |booking| Booking.new(booking) }
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM bookings
          WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.map { |booking| Booking.new(booking)  }
  end

  def delete()
    sql = "DELETE FROM bookings
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE bookings
          SET
          (gymclass_id, member_id)
          =
          ($1, $2)
          WHERE id = $3"
    values = [@gymclass_id, @member_id, @id]
    SqlRunner.run(sql, values)
  end

  # def add_booking(booking, gymclass)
  #   numofbookings = gymclass.count_num_of_bookings()
  #   if gymclass.check_space(numofbookings) == true
  #     booking.save()
  #   else
  #     return "We can't book it!"
  #   end
  # end

  # add booking v2

  def add_booking(gymclass)
    numofbookings = gymclass.count_num_of_bookings()
    if gymclass.check_space(numofbookings) == true
      save()
    else
      return "We can't book it!"
    end
  end

end
