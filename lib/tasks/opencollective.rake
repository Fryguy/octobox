namespace :opencollective do

	subsCostPerMonth = 100
	
	desc "Sync supporters"
  task sync_supporters: :environment do
  	require 'open-uri'
  	# download backers from https://github.com/opencollective/opencollective/blob/master/docs/api/collectives.md#get-members
		response = JSON.parse(open(https://opencollective.com/octobox/members.json))
  	# parse the json stripping and transaction in the last month over 100USD
  	subs = response.select do |item| 
  		Date.parse(item["lastTransactionAt"]) < 1.month.ago &&
  		item["lastTransactionAmount"]) >=  subsCostPerMonth && 
  		item["github"].present? || item["organization"].present?
  	end
  	subs.map do |item|
  		:github => item["github"] if item["github"].present?
  		:organization => item["organization"] if item["organization"].present?
  	end
  	# add a subs to each of the github/organisation accounts 
  	
  end

end