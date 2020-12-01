json.result true
json.message I18n.t('apis.success_get')
json.tests @tests do |test|
  json.id test[:id]
  json.japanese test[:japanese]
  json.furigana test[:furigana]
  json.vietnamese test[:vietnamese]
  json.dummy_vietnamese_1 test[:dummy_vietnamese_1]
  json.dummy_vietnamese_2 test[:dummy_vietnamese_2]
  json.dummy_vietnamese_3 test[:dummy_vietnamese_3]
end
json.total_count @tests.count