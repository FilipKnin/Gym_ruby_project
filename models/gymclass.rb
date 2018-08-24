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

end
