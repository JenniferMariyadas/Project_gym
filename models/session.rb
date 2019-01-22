require_relative('../db/sql_runner')

class Session

  attr_reader :id
  attr_accessor :session_name, :type, :start_time

  def initialize(options)
    @id = options['id'].to_i
    @session_name = options['session_name']
    @type = options['type']
    @start_time = options['start_time']
  end

  def format_name()
    return "#{@session_name}"
  end

  def save()
    sql = "INSERT INTO sessions
    (
      session_name,
      type,
      start_time
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@session_name, @type, @start_time]
    session = SqlRunner.run(sql, values).first
    @id = session['id'].to_i
  end

  # def member()
  #   sql = "SELECT * FROM members
  #   WHERE id = $1"
  #   values = [@member_id]
  #   results = SqlRunner.run( sql, values )
  #   return Member.new( results.first )
  # end

  def member()
      sql = "SELECT members.*
      FROM members
      INNER JOIN bookings
      ON members.id = bookings.member_id
      WHERE bookings.session_id = $1"
      values = [@id]
      members = SqlRunner.run(sql, values)
      return members.map {|member| Member.new(member)}
    end

    def update()
      sql = "UPDATE sessions
      SET
      (
        session_name,
        type,
        start_time
      )=
      (
        $1, $2, $3 
      )
      WHERE id = $4"
      values = [@session_name, @type, @start_time, @id]
      SqlRunner.run( sql, values )
    end



    def self.all()
      sql = "SELECT * FROM sessions"
      results = SqlRunner.run( sql )
      return results.map { |session| Session.new( session ) }
    end

    def self.find( id )
      sql = "SELECT * FROM sessions
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Session.new( results.first )
    end

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end


end
