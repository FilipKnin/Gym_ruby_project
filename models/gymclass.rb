require_relative('../db/sql_runner')


class GymClass
  attr_accessor(:pt_id, :name, :capacity, :day_of_week, :hour)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @pt_id = options['pt_id'].to_i()
    @name = options['name']
    @capacity = options['capacity'].to_i()
    @day_of_week = options['day_of_week'].downcase
    @hour = options['hour']
  end

  def save()
    sql = "INSERT INTO gymclasses
          (pt_id, name, capacity, day_of_week, hour)
          VALUES
          ($1, $2, $3, $4, $5) RETURNING *"
    values = [@pt_id, @name, @capacity, @day_of_week, @hour]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM gymclasses"
    result = SqlRunner.run(sql)
    return result.map { |gymclass| GymClass.new(gymclass) }
  end

  def self.delete_all()
    sql = "DELETE FROM gymclasses"
    SqlRunner.run(sql)
  end

  def all_members()
    sql = "SELECT members.*
          FROM members
          INNER JOIN bookings
          ON bookings.member_id = members.id
          WHERE bookings.gymclass_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |member| Member.new(member)  }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM gymclasses
          WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    outcome = result.map { |gymclass| GymClass.new(gymclass)  }
    return outcome[0]
  end

  def delete()
    sql = "DELETE FROM gymclasses
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # def print_name()
  #   printing short name of object
  # end

end
