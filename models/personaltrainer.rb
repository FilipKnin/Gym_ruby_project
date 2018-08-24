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


end
