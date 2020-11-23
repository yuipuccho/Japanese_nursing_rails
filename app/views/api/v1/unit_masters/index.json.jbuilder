json.result true
json.message I18n.t('apis.success_get')
json.unit_masters @unit_masters do |unit_master|
  json.id unit_master.id
  json.japanese unit_master.japanese
  json.vietnamese unit_master.vietnamese
  json.created_at unit_master.created_at
  json.updated_at unit_master.updated_at
end
json.total_count @unit_masters.count
