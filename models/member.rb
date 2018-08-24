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

end
