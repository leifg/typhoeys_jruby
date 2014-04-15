require 'typhoeus'

class HttpFetcher
  attr_reader :suffixes

  def initialize suffixes
    @suffixes = suffixes
  end

  def run
    hydra = Typhoeus::Hydra.new(max_concurrency: suffixes.size)
    suffixes.each do |suffix|
      hydra.queue(build_request(suffix))
    end
    hydra.run
  end

  private
  def build_request suffix
    Typhoeus::Request.new("http://google.com/?#{suffix}").tap{|r|
      r.on_complete{|response|
        puts "#{response.request.url} returned with #{response.code}\n"
      }
    }
  end
end

iterations = ENV['ITERATIONS'] || 40
size = ENV['SIZE'] || 200

iterations.to_i.times do |n|
  HttpFetcher.new((1..size.to_i).map{|suffix| suffix * (n+1)}).run
end
