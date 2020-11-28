json.result true
json.message I18n.t('apis.success_get')
json.target_testing_count @user_learning_target.target_testing_count
json.today_tested_count @today_test_histories.count
json.target_learning_count @user_learning_target.target_learning_count
json.today_learned_count @today_learning_histories.count
