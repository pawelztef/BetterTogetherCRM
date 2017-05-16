module StatsHelper
  def volunteers_groups_stats
    VolunteersGroup.all.map { |n| [n.name, n.volunteers.count] }
  end

  def sum_of_donations_by_time(period, last)
    line_chart Donation.limit(last ||= 6).group_by_period(period, :created_at, format: '%b %Y', permit: %w[month quarter year]).sum(:amount), library: {
      yAxis: {
        crosshair: true
      },
      xAxis: {
      }
    }
  end
end
