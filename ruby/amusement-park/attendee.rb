class Attendee
  def initialize(height) = @height = height

  def height = @height
  def pass_id = @pass_id
  def issue_pass!(pass_id) = @pass_id = pass_id
  def revoke_pass! = @pass_id = nil
end
