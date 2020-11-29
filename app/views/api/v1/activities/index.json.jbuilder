json.result true
json.message I18n.t('apis.success_get')
json.activities @activity_data do |data|
  json.date data[:date]
  json.learned_count data[:learned_count]
  json.tested_count data[:tested_count]
end