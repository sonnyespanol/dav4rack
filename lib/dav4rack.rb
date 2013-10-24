require 'time'
require 'uri'
require 'nokogiri'

require 'rack'
require 'dav4rack/utils'
require 'dav4rack/http_status'
require 'dav4rack/resource'
require 'dav4rack/handler'
require 'dav4rack/controller'

module DAV4Rack
  IS_18 = RUBY_VERSION[0,3] == '1.8'
end

ENABLE_PC = true

def pc(title, value = "", color = "green")
  return unless ENABLE_PC
  eval("puts('#{title}: #{value.to_s}'.#{color})")
  #puts("#{title}: #{value.to_s}".)
end

class String
  def black;          "\033[30m#{self}\033[0m" end
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def brown;         "\033[33m#{self}\033[0m" end
  def blue;           "\033[34m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def gray;           "\033[37m#{self}\033[0m" end
  def bg_black;       "\033[40m#{self}\0330m"  end
  def bg_red;         "\033[41m#{self}\033[0m" end
  def bg_green;       "\033[42m#{self}\033[0m" end
  def bg_brown;       "\033[43m#{self}\033[0m" end
  def bg_blue;        "\033[44m#{self}\033[0m" end
  def bg_magenta;     "\033[45m#{self}\033[0m" end
  def bg_cyan;        "\033[46m#{self}\033[0m" end
  def bg_gray;        "\033[47m#{self}\033[0m" end
  def bold;           "\033[1m#{self}\033[22m" end
  def reverse_color;  "\033[7m#{self}\033[27m" end
end