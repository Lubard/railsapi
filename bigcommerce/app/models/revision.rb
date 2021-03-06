class Revision < ActiveRecord::Base

	def self.end_update(start_time, end_time)
		only_row = first
		only_row.start_time = start_time.utc
		only_row.end_time = end_time.utc
		only_row.save
	end

	def self.start_update
		only_row = first
		only_row.end_time = nil
		only_row.save
	end

	def self.update_time_iso
		first.start_time.iso8601
	end

	def self.update_time
		first.start_time
	end

	def self.end_time
		first.end_time
	end
end
