class Attendee
  def initialize(height) = @height = height

  def issue_pass!(pass_id) = @pass_id = pass_id
  def revoke_pass! = @pass_id = nil

  def has_pass? = !@pass_id.nil?
  def fits_ride?(ride_minimum_height) = @height >= ride_minimum_height
  def allowed_to_ride?(ride_minimum_height) = fits_ride?(ride_minimum_height) && has_pass?
end
