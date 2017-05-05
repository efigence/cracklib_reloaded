# frozen_string_literal: true

module CracklibReloaded
  module CracklibReloadedFfiMixin
    extend FFI::Library

    LIBCRACK_SO_PATH = [
      ENV['LIBCRACK_SO_PATH'].to_s,
      '/usr/lib/libcrack.so.2',
      '/usr/lib64/libcrack.so.2',
      '/usr/lib/x86_64-linux-gnu/libcrack.so.2'
    ].select { |file| File.readable?(file) }.first.freeze

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
