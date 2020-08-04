#--
# Copyright (c) 2005-2010 Tobias Luetke
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

require 'active_support'
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/hash/conversions'
require 'active_support/core_ext/object/conversions'
require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/enumerable'
require 'active_support/core_ext/module/attribute_accessors'

require 'base64'
require 'securerandom'
require 'builder'
require 'cgi'
require 'rexml/document'
require 'timeout'
require 'socket'
require 'openssl'
## MKCHANGE: I changed the below to require_relative instead of require
require_relative 'active_merchant/network_connection_retries'
require_relative 'active_merchant/net_http_ssl_connection'
require_relative 'active_merchant/connection'
require_relative 'active_merchant/post_data'
require_relative 'active_merchant/posts_data'

require_relative 'active_merchant/billing'
require_relative 'active_merchant/version'
require_relative 'active_merchant/country'

module ActiveMerchant
  def self.deprecated(message, caller=Kernel.caller[1])
    warning = caller + ': ' + message
    if(respond_to?(:logger) && logger.present?)
      logger.warn(warning)
    else
      warn(warning)
    end
  end
end

I18n.enforce_available_locales = false
