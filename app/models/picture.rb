class Picture < ActiveRecord::Base

  def self.newest_first
   Picture.order("created_at DESC")
 end

 def self.most_recent_five
   Picture.newest_first.limit(5)
 end

 def self.created_before(time)
   Picture.where("created_at < ?", time)
 end

 def self.pictures_created_in_year(year)
   dt = DateTime.new(year)
   start_date = dt.beginning_of_year
   end_date = dt.end_of_year
   Picture.where("created_at >= ? and created_at <= ?", start_date, end_date)
 end


end
