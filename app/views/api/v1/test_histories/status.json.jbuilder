json.result true
json.message I18n.t('apis.success_get')
json.all_word_count @all_word_count
json.correct_word_count @test_history_correct_word_ids.count
json.mistake_word_count @test_history_mistake_word_ids.count
json.unquestioned_word_count @unquestioned_word_count