class StaffTimePeriod < ActiveRecord::Base

	belongs_to :staff

	def update_this_month(time_period, date_today)
		StaffTimePeriod.update(time_period.id, {"start_date" => date_today.at_beginning_of_month, "end_date" => date_today.next_day})
	end

	def update_last_month(time_period, date_today)
		StaffTimePeriod.update(time_period.id, start_date: date_today.at_beginning_of_month.last_month, end_date: (date_today.at_end_of_month.last_month).next_day)
	end

	def update_using_default_start_date(time_period, date_today)
		set_time_zone = 'Melbourne'
		StaffTimePeriod.update(time_period.id, start_date: date_today - time_period.start_day, end_date: (date_today - time_period.end_day).next_day)

	end

	def update_quarter(time_period, date_today)
		StaffTimePeriod.update(time_period.id, start_date: date_today.beginning_of_quarter, end_date: (date_today.end_of_quarter).next_day)

	end

	def update_this_year(time_period, date_today)

	end

	def set_as_today(time_period, date_today)
		StaffTimePeriod.update(time_period.id, {"end_date" => date_today.next_day})
	end

	def update_all
		time_periods = StaffTimePeriod.all
		time_periods.each { |t| StaffTimePeriod.new.send(t.update_function, t, Time.now.in_time_zone("Australia/Melbourne").to_date)}
	end

	def self.display
		return where(display: 1)
	end

end
