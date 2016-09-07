# encoding: utf-8
require_relative '../spec_helper'
require "logstash/filters/python-script-executor"

describe LogStash::Filters::PythonScriptExecutor do
  describe "Set to Hello World" do
    let(:config) do <<-CONFIG
      filter {
        python-script-executor {
          message => "Hello World"
        }
      }
    CONFIG
    end

    sample("message" => "some text") do
      expect(subject).to include("message")
      expect(subject['message']).to eq('Hello World')
    end
  end
end
