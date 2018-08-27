require_relative( '../db/sql_runner' )

class Member
  attr_accessor(:name, :email, :phone, :dob, :premium)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @email = options['email']
    @phone = options['phone'].to_i()
    @dob = options['dob']
    @premium = options['premium']
  end

  def save()
    sql = "INSERT INTO members
          (name, email, phone, dob, premium)
          VALUES
          ($1, $2, $3, $4, $5) RETURNING *"
    values = [@name, @email, @phone, @dob, @premium]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM members"
    result = SqlRunner.run(sql)
    return result.map { |member| Member.new(member) }
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def find_age()
    sql = "SELECT EXTRACT(YEAR FROM age(dob)) FROM members
          WHERE dob = $1"
    values = [@dob]
    result = SqlRunner.run(sql, values).first['date_part'].to_i()
    return result
  end

  def check_age(age)
    if find_age() >= age
      return true
    else
      return false
    end
  end

  def all_GymClasses()
    sql = "SELECT gymclasses.*
          from gymclasses
          INNER JOIN bookings
          ON bookings.gymclass_id = gymclasses.id
          WHERE bookings.member_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |gymclass| GymClass.new(gymclass)  }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM members
          WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.map { |member| Member.new(member)  }
  end

end
