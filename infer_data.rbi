# typed: strong
module ActiveMerchant
  class Connection
    # RDL Type: ((String and URI::HTTP)) -> self
    sig { params(endpoint: T.all(String, URI::HTTP)).returns(T.self_type) }
    def initialize(endpoint); end

    # RDL Type: ([ frozen?: () -> XXX ]) -> [ frozen?: () -> XXX ]
    sig { params(device: T.untyped).returns(T.untyped) }
    def wiredump_device=(device); end

    # RDL Type: () -> (XXX or XXX)
    sig { returns(T.untyped) }
    def http; end

    # RDL Type: (Net::HTTP) -> XXX
    sig { params(http: Net::HTTP).returns(T.untyped) }
    def configure_debugging(http); end

    # RDL Type: ((ActiveMerchant::Billing::Gateway or ActiveMerchant::Connection or Net::HTTP)) -> XXX
    sig { params(http: T.any(Net::HTTP, ActiveMerchant::Billing::Gateway, ActiveMerchant::Connection)).returns(T.untyped) }
    def configure_timeouts(http); end

    # RDL Type: (Net::HTTP) -> nil
    sig { params(http: Net::HTTP).void }
    def configure_ssl(http); end

    # RDL Type: ((Net::HTTP or OpenSSL::SSL::SSLContext)) -> nil
    sig { params(http: T.any(Net::HTTP, OpenSSL::SSL::SSLContext)).void }
    def configure_cert(http); end

    # RDL Type: (XXX, ?XXX) -> XXX
    sig { params(message: T.untyped, tag: T.untyped).returns(T.untyped) }
    def debug(message, tag = nil); end

    # RDL Type: (XXX, ?XXX) -> XXX
    sig { params(message: T.untyped, tag: T.untyped).returns(T.untyped) }
    def info(message, tag = nil); end

    # RDL Type: (XXX, ?XXX) -> XXX
    sig { params(message: T.untyped, tag: T.untyped).returns(T.untyped) }
    def error(message, tag = nil); end

    # RDL Type: (XXX, XXX, XXX) -> XXX
    sig { params(level: T.untyped, message: T.untyped, tag: T.untyped).returns(T.untyped) }
    def log(level, message, tag); end
  end

  class CountryCode
    # RDL Type: ([ to_s: () -> String ]) -> self
    sig { params(value: T.untyped).returns(T.self_type) }
    def initialize(value); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_s; end

    # RDL Type: () -> (:alpha2 or :alpha3 or :numeric)
    sig { returns(Symbol) }
    def detect_format; end
  end

  class Country
    # RDL Type: (?([ collect: () {(XXX, XXX) -> XXX} -> XXX ] and [ delete: (:name) -> XXX ])) -> self
    sig { params(options: T.untyped).returns(T.self_type) }
    def initialize(options = nil); end

    # RDL Type: (XXX) -> XXX
    sig { params(format: T.untyped).returns(T.untyped) }
    def code(format); end

    # RDL Type: ([ name: () -> XXX ]) -> (false or true)
    sig { params(other: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def ==(other); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def hash; end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_s; end
  end

  module Empty
    # RDL Type: (XXX) -> (false or true)
    sig { params(value: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def empty?(value); end
  end

  class ConnectionError
    # RDL Type: (XXX, XXX) -> self
    sig { params(message: T.untyped, triggering_exception: T.untyped).returns(T.self_type) }
    def initialize(message, triggering_exception); end
  end

  class ResponseError
    # RDL Type: (([ body: () -> XXX ] and [ code: () -> XXX ]), ?nil) -> self
    sig { params(response: T.untyped, message: NilClass).returns(T.self_type) }
    def initialize(response, message = nil); end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_s; end
  end

  module NetworkConnectionRetries
    # RDL Type: ([ send: (XXX, XXX) -> XXX ], XXX, XXX, XXX, XXX) -> XXX
    sig do
      params(
        logger: T.untyped,
        attempts: T.untyped,
        time: T.untyped,
        message: T.untyped,
        tag: T.untyped
      ).returns(T.untyped)
    end
    def log_with_retry_details(logger, attempts, time, message, tag); end

    # RDL Type: (([ []: (XXX) -> XXX ] and [ keys: () -> XXX ]), Module) -> nil
    sig { params(errors: T.untyped, klass: Module).void }
    def derived_error_message(errors, klass); end
  end

  class PostData
    # RDL Type: () -> String
    sig { returns(String) }
    def to_post_data; end

    # RDL Type: (XXX) -> (false or true)
    sig { params(key: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def required?(key); end
  end

  module PostsData
    # RDL Type: (XXX, ?XXX) -> XXX
    sig { params(endpoint: T.untyped, headers: T.untyped).returns(T.untyped) }
    def ssl_get(endpoint, headers = nil); end

    # RDL Type: (XXX, XXX, ?XXX) -> XXX
    sig { params(endpoint: T.untyped, data: T.untyped, headers: T.untyped).returns(T.untyped) }
    def ssl_post(endpoint, data, headers = nil); end

    # RDL Type: (XXX, XXX, XXX, XXX) -> XXX
    sig do
      params(
        method: T.untyped,
        endpoint: T.untyped,
        data: T.untyped,
        headers: T.untyped
      ).returns(T.untyped)
    end
    def ssl_request(method, endpoint, data, headers); end

    # RDL Type: ((String and URI::HTTP)) -> ActiveMerchant::Connection
    sig { params(endpoint: T.all(String, URI::HTTP)).returns(ActiveMerchant::Connection) }
    def new_connection(endpoint); end

    # RDL Type: (([ body: () -> XXX ] and [ code: () -> XXX ])) -> XXX
    sig { params(response: T.untyped).returns(T.untyped) }
    def handle_response(response); end
  end

  module Billing
    class ApplePayPaymentToken
      # RDL Type: () -> String
      sig { returns(String) }
      def type; end
    end

    class AVSResult
      # RDL Type: (([ []: (:code) -> XXX ] and [ []: (:postal_match) -> XXX ] and [ []: (:street_match) -> XXX ])) -> self
      sig { params(attrs: T.untyped).returns(T.self_type) }
      def initialize(attrs); end

      # RDL Type: () -> Hash<String, (XXX or XXX or XXX or XXX)>
      sig { returns(T::Hash[String, T.untyped]) }
      def to_hash; end
    end

    class Check
      # RDL Type: () -> String
      sig { returns(String) }
      def name; end

      # RDL Type: (String) -> nil
      sig { params(value: String).void }
      def name=(value); end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def validate; end

      # RDL Type: () -> String
      sig { returns(String) }
      def type; end

      # RDL Type: () -> false
      sig { returns(FalseClass) }
      def credit_card?; end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def valid_routing_number?; end
    end

    class CreditCard
      # RDL Type: (String) -> String
      sig { params(value: String).returns(String) }
      def number=(value); end

      # RDL Type: () -> String
      sig { returns(String) }
      def brand; end

      # RDL Type: ((String and [ ==: (String) -> XXX ] and [ respond_to?: (:downcase) -> XXX ])) -> String
      sig { params(value: String).returns(String) }
      def brand=(value); end

      # RDL Type: ((false or true)) -> (false or true)
      sig { params(value: T.any(FalseClass, TrueClass)).returns(T.any(FalseClass, TrueClass)) }
      def require_verification_value=(value); end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def requires_verification_value?; end

      # RDL Type: () -> String
      sig { returns(String) }
      def type; end

      # RDL Type: ((String and [ ==: (String) -> XXX ] and [ respond_to?: (:downcase) -> XXX ])) -> String
      sig { params(value: String).returns(String) }
      def type=(value); end

      # RDL Type: () -> ActiveMerchant::Billing::CreditCard::ExpiryDate
      sig { returns(ActiveMerchant::Billing::CreditCard::ExpiryDate) }
      def expiry_date; end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def expired?; end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def name?; end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def first_name?; end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def last_name?; end

      # RDL Type: () -> String
      sig { returns(String) }
      def name; end

      # RDL Type: (String) -> XXX
      sig { params(full_name: String).returns(T.untyped) }
      def name=(full_name); end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def verification_value?; end

      # RDL Type: () -> String
      sig { returns(String) }
      def display_number; end

      # RDL Type: () -> String
      sig { returns(String) }
      def first_digits; end

      # RDL Type: () -> String
      sig { returns(String) }
      def last_digits; end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def validate; end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def emv?; end

      # RDL Type: () -> Array<([:first_name, String] or [:last_name, String] or [:month, String] or [:year, String])>
      sig { returns(T::Array[T.any(T::Array[T.any(Symbol, String)], T::Array[T.any(Symbol, String)], T::Array[T.any(Symbol, String)], T::Array[T.any(Symbol, String)])]) }
      def validate_essential_attributes; end

      # RDL Type: () -> Array<([:brand, String] or [:number, String])>
      sig { returns(T::Array[T.any(T::Array[T.any(Symbol, String)], T::Array[T.any(Symbol, String)])]) }
      def validate_card_brand_and_number; end

      # RDL Type: () -> Array<[:verification_value, String]>
      sig { returns(T::Array[T::Array[T.any(Symbol, String)]]) }
      def validate_verification_value; end

      class ExpiryDate
        # RDL Type: ([ to_i: () -> Number ], [ to_i: () -> Number ]) -> self
        sig { params(month: T.untyped, year: T.untyped).returns(T.self_type) }
        def initialize(month, year); end

        # RDL Type: () -> (false or true)
        sig { returns(T.any(FalseClass, TrueClass)) }
        def expired?; end

        # RDL Type: () -> Time
        sig { returns(Time) }
        def expiration; end

        # RDL Type: () -> Number
        sig { returns(Integer) }
        def month_days; end
      end
    end

    module CreditCardFormatting
      # RDL Type: ((ActiveMerchant::Billing::CreditCard or ActiveMerchant::Billing::CreditCard::ExpiryDate or ActiveSupport::TimeWithZone or Date or Number or TZInfo::TimeOrDateTime or Time)) -> String
      sig { params(credit_card: T.any(ActiveMerchant::Billing::CreditCard, Integer, Time, ActiveMerchant::Billing::CreditCard::ExpiryDate, TZInfo::TimeOrDateTime, Date, ActiveSupport::TimeWithZone)).returns(String) }
      def expdate(credit_card); end

      # RDL Type: (([ blank?: () -> XXX ] and [ to_i: () -> Number ]), XXX) -> ([ blank?: () -> XXX ] and [ to_i: () -> Number ])
      sig { params(number: T.untyped, option: T.untyped).returns(T.untyped) }
      def format(number, option); end
    end

    module CreditCardMethods
      # RDL Type: ([ to_i: () -> Number ]) -> (false or true)
      sig { params(month: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def valid_month?(month); end

      # RDL Type: () -> true
      sig { returns(TrueClass) }
      def credit_card?; end

      # RDL Type: ([ to_i: () -> Number ]) -> (false or true)
      sig { params(year: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def valid_expiry_year?(year); end

      # RDL Type: (([ to_i: () -> Number ] and [ to_s: () -> String ])) -> (false or true)
      sig { params(year: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def valid_start_year?(year); end

      # RDL Type: ([ to_s: () -> String ], XXX) -> Number
      sig { params(cvv: T.untyped, brand: T.untyped).returns(Integer) }
      def valid_card_verification_value?(cvv, brand); end

      # RDL Type: (XXX) -> Number
      sig { params(brand: T.untyped).returns(Integer) }
      def card_verification_value_length(brand); end

      # RDL Type: ([ to_s: () -> String ]) -> Number
      sig { params(number: T.untyped).returns(Integer) }
      def valid_issue_number?(number); end

      module ClassMethods
        # RDL Type: (String) -> (false or true)
        sig { params(number: String).returns(T.any(FalseClass, TrueClass)) }
        def valid_number?(number); end

        # RDL Type: () -> [String]
        sig { returns(T::Array[String]) }
        def card_companies; end

        # RDL Type: (XXX) -> String
        sig { params(number: T.untyped).returns(String) }
        def brand?(number); end

        # RDL Type: (([ length: () -> XXX ] and [ slice: (Number, Number) -> XXX ])) -> (false or true)
        sig { params(number: T.untyped).returns(T.any(FalseClass, TrueClass)) }
        def electron?(number); end

        # RDL Type: (XXX) -> String
        sig { params(number: T.untyped).returns(String) }
        def type?(number); end

        # RDL Type: ([ slice: (Number, Number) -> XXX ]) -> String
        sig { params(number: T.untyped).returns(String) }
        def first_digits(number); end

        # RDL Type: ((String and [ slice: (Range<Number>) -> XXX ])) -> String
        sig { params(number: String).returns(String) }
        def last_digits(number); end

        # RDL Type: ((String and [ slice: (Range<Number>) -> XXX ])) -> String
        sig { params(number: String).returns(String) }
        def mask(number); end

        # RDL Type: (XXX, XXX) -> (false or true)
        sig { params(number: T.untyped, brand: T.untyped).returns(T.any(FalseClass, TrueClass)) }
        def matching_brand?(number, brand); end

        # RDL Type: (XXX, XXX) -> (false or true)
        sig { params(number: T.untyped, brand: T.untyped).returns(T.any(FalseClass, TrueClass)) }
        def matching_type?(number, brand); end

        # RDL Type: (([ length: () -> XXX ] and [ nil?: () -> XXX ])) -> false
        sig { params(number: T.untyped).returns(FalseClass) }
        def valid_card_number_length?(number); end

        # RDL Type: (([ match: (Regexp) -> XXX ] and [ nil?: () -> XXX ])) -> false
        sig { params(number: T.untyped).returns(FalseClass) }
        def valid_card_number_characters?(number); end

        # RDL Type: (XXX) -> (false or true)
        sig { params(number: T.untyped).returns(T.any(FalseClass, TrueClass)) }
        def valid_test_mode_card_number?(number); end

        # RDL Type: (XXX, [ reverse: () -> XXX ]) -> (false or true)
        sig { params(brand: T.untyped, numbers: T.untyped).returns(T.any(FalseClass, TrueClass)) }
        def valid_by_algorithm?(brand, numbers); end

        # RDL Type: ([ reverse: () -> XXX ]) -> (false or true)
        sig { params(numbers: T.untyped).returns(T.any(FalseClass, TrueClass)) }
        def valid_luhn?(numbers); end
      end
    end

    class CVVResult
      # RDL Type: (([ blank?: () -> XXX ] and [ upcase: () -> XXX ])) -> self
      sig { params(code: T.untyped).returns(T.self_type) }
      def initialize(code); end

      # RDL Type: () -> Hash<String, (XXX or XXX)>
      sig { returns(T::Hash[String, T.untyped]) }
      def to_hash; end
    end

    class Gateway
      # RDL Type: () -> Number
      sig { returns(Integer) }
      def generate_unique_id; end

      # RDL Type: () -> Array<XXX>
      sig { returns(T::Array[T.untyped]) }
      def supported_countries; end

      # RDL Type: (ActiveMerchant::Billing::CreditCard) -> String
      sig { params(source: ActiveMerchant::Billing::CreditCard).returns(String) }
      def card_brand(source); end

      # RDL Type: (?Hash<:test, XXX>) -> self
      sig { params(options: T::Hash[Symbol, T.untyped]).returns(T.self_type) }
      def initialize(options = nil); end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def test?; end

      # RDL Type: () -> false
      sig { returns(FalseClass) }
      def supports_scrubbing?; end

      # RDL Type: (XXX) -> XXX
      sig { params(transcript: T.untyped).returns(T.untyped) }
      def scrub(transcript); end

      # RDL Type: () -> false
      sig { returns(FalseClass) }
      def supports_network_tokenization?; end

      # RDL Type: ([ []=: (XXX, XXX) -> XXX ], [ []: (XXX) -> XXX ], [ each: () {(XXX) -> XXX} -> XXX ]) -> XXX
      sig { params(post: T.untyped, options: T.untyped, fields: T.untyped).returns(T.untyped) }
      def add_fields_to_post_if_present(post, options, fields); end

      # RDL Type: ([ []=: (XXX, XXX) -> XXX ], [ []: (XXX) -> XXX ], XXX) -> nil
      sig { params(post: T.untyped, options: T.untyped, field: T.untyped).void }
      def add_field_to_post_if_present(post, options, field); end

      # RDL Type: ((false or nil or true)) -> (false or nil or true)
      sig { params(field: T.any(FalseClass, TrueClass, NilClass)).returns(T.any(FalseClass, TrueClass, NilClass)) }
      def normalize(field); end

      # RDL Type: () -> (XXX or XXX)
      sig { returns(T.untyped) }
      def user_agent; end

      # RDL Type: ((Rake::FileList or String)) -> (Rake::FileList or String)
      sig { params(xml: T.any(String, Rake::FileList)).returns(T.any(String, Rake::FileList)) }
      def strip_invalid_xml_chars(xml); end

      # RDL Type: () -> %any
      sig { returns(T.untyped) }
      def name; end

      # RDL Type: ([ to_s: () -> String ]) -> (false or true)
      sig { params(currency: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def non_fractional_currency?(currency); end

      # RDL Type: ([ to_s: () -> String ]) -> (false or true)
      sig { params(currency: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def three_decimal_currency?(currency); end

      # RDL Type: (XXX, [ to_s: () -> String ]) -> String
      sig { params(money: T.untyped, currency: T.untyped).returns(String) }
      def localized_amount(money, currency); end

      # RDL Type: ([ to_s: () -> String ], Number) -> String
      sig { params(value: T.untyped, max_size: Integer).returns(String) }
      def truncate(value, max_size); end

      # RDL Type: (String) -> [(String or XXX), (String or XXX)]
      sig { params(full_name: String).returns(T::Array[T.untyped]) }
      def split_names(full_name); end

      # RDL Type: (([ []: (Symbol) -> XXX ] and [ has_key?: (Symbol) -> XXX ]), *XXX) -> Array<XXX>
      sig { params(hash: T.untyped, params: T.untyped).returns(T::Array[T.untyped]) }
      def requires!(hash, *params); end
    end

    class Model
      # RDL Type: (?[ each: () {(XXX, XXX) -> XXX} -> XXX ]) -> self
      sig { params(attributes: T.untyped).returns(T.self_type) }
      def initialize(attributes = nil); end

      # RDL Type: () -> Hash<XXX, XXX>
      sig { returns(T::Hash[T.untyped, T.untyped]) }
      def validate; end
    end

    class NetworkTokenizationCreditCard
      # RDL Type: () -> :apple_pay
      sig { returns(Symbol) }
      def source; end

      # RDL Type: () -> true
      sig { returns(TrueClass) }
      def credit_card?; end

      # RDL Type: () -> String
      sig { returns(String) }
      def type; end
    end

    class PaymentToken
      # RDL Type: (XXX, ?[ with_indifferent_access: () -> XXX ]) -> self
      sig { params(payment_data: T.untyped, options: T.untyped).returns(T.self_type) }
      def initialize(payment_data, options = nil); end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def type; end
    end

    class Response
      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def success?; end

      # RDL Type: () -> false
      sig { returns(FalseClass) }
      def test?; end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def fraud_review?; end

      # RDL Type: ((false or true), XXX, ?[ stringify_keys: () -> XXX ], ?([ []: (:authorization) -> XXX ] and [ []: (:avs_result) -> XXX ] and [ []: (:cvv_result) -> XXX ] and [ []: (:emv_authorization) -> XXX ] and [ []: (:error_code) -> XXX ] and [ []: (:fraud_review) -> XXX ] and [ []: (:test) -> XXX ])) -> self
      sig do
        params(
          success: T.any(FalseClass, TrueClass),
          message: T.untyped,
          params: T.untyped,
          options: T.untyped
        ).returns(T.self_type)
      end
      def initialize(success, message, params = nil, options = nil); end
    end

    class MultiResponse
      # RDL Type: (?false) -> self
      sig { params(use_first_response: FalseClass).returns(T.self_type) }
      def initialize(use_first_response = nil); end

      # RDL Type: (?XXX) {() -> XXX} -> nil
      sig { params(ignore_result: T.untyped).void }
      def process(ignore_result = nil); end

      # RDL Type: ((ActiveMerchant::Billing::MultiResponse or OpenSSL::OCSP::BasicResponse)) -> XXX
      sig { params(response: T.any(OpenSSL::OCSP::BasicResponse, ActiveMerchant::Billing::MultiResponse)).returns(T.untyped) }
      def <<(response); end

      # RDL Type: () -> true
      sig { returns(TrueClass) }
      def success?; end
    end
  end
end

class [s]ActiveMerchant
  class Country
    # RDL Type: (String) -> ActiveMerchant::Country
    sig { params(name: String).returns(ActiveMerchant::Country) }
    def find(name); end
  end

  class NetworkConnectionRetries
    # RDL Type: ([ send: (:attr_accessor, :retry_safe) -> XXX ]) -> XXX
    sig { params(base: T.untyped).returns(T.untyped) }
    def included(base); end

    # RDL Type: ([ send: (XXX, XXX) -> XXX ], XXX, XXX, ?XXX) -> XXX
    sig do
      params(
        logger: T.untyped,
        level: T.untyped,
        message: T.untyped,
        tag: T.untyped
      ).returns(T.untyped)
    end
    def log(logger, level, message, tag = nil); end
  end

  class Billing
    class AVSResult
      # RDL Type: () -> { String: String }
      sig { returns(T::Hash[Symbol, String]) }
      def messages; end
    end

    class Base
      # RDL Type: (XXX) -> XXX
      sig { params(mode: T.untyped).returns(T.untyped) }
      def gateway_mode=(mode); end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def gateway_mode; end

      # RDL Type: (String) -> Object
      sig { params(name: String).returns(Object) }
      def gateway(name); end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def test?; end
    end

    class CreditCard
      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def requires_verification_value?; end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def requires_name?; end
    end

    class CreditCardMethods
      # RDL Type: ([ extend: (Module) -> XXX ]) -> XXX
      sig { params(base: T.untyped).returns(T.untyped) }
      def included(base); end

      # RDL Type: ([ to_i: () -> Number ], [ any?: () {(XXX) -> XXX} -> XXX ]) -> (false or true)
      sig { params(number: T.untyped, ranges: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def in_bin_range?(number, ranges); end
    end

    class CVVResult
      # RDL Type: () -> { String: String }
      sig { returns(T::Hash[Symbol, String]) }
      def messages; end
    end

    class Gateway
      # RDL Type: (XXX) -> XXX
      sig { params(subclass: T.untyped).returns(T.untyped) }
      def inherited(subclass); end

      # RDL Type: ([ to_sym: () -> XXX ]) -> (false or true)
      sig { params(card_type: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def supports?(card_type); end

      # RDL Type: (ActiveMerchant::Billing::CreditCard) -> String
      sig { params(source: ActiveMerchant::Billing::CreditCard).returns(String) }
      def card_brand(source); end

      # RDL Type: (([ dup: () -> XXX ] and [ each: () {(XXX) -> XXX} -> XXX ])) -> XXX
      sig { params(country_codes: T.untyped).returns(T.untyped) }
      def supported_countries=(country_codes); end

      # RDL Type: () -> Array<XXX>
      sig { returns(T::Array[T.untyped]) }
      def supported_countries; end
    end

    class MultiResponse
      # RDL Type: (?false) {XXX} -> XXX
      sig { params(use_first_response: FalseClass).returns(T.untyped) }
      def run(use_first_response = nil); end
    end
  end
end
