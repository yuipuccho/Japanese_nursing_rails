json.result true
json.message I18n.t('apis.success_get')
json.word_masters @word_masters do |word_master|
  json.id word_master.id
  json.unit_master_id word_master.unit_master_id
  json.furigana word_master.furigana
  json.japanese word_master.japanese
  json.english word_master.english
  json.vietnamese word_master.vietnamese
  json.created_at word_master.created_at
  json.updated_at word_master.updated_at
end
json.total_count @word_masters.count