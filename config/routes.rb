# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                            v1_masters GET    /api/v1/masters(.:format)                                                                v1/masters#index {:format=>:json}
#                                       POST   /api/v1/masters(.:format)                                                                v1/masters#create {:format=>:json}
#                             v1_master GET    /api/v1/masters/:id(.:format)                                                            v1/masters#show {:format=>:json}
#                                       PATCH  /api/v1/masters/:id(.:format)                                                            v1/masters#update {:format=>:json}
#                                       PUT    /api/v1/masters/:id(.:format)                                                            v1/masters#update {:format=>:json}
#                                       DELETE /api/v1/masters/:id(.:format)                                                            v1/masters#destroy {:format=>:json}
#                              v1_users POST   /api/v1/users(.:format)                                                                  v1/users#create {:format=>:json}
#                               v1_user PATCH  /api/v1/users/:id(.:format)                                                              v1/users#update {:format=>:json}
#                                       PUT    /api/v1/users/:id(.:format)                                                              v1/users#update {:format=>:json}
#              v1_user_learning_targets GET    /api/v1/user_learning_targets(.:format)                                                  v1/user_learning_targets#show {:format=>:json}
#                                       PATCH  /api/v1/user_learning_targets(.:format)                                                  v1/user_learning_targets#update {:format=>:json}
#                                       PUT    /api/v1/user_learning_targets(.:format)                                                  v1/user_learning_targets#update {:format=>:json}
#                       v1_unit_masters GET    /api/v1/unit_masters(.:format)                                                           v1/unit_masters#index {:format=>:json}
#                                       POST   /api/v1/unit_masters(.:format)                                                           v1/unit_masters#create {:format=>:json}
#                        v1_unit_master PATCH  /api/v1/unit_masters/:id(.:format)                                                       v1/unit_masters#update {:format=>:json}
#                                       PUT    /api/v1/unit_masters/:id(.:format)                                                       v1/unit_masters#update {:format=>:json}
#                       v1_word_masters GET    /api/v1/word_masters(.:format)                                                           v1/word_masters#index {:format=>:json}
#                                       POST   /api/v1/word_masters(.:format)                                                           v1/word_masters#create {:format=>:json}
#                        v1_word_master PATCH  /api/v1/word_masters/:id(.:format)                                                       v1/word_masters#update {:format=>:json}
#                                       PUT    /api/v1/word_masters/:id(.:format)                                                       v1/word_masters#update {:format=>:json}
#                     v1_test_histories POST   /api/v1/test_histories(.:format)                                                         v1/test_histories#create {:format=>:json}
#                 v1_learning_histories POST   /api/v1/learning_histories(.:format)                                                     v1/learning_histories#create {:format=>:json}
#                             v1_signup POST   /api/v1/signup(.:format)                                                                 v1/users#create {:format=>:json}
#                           v1_activity GET    /api/v1/activity(.:format)                                                               v1/activities#index {:format=>:json}
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :users, only: []
  # devise mailer
  # config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  scope :api, defaults: { format: :json } do
    namespace :v1 do
      resources :masters, only: %i[index update show destroy create]
      resources :users, only: %i[create update]
      resource :user_learning_targets, only: %i[show update]
      resources :unit_masters, only: %i[create update index]
      resources :word_masters, only: %i[create update index]
      resources :test_histories, only: %i[create]
      resources :learning_histories, only: %i[create]
      resource :signup, only: %i[create], controller: :users
      get 'activity' => 'activities#index'
    end
  end
end
