require_relative('../db/sql_runner')

class PersonalTrainer
  attr_accessor(:name, :description)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @description = options['description']
  end



  def save()
    sql = "INSERT INTO personaltrainers
          (name, description)
          VALUES
          ($1, $2) RETURNING *"
    values = [@name, @description]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM personaltrainers"
    result = SqlRunner.run(sql)
    return result.map { |pt| PersonalTrainer.new(pt) }
  end

  def self.delete_all()
    sql = "DELETE FROM personaltrainers"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM personaltrainers
          WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    outcome = result.map { |pt| PersonalTrainer.new(pt)  }
    return outcome[0]
  end

  def delete()
    sql = "DELETE FROM personaltrainers
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE personaltrainers
          SET
          (name, description)
          =
          ($1, $2)
          WHERE id = $3"
    values = [@name, @description, @id]
    SqlRunner.run(sql, values)
  end

end
