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

end
