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
    return result.map { |pt| PersonalTrainer.new(pt)  }
  end

end
