# frozen_string_literal: true

require 'ffi'

module CracklibReloaded
  module CracklibReloadedFfiMixin
    extend FFI::Library
    libcrack_so_paths = []
    libcrack_so_paths << ENV['LIBCRACK_SO_PATH'].to_s if ENV['LIBCRACK_SO_PATH']
    interpreter_bytes = 0.to_i.size
    interpreter_bits = interpreter_bytes * 8
    if interpreter_bits == 32
      libcrack_so_paths << '/usr/lib/libcrack.so.2'
      libcrack_so_paths << '/usr/lib/i386-linux-gnu/libcrack.so.2'
    else
      libcrack_so_paths << '/usr/lib64/libcrack.so.2'
      libcrack_so_paths << '/usr/lib/x86_64-linux-gnu/libcrack.so.2'
    end
    LIBCRACK_SO_PATH = libcrack_so_paths.select { |file| File.readable?(file) }.first.freeze

    puts "Using: #{LIBCRACK_SO_PATH}" if ENV['CI']
    ffi_lib LIBCRACK_SO_PATH

    attach_function :cracklib_default_dict, :GetDefaultCracklibDict, [], :string
    attach_function :cracklib_check, :FascistCheck, %i[string string], :string
  end

  class Password
    include CracklibReloadedFfiMixin

    class Errors
      include Enumerable

      def initialize(messages)
        @messages = messages.empty? ? [] : [[:password, messages]]
      end

      def each
        return {} if @messages.empty?
        @messages.each { |message| yield message }
      end

      def empty?
        count.zero?
      end

      def [](key)
        find { |item| item == key }
      end
    end

    def initialize(dict_path = cracklib_default_dict)
      @dict_path = dict_path
    end

    def weak?(password)
      @message = cracklib_check(password.to_s, @dict_path)
      !@message.nil?
    end

    def errors
      return Errors.new([]) unless @message
      Errors.new([@message])
    end
  end
end
