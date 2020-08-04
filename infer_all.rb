require_relative './lib/active_merchant.rb'
#require '../type-infer/rdl/lib/rdl'
require 'rdl'
RDL::Config.instance.number_mode = true
require 'types/core'



RDL.no_infer_meth ActiveMerchant::Connection, :request ## no Net::HTTP#ssl_connection method... potential bug? No not bug, just uses Ruby `refine`, which RDL does not support
RDL.infer_file './lib/active_merchant/connection.rb'


RDL.type ActiveMerchant::CountryCode, :format, "() -> Symbol" ## overrides Kernel#format so we need this... POTENTIAL BUG?
RDL.infer_file './lib/active_merchant/country.rb'

RDL.infer_file './lib/active_merchant/empty.rb'
RDL.infer_file './lib/active_merchant/errors.rb'
RDL.infer_file './lib/active_merchant/net_http_ssl_connection.rb'

RDL.no_infer_meth ActiveMerchant::NetworkConnectionRetries, :retry_exceptions ## unsupported expression type `splat` (splat can't be used outside of certain other kinds of expressions
RDL.no_infer_meth ActiveMerchant::NetworkConnectionRetries, :retry_network_exceptions ## calls tricky metaprogramming/mixin method :retry_safe
RDL.infer_file './lib/active_merchant/network_connection_retries.rb'

RDL.no_infer_meth ActiveMerchant::PostData, :[]= ## unsupported use of zsuper
RDL.infer_file './lib/active_merchant/post_data.rb'

RDL.no_infer_meth ActiveMerchant::PostsData, :raw_ssl_request ## calls metaprogramming method :ssl_strict
RDL.no_infer_meth ActiveMerchant::PostsData, 'self.included' ## calls metaprogramming method :ssl_strict
#RDL.no_infer_meth ActiveMerchant::PostsData, :new_connection ## const issue
RDL.infer_file './lib/active_merchant/posts_data.rb'

RDL.no_infer_meth ActiveMerchant::Billing::ApplePayPaymentToken, :initialize ## super issue
RDL.infer_file './lib/active_merchant/billing/apple_pay_payment_token.rb'
RDL.infer_file './lib/active_merchant/billing/avs_result.rb'

RDL.no_infer_meth ActiveMerchant::Billing::Base, 'self.integration' ### possible bug??? No Billing::Integrations constant defined anywhere
RDL.infer_file './lib/active_merchant/billing/base.rb'


RDL.infer_file './lib/active_merchant/billing/check.rb'

#RDL.no_infer_meth ActiveMerchant::Billing::Compatibility::Model, :valid? ## mixin/super issue
#RDL.no_infer_meth ActiveMerchant::Billing::Compatibility, 'self.humanize' ## mixin/to_proc can't be resolved issue
#RDL.no_infer_meth ActiveMerchant::Billing::Rails::Model, :valid? ## mixin/no validate method issue
#RDL.no_infer_meth ActiveMerchant::Billing::Rails::Model::Errors, :[] ## mixin/super issue
#RDL.no_infer_meth ActiveMerchant::Billing::Rails::Model::Errors, :[]= ## mixin/super issue
#RDL.infer_file './lib/active_merchant/billing/compatibility.rb' 
## Full of redefining hash methods, which results in some weird behavior.

RDL.infer_file './lib/active_merchant/billing/credit_card.rb'
RDL.infer_file './lib/active_merchant/billing/credit_card_formatting.rb'

RDL.no_infer_meth ActiveMerchant::Billing::CreditCardMethods, :electron?
RDL.no_infer_meth ActiveMerchant::Billing::CreditCardMethods::ClassMethods, :valid_naranja_algo? ### can't handle map case
RDL.infer_file './lib/active_merchant/billing/credit_card_methods.rb'

RDL.infer_file './lib/active_merchant/billing/cvv_result.rb'

RDL.no_infer_meth ActiveMerchant::Billing::Gateway, :amount ## use of respond_to?
RDL.no_infer_meth ActiveMerchant::Billing::Gateway, :currency ## use of respond_to?
RDL.infer_file './lib/active_merchant/billing/gateway.rb'

RDL.no_infer_meth ActiveMerchant::Billing::Model, :errors_hash ## unsupported argument type 
RDL.infer_file './lib/active_merchant/billing/model.rb'

RDL.infer_file './lib/active_merchant/billing/model.rb'
RDL.infer_file './lib/active_merchant/billing/network_tokenization_credit_card.rb'
RDL.infer_file './lib/active_merchant/billing/payment_token.rb'
RDL.infer_file './lib/active_merchant/billing/response.rb'


## GATEWAYS

#RDL.no_infer_meth ActiveMerchant::Billing::AdyenGateway, :initialize 
#RDL.infer_file './lib/active_merchant/billing/gateways/adyen.rb'


RDL.do_infer :files, num_times: 11
