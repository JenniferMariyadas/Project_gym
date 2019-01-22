require_relative('../db/sql_runner')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :gender, :age

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @gender = options['gender']
    @age = options['age']
  end

  def format_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      gender,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @last_name, @gender, @age]
    member = SqlRunner.run(sql, values).first
    @id = member['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |member| Member.new( member ) }
  end

  def self.find( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE members
    SET
    (
      first_name,
      last_name,
      gender,
      age
    )=
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @gender, @age, @id]
    SqlRunner.run( sql, values )
  end

    def session()
        sql = "SELECT sessions.*
        FROM sessions
        INNER JOIN bookings
        ON sessions.id = bookings.session_id
        WHERE bookings.member_id = $1"
        values = [@id]
        sessions = SqlRunner.run(sql, values)
        return sessions.map {|session| Session.new(session)}
      end



end
